public class Boat {
  PImage boat;
  float position;

 public Boat (){
   position = width/2;
   boat = loadImage ("boat.png");
 }
 
 public void  drawIt (){
   image (boat, position, height -30);
 }
 
 public void move (float position){
   this.position = position;
 }
 
 public float getPosition(){
   return position;
 }
 
 public void restart (){
 position = width/2;
 }
}