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


///////////////////////
//file naming convention:
//SCIE204M2_Name_a#_v#.pde  <-- M2 is Monday afternoon
// - pde is automatically put into a new folder named exactly the same
// - the file and folder must have the SAME name
//... or for multiple class days...
//SCIE204R_FirstLast_a1_v1
//M = Monday
//R = Thursday


///////////////////////
//Assignment 3
//
//Laurel O'Brien
//lobrien14692@ecuad.ca
//102615
//
//BASIC VERSION DONE IN CLASS... IT DOESN'T HAVE EASING
//
//randomization - random rects on R mouse click
//make player (circle) follow the mouse
//calc dist from one thing to another (eg. for collision checking)
//use tabs (separate pde files) to separate code to keep things cleaner
// eg. bouncySqr actions are in the bouncySqr tab
// eg. player class is in the c_player tab
// eg. mouse handler event functions are in the events tab
//





//global variables
int fc = 0;//frame counter, 60x per sec
boolean isRunning = false;//if game is running, things move

c_player player = new c_player();//player object made from c_player class

//bouncy square
float bsx = 222;//bouncy square pos
float bsy = 333;
float bsvx = random(-5, 5);//bouncy square's velocity
float bsvy = random(-5, 5);
int bsSz = 32;//bouncy square size
float bsAng = 0;//angle of bouncy square
float bsas = random(-9, 9);//bs angular speed
color bsCol = #A47EFF;//bouncy square's starting colour

//random rectangles: colour, pos, size
int rrr;//colour components: red, green, blue
int rrg;
int rrb;
float rrx;//rand rect pos
float rry;
float rrw;//size
float rrh;








//this function run when the program first starts
//you can draw here, but it gets drawn over
void setup()
{
  size(640, 480);//set window size  
  rectMode(CENTER);//draw rect from it's center
  background(#CCEEFF);//bg light blue
  player.randomizePlayer();//randomize player
}




//runs all the time, this is the main app loop
//is called whenever the window updates
void draw()
{ 
  //game over?
  if (fc > 1800) //if 1800 frames have been drawn:
  {
    println("GAME OVER MAN. GAME OVER."); //print a game over message
    isRunning = false; //turn the game off
  }
  
  //background(#CCEEFF);//clear app's bg colour to light blue
  //drawRandRect();//draw random rects
   
  //if the game is running, allow all movements 
  if(isRunning)
  { 
    fc++; //count a frame being drawn while game is running
    moveBouncySquare();
    player.movePlayerFollowMouse();
    
    //if there's a collision between player and bouncySquare
    if(player.checkCollisionWithEnemy(bsx, bsy))
    {      
      bsCol = color(random(255), random(255), random(255));//randomize the colour
      bsas = random(-9, 9);//randomize the bouncy square's angular speed to visually show the collision occur (user feedback)
      println("GAME OVER MAN. GAME OVER."); //print a game over message
      isRunning = false; //turn the game off
    }
  }
    
  //draw all
  player.drawPlayer();
  drawBouncySquare();
}




//draw a randomly positioned and coloured rect
void drawRandRect()
{
  //randomize colour
  //need to cast to int because
  //these are integer variables
  rrr = int(random(22, 222));//rand RGB colour
  rrg = int(random(22, 222));
  rrb = int(random(22, 222));
  
  //randomize position and size
  rrx = random(60, width - 60);//rand pos for the top left
  rry = random(60, height - 60);
  rrw = random(33, 120);//rand width and height
  rrh = random(33, 120);

  fill(rrr, rrg, rrb);
  rect(rrx, rry, rrw, rrh);  
}