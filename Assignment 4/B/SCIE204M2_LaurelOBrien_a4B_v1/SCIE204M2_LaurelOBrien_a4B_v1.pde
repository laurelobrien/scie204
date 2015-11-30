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
Minim song; //declare Minim object named song ("Coyote" by Modest Mouse)
AudioPlayer musicPlayer; //declare AudioPlayer object named musicPlayer

//PImages
PImage mountainPic; //background photo
PImage playIcon, resetIcon, stopIcon; //UI button graphics: 96 x 75 px
PImage[] coyoteSeq = new PImage[41];

int coyoteFrame; //store frame number of coyote animation 
int prevFrame; //store previous frame's value of coyoteFrame

//Strings — "Coyotes" by Modest Mouse
String line1 = "coyotes tip-toe through the snow after dark";
String line2 = "at home with the ghosts in the national parks";
String line3 = "man-kind's behavin' like some serial killer";
String line4 = "giant ol' monsters afraid of the sharks";
String line5 = "and we say “we're in love with all of it”";
String line6 = "and we say “we're in love with everything”";
String line7 = "and we lie, we love to lie.";

//variables for rendering Strings
float fontSize = 36;
PFont lydian;

//variables for layout and movement
float horzMargin = 200; //margin on left and right of canvas
float vertMargin = 200; //margin on top & bottom of canvas: text doesn't touch marching coyotes
float threshDist = 3; //threshold dist before target moves itself away from text

//booleans
boolean isPlaying = false; //indicate if motion graphics and music are playing
boolean isResetting = false; //indicate is program is resetting itself

//instantiate poem lines
PoemLine poemLine1 = new PoemLine(line1, 80, 0.05); //7 new PoemLine objects
PoemLine poemLine2 = new PoemLine(line2, 150, 0.04);
PoemLine poemLine3 = new PoemLine(line3, 220, 0.03);
PoemLine poemLine4 = new PoemLine(line4, 290, 0.02);
PoemLine poemLine5 = new PoemLine(line5, 570, 0.05);
PoemLine poemLine6 = new PoemLine(line6, 640, 0.04);
PoemLine poemLine7 = new PoemLine(line7, 710, 0.03);


//instantiate marching-ant-style animated coyotes
MarchingAnt coyote1 = new MarchingAnt(-200);
MarchingAnt coyote2 = new MarchingAnt(-600);
MarchingAnt coyote3 = new MarchingAnt(-1000);

//2 button objects, instatiated in setup()
Button playButton; 
Button resetButton;



//runs once: set up initial values and states
void setup() 
{
  size(1200, 900); //canvas size
  frameRate(24); //set framerate to match coyote animation
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
  song = new Minim(this); //instantiate Minim object song
  musicPlayer = song.loadFile("coyotes.mp3"); //initialize musicPlayer with song.mp3
  
  //2 new button objects for play and reset
  playButton = new Button(playIcon, 30, 30); 
  resetButton = new Button(resetIcon, 30, 130);
  
  //set coyotes' starting position to be off-screen, staggered
  coyote1.x = -200;
  coyote2.x = -800;
  coyote3.x = -1200;
  
  //initialize PoemLine object values and accept arguments for x, y pos and movForce
  poemLine1.init(); 
  poemLine2.init();
  poemLine3.init();
  poemLine4.init();
  poemLine5.init();
  poemLine6.init();
  poemLine7.init();
}



//runs continuously.
//draw lines of poetry (a song), a play button, and a reset button over a background image.
//
//if the play button is pressed, the two buttons zip over to the right side of the screen
//and display pause and reset instead of play and reset. 3 coyotes will start marching
//across the bottom of the screen and will wrap at the edge in an endless loop. "Coyotes"
//by Modest Mouse will begin playing. Pressing the pause button will pause the music, stop
//the poem lines from moving, and the coyotes will continue to walk off-screen but will not
//reappear.
//
//if the reset button is pressed, poems lines and buttons revert to the original positions
//but paused), the marching coyotes will disappear and begin marching from their 
//initial positions, and the music will start from the beginning when play is next pressed.
void draw() 
{
  background(mountainPic); //background image: erase last frame
  
  //render all PoemLines on canvas
  poemLine1.renderText(); //draw text on screen
  poemLine2.renderText(); //draw text on screen
  poemLine3.renderText(); //draw text on screen
  poemLine4.renderText(); //draw text on screen
  poemLine5.renderText(); //draw text on screen
  poemLine6.renderText(); //draw text on screen
  poemLine7.renderText(); //draw text on screen
  
  //if isPlaying has been turned true by pressing the play button
  if (isPlaying) 
  {
    //move target and text position
    poemLine1.moveTextToTarget();
    poemLine2.moveTextToTarget();
    poemLine3.moveTextToTarget();
    poemLine4.moveTextToTarget();
    poemLine5.moveTextToTarget();
    poemLine6.moveTextToTarget();
    poemLine7.moveTextToTarget();
    
    //move buttons and change play/stop PNG
    playButton.icon = stopIcon; //change PNG of play button
    playButton.move(); //move play button
    resetButton.move(); //move reset button
   
    musicPlayer.play(); //play audio in musicPlayer
    
    animateCoyotes(); //draw instances of MarchingAnt on-screen
  } 
  else 
  {
    //play/pause button displays play icon
    playButton.icon = playIcon;
    
    //coyotes are drawn but stop moving
    coyote1.render();
    coyote2.render();
    coyote3.render();
  }
  
  //if program is resetting
  if (isResetting) 
  {
    //if all coyotes have exited canvas
    if(coyote1.x > width && coyote2.x > width && coyote3.x > width) 
    {
      isPlaying = false; //turn off player
      isResetting = false; //reset is finished
      
      //stop and re-wind the song
      musicPlayer.pause();
      musicPlayer.rewind();  
    }
  }
  
  //draw buttons on canvas
  playButton.render();
  resetButton.render();
} //end of draw()



//initialize an image sequence into a PImage array for animated playback
void initAnimation() 
{
  //for every index in coyoteSeq
  //(starting at one due to image names)
  for (int i = 1; i == coyoteSeq.length; i ++) 
  {
    coyoteSeq[i] = loadImage(i +".png"); //load corresponding image into coyoteSeq[] index
  }
} //end of initAnimation()



//call move and render functions for each MarchingAnt object.
//every program frame the MarchingAnt object displays a "frame" of its own
//from a PImage array and advances across the canvas, wrapping at the edge.
void animateCoyotes() 
{
  //appears first
  coyote1.move();
  coyote1.render();
  
  //appears second
  coyote2.move();
  coyote2.render();
  
  //appears third
  coyote3.move();
  coyote3.render();
} //end of animateCoyotes()

