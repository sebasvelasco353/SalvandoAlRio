public class GameScreen {
  int y_Coord; //Y_coord refers to position of gameScreen on Y axis  

  public GameScreen () {
    y_Coord = -1940;
  }
  public void drawIt () {
    image (game, width/2, y_Coord, width, 5424);
    //thread ("moveGameScren");
  }

  public void moveGameScreen () {
    //yeah, i think the name explains it all...
    if (y_Coord < 5000) {
      y_Coord += 10;
    } //closing if
  } //Closing move method
}