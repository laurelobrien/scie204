////////////////////
//player class

class c_player
{

//declare and initialize attributes
float wispX = 55; //wisp (x, y) position
float wispY = 55;
float wispSpeed = 4;//wisp's speed (rate of position change per frame)
int wispSize = 30; //wisp size
int numColl = 0;//number of collisions between player and bs
float easing = 0.05; //percent of distance between mouse and wisp position
boolean isCarryingKey = false;
color wispColour = color(250); //light grey

float angle = 0;
float targetAngle = 0;



//move wisp to follow the mouse
void moveWispFollowMouse()
{ 
  float distanceX = mouseX - wispX; //vert and horiz distance between mouse and wisp
  float distanceY = mouseY - wispY;
  
  wispX += distanceX * easing; //move wisp n% of its current distance from mouse
  wispY += distanceY * easing;
}



//draw the wisp and its smoke cloud pointing towards the mouse
void drawWisp()
{
  //draw smoke trail if game is running
  if (isRunning == true) 
  {
    drawLightTrail(); //call drawLightTrail()
  }

  pushMatrix(); //isolate memory for transformations
  
  translate(wisp.wispX, wisp.wispY); //translate wisp back to its correct position
  rotate(getWispRotAng()); //rotate wisp by targetAngle
  translate(wisp.wispX*-1, wisp.wispY*-1); //move wisp to canvas origin (0, 0)
  
  //draw shapes making up wisp
  fill(200, 255, 255, 50); //low opacity pale blue
  ellipse(wispX, wispY, objectSize, objectSize); //wisp glow
  fill(200, 255, 255, 255); //pale blue
  ellipse(wispX, wispY, objectSize*0.625, objectSize*0.625); //wisp body
  
  fill(255); //white
  triangle(wispX-12, wispY-2, wispX-20, wispY+18, wispX-13, wispY+12); //left wing
  triangle(wispX+12, wispY-2, wispX+20, wispY+18, wispX+13, wispY+12); //right wing
  
  popMatrix(); //done isolating memory
  
  //if wisp picked up key
  if (isCarryingKey) 
  {
    drawHoveringKey(); //draw small key hovering behind it
  }
}



//place wisp on top of landing pad
void placeWisp()
{
  wispX = landingPadXPos;
  wispY = landingPadYPos;
  numColl = 0;//reset number of collisions
}



//see if player collided with the enemy
boolean checkCollisionWithEnemy(float enemyX, float enemyY)
{
  //check if distance between edge of player and edge of enemy is less than collision allowance
  if(dist(wispX, wispY, enemyX, enemyY) < collisionSize)
  {    
    return true; //there was a collision        
  }
  return false; //no collision detected
}



//see if player collided with the key
void checkKeyStorage()
{
  //check if distance between edge of player and edge of key is less than collision allowance
  if((dist(wispX, wispY, keyXPos, keyYPos) < collisionSize)
  && isKeyPresent == true)
  {    
    isCarryingKey = true; //there was a collision; wisp now carrying key
    isKeyPresent = false; //colliding with this area won't pick up a new key
  }
}



//draw a fading smoke trail behind wisp
//which changes colour if wisp is carrying a key
void drawLightTrail()
{
  //assign wisp's position this frame into lightX[] and lightY[]
  int which = frameCount % num;
  lightX[which] = wispX;
  lightY[which] = wispY;
  
  //loop through number of indices in smokeX/smokeY (num)
  //and draw an ellipse based on their stored coordinates
  for (int i = 0; i < num; i ++) {
    // which+1 is the the oldest in the arrays
    int index = (which+1 + i) % num; //wrap back to 0 upon reaching num
    //check isCarryingKey to decide fill colour of smoke
    if (isCarryingKey == true) 
    {
      fill(blueTrail); //fill with blue
    } 
    else 
    {
      fill(greyTrail); //fill with grey
    }
    
    //map i to a value between 2 and 15 to control size of smoke cloud
    float lightSize = map(i, 0, num, 5, 20);
    
    ellipse(lightX[index], lightY[index], lightSize, lightSize); //draw smoke cloud
  }
}



//calculate angle of rotation to make wisp point at mouse
float getWispRotAng()
{
  //assign angle based on difference between mouse and wisp position
  angle = atan2(mouseY - wisp.wispY, mouseX - wisp.wispX);
  
  float direction = (angle - targetAngle) / TWO_PI;
  direction -= round(direction);
  direction *= TWO_PI;
  
  targetAngle += direction;
  
  //add 90 degrees rotation to compensate for visual "nose" of wisp
  //not being the focus of the rotation calculation
  targetAngle += radians(90);
  
  return targetAngle; //give method a returned float value
}



//draw smaller version of key hovering behind wisp
void drawHoveringKey() 
{
  pushMatrix(); //isolate memory for transformations
  
  translate(wispX-20, wispY+20); //translate to correct position behind wisp
  scale(0.5); //scale down 50%
  
  drawKey(0, 0); //call drawKey(); to draw key at canvas origin
  
  popMatrix(); //done isolating memory
}

} //end of player class
