////////////////////////
//
// PoemLine class 
//
// used for creating lines of a poem

class PoemLine 
{
  //attributes
  String text; //String to be drawn on canvas
  float textX, textY; //coordinate position of that String
  float textVX = 0; //velocity of text movement
  float textVY = 0; 
  float targetX, targetY; //target position to move towards
  float distanceX, distanceY; //distance between text pos and target pos
  float dist;
  float movForce; //percent of dist text will move
  float xHome = 600; //fixed horizontal home position
  float yHome; //variable vertical home position
  
  //constructor: how arguments are to be accepted and used
  PoemLine(String tempText, float tempYHome, float tempMovForce) 
  {
    text = tempText; //specific line of poem in String form
    yHome = tempYHome; //y position before hitting play or after reset
    movForce = tempMovForce; //amount of change in position during every frame of movement
  }
  
  //methods
  //
  //initialize text and target starting position
  void init() 
  {
    //text: home position
    textX = xHome;
    textY = yHome;
    
    //target: position is random
    targetX = random(width);
    targetY = random(height - vertMargin); //target is never in area that coyotes march
  }
  
  
  
  //calculate distance from text to target,
  //and move target to new random location if applicable
  void calcDist()
  {
    distanceX = targetX - textX; //horizontally
    distanceY = targetY - textY; //vertically
    dist = dist(textX, textY, targetX, targetY); //distance this frame between text and target
    
    //if text has reached target and doesn't need to stop there as part of a reset,
    //pick a new random target position inside canvas margins
    if (dist < 3 && !isResetting)
    {
      targetX = random(0+horzMargin, width-horzMargin);
      targetY = random(0+vertMargin, height-vertMargin);
    } 
  } //end of calcDist()
  
  
  
  //move the text towards the target (using easing)
  //at a velocity which is based on the dist from the target, and movForce
  void moveTextToTarget()
  { 
    calcDist(); //call calcDist to determine if target has moved and how far text will move
    
    //when the magnitude of the dist is bigger than the threshold dist,
    //move text towards the target
    if(dist > threshDist)
    {
      textVX = distanceX * movForce; //calculate velocity in x and y axes
      textVY = distanceY * movForce;
      
      //apply the velocity (in both directions) to text position
      textX += textVX; //x-axis movement
      textY += textVY; //y-axis movement
    }
  }
  
  
  
  //draw text on canvas
  void renderText() 
  {
    textAlign(CENTER); //center text on x, y position
    textFont(lydian); //use Lydian font
    fill(255); //white fill
    //blendMode(DIFFERENCE); //using blend mode Difference so text colour is always visible
    text(text, textX, textY); //draw text on canvas at (textX, textY)
  } //end of renderText()
}
