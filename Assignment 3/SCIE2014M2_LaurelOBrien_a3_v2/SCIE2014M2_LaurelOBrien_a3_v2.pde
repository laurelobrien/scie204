///////////////////////
//Assignment 3
//
//Laurel O'Brien
//lobrien14692@ecuad.ca
//102615

//declare and initialize variables
int fc = 0; //frame counter, game is 60fps
boolean isRunning = false; //indicate if game is running
int boundaryMargin = 20; //minimum distance from edge of canvas

c_pilot pilot = new c_pilot(); //new user-controlled object from c_player class
enemy enemy1 = new enemy(); //new user-controlled object from c_player class


//initial settings, only declared or performed at start
void setup() 
{
  size(640, 480);
  background(#CAE3A5); //bg: light green
  pilot.randomizePilot(); //random initial position of pilot object
  enemy1.randomizeEnemy();
  rectMode(CENTER);
}

void draw() 
{
  background(#CAE3A5); //light green bg: erase last frame
  
  //check if game is running
  if (isRunning) {
    pilot.movePilotFollowMouse(); //move pilot object to mouse pos
    enemy1.moveEnemy(); //start enemy bouncing around canvas
  }
  
  //draw all
  pilot.drawPilot();
  enemy1.drawEnemy();
}