///////////////////////
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
    isRunning = false; //turn/keep game off
    
    resetGame();
  }
}


///////////////////////
// game over conditions
//
// 1. player has touched enemy
// OR
// 2. thirty seconds have elapsed

void gameOverScreen() 
{
  background(150, 0, 0); //dark red
}

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
  if (fc == 1800) 
  {
    return true;
  } 
  //else, game is still running
  else 
  {
    return false;
  }
}



//reset game positions, booleans, counters etc for new game
void resetGame() 
{
  //reset booleans
  pilot.isCarryingWater = false;
  isFireBurning = true;
  
  //re-randomize positions
  pilot.randomizePilot(); //randomize pilot position
  enemy1.randomizeEnemy(); //randomize enemy positions
  enemy2.randomizeEnemy();
  enemy3.randomizeEnemy();
  enemy4.randomizeEnemy();
  lakeXPos = random(0+boundaryMargin, 640-boundaryMargin); //randomize lake position
  lakeYPos = random(0+boundaryMargin, 480-boundaryMargin);
  fireXPos = random(0+boundaryMargin, 640-boundaryMargin); //randomize fire position
  fireYPos = random(0+boundaryMargin, 480-boundaryMargin);
  landingPadXPos = random(0+boundaryMargin, width-boundaryMargin); //randomize landing pad position
  landingPadYPos = random(0+boundaryMargin, height-boundaryMargin);
}



///////////////////////
// win conditions
//
// 1. touch lake to pick up water, AND
// 2. touch fire while carrying water to extinguish flames, AND
// 3. touch landing pad after extinguishing flames

void wonTheGameScreen() 
{
  background(255, 150, 100); //peachy pink
  
  println("You won in " + str(fc/60) + " seconds."); //report seconds taken to win
  
  isRunning = false; //turn off game
}

//check if player touched fire while carrying water
void douseFlames()
{
  //check for collision with player
  if((dist(pilot.pilotX, pilot.pilotY, fireXPos, fireYPos) < pilot.pilotSize) && (pilot.isCarryingWater == true))
  {    
    isFireBurning = false; //fire extinguished
    pilot.isCarryingWater = false; //water load dropped
  }
}



//check if player touched landing pad after extinguishing fire
boolean hasPlayerWon()
{
  //check for collision with player
  if((dist(pilot.pilotX, pilot.pilotY, landingPadXPos, landingPadYPos) < pilot.pilotSize) && (isFireBurning == false))
  {    
    isRunning = false; //stop game
    return true; //player has done their job and landed safely: win!
  }
  else 
  {
    return false; //player has not done their job yet
  }
}