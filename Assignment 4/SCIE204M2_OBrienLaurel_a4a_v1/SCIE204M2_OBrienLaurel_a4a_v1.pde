////////////////
// a4a
//
// Laurel O'Brien
// 20151116

//import sound-oriented library Minim
import ddf.minim.*;

//global variables
float mothX = random(width); //text ("atlas moth") position
float mothY = random(height);
float mothVX = 0; //player velocity in x and y directions
float mothVY = 0;
float movForce = 0.03; //amount of movement every frame (% of remaining distance)
float targetX = random(width); //light source/target position
float targetY = random(height);
float distanceX = 0; //displacement of moth from target
float distanceY = 0;
float dist = 0;//distance from player to target diagonally/directly
float threshDist = 3; //minimum distance for movement of moth to target

//variables for rendering text
PFont larish; //declare PFont named larish
String textWords = "atlas moth"; //text appearing on-screen in draw()
float colourChange = 0; //fill colour of text, changes with dist

//variables for rendering image and playing sound
PImage hiking; //

Minim spectre; //declare Minim object named spectre (Spectre by Tycho, from 2015 album Awake)
AudioPlayer musicPlayer; //declare AudioPlayer object named musicPlayer



//run once to initialize static and/or initial settings
void setup()
{
  size(1000, 667); //canvas size
  noStroke(); //remove stroke
  rectMode(CENTER); //draw rectangles (including textboxes) from their center
  
  larish = createFont("larish.ttf", 50); //load larish.ttf into PFont variable larish
  hiking = loadImage("austin_hiking.jpg"); //load austin_hiking.jpg into variable hiking
  
  
  spectre = new Minim(this); //instantiate Minim object spectre
  musicPlayer = spectre.loadFile("spectre.mp3"); //initialize musicPlayer with spectre.mp3
}




//runs all the time, this is the main app loop
//is called whenever the window updates
void draw()
{
  //check if left mouse button is pressed
  if ((mousePressed) && (mouseButton == LEFT))
  {
    musicPlayer.play(); //start music: call play() method of musicPlayer
  }
  
  background(hiking); //bg image
  
  //movements
  moveTextToTarget(); //move text towards a target according to the movement force

  drawText(mothX, mothY); //render moth text at (mothX, mothY)
  drawLightSource(); //draw glowing light source target for moth text to follow
}



//draw text on-screen
void drawText(float x, float y) 
{
  //map current value of dist between 0 and 255 so greyscale values 
  //can change with dist proportionately.
  //input range max == width/3, to make colour change more dramatic and
  //is multiplied by -1 so decreasing dist outputs increasing RGB value (double neg)
  colourChange = map(dist, 0, width/3, 255, 0) * -1;
  
  fill(0 - colourChange, 0 - colourChange, 0 - colourChange); //black minus colourChange
  textFont(larish); //Larish Neue font
  textAlign(CENTER); //align text in center (x,y is bottom-center)
  text(textWords, x, y); //draw textWords contents on-screen
}



//draw light source to act as target for text to move towards
void drawLightSource() {
  fill(255, 20); //white, low opacity fill
  
  //layers of translucent ellipses:
  //stand in for exposure/contrast filter emulating flashlight illumination
  ellipse(targetX, targetY, 10, 10);
  ellipse(targetX, targetY, 30, 30);
  ellipse(targetX, targetY, 50, 50);
  ellipse(targetX, targetY, 75, 75);
  ellipse(targetX, targetY, 100, 100);
  ellipse(targetX, targetY, 125, 125);
}



//calculate distance from moth text to light source (target)
void calcDist()
{
  distanceX = targetX - mothX;//horizontally
  distanceY = targetY - mothY;//vertically
  dist = dist(mothX, mothY, targetX, targetY);
  
  //if very close to target
  //pick a new random target position inside canvas
  if(dist < threshDist)
  {
    targetX = random(0, width);
    targetY = random(0, height);
  } 
}



//move the player towards the target (using easing)
//at a velocity which is based on the dist from the target and movForce
void moveTextToTarget()
{
  calcDist(); //call calcDist
  
  //when the magnitude of the dist is
  //bigger than the threshold dist,
  //move player towards the target
  if(dist > threshDist)
  {
    mothVX = distanceX * movForce; //calculate velocity in x and y axes
    mothVY = distanceY * movForce;
    
    //apply the velocity (in both directions)
    mothX += mothVX; //x-axis movement
    mothY += mothVY; //y-axis movement
  }
}
