/*
Instalacion interactiva para el cuidado de los rios en la ciudad
 Realizado por: Sebastian Velasco
 Daniel PAlomino
 Sebastian Cruz
 Simon Herrera
 
 para la materia: Arte y Tecnologia de la carrera 
 Diseño de medios interactivos en la universidad Icesi.
 */

import de.voidplus.leapmotion.*;

Boat myBarco; //Boat (aKA Player) object
Timer myTimer; //Timer so you dont screw it over time
GameScreen gScreen;  //Class for all game related screen

LeapMotion leap;

ArrayList <Trash> myTrash;
ArrayList <Trash> myEmptyTrash;
int screen, life, points; 

float palmPosition;
PImage intro, game, lost;

void setup () { //I think i dont need to explain this
  fullScreen(); //Fullscreen application bitch!

  smooth ();
  imageMode (CENTER);
  loadImages (); //Method that loads every IMG that im going to use.
  myBarco = new Boat ();
  myTimer = new Timer ();
  gScreen = new GameScreen ();
  leap = new LeapMotion (this);


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
    thread ("getHandCoord");
    gScreen.drawIt();
    gScreen.moveGameScreen();

    myBarco.drawIt ();
    myBarco.move(palmPosition);
    break;
    //You lost bcause of your bitchin!
  case 2:
    image (lost, width/2, height/2, width, height);
    break;
  } //Closing switch
}

void mousePressed () { //WTF IS WRONG WOTH YOU, you should totally know what this is for
  if (screen == 0) {
    screen = 1;
  } else {
    screen = 2;
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

public void getHandCoord () {
  for (Hand hand : leap.getHands ()) {
    int     hand_id          = hand.getId();
    PVector hand_position    = hand.getPosition();

    palmPosition = hand_position.x;
  }
}