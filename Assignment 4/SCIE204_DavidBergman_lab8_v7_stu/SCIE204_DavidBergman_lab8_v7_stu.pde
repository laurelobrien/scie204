////////////// code for students

///////////////////////
//commenting and formatting reminders
//
//comment
// - above all
//   - functions
//   - if() statements
//   - for() loops
// - each variable or set of variables you make
// - all lines of code that do something important / notable (eg. clear bg to blue)
//format
// - { } vertically aligned
// - using tabbing so you can see what's inside what, or if you're missing a squiggle
// - 3+ spaces between functions for clarity


////////////////
// lab9
//
// Laurel O'Brien
// 20151116
//
//mouse events (eg. pressed, released, drag)
//calc dist() between 2 points
//easing motion - moving to the mouse pos, or a random target pos
//uses velocity variables to adjust the position (ie. vx and vy for horizontal and vertical)



//global variables
float px = random(600);//player pos
float py = random(400);
float pvx = 0;//player velocity in x and y directions
float pvy = 0;
float movForce = 0.05;//movement force for easing (setup as a % of dist)
float targetX = random(600);//target pos
float targetY = random(400);
float dx = 0;//displacement of player from target
float dy = 0;
float dist = 0;//distance from player to target as the crow flies (not just horizontally or vertically)
float threshDist = 3;//threshold min dist for movement of player to target

PFont larish;
String textWords = "prism";
boolean lineFinished;
int lineCount = 0;
int possibleLines = 10;
c_line[] lineStorage; //array of c_line objects






//runs once when the app first starts
//you can draw here, but it gets drawn over
void setup()
{
  size(640, 480); //sets the app size
  noStroke(); //so shapes don't have outline strokes
  rectMode(CENTER); //make rectangles draw from their centers
  
  larish = createFont("larish.ttf",48);
  lineStorage = new c_line[possibleLines];
  //loadFont("larish.ttf");
}




//runs all the time, this is the main app loop
//is called whenever the window updates
void draw()
{
  background(#FCE694);//bg light yellow
  
  /////testing
  //
  //mouse pos as the target, no click needed
  //targetX = mouseX;//set the mouse to be the target
  //targetY = mouseY;
  
  //movements
  movePlayerToTarget();//move player towards a target according to the movement force
  
  if (lineCount < possibleLines) 
  {
    drawConnectors(); //draw connecting lines between met targets
  } 
  else 
  {
    revealConnectors();
  }

  drawPlayer();//draw player
  drawTarget();//draw target that the player is moving towards
}



//draw text on-screen
void drawText(float x, float y) 
{
  fill(#EA612F); //red
  textFont(larish); //Larish Neue font
  textAlign(CENTER); //align text in center (x,y is bottom center)
  text(textWords, x, y); //draw textWords contents on-screen
}


//draw connecting line between current target and player
void drawConnectors()
{
  stroke(255); //white
  line(targetX, targetY, px, py); //draw line between target and text
  noStroke(); //turn of stroke for following functions
  
  //instantiate new c_line object when player touches target
  if (lineFinished == true) 
  {
    lineStorage[lineCount] = new c_line(px, py, targetX, targetY);
    lineCount ++; //new line completed, increment lineCount
  }
}


//draw all stored c_line objects in lineStorage[]
void revealConnectors() 
{
  for (int i = 0; i < possibleLines; i ++) 
  {
    lineStorage[i].drawLine();
  }
}



//draw the player (circle) that follows the
//target using easing motion / animation
void drawPlayer()
{
  //fill(#FFD136);//orange, hex values from colour picker up in the menu
  //ellipse(px, py, 33, 33);
  
  drawText(px, py);
}




//draw the target '+' that the mouse will move towards
void drawTarget()
{
  fill(#EA612F); //red
  rect(targetX, targetY, 11, 4);//draw a bigger plus as outline  
  rect(targetX, targetY, 4, 11);
  
  fill(255);//white
  rect(targetX, targetY, 9, 2);//draw a plus  
  rect(targetX, targetY, 2, 9);
}




//calc dists from player to target
//note that the direction of dx and dy
//matter when they are used to determine
//which way to move the player in movePlayer()
//... that's why we can't do an abs() on them
//when they are calculated here
void calcDist()
{
  dx = targetX - px;//horizontally
  dy = targetY - py;//vertically
  dist = dist(px, py, targetX, targetY);//directly (as the crow flies)
  
  //if very close to target
  //pick a new random target pos
  if(dist < threshDist)
  {
    lineFinished = true;
    targetX = random(22, 622);
    targetY = random(22, 455);
  } 
  else
  {
    lineFinished = false;
  }
}





//move the player towards the target (using easing)
//at a velocity which is based on the dist from
//the target and the movement force we set
void movePlayerToTarget()
{
  calcDist();
  
  //when the magnitude of the dist is
  //bigger than the threshold dist,
  //move player towards the target
  if(dist > threshDist)
  {
    pvx = dx * movForce;//calculate velocity in horz and vert directions
    pvy = dy * movForce;
    
    //apply the velocity (in both horizontal and vertical directions)
    //notice that the positions are just ADJUSTED by the velocity... this happens EACH frame
    px += pvx;//horz movement
    py += pvy;//vert movement
  }
}