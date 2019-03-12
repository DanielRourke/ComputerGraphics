Button b1;
Button b2;
Button b3;
int size = 10;


void setup() {
size(400, 400);
smooth();

  b1 = new Button(40,50,100,75,color(255,0,0));
  b2 = new Button(150,50,100,75,color(0,255,0));
  b3 = new Button(260,50,100,75,color(0,0,255));
  //noLoop();


}



void draw() 
{
  background(255);
  //drawButtons();
  //drawAntsWhile();
  //drawPerson();
  drawCube(50, 1);
  drawCube(100, 2);

} 

void drawCube(float x, float w)
{
    
  rectMode(CENTER);
  ellipseMode(CENTER);  
  rect(x * w ,50,75*w,75 *w);
  ellipse(x+ 75* w,40* w,100* w,100* w);
}
