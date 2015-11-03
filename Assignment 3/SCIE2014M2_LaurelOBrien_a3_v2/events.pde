///////////////////////
//
//mouse interaction events

//will be called when any mouse button is pressed
//needs to be called in draw() or it will run once
void mousePressed() 
{
  background(#CAE3A5); //green: erase last frame
  
  //if left mouse button is pressed:
  if (mouseButton == LEFT) 
  {
    isRunning = !isRunning; //toggle isRunning boolean; turn game on/off
  }
  
  //if right mouse button is pressed:
  if (mouseButton == RIGHT) 
  {
    isRunning = true; //turn game on
    pilot.randomizePilot(); //randomize pilot position
    enemy1.randomizeEnemy();
    enemy2.randomizeEnemy();
    enemy3.randomizeEnemy();
    enemy4.randomizeEnemy();
    
    //reset booleans
    isFireBurning = true;
    canWin = false;
  }
}


///////////////////////
// game over conditions
//
// 1. player has touched enemy
// OR
// 2. thirty seconds have elapsed

boolean hasPlayerLost() 
{
  //check if pilot has collided with enemy1 through enemy4
  if (pilot.checkCollisionWithEnemy(enemy1.enemyX, enemy1.enemyY)) 
  {
    return true;
  }
  if (pilot.checkCollisionWithEnemy(enemy2.enemyX, enemy2.enemyY)) 
  {
    return true;
  }
  if (pilot.checkCollisionWithEnemy(enemy3.enemyX, enemy3.enemyY)) 
  {
    return true;
  }
  if (pilot.checkCollisionWithEnemy(enemy4.enemyX, enemy4.enemyY)) 
  {
    return true;
  }
  //check if 30 seconds have elapsed
  if (frameCount == 1800) 
  {
    return true;
  } 
  //else, game is still running
  else 
  {
    return false;
  }
}


///////////////////////
// win conditions
//
// 1. touch lake to pick up water, AND
// 2. touch fire while carrying water to extinguish flames, AND
// 3. touch landing pad after extinguishing flames

//check if player touched fire while carrying water
void douseFlames()
{
  //check for collision with player
  if((dist(pilot.pilotX, pilot.pilotY, fireXPos, fireYPos) < pilot.pilotSize) && (pilot.isCarryingWater == true))
  {    
    isFireBurning = false; //fire extinguished
    canWin = true; //can land safely to win
    pilot.isCarryingWater = false; //water load dropped
  }
}