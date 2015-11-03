///////////////////////
//Assignment 3
//
//Laurel O'Brien
//lobrien14692@ecuad.ca
//102615

//declare and initialize variables
int fc = 0; //frame counter
int boundaryMargin = 30; //minimum distance from edge of canvas
boolean isRunning = false; //indicate if game is running
boolean canWin = false;
boolean isFireBurning = true;

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
  pilot.randomizePilot(); //random initial position of pilot object
  enemy1.randomizeEnemy(); //random initial position of 4 enemy objects
  enemy2.randomizeEnemy();
  enemy3.randomizeEnemy();
  enemy4.randomizeEnemy();
}

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
      isRunning = false; //stop the game
      
      //print game-over message to console
      println("You win!");
      println("Right-click to play again.");
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
  fill(#FAE821); //yellow
  rect(landingPadXPos, landingPadYPos, 30, 50); //landing pad shape
}