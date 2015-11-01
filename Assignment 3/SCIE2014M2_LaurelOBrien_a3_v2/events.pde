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
    
    //randomize and draw enemies
  }
}


///////////////////////
//game over events

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