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
  float buttonTarget; //target for button to move towards: landLeft or landRight
  
  PImage icon; //PNG used to display button
  float dist; //distance between button and target location (landLeft or landRight)
  float movForce = 0.12; //percent of dist button will move
  
  boolean isButtonHover = false; //indicate if mouse is inside button area
  boolean isMovingRight = true; //indicate direction button will move; false = left
  
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
    //determine if button needs to move left or right
    //
    //if it needs to move right:
    if (isMovingRight) 
    {
      buttonTarget = landRight; //its target is x coordinate variable landRight
    }
    //else, it needs to move left, so:
    else
    {
      buttonTarget = landLeft; //its target is landLeft
    }
    
    //calculate distance button needs to move to reach landing position
    dist = dist(buttonTarget, 1, x, 1); //distance this frame between button and target
    
    //if distance between button and landing position is more than a pixel:
    if (dist > 1) 
    {
      buttonVel = dist * movForce; //calculate velocity as percent of distance remaining
      
      //change x position with buttonVel either left or right: addition or subtraction
      //
      //if button is moving right
      if (isMovingRight) 
      {
        x += buttonVel; //apply the velocity to button x position as an addend: move it right
      }
      //else, button is moving left, so:
      else
      {
        x -= buttonVel; //apply the velocity as a subtrahend: move it left
      }
      
    }
    //else, if dist is not more than a pixel:
    else 
    {
      isMovingRight = ! isMovingRight; //toggle direction button will move
    }
  }
  
  //draw button on canvas
  void render() 
  {
    image(icon, x, y); //draw PNG on canvas at current position with current PImage
  }

} //end of renderButton()
