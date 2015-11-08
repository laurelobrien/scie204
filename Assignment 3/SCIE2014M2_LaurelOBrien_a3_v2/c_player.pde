////////////////////
//player class

class c_pilot
{

//declare and initialize attributes
float pilotX = 55; //pilot (x, y) position
float pilotY = 55;
float pilotSpeed = 4;//pilot's speed (rate of position change per frame)
int pilotSize = 30; //pilot size
int numColl = 0;//number of collisions between player and bs
float easing = 0.05; //percent of distance between mouse and pilot position
boolean isCarryingWater = false;
color pilotColour = color(255, 255, 50); //yellow



//move pilot to follow the mouse
void movePilotFollowMouse()
{ 
  float distanceX = mouseX - pilotX; //vert and horiz distance between mouse and pilot
  float distanceY = mouseY - pilotY;
  
  pilotX += distanceX * easing; //move pilot n% of its current distance from mouse
  pilotY += distanceY * easing;
}



//draw the pilot (ellipse)
void drawPilot()
{
  pushMatrix(); //isolate memory
  
  fill(pilotColour);//yellow
  ellipse(pilotX, pilotY, 20, 20); //pilot's shape
  
  popMatrix(); //done isolating memory
  
  //if pilot has picked up water at the lake
  if (isCarryingWater == true) 
  {
    drawWaterLoad(); //draw "satellite" ball of water
  }
}




//randomize player pos in the screen
void placePilot()
{
  pilotX = landingPadXPos;
  pilotY = landingPadYPos;
  numColl = 0;//reset number of collisions
}


//see if player collided with the enemy
//enemyX, enemyY is enemy position x and y
boolean checkCollisionWithEnemy(float enemyX, float enemyY)
{
  //check for collision with player
  if(dist(pilotX, pilotY, enemyX, enemyY) < pilotSize)
  {    
    //numColl ++; //another collision detected
    //println("collision detected --> #" + numColl);
    return true; //there was a collision        
  }
  return false; //no collision detected
}

//see if player collided with the lake
void checkWaterStorage()
{
  //check for collision with player
  if(dist(pilotX, pilotY, lakeXPos, lakeYPos) < 10)
  {    
    isCarryingWater = true; //there was a collision; pilot now carrying water
  }
}

//draw satellite of water following pilot
void drawWaterLoad() 
{
  fill(#12deef); //cyan
  ellipse(pilot.pilotX - 10, pilot.pilotY - 10, 10, 10); //ball of water near pilot
}

} //end of player class