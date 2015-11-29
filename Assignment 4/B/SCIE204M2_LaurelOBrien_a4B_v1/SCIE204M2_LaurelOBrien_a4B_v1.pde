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
}



//runs continuously
void draw() 
{
  background(forestPic);
  
  renderText();
}



void renderText() 
{
  fill(255); //white
  textFont(lydian); //Lydian typeface
  textAlign(CENTER); //align text in the center
  blendMode(DIFFERENCE);
  text(line1, width/2, height/2); //line 1 of "Coyotes"
}
