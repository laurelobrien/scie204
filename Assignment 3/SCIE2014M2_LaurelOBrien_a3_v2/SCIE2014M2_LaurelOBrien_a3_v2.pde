///////////////////////
//Assignment 3
//
//Laurel O'Brien
//lobrien14692@ecuad.ca
//102615

//declare and/or initialize variables
int fc = 0; //frame counter
int boundaryMargin = 30; //minimum spawn distance from edge of canvas
float fireSize = 50; //square dimensions of fire
boolean isRunning = false; //indicate if game is running
boolean isFireBurning = true; //indicate if fire is burning
color bgColour = color(200, 250, 150); //background colour, changes with game state

float lakeXPos;
float lakeYPos;
float fireXPos;
float fireYPos;
float landingPadXPos;
float landingPadYPos;

c_pilot pilot = new c_pilot(); //new user-controlled object from c_player class
enemy enemy1 = new enemy(color(100), 30); //4 new objects from enemy class
enemy enemy2 = new enemy(color(200), 30);
enemy enemy3 = new enemy(color(30), 30); 
enemy enemy4 = new enemy(color(250), 30); 



//initial settings, only declared or performed at start
void setup() 
{
  size(640, 480); //canvas size
  background(#CAE3A5); //bg: light green
  rectMode(CENTER); //draw rectangles from their center
  
  resetGame(); //initialize starting positions of elements, booleans, counters etc
}



//draw 4 enemies bouncing around the canvas, a pilot the player can control,
//a lake to retrieve water from, a fire burning that needs to be extinguished,
//and a landing pad for the player to go home to after they put out the flames.
void draw() 
{
  background(bgColour); //light green bg: erase last frame

  //draw all
  enemy1.drawEnemy();
  enemy2.drawEnemy();
  enemy3.drawEnemy();
  enemy4.drawEnemy();
  lake();
  forestFire();
  landingPad();
  pilot.drawPilot();
  
  //run if game is running
  if (isRunning) {
    pilot.movePilotFollowMouse(); //move pilot object pos to mouse pos
    enemy1.moveEnemy(); //move enemy pos
    enemy2.moveEnemy();
    enemy3.moveEnemy();
    enemy4.moveEnemy();
    
    pilot.checkWaterStorage(); //check if pilot has picked up water
    douseFlames(); //check if flames have extinguished
    
    //run if any game-over condition has been met
    if (hasPlayerLost()) 
    {
      gameOverScreen(); //stop game and display game-over text/bg
    }   
    
    //run if player has satisfied all win conditions
    if (hasPlayerWon()) 
    {
      wonTheGameScreen(); //stop game and display winning text
    }  
    
    fc ++; //increment frame count
  } //end of (isRunning) check
} //end of draw()