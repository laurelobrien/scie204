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
enemy enemy1 = new enemy(color(100), 20); //new object from enemy class
enemy enemy2 = new enemy(color(200), 30); //new object from enemy class
enemy enemy3 = new enemy(color(30), 40); //new object from enemy class
enemy enemy4 = new enemy(color(250), 10); //new object from enemy class


//initial settings, only declared or performed at start
void setup() 
{
  size(640, 480);
  background(#CAE3A5); //bg: light green
  pilot.randomizePilot(); //random initial position of pilot object
  enemy1.randomizeEnemy();
  enemy2.randomizeEnemy();
  enemy3.randomizeEnemy();
  enemy4.randomizeEnemy();
  rectMode(CENTER);
}

void draw() 
{
  background(#CAE3A5); //light green bg: erase last frame
  
  //check if game is running
  if (isRunning) {
    pilot.movePilotFollowMouse(); //move pilot object to mouse pos
    enemy1.moveEnemy(); //start enemy bouncing around canvas
    enemy2.moveEnemy(); //start enemy bouncing around canvas
    enemy3.moveEnemy(); //start enemy bouncing around canvas
    enemy4.moveEnemy(); //start enemy bouncing around canvas
  }
  
  //draw all
  pilot.drawPilot();
  enemy1.drawEnemy();
  enemy2.drawEnemy();
  enemy3.drawEnemy();
  enemy4.drawEnemy();
}