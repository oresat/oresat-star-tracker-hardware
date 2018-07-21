#include <Wire.h>

uint16_t hB;
uint16_t lB;
char address = 0x10;

void setup() {
  Wire.begin(); // join i2c bus (address optional for master)
  Serial.begin(115200); 
}

void loop() {
  for(uint16_t i = 0x3000 ; i <= 0x31FC ; i += 0x02) //read all registers
  {
      Wire.beginTransmission(address);
      Wire.write(i >> 8);
      Wire.write(i & 0x00ff);
      Wire.endTransmission(false); //send restart condition
      Wire.requestFrom(address, 2); //request 2 bytes
      while (Wire.available()) 
      {       
        hB = Wire.read();  //high bytes
        lB = Wire.read();  //low byte
      }
      Wire.endTransmission(true);
      Serial.print("Address = 0x");
      Serial.println(i, HEX); //upper 2 bits
      Serial.print("Value = 0x");
      
      uint16_t reg_val = ((hB<<8) | lB);
      if(reg_val < 8) //append zeros for readability
      {
        Serial.print("000");
      }else if(reg_val < 256)
      {
        Serial.print("00");
      }else if(reg_val < 4096)
      {
        Serial.print("0");
      }
      
      Serial.println(reg_val, HEX);
      Serial.println("----------------");

      delay(1);
  }
  while(1);
}

