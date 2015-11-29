//sketching objects
float pilotX;
float pilotY;


void setup() 
{
  rectMode(CENTER);
  noFill();
  noStroke();
}

void draw() 
{
  background(128, 128);
  //drawKey(50, 50);
  //drawLock(75, 75);
  
  pilotX = mouseX;
  pilotY = mouseY;
  
  drawPilot();

}

void drawKey(int x, int y) 
{
  background(255);
  noStroke();
  fill(10, 255, 255, 50); //cyan
  ellipse(x, y, 40, 40);
  ellipse(x, y, 25, 25);
  ellipse(x, y, 25, 25);
  
  stroke(#F7C846);
  strokeWeight(3);
  ellipse(x, y-12, 15, 8); //finger loop
  line(x, y-8, x, y+12); //key shaft
  line(x-3, y+5, x-3, y+13); //tooth webbing
  line(x-10, y+13, x, y+13); //long tooth
  line(x-8, y+5, x, y+5); //short tooth
  noStroke();
}

void drawLock(int x, int y) 
{
  fill(200, 150, 100); //light brown
  ellipse(x, y, 40, 40);
  rect(x, y+10, 40, 20);
  
  fill(#F7C846); //bronze
  ellipse(x, y-3, 20, 20);
  rect(x, y+5, 10, 20);
  
  fill(100, 50, 0); //dark brown
  ellipse(x, y-3, 13, 13);
  rect(x, y+7, 4, 10);
}

void drawPilot() 
{
  //draw shapes making up wisp
  fill(200, 255, 255, 50); //low opacity pale blue
  ellipse(pilotX, pilotY, 40, 40); //wisp glow
  fill(200, 255, 255, 255); //pale blue
  ellipse(pilotX, pilotY, 25, 25); //wisp
  
  fill(255); //white
  triangle(pilotX-12, pilotY-2, pilotX-20, pilotY+18, pilotX-13, pilotY+12); //left wing
  triangle(pilotX+12, pilotY-2, pilotX+20, pilotY+18, pilotX+13, pilotY+12); //right wing
}
