////////////////////////
//
// Button class 
//
// used for moving, rendering, and 
// interacting with buttons

class Button 
{
  ////////////////////////
  //attributes
  int w = 96; //width of button png
  int h = 75; //height of button png
  float x, y; //x and y positions of button, drawn from corner
  float landLeft = 30; //left and right landing positions to move towards during transitions
  float landRight = width - 30 - w;
  float buttonVel; //velocity of button movement
  boolean isButtonHover = false; //indicate if mouse is inside button area
  PImage icon; //PNG used to display button
  float dist; //distance between button and target location (landLeft or landRight)
  float movForce; //percent of dist button will move
  float distanceX;
  float easing = 0.05;
  
  ////////////////////////
  //constructor
  Button(PImage tempIcon, int tempX, int tempY) 
  {
    icon = tempIcon; //image used to render button
    x = tempX; //initial x and y pos
    y = tempY;
  }
  
  ////////////////////////
  //methods
  //
  //detect if mouse is inside button area when pressed
  boolean detectMouse() 
  { 
    //while mouse is hovering over button area, return true 
    if ((mouseX > x && mouseX < x + w) && (mouseY > y && mouseY < y + h))
    {
      return true;
    } 
    //else, return false
    else 
    {
      return false;
    }
  } //end of detectMouse
  
  
  /*calculate dist, and move x position of button with easing 
  void calcDist() 
  {
    distanceX = landRight - x; //horizontally
    dist = landRight-x; //distance this frame between text and target
  } */
  
  
  //move button to resting/landing position
  void move() 
  {
    //calculate distance button needs to move to reach landing position
    dist = landRight - x; //distance this frame between text and target
    
    //if button has not reached left or right landing position yet:
    if (dist > 1) 
    {
      buttonVel = dist * easing; //calculate velocity as percent of distance remaining
      x += buttonVel; //apply the velocity to button x position
    }
  }
  
  //draw button on canvas
  void render() 
  {
    image(icon, x, y); //PImage provided in argument drawn at x and y pos
  }

} //end of renderButton()
