

//set target when L mouse button pressed
void mousePressed()
{
  if(mouseButton == LEFT)
  {
    targetX = mouseX;//set the mouse to be the target
    targetY = mouseY;
  }
}





//when the user releases R mouse button,
//set a random target
//?? why is this function not bold???... it's a built in function (bug?)
void mouseReleased()
{
  if(mouseButton == RIGHT)
  {
    targetX = random(22, 622);
    targetY = random(22, 455);
  }
}





//when any mouse button is down and
//the mouse is being moved
//draw a player marker right under the mouse
void mouseDragged()
{
  fill(#EEFF6F);//yellow, hex number from the colour picker up in the menu
  ellipse(mouseX, mouseY, 22, 22);
}