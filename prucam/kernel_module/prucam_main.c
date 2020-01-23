#include "prucam_main.h"


static int    majorNumber;                  ///< Stores the device number -- determined automatically
static struct class*  prucamClass  = NULL; ///< The device-driver class struct pointer
static struct device* prucamDevice = NULL; ///< The device-driver device struct pointer

// The prototype functions for the character driver -- must come before the struct definition
static int     dev_open(struct inode *, struct file *);
static int     dev_release(struct inode *, struct file *);
static ssize_t dev_read(struct file *, char *, size_t, loff_t *);
static int pru_handshake(int physAddr);
static irq_handler_t irqhandler(unsigned int irq, void *dev_id, struct pt_regs *regs);
int pru_probe(struct platform_device*);
int pru_rm(struct platform_device*);
static void free_irqs(void);
int init_camera_regs(void);
int write_cam_reg(uint16_t reg, uint16_t val);


int param = 0x1f;

int param_set(const char *val, const struct kernel_param *kp) {
  int* pval = kp->arg; // get the val
  printk(KERN_INFO "param* set: %x\n", pval);
  printk(KERN_INFO "param set: %d\n", *pval);
  printk(KERN_INFO "val*: %x\n", val);
  if(val != NULL)
    printk(KERN_INFO "val: %s\n", *val);

}

int param_get(char *buffer, const struct kernel_param *kp) {
  int* pval = kp->arg;
  printk(KERN_INFO "param get: %d\n", pval);
}

const struct kernel_param_ops param_ops = 
{
  .set = &param_set,  // Use our setter ...
  .get = &param_get,     // .. and standard getter
};


module_param_cb(param, &param_ops, &param, S_IRUGO | S_IWUSR);

/*
 * TODO
 * - dedicated error interrupt line from PRU that triggers handler to shut down
 *   other opperations
 */

static struct file_operations fops =
{
  .open = dev_open,
  .read = dev_read,
  .release = dev_release,
};

//Memory pointers
dma_addr_t dma_handle = (dma_addr_t)NULL;
int *cpu_addr = NULL;
int* physAddr = NULL;
volatile int int_triggered = 0;

struct i2c_adapter* i2c_adap;

//i2c_client is used to interact with the image sensor's i2c slave address
struct i2c_client* client;

//represents the address of the AR013X image sensor
static struct i2c_board_info ar013x_i2c_info __initdata = { //TODO does this need __initdata
  I2C_BOARD_INFO("AR013X", 0x10),
};

static const struct of_device_id my_of_ids[] = {
  { .compatible = "prudev,prudev" },
  { },
};

static struct platform_driver prudrvr = {
  .driver = {
    .name = "prudev",
    .owner = THIS_MODULE,
    .of_match_table = my_of_ids
  },
  .probe = pru_probe,
  .remove = pru_rm,
};

typedef struct {
  char* name;
  int   num;
}irq_info;

/*
 * mapping of an irq name(from the platfor device in the device device-tree)
 * to it's assigned linux irq number(in /proc/interrupt). When the irq is 
 * successfully retrieved and requested, the 'num' will be assigned.
 */
irq_info irqs[8] = {
  {"20", -1},
  {"21", -1},
  {"22", -1},
  {"23", -1},
  {"24", -1},
  {"25", -1},
  {"26", -1},
  {"27", -1}
};

int init_camera_regs(void){
  for(int i = 0 ; ; i++){
    camReg reg = startupRegs[i];

    //last entry in the array will be empty
    if(reg.reg == 0 && reg.val == 0) {
      break;
    }

    //if reg == 0, then we delay val milliseconds
    if(reg.reg == 0) {
      //delay is more wasteful than sleep, but the resultant traffic is
      //cleaner. TODO Come back to this.
      mdelay(reg.val);
      //msleep(reg.val);
      continue;
    }

    int ret = write_cam_reg(reg.reg, reg.val);
    if(ret < 0) {
      printk("ERROR: i2c write reg: %04x val: %04x returned: %d\n",reg.reg, reg.val, ret);
      //return ret;
    }
    //mdelay(1);
  }
  return 0;
}

//write_cam_reg write the value to the specified register. The AR013X has 16
//bit register addresses and values, which differs from "normal" i2c
int write_cam_reg(uint16_t reg, uint16_t val){
  //unpack 16 bit values in buffer of bytes
  char buf[4] = {
    reg >> 8,
    reg,
    val >> 8,
    val,
  };

  //TODO should I check that num bytes matches?
  int ret = i2c_master_send(client, buf, 4);
  if(ret < 0) {
    return ret;
  }
  return 0;
}

