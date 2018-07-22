#include <Wire.h>

uint16_t hB;
uint16_t lB;
char address = 0x10; //only includes 7 bits, 0x20 = write, 0x21 = read

int REGS = 10;

struct camReg {
  uint16_t reg = 0x0000;
  uint16_t val = 0x0000;
  uint16_t defVal = 0x0000;
};

camReg regs[10];

camReg regs[] = {
  reg = 10 : val = 10,
  reg = 10 ; val = 10
};

void setup() {
  Wire.begin(); // join i2c bus (address optional for master)
  Serial.begin(115200); 
  initRegs();
}

void loop() {
  for(uint8_t i = 0 ; i < REGS ; ++i) //read all registers
  {
    writeReg(regs[i].reg, regs[i].val);
    printReg(regs[i].reg, readReg(regs[i].reg));

    delay(1);
    while(1); //only run once
  }
  
}

void writeReg(uint16_t reg, uint16_t data)
{
  Wire.beginTransmission(address);

  //write the register
  Wire.write(reg >> 8);
  Wire.write(reg & 0x00ff);

  //write the data
  Wire.write(data >> 8);
  Wire.write(data & 0x00ff);
  Wire.endTransmission(true); 
}

uint16_t readReg(uint16_t reg)
{
  Wire.beginTransmission(address);
  Wire.write(reg >> 8);
  Wire.write(reg & 0x00ff);
  Wire.endTransmission(false); //send restart condition
  Wire.requestFrom(address, 2); //request 2 bytes
  while (Wire.available()) 
  {       
    hB = Wire.read();  //high bytes
    lB = Wire.read();  //low byte
  }
  Wire.endTransmission(true);
  return ((hB<<8) | lB); //return the 2 regs together
}

void printReg(uint16_t reg, uint16_t value)
{
  Serial.print("Address = 0x");
  Serial.println(reg, HEX); //upper 2 bits
  Serial.print("Value = 0x");
  
  if(value < 8) //append zeros for readability
  {
    Serial.print("000");
  }else if(value < 256)
  {
    Serial.print("00");
  }else if(value < 4096)
  {
    Serial.print("0");
  }
  Serial.println(value, HEX);
  Serial.println("----------------");
}

void initRegs()
{
  regs[0].reg = 0x3012;
  regs[0].val = 0xa1a1;
}


