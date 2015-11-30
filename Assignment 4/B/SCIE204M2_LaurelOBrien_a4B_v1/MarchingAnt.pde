////////////////////////
//
// MarchingAnts class 
//
// 
//

class MarchingAnt 
{
  //attributes
  float w = 200; //width and height
  float h = 114;
  float x; //horizontal position: initialized in setup()
  float y = 680; //vertical position: fixed 
  float initPos; //offset 3 different positions from each other
  int offset;
  
  
  //constructor
  MarchingAnt(float tempInitPos) 
  {
    initPos = tempInitPos;
  }
  
  //methods
  void move() 
  {
    //if x position is past the right edge of the canvas and the program isn't resetting itself
    if (x > width && !isResetting) 
    {
      x = 0 - w; //wrap position to beginning of canvas, minus PNG width so it's off-screen
    }
    x += 3.5; //increase x at a speed that matches walking animation
  }
  
  
  
  void render()
  {
    prevFrame = coyoteFrame; //store value of coyoteFrame before re-assigning it
    
    //if the demo is running
    if (isPlaying)
    {
      //re-assign as current frameCount, wrapped @ end of coyote animation
      coyoteFrame = frameCount % coyoteSeq.length;
    } 
    //else, if it's not running:
    else 
    {
      coyoteFrame = prevFrame; //continue to display the most recent frame, pausing animation
    }  

    //draw image from coyoteSeq array
    image(coyoteSeq[coyoteFrame], x, y);
  }

}
