///////////////////////
//Assignment 3
//
//Laurel O'Brien
//lobrien14692@ecuad.ca
//102615

//declare and initialize global variables
//
//misc. counters, constants, and variable integers/floats
int fc = 0; //frame counter
float objectSize = 40; //base size used for calculating size of game pieces
float collisionSize = objectSize/2; //size used to calculate collision between game pieces
float boundaryMargin = objectSize + 10; //minimum buffer distance from edge of canvas

//boolean variables
boolean isRunning = false; //indicate if game is running
boolean isDoorLocked = true; //indicate if lock is burning
boolean hasStarted = false; //indicate if game has been started with left click
boolean isKeyPresent = true; //is key available to be picked up

//arrays
int num = 30;
float lightX[] = new float[num]; //array for storing mouseX position to draw light trail
float lightY[] = new float[num]; //storing mouseY position for light trail
int[] starChartX = new int[200]; //200 empty indices for x-axis of a star
int[] starChartY = new int[200]; //200 empty indices for y-axis of a star

//colour variables
color blueTrail = color(50, 100, 240, 100); //low opacity blue
color greyTrail = color(200, 255, 255, 40); //low opacity blue-ish grey
color bronze = color(255, 220, 103); //bronze-yellow
color bgColour = color(10, 5, 50); //background colour, changes with game state

//static object position variables
float keyXPos; //key
float keyYPos;
float lockXPos; //lock
float lockYPos;
float landingPadXPos; //landing pad
float landingPadYPos;

PGraphics endOverlay; //PGraphics that holds win/lose overlay effect

//declare and initialize c_player and c_enemy objects
//
//enemy() takes 2 arguments: greyscale color and square dimension
c_player wisp = new c_player(); //new user-controlled object from c_player class
enemy enemy1 = new enemy(color(100), 30); //4 new objects from enemy class
enemy enemy2 = new enemy(color(200), 30);
enemy enemy3 = new enemy(color(30), 30); 
enemy enemy4 = new enemy(color(250), 30); 



//initial settings, only declared or performed at start
void setup() 
{
  size(640, 480); //canvas size
  rectMode(CENTER); //draw rectangles from their center
  endOverlay = createGraphics(width, height); //initialize endOverlay size
  resetGame(); //initialize starting values for coordinate positions, booleans, counters
  
  //initialize starChartx[] and starChartY with 200 random values fitting inside canvas
  //
  //for every index in starChart[]:
  for (int stars = 0; stars < starChartX.length; stars ++) {
    starChartX[stars] = int(random(0, width)); //select it and assign random value inside width
    starChartY[stars] = int(random(0, height)); //assign  random value inside height
  }
}



//draw 4 enemies bouncing around the canvas, a wisp the player can control,
//a key to retrieve water from, a lock burning that needs to be extinguished,
//and a landing pad for the player to go home to after they put out the flames.
void draw() 
{
  background(bgColour); //cariable-colour background: erase last frame
  starSmatter(); //call starSmatter to draw twinkling stars

  //draw all pieces
  enemy1.drawEnemy(); //enemies: four instances of enemy class
  enemy2.drawEnemy();
  enemy3.drawEnemy();
  enemy4.drawEnemy();
  //only draw key if it isn't being carried and door hasn't been unlocked yet
  if (wisp.isCarryingKey == false && isDoorLocked == true) 
  {
    drawKey(keyXPos, keyYPos); //key
  }
  drawKeyBubble(keyXPos, keyYPos); //key's bubble
  drawLockedDoor(lockXPos, lockYPos); //locked door
  landingPad(); //landing pad
  wisp.drawWisp(); //player-controlled wisp
  
  //run if game is running
  if (isRunning) {
    wisp.moveWispFollowMouse(); //move wisp pos towards mouse pos
    enemy1.moveEnemy(); //move enemy pos
    enemy2.moveEnemy();
    enemy3.moveEnemy();
    enemy4.moveEnemy();
    
    wisp.checkKeyStorage(); //check if wisp has picked up key
    unlockDoor(); //check if door has been unlocked
    
    //run if any game-over condition has been met
    if (hasPlayerLost()) 
    {
      gameOverScreen(); //stop game and display game-over text/bg
    }   
    
    //run if player has satisfied all win conditions
    if (hasPlayerWon()) 
    {
      wonTheGameScreen(); //stop game and display winning text/bg
    }  
    
    fc ++; //increment frame count
  } //end of isRunning() check
    
  //display anything that was written to endOverlay in 
  //gameOverScreen() or wonTheGameScreen()
  image(endOverlay, 0, 0);
  
} //end of draw()
  
