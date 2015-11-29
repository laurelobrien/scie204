

////////////////////
//player class
//
//includes everything for player
//-attributes (variables)
//-actions (functions)
//
class c_player
{

//variables local to a player
//- not globally visible... only visible inside player object
//  unless you use the player object's name to access the
//  variables or functions
float px = 55;//player x,y pos
float py = 55;
float pSpd = 2.5;//player's speed (used for horz and vert movements)
int pSz = 30;//player size
int numColl = 0;//number of collisions between player and bs



//move player to follow the mouse
void movePlayerFollowMouse()
{
  //move horz
  if(mouseX > px)
  {
    px += pSpd;//move right
  }
  else if(mouseX < px)
  {
    px -= pSpd;//move left
  }
  
  //move vert
  if(mouseY > py)
  {
    py += pSpd;//move down
  }
  else if(mouseY < py)
  {
    py -= pSpd;//move up
  }
}



//draw the circle follower
void drawPlayer()
{
  pushMatrix();
  
  fill(#FFC012);//orange
  ellipse(px, py, 11, 11);
  
  popMatrix();
}




//randomize player pos in the screen
void randomizePlayer()
{
  int buffSpace = 20;
  px = random(buffSpace, width - buffSpace);//randomize pos
  py = random(buffSpace, height - buffSpace);
  numColl = 0;//reset number of collisions
}




//see if player collided with the enemy
//
//epx,epy is enemy position x and y
boolean checkCollisionWithEnemy(float epx, float epy)
{
  //check for collision with player
  if(dist(px, py, epx, epy) < pSz)
  {    
    numColl++;//another collision detected
    println("collision detected --> #" + numColl);
    return true;//there was a collision        
  }
  return false;//no collision detected
}





}//end of player class