int pru_probe(struct platform_device* dev)
{
  printk(KERN_INFO "prucam: probing %s\n", dev->name);
  int ret = 0; //return value

  for(int i = 0 ; i < NUM_IRQS ; i++)
  {
    int irq = platform_get_irq_byname(dev, irqs[i].name);
    printk(KERN_INFO "prucam: platform_get_irq(%s) returned: %d\n", irqs[i].name, irq);
    //if not zero, return errno
    if(irq < 0)
      return irq;

    int ret = request_irq(irq, (irq_handler_t)irqhandler, IRQF_TRIGGER_RISING, "prudev", NULL);
    printk(KERN_INFO "prucam: request_irq(%d) returned: %d\n", irq, ret);
    if(ret < 0)
      return ret;

    irqs[i].num = irq;
  }

  if(prucamDevice == NULL){
    printk(KERN_ERR "prucamDevice NULL!\n");
    return -1;
  }

  //set DMA mask
  ret = dma_set_coherent_mask(prucamDevice, 0xffffffff);
  if(ret != 0)
  {
    printk(KERN_INFO "Failed to set DMA mask : error %d\n", ret);
    return 0;
  }

  /*
   * I initial used GFP_DMA flag below, but I could not allocate >1 MiB
   * I am unsure what the ideal flags for this are, but GFP_KERNEL seems to
   * work
   */
  cpu_addr = dma_alloc_coherent(prucamDevice, SIZE, &dma_handle, GFP_KERNEL);
  if(cpu_addr == NULL)
  {
    printk(KERN_INFO "Failed to allocate memory\n");
    return -1;
  }

  printk(KERN_INFO "prucam: virtual Address: %x\n", (int)cpu_addr);

  physAddr = (int*)dma_handle;
  printk(KERN_INFO "prucam: physical Address: %x\n", (int)physAddr);
  int_triggered = 0;

  return 0;
}

int pru_rm(struct platform_device* dev)
{
  //free irqs alloc'd in the probe
  free_irqs();

  dma_free_coherent(prucamDevice, SIZE, cpu_addr, dma_handle);
  printk(KERN_INFO "prucam: Freed %d bytes\n", SIZE); 

  return 0;
}

/** @brief The LKM initialization function
 *  The static keyword restricts the visibility of the function to within this C file. The __init
 *  macro means that for a built-in driver (not a LKM) the function is only used at initialization
 *  time and that it can be discarded and its memory freed up after that point.
 *  @return returns 0 if successful
 */
static int __init prucam_init(void){
  int r;
  printk(KERN_INFO "prucam: Initializing the prucam v1\n");

  // Try to dynamically allocate a major number for the device -- more difficult but worth it
  majorNumber = register_chrdev(0, DEVICE_NAME, &fops);
  if (majorNumber<0){
    printk(KERN_ALERT "prucam failed to register a major number\n");
    return majorNumber;
  }
  printk(KERN_INFO "prucam: registered correctly with major number %d\n", majorNumber);

  // Register the device class
  prucamClass = class_create(THIS_MODULE, CLASS_NAME);
  if (IS_ERR(prucamClass)){                // Check for error and clean up if there is
    unregister_chrdev(majorNumber, DEVICE_NAME);
    printk(KERN_ALERT "Failed to register device class\n");
    return PTR_ERR(prucamClass);          // Correct way to return an error on a pointer
  }
  printk(KERN_INFO "prucam: device class registered correctly\n");

  //set interrupt to not triggered yet
  int_triggered = 0;

  // Register the device driver
  prucamDevice = device_create(prucamClass, NULL, MKDEV(majorNumber, 0), NULL, DEVICE_NAME);
  if (IS_ERR(prucamDevice)){               // Clean up if there is an error
    class_destroy(prucamClass);           // Repeated code but the alternative is goto statements
    unregister_chrdev(majorNumber, DEVICE_NAME);
    printk(KERN_ALERT "Failed to create the device\n");
    return PTR_ERR(prucamDevice);
  }
  printk(KERN_INFO "prucam: device class created correctly\n"); // Made it! device was initialized

  /* Register the platform driver. This causes the system the scan the platform
   * bus for devices that match this driver. As defined in the device-tree,
   * there should be a platform device that is found, at which point the
   * drivers probe function is called on the device and the driver can read and
   * request the interrupt line associated with that device
   */
  int regDrvr = platform_driver_register(&prudrvr);
  printk(KERN_INFO "prucam: platform driver register returned: %d\n", regDrvr);


  i2c_adap = i2c_get_adapter(2);
  client = i2c_new_device(i2c_adap, &ar013x_i2c_info);
  if(client == NULL) {
    printk("new device returned NULL!\n");
  }

  // init the camera control GPIO
  if((r = init_cam_gpio())) 
    return r;

  camera_enable();

  // AR0130 datasheet says sleep for a little bit after enabled vregs and clock
  msleep(10);

  // init camera i2c regs
  init_camera_regs();
  printk(KERN_INFO "Init Complete\n");


  return 0;
}

