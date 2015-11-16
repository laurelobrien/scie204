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
  println("GAME OVER, MAN. GAME OVER."); //output printed to console
  String loseText = "GAME OVER, MAN. GAME OVER."; //String to be displayed on canvas
  
  //draw to endOverlay
  endOverlay.beginDraw();
  endOverlay.noStroke(); //turn off stroke inside PGraphic
  endOverlay.rectMode(CENTER); //draw rectangles (and textboxes) from their center
  endOverlay.fill(100, 10, 10, 160); //low opacity dark red
  endOverlay.rect(width/2, height/2, width, height); //rect filling canvas
  
  endOverlay.fill(255); //white
  endOverlay.textSize(32); //set text size
  endOverlay.text(loseText, width/2, height/2, 200, 200); //draw loseText inside 200x200 textbox
  endOverlay.endDraw();
  //end drawing to endOverlay
  
  isRunning = false; //turn off game
  bgColour = color(100, 10, 10); //dark red background
}



//check if any game over conditions have been met
boolean hasPlayerLost() 
{
  //check if wisp has collided with enemy1 through enemy4
  if (wisp.checkCollisionWithEnemy(enemy1.enemyX, enemy1.enemyY)) 
  {
    return true;
  }
  if (wisp.checkCollisionWithEnemy(enemy2.enemyX, enemy2.enemyY)) 
  {
    return true;
  }
  if (wisp.checkCollisionWithEnemy(enemy3.enemyX, enemy3.enemyY)) 
  {
    return true;
  }
  if (wisp.checkCollisionWithEnemy(enemy4.enemyX, enemy4.enemyY)) 
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
  bgColour = color(5, 5, 30); //re-assign bg to a light green background
  
  //reset booleans
  wisp.isCarryingKey = false;
  isDoorLocked = true;
  isKeyPresent = true;
  
  //re-assign starting positions
  //
  //enemies in all 4 corners
  enemy1.initialPosition(enemy1.enemyDiam, enemy1.enemyDiam); 
  enemy2.initialPosition(width-enemy2.enemyDiam, enemy2.enemyDiam);
  enemy3.initialPosition(enemy3.enemyDiam, height-enemy3.enemyDiam);
  enemy4.initialPosition(width-enemy4.enemyDiam, height-enemy4.enemyDiam);
  
  //key, lock, and landing pad in random position inside boundaryMargin limits
  keyXPos = random(boundaryMargin, width-boundaryMargin); //randomize key position
  keyYPos = random(boundaryMargin, height-boundaryMargin);
  lockXPos = random(boundaryMargin, width-boundaryMargin); //randomize lock position
  lockYPos = random(boundaryMargin, height-boundaryMargin);
  landingPadXPos = random(boundaryMargin, width-boundaryMargin); //randomize landing pad position
  landingPadYPos = random(boundaryMargin, height-boundaryMargin);
  
  wisp.placeWisp(); //place wisp on landing pad
  
  endOverlay.beginDraw();
  endOverlay.clear(); //erase any overlay drawings from winning/losing last game
  endOverlay.endDraw();
  
  fc = 0; //reset frame count
}



///////////////////////
// win conditions
//
// 1. touch key to pick it up, AND
// 2. touch door while carrying key to unlock it, AND
// 3. touch landing pad after unlocking door

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

//check if player touched lock while carrying water
void unlockDoor()
{
  //check for collision with player that's carrying water
  if((dist(wisp.wispX, wisp.wispY, lockXPos, lockYPos) <= collisionSize) 
  && (wisp.isCarryingKey == true))
  {    
    isDoorLocked = false; //lock extinguished
    wisp.isCarryingKey = false; //key used and dropped
  }
}



//check if player touched landing pad after putting key in lock
boolean hasPlayerWon()
{
  //check for collision with player
  if((dist(wisp.wispX, wisp.wispY, landingPadXPos, landingPadYPos) <= 10) 
  && (isDoorLocked == false))
  {    
    isRunning = false; //stop game
    return true; //player has done their job and landed safely: win!
  }
  else 
  {
    return false; //player has not done their job yet
  }
}
