
#include <linux/init.h>           // Macros used to mark up functions e.g. __init __exit
#include <linux/module.h>         // Core header for loading LKMs into the kernel
#include <linux/device.h>         // Header to support the kernel Driver Model
#include <linux/kernel.h>         // Contains types, macros, functions for the kernel
#include <linux/fs.h>             // Header for the Linux file system support
#include <linux/uaccess.h>          // Required for the copy to user function
#include <linux/dma-mapping.h>
#include <linux/interrupt.h>
#include <linux/platform_device.h>
#define  DEVICE_NAME "ebbchar"    ///< The device will appear at /dev/ebbchar using this value
#define  CLASS_NAME  "ebb"        ///< The device class -- this is a character device driver
#define SIZE 1<<21 //2 MiB is enough for one image
#define ROWS 960
#define COLS 1280
#define PIXELS ROWS * COLS

MODULE_LICENSE("GPL");            ///< The license type -- this affects available functionality
MODULE_AUTHOR("Oliver Rew");    ///< The author -- visible when you use modinfo
MODULE_DESCRIPTION("write this");  ///< The description -- see modinfo
MODULE_VERSION("0.1");            ///< A version number to inform users

static int    majorNumber;                  ///< Stores the device number -- determined automatically
static char   message[256] = {0};           ///< Memory for the string that is passed from userspace
static short  size_of_message;              ///< Used to remember the size of the string stored
static struct class*  ebbcharClass  = NULL; ///< The device-driver class struct pointer
static struct device* ebbcharDevice = NULL; ///< The device-driver device struct pointer

// The prototype functions for the character driver -- must come before the struct definition
static int     dev_open(struct inode *, struct file *);
static int     dev_release(struct inode *, struct file *);
static ssize_t dev_read(struct file *, char *, size_t, loff_t *);
static ssize_t dev_write(struct file *, const char *, size_t, loff_t *);
static int pru_handshake(int physAddr);
static irq_handler_t irqhandler(unsigned int irq, void *dev_id, struct pt_regs *regs);
int pru_probe(struct platform_device*);
int pru_rm(struct platform_device*);
static void free_irqs(void);

/*
 * TODO
 * - dedicated error interrupt line from PRU that triggers handler to shut down
 *   other opperations
 */

/** @brief Devices are represented as file structure in the kernel. The file_operations structure from
 *  /linux/fs.h lists the callback functions that you wish to associated with your file operations
 *  using a C99 syntax structure. char devices usually implement open, read, write and release calls
 */
static struct file_operations fops =
{
  .open = dev_open,
  .read = dev_read,
  .write = dev_write,
  .release = dev_release,
};

//Memory pointers: TODO is there anything wrong with these being global?
dma_addr_t dma_handle = NULL;
int *cpu_addr = NULL;
int* physAddr = NULL;
volatile int int_triggered = 0;

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

static struct irq_info {
  char* name;
  int   num;
};

#define NUM_IRQS 8
/*
 * mapping of an irq name(from the platfor device in the device device-tree)
 * to it's assigned linux irq number(in /proc/interrupt). When the irq is 
 * successfully retrieved and requested, the 'num' will be assigned.
 */
struct irq_info irqs[8] = {
  {"20", -1},
  {"21", -1},
  {"22", -1},
  {"23", -1},
  {"24", -1},
  {"25", -1},
  {"26", -1},
  {"27", -1}
};

int pru_probe(struct platform_device* dev)
{
  printk(KERN_INFO "EBBChar: probing %s\n", dev->name);

  for(int i = 0 ; i < NUM_IRQS ; i++)
  {
    int irq = platform_get_irq_byname(dev, irqs[i].name);
    printk(KERN_INFO "EBBChar: platform_get_irq(%s) returned: %d\n", irqs[i].name, irq);
    //if not zero, return errno
    if(irq < 0)
      return irq;

    int ret = request_irq(irq, (irq_handler_t)irqhandler, IRQF_TRIGGER_RISING, "prudev", NULL);
    printk(KERN_INFO "EBBChar: request_irq(%d) returned: %d\n", irq, ret);
    if(ret < 0)
      return ret;

    irqs[i].num = irq;
  }

  return 0;
}

//TODO need to define this
int pru_rm(struct platform_device* dev)
{
  return 0;
}

/** @brief The LKM initialization function
 *  The static keyword restricts the visibility of the function to within this C file. The __init
 *  macro means that for a built-in driver (not a LKM) the function is only used at initialization
 *  time and that it can be discarded and its memory freed up after that point.
 *  @return returns 0 if successful
 */
