///////////////////////
// GAME EVENTS
//
// what happens with mouse clicks, winning, losing, collision, etc

///////////////////////
//mouse interaction events
//
//will be called when any mouse button is pressed
void mousePressed() 
{  
  //if left mouse button is pressed and the game isn't already running:
  if (mouseButton == LEFT && isRunning == false && hasStarted == false) 
  {
    isRunning = true; //start the game
    hasStarted = true; //indicate left click can no longer start the game
  }
  
  //if right mouse button is pressed:
  if (mouseButton == RIGHT) 
  {
    isRunning = true; //turn or keep game on
    
    resetGame(); //reset relevant variables to their starting positions
  }
}



///////////////////////
// game over conditions
//
// 1. player has touched enemy
// OR
// 2. thirty seconds have elapsed

//run when the player has lost
void gameOverScreen() 
{
  println("GAME OVER, MAN. GAME OVER.");
  String loseText = "GAME OVER, MAN. GAME OVER.";
  
  //write to endOverlay
  endOverlay.beginDraw();
  endOverlay.noStroke();
  endOverlay.rectMode(CENTER);
  endOverlay.fill(100, 10, 10, 160); //low opacity dark red
  endOverlay.rect(width/2, height/2, width, height); //rect filling canvas
  
  endOverlay.fill(255); //white
  endOverlay.textSize(32);
  endOverlay.text(loseText, width/2, height/2, 200, 200);
  endOverlay.endDraw();
  //end writing to endOverlay
  
  isRunning = false; //turn off game
  bgColour = color(100, 10, 10); //dark red background
}



//check if any game over conditions have been met
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
  //else, player has not lost this frame
  else 
  {
    return false;
  }
}



//reset game positions, booleans, counters etc for new game
void resetGame() 
{
  bgColour = color(200, 250, 150); //re-assign bg to a light green background
  
  //reset booleans
  pilot.isCarryingWater = false;
  isFireBurning = true;
  
  //re-assign starting positions
  //
  //enemies in all 4 corners
  enemy1.initialPosition(0+enemy1.enemyDiam, 0+enemy1.enemyDiam); //initial position of 4 enemy objects in 4 corners
  enemy2.initialPosition(width-enemy2.enemyDiam, 0+enemy2.enemyDiam);
  enemy3.initialPosition(0+enemy3.enemyDiam, height-enemy3.enemyDiam);
  enemy4.initialPosition(width-enemy4.enemyDiam, height-enemy4.enemyDiam);
  
  //lake, fire, and landing pad in random position inside boundaryMargin limits
  lakeXPos = random(0+boundaryMargin, 640-boundaryMargin); //randomize lake position
  lakeYPos = random(0+boundaryMargin, 480-boundaryMargin);
  fireXPos = random(0+boundaryMargin, 640-boundaryMargin); //randomize fire position
  fireYPos = random(0+boundaryMargin, 480-boundaryMargin);
  landingPadXPos = random(0+boundaryMargin, width-boundaryMargin); //randomize landing pad position
  landingPadYPos = random(0+boundaryMargin, height-boundaryMargin);
  
  pilot.placePilot(); //place pilot on landing pad
  
  endOverlay.beginDraw();
  endOverlay.clear(); //erase any overlay drawings from winning/losing last game
  endOverlay.endDraw();
  
  fc = 0; //reset frame count
}



///////////////////////
// win conditions
//
// 1. touch lake to pick up water, AND
// 2. touch fire while carrying water to extinguish flames, AND
// 3. touch landing pad after extinguishing flames

void wonTheGameScreen() 
{ 
  println("You won in " + str(fc/60) + " seconds."); //report seconds taken to win
  String winText = "You won in "+str(fc/60)+" seconds.";
  
  //write to endOverlay
  endOverlay.beginDraw();
  endOverlay.noStroke();
  endOverlay.rectMode(CENTER);
  endOverlay.fill(255, 180, 160, 160); //low opacity peachy pink
  endOverlay.rect(width/2, height/2, width, height); //rect filling canvas  
  
  endOverlay.fill(255); //white
  endOverlay.textSize(32);
  endOverlay.text(winText, width/2, height/2, 200, 200);
  endOverlay.endDraw();
  //end writing to endOverlay
  
  
  isRunning = false; //turn off game
  bgColour = color(255, 180, 160); //peachy pink background
}

//check if player touched fire while carrying water
void douseFlames()
{
  //check for collision with player that's carrying water
  if((dist(pilot.pilotX, pilot.pilotY, fireXPos, fireYPos) <= collisionSize) 
  && (pilot.isCarryingWater == true))
  {    
    isFireBurning = false; //fire extinguished
    pilot.isCarryingWater = false; //water load dropped
  }
}



//check if player touched landing pad after extinguishing fire
boolean hasPlayerWon()
{
  //check for collision with player
  if((dist(pilot.pilotX, pilot.pilotY, landingPadXPos, landingPadYPos) <= 10) 
  && (isFireBurning == false))
  {    
    isRunning = false; //stop game
    return true; //player has done their job and landed safely: win!
  }
  else 
  {
    return false; //player has not done their job yet
  }
}