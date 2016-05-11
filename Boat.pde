public class Boat {
  PImage boat;
  int position;

  public Boat () {
    position = width/2;
    boat = loadImage ("boat.png");
  }

  public void  drawIt () {
    image (boat, position, height -30);
  }

  public void move (int position) {
    if ((position > 80) && (position < width-80)) {
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