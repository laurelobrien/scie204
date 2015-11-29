//////////////////////////
// this class draws a line between provided coordinates
//
// in draw(), c_line objects are instantiated into an object array 
//for later use

class c_line
{
  //declare and initialize attributes
  float x1, y1, x2, y2; //two sets of coordinates
  color lineCol = color(255); //colour of line
  
  //constructor
  c_line(float tempX1, float tempY1, float tempX2, float tempY2) 
  {
    x1 = tempX1;
    x2 = tempX2;
    y1 = tempY1;
    y2 = tempY2;
  }
  
  
  
  //methods
  //
  //draw PShape line between provided coordinates
  void drawLine() 
  {
    //assignPoints();
    
    stroke(lineCol); //set stroke colour
    line(x1, y1, x2, y2); //draw line with provided arguments
    
    noStroke(); //turn off stroke for future functions
  }
  
}