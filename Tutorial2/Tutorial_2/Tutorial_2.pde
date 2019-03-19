Button b1;
Button b2;
Button b3;
Person people[] = new Person[10];
Person peter = new Person(new Coord(0.0, 0.0),100,200, color(0), 1 ,0);
Person simon = new Person(new Coord(200.0, 0.0),100,200, color(0),random(0),random(4));
int size = 10;


void setup() {
size(400, 400);
smooth();

  b1 = new Button(40,50,100,75,color(255,0,0));
  b2 = new Button(150,50,100,75,color(0,255,0));
  b3 = new Button(260,50,100,75,color(0,0,255));

  //noLoop();
  frameRate(60);
  //Person people[];
  for (int i = 9; i >= 0; i--)
  {
    people[i] = new Person(new Coord(random(width - 100), random(height -200)),(width / 80) * (i + 1),(height / 40) * (i + 1), color(random(256),random(256),random(256)) ,random(2),random(2));
  }

}



void draw() 
{
  background(255);
  //drawButtons();
  //drawAntsWhile();
  //drawCube(50, 1);
  //drawCube(100, 2);
   drawPeople();

  peter.drawPerson();
  peter.movePerson(0);
  simon.drawPerson();
  simon.movePerson(1);

} 

void drawCube(float x, float w)
{
    
  rectMode(CENTER);
  ellipseMode(CENTER);  
  rect(x * w ,50,75*w,75 *w);
  ellipse(x+ 75* w,40* w,100* w,100* w);
}
