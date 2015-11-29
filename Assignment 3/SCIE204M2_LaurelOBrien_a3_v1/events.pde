

//when a mouse button is pressed
//
//
void mousePressed()
{
  background(#CCEEFF);//bg light blue
  
  //if L mouse button is down
  if(mouseButton == LEFT)
  {
    isRunning = !isRunning;//toggle game running or not    
  }
  
  //R mouse button down
  if(mouseButton == RIGHT)
  {
    isRunning = true;//turn game on, allow movements
    player.randomizePlayer();

    //draw several randomly placed and coloured rectangles
    for(int i=0; i < 22; i++)
      drawRandRect();
    
    //do all the other things here to reset and start a new game
  }
}