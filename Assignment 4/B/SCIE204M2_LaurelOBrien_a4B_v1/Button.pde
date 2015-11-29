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
  float landLeft = 30; //left and right x positions to move towards during transitions
  float landRight = width - 30;
  boolean isButtonHover = false; //indicate if mouse is inside button area
  PImage icon; //PNG used to display button
  
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
  
  
  
  /*move x position of button with easing
  void moveButton() 
  {
    
  } end of moveButton() */
  
  
  
  //draw button on canvas
  void render() 
  {
    image(icon, x, y); //PImage provided in argument drawn at x and y pos
  }

} //end of renderButton()
