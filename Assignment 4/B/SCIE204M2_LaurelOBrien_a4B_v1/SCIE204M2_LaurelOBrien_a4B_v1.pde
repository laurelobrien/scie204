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
PImage forestPic;

//Strings — "Coyotes" by Modest Mouse
String line1 = "coyotes tip-toe through the snow after dark";
String line2 = "at home with the ghosts in the national parks";
String line3 = "man-kind's behavin' like some serial killer";
String line4 = "giant ol' monsters afraid of the sharks";

//variables for rendering Strings
float fontSize = 30;
PFont lydian;

//variables for layout and movement
float horzMargin = 100; //margin on left and right of canvas
float vertMargin = 50; //margin on top and bottom of canvas
//float distanceX;
//float distanceY;
float threshDist = 3; //threshold dist before target moves itself away from text
float movForce = 0.03; //percent of prescribed distance text will move

//instantiate objects
PoemLine poemLine1 = new PoemLine(line1); //4 new PoemLine objects
PoemLine poemLine2 = new PoemLine(line2);
PoemLine poemLine3 = new PoemLine(line3);
PoemLine poemLine4 = new PoemLine(line4);

//runs once: set up initial values and states
void setup() 
{
  size(1200, 900); //canvas size
  noStroke(); //remove stroke
  
  //initialize images and fonts that need to be loaded
  forestPic = loadImage("forest.jpeg");
  lydian = createFont("lydian.ttf", fontSize);
  
   //initialize sound file and music player
  spectre = new Minim(this); //instantiate Minim object spectre
  musicPlayer = spectre.loadFile("coyotes.mp3"); //initialize musicPlayer with spectre.mp3
  
  poemLine1.init(width/2, 100); //initialize poem and target locations for PoemLine objects
  poemLine2.init(width/2, 300);
  poemLine3.init(width/2, 500);
  poemLine4.init(width/2, 700);
}



//runs continuously
void draw() 
{
  background(forestPic); //set background image
  blendMode(DIFFERENCE); //use DIFFERENCE blend mode to ensure text is always visible against bg
  
  poemLine1.moveTextToTarget();
  poemLine2.moveTextToTarget();
  poemLine3.moveTextToTarget();
  poemLine4.moveTextToTarget();
  
  //render all PoemLines
  poemLine1.renderText(); //draw text on screen
  poemLine2.renderText(); //draw text on screen
  poemLine3.renderText(); //draw text on screen
  poemLine4.renderText(); //draw text on screen
}



/*
void renderText() 
{
  fill(255); //white
  textFont(lydian); //Lydian typeface
  textAlign(CENTER); //align text in the center
  blendMode(DIFFERENCE);
  text(line1, width/2, height/2); //line 1 of "Coyotes"
}*/
