int numBounces = 0;


//move the square around in a bouncy way
void moveBouncySquare()
{
  //move the square according to its velocity
  bsx += bsvx;
  bsy += bsvy;
  
  checkForBounce();
  limitSpeed();//ensure speed is reasonable
}




//ensure bs stays inside the app size
void checkForBounce()
{
  //if square goes off screen, then it's a bounce so turn it around
  //and give it more change in the other dimension to allow for wonky
  //bounces
  if(bsx > width || bsx < 0)
  {
    bsx -= bsvx;//move it back in bounds
    bsvx *= -1;//turn it around
    bsvx *= random(0.5, 2);//make it a bit faster or slower
    bsvy *= random(0.5, 10);
    numBounces++;
    println("bounce horz, number of bounces is " + numBounces);
  }
  
  if(bsy > height || bsy < 0)
  {
    bsy -= bsvy;//move it back in bounds
    bsvy *= -1;//reverse
    bsvx *= random(0.5, 10);//make it a bit faster or slower
    bsvy *= random(0.5, 2);
    numBounces++;
    println("bounce horz, number of bounces is " + numBounces);
  }
}




//limit the speed so it's not too fast or slow
void limitSpeed()
{
  //ensure speed isn't too fast
  while(dist(0,0, bsvx, bsvy) > 5)
  {
    //reduce speed equally for vx and vy
    //so the direction is preserved
    bsvx *= 0.9;
    bsvy *= 0.9;
  }
  
  //ensure speed isn't too slow
  while(dist(0,0, bsvx, bsvy) < 2)
  {
    //increase  speed equally for vx and vy
    //so the direction is preserved
    bsvx *= 1.1;
    bsvy *= 1.1;
  }
}





//draw bouncing square
void drawBouncySquare()
{
  pushMatrix();//isolate transformations in memory
  
  bsAng += bsas;//rotate using the angular speed
  
  //////////////
  //transformations happen in reverse
  //  
  translate(bsx, bsy);//put it back
  rotate(radians(bsAng));//rotate
  translate(-bsx, -bsy);//move it to the origin to do a rotation
  
  fill(bsCol);
  rect(bsx, bsy, bsSz, bsSz);//draw square
  
  popMatrix();//done isolating transformations in mem
}