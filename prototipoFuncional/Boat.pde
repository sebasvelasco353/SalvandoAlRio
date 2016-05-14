public class Boat {
  PImage boat;
  int position;

  public Boat () {
    position = width/2;
    boat = loadImage ("boat.png");
  }

  public void  drawIt () {
    image (boat, position, height -60);
  }

  public void move (int position) {
    if ((position > 125) && (position < width-125)) {
      this.position = position;
    }
  }

  public int getPosition() {
    return position;
  }

  public void restart () {
    position = width/2;
  }
}