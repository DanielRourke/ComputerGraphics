Button b1;
Button b2;
Button b3;
Person people[] = new Person[10];
Person peter = new Person(new Coord(0.0, 0.0),100,200, color(0), random(2) ,random(2));
Person simon = new Person(new Coord(200.0, 0.0),100,200, color(0),random(2),random(2));
int size = 10;


void setup() {
size(800, 800);
smooth();

  b1 = new Button(40,50,100,75,color(255,0,0));
  b2 = new Button(150,50,100,75,color(0,255,0));
  b3 = new Button(260,50,100,75,color(0,0,255));

  //noLoop();
  frameRate(60);
  //Person people[];
  for (int i = 9; i > 0; i--)
  {
    people[i] = new Person(new Coord(random(width - 100), random(height -200)),10 * (i + 1),20 * (i + 1), color(random(256),random(256),random(256)) ,random(2),random(2));
  }

}



void draw() 
{
  background(255);
  //drawButtons();
  //drawAntsWhile();
  //drawPerson();
  //drawCube(50, 1);
  //drawCube(100, 2);
   drawPeople();

  peter.drawPerson();
  peter.movePerson();
  simon.drawPerson();
  simon.movePerson();

} 

void drawCube(float x, float w)
{
    
  rectMode(CENTER);
  ellipseMode(CENTER);  
  rect(x * w ,50,75*w,75 *w);
  ellipse(x+ 75* w,40* w,100* w,100* w);
}
