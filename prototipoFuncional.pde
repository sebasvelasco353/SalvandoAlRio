/*
Instalacion interactiva para el cuidado de los rios en la ciudad
 Realizado por: Sebastian Velasco
 Daniel PAlomino
 Sebastian Cruz
 Simon Herrera
 
 para la materia: Arte y Tecnologia de la carrera 
 Diseño de medios interactivos en la universidad Icesi.
 */

Boat myBarco; //Boat (aKA Player) object
Timer myTimer; //Timer so you dont screw it over time

ArrayList <Trash> myTrash;
ArrayList <Trash> myEmptyTrash;
int screen, life, points, y_Coord; //Y_coord refers to position of gameScreen on Y axis 
PImage intro, game, lost;

void setup () { //I think i dont need to explain this
  fullScreen(); //Fullscreen application bitch!

  smooth ();
  imageMode (CENTER);
  loadImages (); //Method that loads every IMG that im going to use.
  myBarco = new Boat ();
  myTimer = new Timer ();
  y_Coord = -2712;

  myTrash = new ArrayList <Trash>();
  myEmptyTrash = new ArrayList <Trash>();
  screen = 0;
}

void draw () { //RLY DUDE?
  switch (screen) {

    //Intro screen
  case 0:
    image (intro, width/2, height/2, width, height);
    break;

    //Game Screen
  case 1:
    image (game, width/2, y_Coord);
    println (screen + " GameScreen Yaxis: " + y_Coord);
    break;
    //You lost bcause of your bitchin!
  case 2:

    break;
  } //Closing switch
}

void mousePressed () { //WTF IS WRONG WOTH YOU, you should totally know what this is for
  if (screen == 0) {
    screen = 1;
  }
} //cierro mousePressed

public void addTrash () {
  Trash temp = new Trash ();
  myTrash.add (temp);
  delay(5000);
}

public void restart () {
  myTrash = myEmptyTrash;
  screen = 0;
  myBarco.restart();
}

public void loadImages() {
  intro = loadImage ("intro.jpg");
  game = loadImage("bg.png");
  lost = loadImage ("lost.jpg");
}

public void moveGameScreen () {
  //yeah, i think the name explains it all...
} //Closing move method