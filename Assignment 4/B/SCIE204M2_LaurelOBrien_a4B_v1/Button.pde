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
  float buttonTarget; //assigned as either landLeft or landRight
  
  PImage icon; //PNG used to display button
  float dist; //distance between button and target location (landLeft or landRight)
  float movForce = 0.08; //percent of dist button will move
  
  boolean isButtonHover = false; //indicate if mouse is inside button area
  boolean hasReachedLanding = true; //indicate if button has stopped on a landing position
  
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



  //move button to resting/landing position
  void move() 
  {
    int directionMod; //use as multiplier for positive or negative position changes
    //if button
    if (isPlaying) 
    {
      buttonTarget = landRight; //button's home on the right
      directionMod = 1;
    }
    //else, demo is not running, so:
    else 
    {
      buttonTarget = landLeft;
      directionMod = -1;
    }
    
    //calculate distance button needs to move to reach landing position
    dist = dist(buttonTarget, 1, x, 1); //distance this frame between button and target
    
    //if distance between button and landing position is more than a pixel:
    if (dist > 1) 
    { 
      buttonVel = dist * movForce; //calculate velocity as percent of distance remaining
      x += buttonVel * directionMod; //apply the velocity to button x position as an addend: move it right
    }
    //else, button is at its home position, so:
    else
    {
      hasReachedHome = true; //re-assign as true so move() is no longer called
    }
  } //end of move()
  
  //draw button on canvas
  void render() 
  {
    //if user is hovering over button
    if (detectMouse()) 
    {
      fill(255, 70); //low opacity white
      rect(x+3, y+3, w-6, h-6); //draw filled rect behind button to indicate hovering
    }
    
    image(icon, x, y); //draw PNG on canvas at current position with current PImage
  }

} //end of renderButton()
