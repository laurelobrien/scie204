////////////////////
//player class
//
//includes everything for player
//-attributes (variables)
//-actions (functions)
//
class c_pilot
{

//declare and initialize attributes
float pilotX = 55; //pilot (x, y) position
float pilotY = 55;
float pilotSpeed = 4;//pilot's speed (rate of position change per frame)
int pilotSize = 30; //pilot size
int numColl = 0;//number of collisions between player and bs
float easing = 0.05; //percent of distance between mouse and pilot position



//move pilot to follow the mouse
void movePilotFollowMouse()
{
  //example code from class
  //moves shape in a zig-zag
  //
  /*move horz
  if(mouseX > pilotX)
  {
    pilotX += pilotSpeed;//move right
  }
  else if(mouseX < pilotX)
  {
    pilotX -= pilotSpeed;//move left
  }
  
  //move vert
  if(mouseY > pilotY)
  {
    pilotY += pilotSpeed;//move down
  }
  else if(mouseY < pilotY)
  {
    pilotY -= pilotSpeed;//move up
  }
  */
  
  float distanceX = mouseX - pilotX; //vert and horiz distance between mouse and pilot
  float distanceY = mouseY - pilotY;
  
  pilotX += distanceX * easing; //move pilot n% of its current distance from mouse
  pilotY += distanceY * easing;
}



//draw the pilot (ellipse)
void drawPilot()
{
  pushMatrix(); //isolate memory
  
  fill(#FFFF00);//yellow
  ellipse(pilotX, pilotY, 20, 20); //pilot's shape
  
  popMatrix(); //done isolating memory
}




//randomize player pos in the screen
void randomizePilot()
{
  pilotX = random(boundaryMargin, width - boundaryMargin); //randomize pos excluding boundaryMargin
  pilotY = random(boundaryMargin, height - boundaryMargin);
  numColl = 0;//reset number of collisions
}



/* code written in class
// not implemented yet
// will apply to 4 randomly-moving enemy objects
//
//see if player collided with the enemy
//enemyX, enemyY is enemy position x and y
boolean checkCollisionWithEnemy(float enemyX, float enemyY)
{
  //check for collision with player
  if(dist(pilotX, pilotY, enemyX, enemyY) < pilotSize)
  {    
    numColl ++; //another collision detected
    println("collision detected --> #" + numColl);
    return true;//there was a collision        
  }
  return false;//no collision detected
} */

} //end of player class