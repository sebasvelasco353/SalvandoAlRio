#include <Ultrasonic.h>

Ultrasonic ultrasonic(9,8); // (Trig PIN,Echo PIN)
int distance;

void setup() {
  Serial.begin(9600);
}

void loop(){
 distance = ultrasonic.Ranging(CM);
 Serial.print(distance); // CM or INC
 //Serial.println(" cm" );
 delay(100);
}

