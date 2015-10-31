///////////////////////
//Assignment 3
//
//Laurel O'Brien
//lobrien14692@ecuad.ca
//102615

//declare and initialize variables
int fc = 0; //frame counter, game is 60fps
boolean isRunning = false; //indicate if game is running

c_pilot pilot = new c_pilot(); //new user-controlled object from c_player class


//initial settings, only declared or performed at start
void setup() 
{
  size(640, 480);
  background(#CAE3A5); //bg: light green
  pilot.randomizePilot(); //random initial position of pilot object
}

void draw() 
{
  background(#CAE3A5); //light green bg: erase last frame
  pilot.drawPilot();
  
  if (isRunning) {
    pilot.movePilotFollowMouse();
  }
}