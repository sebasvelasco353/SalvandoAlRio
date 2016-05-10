

public class Boat {
  PImage boat;
  PVector position;
  
 public Boat (){
   position = new PVector (width/2, height/2);
   boat = loadImage ("boat.png");
 }
 
 public void  drawIt (){
   image (boat, position.x, position.y);
 }
 
 public void move (){
   
 }
 
 public void getPosition(){
   
 }
 
 public void restart (){
 position = new PVector (width/2, height/2);
 }
}