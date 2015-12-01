////////////////////////
//
// MarchingAnts class 
//
// 
//

class MarchingCoyote 
{
  //attributes
  float w = 200; //width and height
  float h = 114;
  float x; //horizontal position: initialized in setup()
  float y = 740; //vertical position: fixed 
  float initPos; //offset 3 different positions from each other
  int offset;
  
  
  //constructor
  MarchingCoyote(float tempInitPos) 
  {
    initPos = tempInitPos;
  }
  
  //methods
  void move() 
  {
    //if x position is past the right edge of the canvas and the program isn't resetting itself
    if (x > width && (!isResetting || !isPlaying)) 
    {
      x = 0 - w; //wrap position to beginning of canvas, minus PNG width so it's off-screen
    }
    x += 3.5; //increase x at a speed that matches walking animation
  }
  
  
  
  void render()
  {
    //draw image from coyoteSeq array based on frameCount,
    //wrapping at the end of the animation
    image(coyoteSeq[frameCount % coyoteSeq.length], x, y);
  } //end of render

}
