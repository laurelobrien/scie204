///////////////////////
//Assignment 3
//
//Laurel O'Brien
//lobrien14692@ecuad.ca
//102615

//declare and initialize global variables
int fc = 0; //frame counter
int boundaryMargin = 30; //minimum spawn distance from edge of canvas
boolean fadeIn = false;
float fireSize = 30; //square dimensions of fire
boolean isRunning = false; //indicate if game is running
boolean isFireBurning = true; //indicate if fire is burning
boolean hasStarted = false; //indicate if game has been started with left click
color bgColour = color(10, 5, 50); //background colour, changes with game state

//smoke cloud variables
int num = 30;
float lightX[] = new float[num];
float lightY[] = new float[num];
color blueWater = color(50, 100, 240, 100); //low opacity blue
color greySmoke = color(200, 255, 255, 40); //low opacity grey

//static object position variables
float lakeXPos; //lake
float lakeYPos;
float fireXPos; //fire
float fireYPos;
float landingPadXPos; //landing pad
float landingPadYPos;

int collisionSize = 30;

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
}



//draw 4 enemies bouncing around the canvas, a wisp the player can control,
//a lake to retrieve water from, a fire burning that needs to be extinguished,
//and a landing pad for the player to go home to after they put out the flames.
void draw() 
{
  background(bgColour); //light green bg: erase last frame

  //draw all
  enemy1.drawEnemy(); //enemies: four instances of enemy class
  enemy2.drawEnemy();
  enemy3.drawEnemy();
  enemy4.drawEnemy();
  drawKeyGlow(lakeXPos, lakeYPos); //key's glow
  drawKey(lakeXPos, lakeYPos); //key
  drawLock(fireXPos, fireYPos);
  landingPad(); //landing pad
  wisp.drawWisp(); //wisp
  
  //run if game is running
  if (isRunning) {
    wisp.moveWispFollowMouse(); //move wisp pos to mouse pos
    enemy1.moveEnemy(); //move enemy pos
    enemy2.moveEnemy();
    enemy3.moveEnemy();
    enemy4.moveEnemy();
    
    wisp.checkKeyStorage(); //check if wisp has picked up water
    douseFlames(); //check if flames have been extinguished
    
    //run if any game-over condition has been met
    if (hasPlayerLost()) 
    {
      gameOverScreen(); //stop game and display game-over text/bg;
    }   
    
    //run if player has satisfied all win conditions
    if (hasPlayerWon()) 
    {
      wonTheGameScreen(); //stop game and display winning text
    }  
    
    fc ++; //increment frame count
  } //end of isRunning() check
    
  //display anything that was written to endOverlay in 
  //gameOverScreen() or wonTheGameScreen()
  image(endOverlay, 0, 0);
  
} //end of draw()
  
