///////////////////////
//Assignment 3
//
//Laurel O'Brien
//lobrien14692@ecuad.ca
//102615

//declare and/or initialize variables
int fc = 0; //frame counter
int boundaryMargin = 30; //minimum distance from edge of canvas
boolean isRunning = false; //indicate if game is running
boolean isFireBurning = true; //indicate if fire is burning

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
  
  //randomize starting positions of game elements
  lakeXPos = random(0+boundaryMargin, width-boundaryMargin); //randomize lake position
  lakeYPos = random(0+boundaryMargin, height-boundaryMargin);
  fireXPos = random(0+boundaryMargin, width-boundaryMargin); //randomize fire position
  fireYPos = random(0+boundaryMargin, height-boundaryMargin);
  landingPadXPos = random(0+boundaryMargin, width-boundaryMargin); //randomize landing pad position
  landingPadYPos = random(0+boundaryMargin, height-boundaryMargin);
  pilot.placePilot(); //place pilot on top of landng pad
  enemy1.initialPosition(0+enemy1.enemyDiam, 0+enemy1.enemyDiam); //initial position of 4 enemy objects in 4 corners
  enemy2.initialPosition(width-enemy2.enemyDiam, 0+enemy2.enemyDiam);
  enemy3.initialPosition(0+enemy3.enemyDiam, height-enemy3.enemyDiam);
  enemy4.initialPosition(width-enemy4.enemyDiam, height-enemy4.enemyDiam);
}

//draw 4 enemies bouncing around the canvas, a pilot the player can control,
//a lake to retrieve water at, a fire burning that needs to be put out,
//and a landing pad for the player to go home to after they put out the flames.
void draw() 
{
  background(#CAE3A5); //light green bg: erase last frame

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
    
    douseFlames();
    
    //run if any game-over condition has been met
    if (hasPlayerLost()) 
    {
      isRunning = false; //stop the game
      
      //print game-over message to console
      println("GAME OVER, MAN. GAME OVER.");
      println("Right-click to play again.");
    }   
    
    //run if any game-over condition has been met
    if (hasPlayerWon()) 
    {
      wonTheGameScreen();
    }  
    
    fc ++; //increment frame count
  } //end of (isRunning) check
} //end of draw()



//draw lake in random, static position
void lake() 
{
  fill(50, 100, 255); //blue
  ellipse(lakeXPos, lakeYPos, 30, 30); //lake shape
}



//draw forest fire in random, static position
void forestFire() 
{
  //check status of flames to choose fill colour
  if (isFireBurning == false) 
  {
    fill(50, 20, 20); //extinguished: sooty brown
  }
  else 
  {
  fill(255, 80, 30); //burning: bright red
  }
  
  rect(fireXPos, fireYPos, 30, 30); //rectangle of fire
}



//draw landing pad in random, static position
void landingPad() 
{
  fill(20, 200, 30); //dark green
  rect(landingPadXPos, landingPadYPos, 40, 40); //landing pad shape
}