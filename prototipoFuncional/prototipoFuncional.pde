/*
Instalacion interactiva para el cuidado de los rios en la ciudad
 
 Realizado por: 
 
 Sebastian Velasco
 Daniel PAlomino
 Sebastian Cruz
 Simon Herrera
 
 para la materia: Arte y Tecnologia de la carrera 
 Diseño de medios interactivos en la universidad Icesi.
 */

import de.voidplus.leapmotion.*;

Boat myBarco; //Boat (aKA Player) object
GameScreen gScreen;  //Class for all game related screen
Timer timer;

LeapMotion leap;

ArrayList <Trash> myTrash;
ArrayList <Trash> myEmptyTrash;
int screen, life, points; 

int palmPosition;
int time = millis(); //for the timer that adds trash
PImage intro, game, lost; // heart;

void setup () { //I think i dont need to explain this
  fullScreen(); //Fullscreen application bitch!
  
  smooth ();
  imageMode (CENTER);
  loadImages (); //Method that loads every IMG that im going to use.
  myBarco = new Boat ();
  gScreen = new GameScreen ();
  leap = new LeapMotion (this);
  timer = new Timer (50, 50);

  myTrash = new ArrayList <Trash>();
  myEmptyTrash = new ArrayList <Trash>();
  screen = 0;
  life = 3;
}

void draw () { //RLY DUDE?
background (255);
  switch (screen) {

    //Intro screen
  case 0:
    image (intro, width/2, height/2, width, height);
    break;

    //Game Screen
  case 1:
    if (timer.currentTime() < 60) {
      thread ("addTrash");
      thread ("getHandCoord");
      thread ("validate");
      //thread ("timer");

      //gScreen.moveGameScreen();
      gScreen.drawIt();
      thread ("moveScreen");      

      myBarco.drawIt ();
      myBarco.move(palmPosition);

      drawAndMoveTrash ();
      timer.DisplayTime();
      //drawHearts ();
    } else {
      timer.pause();
      screen = 2;
    }
    break;
    //You lost bcause of your bitchin!
  case 2:
    restart();
    image (lost, width/2, height/2, width, height);
    break;
  } //Closing switch
}

void mousePressed () { //WTF IS WRONG WOTH YOU, you should totally know what this is for
  if (screen == 0) {
    screen = 1;
    timer.start();
  } else {
    screen = 2;
  }
} //cierro mousePressed

public void addTrash () {
    println ("hfhsdf");
    if (millis() >= time+2000){
        Trash temp = new Trash ();
        myTrash.add (temp);
        println ("a trash was added"+ myTrash.size());
        time = millis();
      }
}

public void restart () {
  myTrash = myEmptyTrash;
  //screen = 0;
  myBarco.restart();
  timer.restart();
}

public void loadImages() {
  intro = loadImage ("intro.jpg");
  game = loadImage("bg.png");
  lost = loadImage ("lost.jpg");
  // heart = loadImage ("heart.png");
}

public void getHandCoord () {
  for (Hand hand : leap.getHands ()) {
    int     hand_id          = hand.getId();
    PVector hand_position    = hand.getPosition();

    palmPosition = (int) hand_position.x;
  }
  //myBarco.move(palmPosition);
}

/*public void drawHearts () {
 if (life == 3) {
 image (heart, 1000, 80);
 image (heart, 930, 80);
 image (heart, 850, 80);
 }
 }*/

public void drawAndMoveTrash () {
  for (int i = 0; i < myTrash.size(); i++) {
    Trash temp = myTrash.get(i);
    temp.drawIt();
    temp.moveIt ();
  }
}

public void validate () {
  for (int i = 0; i < myTrash.size (); i++) {
    //Trash temp = myTrash.get(i);
    if ((myBarco.getPosition()-60 <  myTrash.get(i).getPosX ()) && ( myTrash.get(i).getPosX () < myBarco.getPosition()+60)) {
      if ((height - 90 < myTrash.get(i).getPosY())&&(myTrash.get(i).getPosY() < height -60)) {
        println ("picked up a trash!");
        myTrash.remove( myTrash.get(i));
        points +=1;
      } else if ( myTrash.get(i).getPosY() > height -30) {
        myTrash.remove( myTrash.get(i));
        println ("se te escapo una");
      }
    }
  }
}

public void moveScreen (){
      gScreen.moveGameScreen(); 
}