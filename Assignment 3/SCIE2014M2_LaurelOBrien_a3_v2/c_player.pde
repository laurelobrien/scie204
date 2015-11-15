////////////////////
//player class

class c_pilot
{

//declare and initialize attributes
float pilotX = 55; //pilot (x, y) position
float pilotY = 55;
float pilotSpeed = 4;//pilot's speed (rate of position change per frame)
int pilotSize = 40; //pilot size
int numColl = 0;//number of collisions between player and bs
float easing = 0.05; //percent of distance between mouse and pilot position
boolean isCarryingWater = false;
color pilotColour = color(250); //light grey



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
  
  //draw smoke trail if game is running
  if (isRunning == true) 
  {
    drawSmokeTrail(); //call drawSmokeTrail() with rgba arguments
  }
  
  fill(pilotColour); //plane body colour
  stroke(240, 10, 10); //edge of red underbelly
  strokeWeight(2); //thicker stroke
  ellipse(pilotX, pilotY, pilotSize/4, pilotSize); //plane body
  noStroke(); //turn off stroke
  ellipse(pilotX, pilotY-5, pilotSize, pilotSize/3); //plane wings
  ellipse(pilotX, pilotY+18, pilotSize/2, pilotSize/5); //plane tail
  fill(10); //dark grey
  rect(pilotX-10, pilotY-5, 3, 11); //left wing stripe
  rect(pilotX+10, pilotY-5, 3, 11); //right wing stripe
  
  popMatrix(); //done isolating memory
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



//draw a fading smoke trail behind pilot
//which changes colour if pilot is carrying water
void drawSmokeTrail()
{
  //assign pilot's position this frame into smokeX[] and smokeY[]
  int which = frameCount % num;
  smokeX[which] = pilotX;
  smokeY[which] = pilotY+30;
  
  //loop through number of indices in smokeX/smokeY (num)
  //and draw an ellipse based on their stored coordinates
  for (int i = 0; i < num; i ++) {
    // which+1 is the the oldest in the arrays
    int index = (which+1 + i) % num; //wrap back to 0 upon reaching num
    //check isCarryingWater to decide fill colour of smoke
    if (isCarryingWater == true) 
    {
      fill(blueWater); //fill with blue
    } 
    else 
    {
      fill(greySmoke); //fill with grey
    }
    ellipse(smokeX[index], smokeY[index], i, i);
  }
}

} //end of player class