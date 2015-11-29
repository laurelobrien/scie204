/*
rotate drawing to point at mouse

from 
https://forum.processing.org/one/topic/
rotate-shape-towards-mouse-with-easing.html
*/

float angle = 0;
float targetAngle = 0;
float easing = 0.05f;

//initial settings
void setup() {
  size(320, 240); //canvas size
  background(0); //black background
}

void draw() {
  background(0);
  
  //calculate angle based on difference between mouse and center of canvas
  angle = atan2( mouseY - height/2, mouseX - width/2 );
  
  //initialize direction as angle minus targetAngle divided by 2*PI
  float direction = (angle - targetAngle) / TWO_PI;
  direction -= round(direction); //round direction
  direction *= TWO_PI; //multiply by 2*PI
  
  //change targetAngle by direction, modified by easing
  targetAngle += direction * easing;
  
  noStroke(); //remove stroke
  fill(200); //grey
  pushMatrix(); //begin transformations
  
  //rotate by targetAngle, then translate to center of canvas
  translate(width/2, height/2);
  rotate(targetAngle);
  
  //draw ellipse at canvas origin
  ellipse(0, 0, 60, 30);
  popMatrix(); //end transformations
}