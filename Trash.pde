public class Trash {
  int posX, posY;
  PImage trash;
  int type = (int) random (0, 4);;
  
  public Trash () {
    posX = (int) random (20, width-20);
    posY = -10;
    
    switch (type){
     case 0:
     trash = loadImage ("trash0.png");
     break;
     case 1:
     trash = loadImage ("trash1.png");
     break;
     case 2:
     trash = loadImage ("trash2.png");
     break;
     case 3:
     trash = loadImage ("trash3.png");
     break;
     case 4:
     trash = loadImage ("trash4.png");
     break;
    }
  }
  
  public void drawIt (){
    image (trash, posX, posY);
  }
  
  public void moveIt (){
    
  }
}