static int __init ebbchar_init(void){
  printk(KERN_INFO "EBBChar: Initializing the EBBChar v1\n");

  // Try to dynamically allocate a major number for the device -- more difficult but worth it
  majorNumber = register_chrdev(0, DEVICE_NAME, &fops);
  if (majorNumber<0){
    printk(KERN_ALERT "EBBChar failed to register a major number\n");
    return majorNumber;
  }
  printk(KERN_INFO "EBBChar: registered correctly with major number %d\n", majorNumber);

  // Register the device class
  ebbcharClass = class_create(THIS_MODULE, CLASS_NAME);
  if (IS_ERR(ebbcharClass)){                // Check for error and clean up if there is
    unregister_chrdev(majorNumber, DEVICE_NAME);
    printk(KERN_ALERT "Failed to register device class\n");
    return PTR_ERR(ebbcharClass);          // Correct way to return an error on a pointer
  }
  printk(KERN_INFO "EBBChar: device class registered correctly\n");

  /* Register the platform driver. This causes the system the scan the platform
   * bus for devices that match this driver. As defined in the device-tree,
   * there should be a platform device that is found, at which point the
   * drivers probe function is called on the device and the driver can read and
   * request the interrupt line associated with that device
   */
  int regDrvr = platform_driver_register(&prudrvr);
  printk(KERN_INFO "EBBChar: platform driver register returned: %d\n", regDrvr);

  //set interrupt to not triggered yet
  int_triggered = 0;

  // Register the device driver
  ebbcharDevice = device_create(ebbcharClass, NULL, MKDEV(majorNumber, 0), NULL, DEVICE_NAME);
  if (IS_ERR(ebbcharDevice)){               // Clean up if there is an error
    class_destroy(ebbcharClass);           // Repeated code but the alternative is goto statements
    unregister_chrdev(majorNumber, DEVICE_NAME);
    printk(KERN_ALERT "Failed to create the device\n");
    return PTR_ERR(ebbcharDevice);
  }
  printk(KERN_INFO "EBBChar: device class created correctly\n"); // Made it! device was initialized
  return 0;
}

/** @brief The LKM cleanup function
 *  Similar to the initialization function, it is static. The __exit macro notifies that if this
 *  code is used for a built-in driver (not a LKM) that this function is not required.
 */
static void __exit ebbchar_exit(void){
  //unregister platform driver
  platform_driver_unregister(&prudrvr);

  //free irqs
  free_irqs();

  device_destroy(ebbcharClass, MKDEV(majorNumber, 0));     // remove the device
  class_unregister(ebbcharClass);                          // unregister the device class
  class_destroy(ebbcharClass);                             // remove the device class
  unregister_chrdev(majorNumber, DEVICE_NAME);             // unregister the major number
  printk(KERN_INFO "EBBChar: Goodbye from the LKM!\n");
}

static void free_irqs(void){
  for(int i = 0 ; i < NUM_IRQS ; i++)
    if(irqs[i].num > -1)
      free_irq(irqs[i].num, NULL);
}

static int dev_open(struct inode *inodep, struct file *filep){
  int ret = 0; //return value
  //set DMA mask
  int retMask = dma_set_coherent_mask(ebbcharDevice, 0xffffffff);
  if(retMask != 0)
  {
    printk(KERN_INFO "Failed to set DMA mask : error %d\n", retMask);
    return 0;
  }

  /*
   * I initial used GFP_DMA flag below, but I could not allocate >1 MiB
   * I am unsure what the ideal flags for this are, but GFP_KERNEL seems to
   * work
   */
  cpu_addr = dma_alloc_coherent(ebbcharDevice, SIZE, &dma_handle, GFP_KERNEL);
  if(cpu_addr == NULL)
  {
    printk(KERN_INFO "Failed to allocate memory\n");
    return -1;
  }

  printk(KERN_INFO "Virtual Address: %x\n", (int)cpu_addr);

  physAddr = (int*)dma_handle;
  printk(KERN_INFO "Physical Address: %x\n", (int)physAddr);
  int_triggered = 0;

  return ret;
}

//TODO do I need to check for some sort of error on readl() and writel()

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
  //TODO move these above or to header
