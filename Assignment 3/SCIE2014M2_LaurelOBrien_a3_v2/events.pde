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