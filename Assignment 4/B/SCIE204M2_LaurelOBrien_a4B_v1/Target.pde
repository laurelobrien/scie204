////////////////////////
//
// Events
//
// user interaction, events, state changes 
// 



//happens when reset button is pressed
void resetEverything() 
{
  
  
  //reassign all PoemLine objects' target to its home position.
  //x position changed to home
  poemLine1.targetX = poemLine1.xHome;
  poemLine2.targetX = poemLine2.xHome;
  poemLine3.targetX = poemLine3.xHome;
  poemLine4.targetX = poemLine4.xHome;
  poemLine5.targetX = poemLine5.xHome;
  poemLine6.targetX = poemLine6.xHome;
  poemLine7.targetX = poemLine7.xHome;
  
  //y position changed to home
  poemLine1.targetY = poemLine1.yHome;
  poemLine2.targetY = poemLine2.yHome;
  poemLine3.targetY = poemLine3.yHome;
  poemLine4.targetY = poemLine4.yHome;
  poemLine5.targetY = poemLine5.yHome;
  poemLine6.targetY = poemLine6.yHome;
  poemLine7.targetY = poemLine7.yHome;
  
  isResetting = true; //stop PoemLine objects from assigning new targets
}



//detect button-clicks and toggle booleans accordingly
void mouseReleased() {
  //if mouse is hovering inside play button area when released
  if (playButton.detectMouse()) 
  {
    isPlaying = ! isPlaying; //toggle value of isPlaying
    
    //if play button was toggled to pause music and isPlaying is now false:
    if (!isPlaying) 
    {
      musicPlayer.pause(); //pause the song
    } 
  }
} //end of mouseReleased()



void mousePressed() 
{
  //if mouse position is inside resetButton's area when pressed:
  if (resetButton.detectMouse()) 
  {
    resetEverything();
  }
}