#define PRUBASE 0x4a300000
#define PRUSHAREDRAM PRUBASE + 0x10000
#define PRUINTC_OFFSET 0x20000
#define SRSR0_OFFSET 0x200

  //ioremap physical locations in the PRU shared ram 
  void __iomem *pru_shared_ram;
  pru_shared_ram = ioremap_nocache((int)PRUSHAREDRAM, 4); 
  printk(KERN_INFO "pru_shared_ram virt: %x\n", (int)pru_shared_ram);

  //write physical address to PRU shared RAM where a PRU can find it
  writel(physAddr, pru_shared_ram);

  printk(KERN_INFO "srsr0 offset: %x\n", (int)(PRUBASE + PRUINTC_OFFSET + SRSR0_OFFSET));
  //ioremap PRU SRSR0 reg
  void __iomem *pru_srsr0;
  pru_srsr0 = ioremap_nocache((int)(PRUBASE + PRUINTC_OFFSET + SRSR0_OFFSET), 4); 
  printk(KERN_INFO "pru_srsr0 virt: %x\n", (int)pru_srsr0);

  //set bit 24 in PRU SRSR0 to trigger event 24
  writel(0x1000000, pru_srsr0);

  //TODO add a response via an interrupt from the PRU and return error

  //unmap iomem
  iounmap(pru_shared_ram);
  iounmap(pru_srsr0);

  return 0; 
}

static ssize_t dev_read(struct file *filep, char *buffer, size_t len, loff_t *offset){
  //TODO address to known location with checksum to other location  this can replace the handshake
  
  //signal PRU and tell it where to write the data
  int handshake = pru_handshake((int)physAddr);
  if(handshake < 0) 
  {
    printk(KERN_ERR "PRU Handshake failed: %x\n", (int)physAddr);
    return -1;
  }

  printk(KERN_INFO "...waiting for interrupt\n");

  //wait for intc to be triggered
  volatile int i;
  for(i = 0 ; i < (1<<27) && !int_triggered ; i++);

  if(!int_triggered) {
    printk(KERN_ERR "Interrupt never triggered!\n");
    return -1;
  }

  int_triggered = 0;

  printk(KERN_INFO "Interrupt Triggered!\n");

  char* physBase;
  physBase = (char*)cpu_addr;
  
  int error_count = 0;
  // copy_to_user has the format ( * to, *from, size) and returns 0 on success
  error_count = copy_to_user(buffer, physBase, PIXELS); //TODO use __copy_to_user

  physBase = (char*)cpu_addr;
  //this just reads back a few values from the PRU to verify everything is
  //working
  /*
  for(int i = 0 ; i < 16 ; i++)
  {
    printk(KERN_INFO "phys: %x\n", *physBase);
    physBase++;
  }
  */
  
  if (error_count==0){            // if true then have success
    printk(KERN_INFO "EBBChar: Sent %d characters to the user\n", size_of_message);
    return (size_of_message=0);  // clear the position to the start and return 0
  }
  else {
    printk(KERN_INFO "EBBChar: Failed to send %d characters to the user\n", error_count);
    return -EFAULT;              // Failed -- return a bad address message (i.e. -14)
  }
}

/** @brief This function is called whenever the device is being written to from user space i.e.
 *  data is sent to the device from the user. The data is copied to the message[] array in this
 *  LKM using the sprintf() function along with the length of the string.
 *  @param filep A pointer to a file object
 *  @param buffer The buffer to that contains the string to write to the device
 *  @param len The length of the array of data that is being passed in the const char buffer
 *  @param offset The offset if required
 */
static ssize_t dev_write(struct file *filep, const char *buffer, size_t len, loff_t *offset){
  printk(KERN_INFO "============WRITE============\n");
  copy_from_user(message,buffer,5);
  size_of_message = strlen(message);                 // store the length of the stored message
  printk(KERN_INFO "len: %d\n", size_of_message);
  //printk(KERN_INFO "buffer: %c\n", buffer[0]);
  printk(KERN_INFO "message: %c\n", message[0]);
  //message[0] = 'g';
  printk(KERN_INFO "============WRITE============\n");
  printk(KERN_INFO "EBBChar: Received %zu characters from the user\n", len);
  return len;
}

static irq_handler_t irqhandler(unsigned int irqN, void *dev_id, struct pt_regs *regs)
{
  //  if(irqN != irq)
  // return (irq_handler_t) IRQ_NONE; 
  printk(KERN_INFO "IRQ_HANDLER: %d\n", irqN);

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
  dma_free_coherent(ebbcharDevice, SIZE, cpu_addr, dma_handle);
  printk(KERN_INFO "Freed %d bytes\n", SIZE); 

  printk(KERN_INFO "EBBChar: Device successfully closed\n");
  return 0;
}

/** @brief A module must use the module_init() module_exit() macros from linux/init.h, which
 *  identify the initialization function at insertion time and the cleanup function (as
 *  listed above)
 */
module_init(ebbchar_init);
module_exit(ebbchar_exit);