static void __exit prucam_exit(void){
  //unregister platform driver
  platform_driver_unregister(&prudrvr);

  device_destroy(prucamClass, MKDEV(majorNumber, 0));     // remove the device
  class_unregister(prucamClass);                          // unregister the device class
  class_destroy(prucamClass);                             // remove the device class
  unregister_chrdev(majorNumber, DEVICE_NAME);            // unregister the major number

  i2c_unregister_device(client);

  // put camera GPIO in good state and free the lines
  free_cam_gpio();

  printk(KERN_INFO "prucam: module exit\n");
}

static void free_irqs(void){
  for(int i = 0 ; i < NUM_IRQS ; i++)
    if(irqs[i].num > -1)
      free_irq(irqs[i].num, NULL);
}

static int dev_open(struct inode *inodep, struct file *filep){

  return 0;
}

/* 
 * pru_handshake() writes directly to the the PRU SRSR0 register that manually
 * triggers PRU system events, which can fire the PRU interrupt bit in R31.
 * Then it writes the address of the physical memory it allocated to a known
 * location in PRU shared RAM. THe PRU reads this and writes the image to this
 * address. I am writing without permission to the PRU shared RAM. This
 * should be ok, but in the future I should set aside of piece of PRU shared
 * RAM to ensure it doesn't accidentally use it
 */
static int pru_handshake(int physAddr )
{

  //ioremap physical locations in the PRU shared ram 
  void __iomem *pru_shared_ram;
  pru_shared_ram = ioremap_nocache((int)PRUSHAREDRAM, 4); 

  //write physical address to PRU shared RAM where a PRU can find it
  writel(physAddr, pru_shared_ram);

  //ioremap PRU SRSR0 reg
  void __iomem *pru_srsr0;
  pru_srsr0 = ioremap_nocache((int)(PRUBASE + PRUINTC_OFFSET + SRSR0_OFFSET), 4); 

  //set bit 24 in PRU SRSR0 to trigger event 24
  writel(0x1000000, pru_srsr0);

  //TODO add a response via an interrupt from the PRU and return error

  //unmap iomem
  iounmap(pru_shared_ram);
  iounmap(pru_srsr0);

  return 0; 
}

static ssize_t dev_read(struct file *filep, char *buffer, size_t len, loff_t *offset){
  //TODO address to known location with checksum to other location this can replace the handshake

  //signal PRU and tell it where to write the data
  int handshake = pru_handshake((int)physAddr);
  if(handshake < 0) 
  {
    printk(KERN_ERR "PRU Handshake failed: %x\n", (int)physAddr);
    return -1;
  }

  //wait for intc to be triggered
  volatile int i;
  for(i = 0 ; i < (1<<27) && !int_triggered ; i++);

  if(!int_triggered) {
    printk(KERN_ERR "Interrupt never triggered!\n");
    return -1;
  }

  int_triggered = 0;

  printk(KERN_INFO "prucam: Interrupt Triggered!\n");

  char* physBase;
  physBase = (char*)cpu_addr;

  int err = 0;
  err = copy_to_user(buffer, physBase, PIXELS); //TODO use __copy_to_user
  if(err != 0) {
    return -EFAULT;
  }

  return 0;
}

static irq_handler_t irqhandler(unsigned int irqN, void *dev_id, struct pt_regs *regs)
{
  printk(KERN_INFO "prucam: IRQ_HANDLER: %d\n", irqN); //TODO get rid of this

  //signal that interrupt has been triggered
  int_triggered = 1;

  return (irq_handler_t) IRQ_HANDLED;
}

/** @brief The device release function that is called whenever the device is closed/released by
 *  the userspace program
 *  @param inodep A pointer to an inode object (defined in linux/fs.h)
 *  @param filep A pointer to a file object (defined in linux/fs.h)
 */
static int dev_release(struct inode *inodep, struct file *filep){
  printk(KERN_INFO "prucam: Device successfully closed\n");
  return 0;
}

/** @brief A module must use the module_init() module_exit() macros from linux/init.h, which
 *  identify the initialization function at insertion time and the cleanup function (as
 *  listed above)
 */
module_init(prucam_init);
module_exit(prucam_exit);
