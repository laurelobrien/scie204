///////////////////////
//
// a4B
//
// Laurel O'Brien
// 20151128
// lobrien14692@ecuad.ca

//import sound-oriented library Minim

//THIS DOESN'T WORK WITHOUT THE MINIM LIBRARY INSTALLED
import ddf.minim.*;

/* declare and initialize global variables/objects/arrays/et al
-------------------------------------------------------------------*/

//objects for playing sound
Minim spectre; //declare Minim object named spectre ("Coyote" by Modest Mouse)
AudioPlayer musicPlayer; //declare AudioPlayer object named musicPlayer

//PImages
PImage mountainPic; //background photo
PImage playIcon, resetIcon, stopIcon; //UI button graphics: 96 x 75 px
PImage[] coyoteSeq = new PImage[41];

//Strings — "Coyotes" by Modest Mouse
String line1 = "coyotes tip-toe through the snow after dark";
String line2 = "at home with the ghosts in the national parks";
String line3 = "man-kind's behavin' like some serial killer";
String line4 = "giant ol' monsters afraid of the sharks";

//variables for rendering Strings
float fontSize = 30;
PFont lydian;

//variables for layout and movement
float horzMargin = 200; //margin on left and right of canvas
float vertMargin = 50; //margin on top and bottom of canvas
//float distanceX;
//float distanceY;
float threshDist = 3; //threshold dist before target moves itself away from text
float movForce = 0.02; //percent of prescribed distance text will move

//booleans
boolean isPlaying = false; //indicate if motion graphics and music are playing

//instantiate objects
PoemLine poemLine1 = new PoemLine(line1); //4 new PoemLine objects
PoemLine poemLine2 = new PoemLine(line2);
PoemLine poemLine3 = new PoemLine(line3);
PoemLine poemLine4 = new PoemLine(line4);

Button playButton; //2 button objects, initialized in setup()
Button resetButton;



//runs once: set up initial values and states
void setup() 
{
  size(1200, 900); //canvas size
  frameRate(24);
  noStroke(); //remove stroke
  
  //initialize images and fonts
  mountainPic = loadImage("mountains.jpg");
  playIcon = loadImage("play.png");
  resetIcon = loadImage("reset.png");
  stopIcon = loadImage("stop.png");
  lydian = createFont("lydian.ttf", fontSize);
  
  //initialize coyoteSeq[] with frames of an animation (+1 due to file names)
  for (int i = 0; i < coyoteSeq.length; i ++) 
  {
    coyoteSeq[i] = loadImage((i+1) +".png"); //load corresponding image into coyoteSeq[] index
  }
  
   //initialize sound file and music player
  spectre = new Minim(this); //instantiate Minim object spectre
  musicPlayer = spectre.loadFile("coyotes.mp3"); //initialize musicPlayer with spectre.mp3
  
  //2 new button objects for play and reset
  playButton = new Button(playIcon, 30, 30); 
  resetButton = new Button(resetIcon, 30, 130);
  
  poemLine1.init(width/2, 180); //initialize poem and target locations for PoemLine objects
  poemLine2.init(width/2, 260);
  poemLine3.init(width/2, 340);
  poemLine4.init(width/2, 580);
}



//runs continuously
void draw() 
{
  background(mountainPic); //background image: erase last frame
  
  //render all PoemLines on canvas
  poemLine1.renderText(); //draw text on screen
  poemLine2.renderText(); //draw text on screen
  poemLine3.renderText(); //draw text on screen
  poemLine4.renderText(); //draw text on screen
  
  //if isPlaying has been turned true by pressing the play button
  if (isPlaying) 
  {
    //move target and text position
    poemLine1.moveTextToTarget();
    poemLine2.moveTextToTarget();
    poemLine3.moveTextToTarget();
    poemLine4.moveTextToTarget();
    
    //move buttons and change play/stop PNG
    playButton.icon = stopIcon; //change PNG of play button
    playButton.move(); //move play button
    resetButton.move(); //move reset button
    
    musicPlayer.play(); //begin playing audio in musicPlayer
  }
  
  if (isPlaying == false) 
  {
    playButton.icon = playIcon;
  }
  
  //draw buttons on canvas
  playButton.render();
  resetButton.render();
  
  renderGif(500);
} //end of draw()



//detect button-clicks and toggle booleans accordingly
void mouseReleased() {
  //if mouse is hovering inside play button area when released
  if (playButton.detectMouse()) 
  {
    isPlaying = ! isPlaying; //toggle value of isPlaying
  }
  
}



//initialize an image sequence into a PImage array for animated playback
void initGif() 
{
  //for every index in coyoteSeq
  //(starting at one due to image names)
  for (int i = 1; i == coyoteSeq.length; i ++) 
  {
    coyoteSeq[i] = loadImage(i +".png"); //load corresponding image into coyoteSeq[] index
  }
} //end of initGif()


//loop through coyoteSeq[] according to frameCount, wrapping at the end,
//and draw the stored image on canvas
void renderGif(int x) 
{
  //draw frame of coyote walking at fixed y pos, and variable x pos
  image(coyoteSeq[frameCount % coyoteSeq.length], x, 680);
}

