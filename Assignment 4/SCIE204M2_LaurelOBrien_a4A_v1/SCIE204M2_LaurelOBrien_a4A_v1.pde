////////////////
// a4A
//
// Laurel O'Brien
// 20151116

//import sound-oriented library Minim
//THIS DOESN'T WORK WITHOUT THE MINIM LIBRARY INSTALLED
import ddf.minim.*;

//variables for rendering text
PFont bodoni; //declare PFont named bodoni
String textBox = "coyotes tiptoe in the snow after dark\n•"; //3 lines drawn in renderText()
float fontSize = 54; //point size of loaded font
float lineLeading = fontSize * 0.9; //90% leading
float textBoxHeight = 300; //height of text box
float textBoxWidth = 400; //width of text box
float vertMargin = textBoxHeight / 2; //top and bottom buffers for target spawn area
float horzMargin = textBoxWidth / 2; //left and right buffers for target spawn area

//variables for moving text and target
float textX; //text position
float textY;
float textVX = 0; //text velocity in x and y directions
float textVY = 0;
float movForce = 0.03; //amount of movement every frame (% of remaining distance)
float targetX; //target position
float targetY;
float distanceX = 0; //displacement of text from target
float distanceY = 0;
float dist = 0;//distance from text to target diagonally/directly
float threshDist = 3; //minimum distance for movement of text to target

//variables for rendering images
PImage coyote, coyoteBlur; //photo of coyote, regular and blurred
PGraphics alphaMask; //PGraphics to be used as an alpha mask

//objects for playing sound
Minim spectre; //declare Minim object named spectre (Coyote by Modest Mouse)
AudioPlayer musicPlayer; //declare AudioPlayer object named musicPlayer



//run once to initialize static and/or initial settings
void setup()
{
  size(1000, 633); //canvas size
  noStroke(); //remove stroke
  
  //initialize starting positions now that size() is set
  textX = random(0 + horzMargin, width - horzMargin); //text starting position
  textY = random(0 + vertMargin, 0 - vertMargin);
  targetX = random(0 + horzMargin, width - horzMargin); //target starting position
  targetY = random(0 + vertMargin, 0 - vertMargin);
  
  //initialize images and pgraphics
  bodoni = createFont("Poster Bodoni Italic BT.ttf", fontSize); //load Poster Bodoni into bodoni
  coyote = loadImage("coyote.jpg"); //load coyote.jpg into variable coyote
  coyoteBlur = loadImage("coyote_blur.jpg"); //blurred, brighter version of coyote
  alphaMask = createGraphics(width, height); //initialize alphaMask and set size

  //initialize sound file and music player
  spectre = new Minim(this); //instantiate Minim object spectre
  musicPlayer = spectre.loadFile("coyotes.mp3"); //initialize musicPlayer with spectre.mp3
}




//runs all the time:
//move an invisible target to a random position inside canvas margins
//and move text to follow it, using easing. move target to a new position
//when the text reaches its position.
//the text masks the blur over the background image.
//
//a song starts playing when the left mouse button is clicked.
void draw()
{
  //check if left mouse button is pressed
  if ((mousePressed) && (mouseButton == LEFT))
  {
    musicPlayer.play(); //start music: call play() method of musicPlayer
  }
  
  background(coyote); //bg: sharp coyote image
  
  moveTextToTarget(); //move text towards a target according to the movement force
  drawText(textX, textY); //draw text to alphaMask according to textX, textY positions
  coyoteBlur.mask(alphaMask); //apply alphaMask to coyote as a mask
  image(coyoteBlur, 0, 0); //draw blurred coyote image with mask now applied
}



//draw black text to white alphaMask before it is applied to coyoteBlur as a mask.
//this will reveal background behind mask-applied image where pixels are black
void drawText(float x, float y) 
{
  alphaMask.beginDraw(); //start drawing to alphaMask
  alphaMask.background(255); //white: masked image fully visible
  alphaMask.fill(0); //black: masked image hidden
  alphaMask.textFont(bodoni); //Poster Bodoni font (italic)
  alphaMask.textAlign(CENTER); //align text in center
  alphaMask.rectMode(CENTER); //draw rectangles from their center (incl. text boxes)
  alphaMask.textLeading(lineLeading); //line spacing
  alphaMask.text(textBox, x, y, textBoxWidth, textBoxHeight); //draw textBox on alphaMask
  alphaMask.endDraw(); //done drawing to alphaMask
}



//calculate distance from text to target
void calcDist()
{
  distanceX = targetX - textX;//horizontally
  distanceY = targetY - textY;//vertically
  dist = dist(textX, textY, targetX, targetY);
  
  //if very close to target
  //pick a new random target position inside canvas margins
  if(dist < threshDist)
  {
    targetX = random(0+horzMargin, width-horzMargin);
    targetY = random(0+vertMargin, height-vertMargin);
  } 
}



//move the text towards the target (using easing)
//at a velocity which is based on the dist from the target and movForce
void moveTextToTarget()
{
  calcDist(); //call calcDist
  
  //when the magnitude of the dist is bigger than the threshold dist,
  //move text towards the target
  if(dist > threshDist)
  {
    textVX = distanceX * movForce; //calculate velocity in x and y axes
    textVY = distanceY * movForce;
    
    //apply the velocity (in both directions)
    textX += textVX; //x-axis movement
    textY += textVY; //y-axis movement
  }
}
