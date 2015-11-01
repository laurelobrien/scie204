///////////////////////
//Assignment 3
//
//Laurel O'Brien
//lobrien14692@ecuad.ca
//102615

//declare and initialize variables
int fc = 0; //frame counter, game is 60fps
boolean isRunning = false; //indicate if game is running
boolean isGameOver = true; //player lost, game is over
int boundaryMargin = 20; //minimum distance from edge of canvas
float lakeXPos = random(0+boundaryMargin, 640-boundaryMargin);
float lakeYPos = random(0+boundaryMargin, 480-boundaryMargin);

c_pilot pilot = new c_pilot(); //new user-controlled object from c_player class
enemy enemy1 = new enemy(color(100), 30); //new object from enemy class
enemy enemy2 = new enemy(color(200), 30); //new object from enemy class
enemy enemy3 = new enemy(color(30), 30); //new object from enemy class
enemy enemy4 = new enemy(color(250), 30); //new object from enemy class


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

  //draw all
  enemy1.drawEnemy();
  enemy2.drawEnemy();
  enemy3.drawEnemy();
  enemy4.drawEnemy();
  lake(lakeXPos, lakeYPos);
  pilot.drawPilot();
  
  //check if game is running
  if (isRunning) {
    pilot.movePilotFollowMouse(); //move pilot object pos to mouse pos
    enemy1.moveEnemy(); //start enemy bouncing around canvas; pos arguments changed
    enemy2.moveEnemy(); //start enemy bouncing around canvas
    enemy3.moveEnemy(); //start enemy bouncing around canvas
    enemy4.moveEnemy(); //start enemy bouncing around canvas
    
    pilot.checkWaterStorage(); //check if pilot has picked up water
    
    if (pilot.isCarryingWater == true) 
    {
      drawWaterLoad();
    }
    
    /*check if a game-over requirement has been met
    if (hasPlayerLost()) 
    {
      isRunning = false; //stop the game
      println("GAME OVER, MAN. GAME OVER.");
      println("Right-click to play again.");
    }*/
    
  }
}

void lake(float lakeX, float lakeY) 
{
  fill(50, 100, 255); //blue
  ellipse(lakeX, lakeY, 30, 30); //lake shape
}

void drawWaterLoad() 
{
  fill(#12deef); //cyan
  ellipse(pilot.pilotX - 10, pilot.pilotY - 10, 10, 10); //ball of water near pilot
}