#include <Ultrasonic.h>

Ultrasonic ultrasonic(9,8); // (Trig PIN,Echo PIN)
int distance;

void setup() {
  Serial.begin(9600);
}

void loop(){
 distance = ultrasonic.Ranging(CM);
 if (distance < 35){
 Serial.println("GO"); // CM or INC
 //Serial.println(" cm" );
 } else {
  Serial.print("DONT");
 }
 delay(100);
}

