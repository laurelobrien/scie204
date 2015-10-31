///////////////////////
//Assignment 3
//
//Laurel O'Brien
//lobrien14692@ecuad.ca
//102615

//declare and initialize variables
int fc = 0; //frame counter, game is 60fps
boolean isRunning = false; //indicate if game is running
int enemyHorzVel = 1; //x-axis velocity
int enemyVertVel = 1; //y-axis velocity  
int enemyX = 200;
int enemyY = 300;
int enemyDiam = 30; //w and h dimensions of enemy
int enemyRad = enemyDiam / 2; //radius of enemy (for rectMode(CENTER) considerations)

c_pilot pilot = new c_pilot(); //new user-controlled object from c_player class


//initial settings, only declared or performed at start
void setup() 
{
  size(640, 480);
  background(#CAE3A5); //bg: light green
  pilot.randomizePilot(); //random initial position of pilot object
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