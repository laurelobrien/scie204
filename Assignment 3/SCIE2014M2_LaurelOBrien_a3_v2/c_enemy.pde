////////////////////
//enemy class
//
//its objects take 2 arguments: fill colour and square dimension

class enemy 
{
  //declare and initialize attributes
  float enemyHorzVel = random(0.5,5); //x-axis velocity
  float enemyVertVel = random(0.5,6); //y-axis velocity  
  float enemyX;
  float enemyY;
  int enemyDiam; //w and h dimensions of enemy
  int enemyRad = enemyDiam / 2; //radius of enemy (for rectMode(CENTER) considerations)
  color fillColour; //fill colour
  
  //constructor
  enemy(color tempColour, int tempDiam) 
  {
    fillColour = tempColour;
    enemyDiam = tempDiam;
  }
  
  void moveEnemy() 
  {
    enemyX += enemyHorzVel;
    enemyY += enemyVertVel;
    
    checkForBounce();
    limitSpeed();
  }
  
  void checkForBounce() 
  {
    if (enemyX > width - enemyRad || enemyX < enemyRad) 
    {
      enemyX -= enemyHorzVel; //move it back in bounds
      enemyHorzVel *= -1; //turn it around: reverse the polarity of its increments
      enemyHorzVel *= random(0.5, 2); //re-randomize speed
      enemyVertVel *= random(0.5, 5);
    }
    
    if (enemyY > height - enemyRad || enemyY < enemyRad) 
    {
      enemyY -= enemyVertVel; //move it back in bounds
      enemyVertVel *= -1; //turn it around: reverse the polarity of its increments
      enemyHorzVel *= random(0.5, 5); //re-randomize speed
      enemyVertVel *= random(0.5, 2);
    }
  }
  
  //limit the speed so it's not too fast or slow
  void limitSpeed()
  {
    //ensure speed isn't too fast
    while(dist(0,0, enemyHorzVel, enemyVertVel) > 5)
    {
      //reduce speed equally for vx and vy
      //so the direction is preserved
      enemyHorzVel *= 0.9;
      enemyVertVel *= 0.9;
    }
    
    //ensure speed isn't too slow
    while(dist(0,0, enemyHorzVel, enemyVertVel) < 2)
    {
      //increase  speed equally for vx and vy
      //so the direction is preserved
      enemyHorzVel *= 1.1;
      enemyVertVel *= 1.1;
    }
  }
  
  void drawEnemy() 
  {
    noStroke();
    fill(fillColour); //colour provided on instantiation
    rect(enemyX, enemyY, enemyDiam, enemyDiam);
  }
  
  void initialPosition(int xxx, int yyy) 
  {
    enemyX = xxx;
    enemyY = yyy;
  }
}