///////////////////////
//Assignment 3
//
//Laurel O'Brien
//lobrien14692@ecuad.ca
//102615

//declare and initialize variables
int fc = 0; //frame counter, game is 60fps
boolean isRunning = false; //indicate if game is running
float enemyHorzVel = random(0.5,5); //x-axis velocity
float enemyVertVel = random(0.5,6); //y-axis velocity  
float enemyX = 200;
float enemyY = 300;
int enemyDiam = 30; //w and h dimensions of enemy
int enemyRad = enemyDiam / 2; //radius of enemy (for rectMode(CENTER) considerations)
int boundaryMargin = 20; //minimum distance from edge of canvas

c_pilot pilot = new c_pilot(); //new user-controlled object from c_player class


//initial settings, only declared or performed at start
void setup() 
{
  size(640, 480);
  background(#CAE3A5); //bg: light green
  pilot.randomizePilot(); //random initial position of pilot object
  randomizeEnemy();
  rectMode(CENTER);
}

void draw() 
{
  background(#CAE3A5); //light green bg: erase last frame
  
  //check if game is running
  if (isRunning) {
    pilot.movePilotFollowMouse(); //move pilot object to mouse pos
    moveEnemy(); //start enemy bouncing around canvas
  }
  
  //draw all
  pilot.drawPilot();
  drawEnemy();
}