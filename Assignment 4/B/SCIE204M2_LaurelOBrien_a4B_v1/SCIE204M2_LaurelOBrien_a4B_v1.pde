////////////////////////
// a4B
//
// Laurel O'Brien
// 20151128
// lobrien14692@ecuad.ca
//
// Note for David: everything works except the events that are triggered
// for a reset (upon pressing reset button) only start being rendered when the demo
// is running (isRunning == true). This is due to a logical failure of relying on
// move functions gated inside an if(isPlaying) check, which I know how to fix
// but am too tired to stay awake at my keyboard right now! I will upload a new
// version to moodle after a nap.
////////////////////////



//import sound-oriented library Minim
//
//THIS DOESN'T WORK WITHOUT THE MINIM LIBRARY INSTALLED
import ddf.minim.*;

// declare and initialize global variables/objects/arrays/et al
//
//objects for playing sound
Minim song; //declare Minim object named song ("Coyote" by Modest Mouse)
AudioPlayer musicPlayer; //declare AudioPlayer object named musicPlayer

//PImages
PImage mountainPic; //background photo
PImage playIcon, resetIcon, stopIcon; //UI button graphics: 96 x 75 px
PImage[] coyoteSeq = new PImage[41]; //PImage array for animating "marching ants" (coyotes)

//Strings — lyrics from "Coyotes" by Modest Mouse
String line1 = "coyotes tip-toe through the snow after dark";
String line2 = "at home with the ghosts in the national parks";
String line3 = "man-kind's behavin' like some serial killer";
String line4 = "giant ol' monsters afraid of the sharks";
String line5 = "and we say “we're in love with all of it”";
String line6 = "and we say “we're in love with everything”";
String line7 = "and we lie, we love to lie.";

//variables for rendering Strings
float fontSize = 36; //pt size of font
PFont lydian; //PFont object

//variables for layout and movement
float horzMargin = 400; //margin on left and right of canvas
float vertMargin = 175; //margin on top & bottom of canvas: text doesn't touch marching coyotes
float mountainX, mountainY; //for parallax effect

//booleans
boolean isPlaying = false; //indicate if motion graphics and music are playing
boolean isResetting = false; //indicate is program is resetting itself
boolean hasReachedHome = true; //indicate if button has moved all the way to its target
boolean demoStarted = false;

//insantiate PoemLine objects with String, y home position, and movForce
PoemLine poemLine1 = new PoemLine(line1, 80, 0.05);
PoemLine poemLine2 = new PoemLine(line2, 150, 0.04);
PoemLine poemLine3 = new PoemLine(line3, 220, 0.03);
PoemLine poemLine4 = new PoemLine(line4, 290, 0.02);
PoemLine poemLine5 = new PoemLine(line5, 600, 0.05);
PoemLine poemLine6 = new PoemLine(line6, 670, 0.04);
PoemLine poemLine7 = new PoemLine(line7, 740, 0.03);


//instantiate marching-ant-style animated coyotes
MarchingCoyote coyote1 = new MarchingCoyote(-200);
MarchingCoyote coyote2 = new MarchingCoyote(-600);
MarchingCoyote coyote3 = new MarchingCoyote(-1000);

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
  mountainPic = loadImage("mountains.jpg"); //stock photo from unsplash.com
  playIcon = loadImage("play.png");
  resetIcon = loadImage("reset.png");
  stopIcon = loadImage("stop.png");
  lydian = createFont("lydian.ttf", fontSize);
  
  //initialize coyoteSeq[] with frames of an animation (+1 due to file names).
  //these are PNGs extracted from a gif animation, used with permission
  for (int i = 0; i < coyoteSeq.length; i ++) 
  {
    coyoteSeq[i] = loadImage((i+1) +".png"); //load corresponding image into coyoteSeq[] index
  }
  
  //initialize sound file and music player
  song = new Minim(this); //instcoyoteiate Minim object song
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
  //map the position of poemLine1 to a much smaller area to move the background image
  mountainX = map(poemLine1.textX, 0+horzMargin, width-horzMargin, width/2-10, width/2+10);
  mountainY = map(poemLine1.textY, 0+vertMargin, height-vertMargin, height/2-10, height/2+10);
  
  imageMode(CENTER); //draw images from their center
  image(mountainPic, mountainX, mountainY); //act as a bg, move to create parallax effect
  imageMode(CORNER); //draw images from their corner for future images
  
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
    
    playButton.icon = stopIcon; //PNG of play button is a pause icon
  } 
  //else, demo is not running, so:
  else 
  {
    //play/pause button displays play icon
    playButton.icon = playIcon;
  }
  
  //if demo has started for the first time, start animating coyotes.
  //they are never turned off; when program is stopped their position
  //just no longer wraps them back onto the canvas, to allow for them to
  //walk off-screen.
  if (demoStarted) 
  {
    animateCoyotes(); //draw instances of MarchingCoyote on-screen
  }
  
  
  //if button is not at its home position
  if (!hasReachedHome) 
  {
    //move button towards its home position
    playButton.move(); //move play button
    resetButton.move(); //move reset button
  }
  
  //if program is resetting
  if (isResetting) 
  {
    //if all coyotes have exited canvas indicate the reset is done
    if(coyote1.x > width && coyote2.x > width && coyote3.x > width) 
    {
      isPlaying = false; //turn off player
      isResetting = false; //reset is finished
      
      //stop and re-wind the song
      musicPlayer.pause();
      musicPlayer.rewind();  
    }
  } 
  //else, reset is not happening so if demo is running:
  else if (isPlaying)
  {
    musicPlayer.play(); //play audio in musicPlayer
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



//call move and render functions for each MarchingCoyote object.
//every program frame the MarchingCoyote object displays a "frame" of its own
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

