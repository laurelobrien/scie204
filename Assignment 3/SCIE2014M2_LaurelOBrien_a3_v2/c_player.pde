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
color pilotColour = color(250); //light grey

float angle = 0;
float targetAngle = 0;



//move pilot to follow the mouse
void movePilotFollowMouse()
{ 
  float distanceX = mouseX - pilotX; //vert and horiz distance between mouse and pilot
  float distanceY = mouseY - pilotY;
  
  pilotX += distanceX * easing; //move pilot n% of its current distance from mouse
  pilotY += distanceY * easing;
}



//draw the pilot and its smoke cloud pointing towards the mouse
void drawPilot()
{
  //draw smoke trail if game is running
  if (isRunning == true) 
  {
    drawSmokeTrail(); //call drawSmokeTrail() with rgba arguments
  }
  
  //BEGIN TRANSFORMATIONS
  pushMatrix(); //isolate memory
  
  translate(pilot.pilotX, pilot.pilotY); //translate pilot back to its correct position
  rotate(getPilotRotAng()); //rotate pilot by targetAngle
  translate(pilot.pilotX*-1, pilot.pilotY*-1); //move pilot to canvas origin (0, 0)
  
  //draw shapes making up pilot
  fill(pilotColour); //plane body colour
  stroke(240, 10, 10); //edge of red underbelly
  strokeWeight(2); //thicker stroke
  ellipse(pilotX, pilotY, pilotSize/4, pilotSize); //plane body
  noStroke(); //turn off stroke
  ellipse(pilotX, pilotY-5, pilotSize, pilotSize/3); //plane wings
  ellipse(pilotX, pilotY+18, pilotSize/2, pilotSize/5); //plane tail
  fill(10); //dark grey
  rect(pilotX-10, pilotY-5, 3, 9); //left wing stripe
  rect(pilotX+10, pilotY-5, 3, 9); //right wing stripe
  
  popMatrix(); //done isolating memory
  //END TRANSFORMATIONS
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
  if(dist(pilotX, pilotY, lakeXPos, lakeYPos) < collisionSize)
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
  smokeY[which] = pilotY;
  
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
    
    //map i to a value between 2 and 15 to control size of smoke cloud
    float smokeSize = map(i, 0, num, 5, 15);
    
    ellipse(smokeX[index], smokeY[index], smokeSize, smokeSize); //draw smoke cloud
  }
}



//calculate angle of rotation to make pilot point at mouse
float getPilotRotAng()
{
  //assign angle based on difference between mouse and pilot position
  angle = atan2(mouseY - pilot.pilotY, mouseX - pilot.pilotX);
  
  float direction = (angle - targetAngle) / TWO_PI;
  direction -= round(direction);
  direction *= TWO_PI;
  
  targetAngle += direction;
  
  //add 90 degrees rotation to compensate for visual "nose" of pilot
  //not being the focus of the rotation calculation
  targetAngle += radians(90);
  
  return targetAngle; //give method a returned float value
}

} //end of player class