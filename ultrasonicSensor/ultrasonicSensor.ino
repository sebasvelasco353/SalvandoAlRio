#include <Ultrasonic.h>

Ultrasonic ultrasonic(9,8); // (Trig PIN,Echo PIN)
int distance;
char msg = '0';

void setup() {
  Serial.begin(9600);
}

void loop(){
 msg = '0';
 distance = ultrasonic.Ranging(CM);
 if (distance < 35){
  msg = '1';
 //Serial.println("GO"); // CM or INC
 Serial.println(msg);
 } else {
  msg = '0';
 Serial.println(msg);
 // Serial.println("DONT");
 //Serial.println("0");
 }
 delay(100);
}

