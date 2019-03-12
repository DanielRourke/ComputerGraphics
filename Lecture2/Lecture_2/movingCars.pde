
void drawCar(int x, int y, int thesize, color c)
{
  // used for draw the wheels
  int offset = thesize/4;
  // draw main car body
  rectMode(CENTER);
  stroke(50);
  fill(c);
  rect(x, y, thesize, thesize/2);
  // draw 4 wheels relative to centre
  fill(50);
  rect(x-offset, y-offset, offset, offset/2);
  rect(x+offset, y-offset, offset, offset/2);
  rect(x-offset, y+offset, offset, offset/2);
  rect(x+offset, y+offset, offset, offset/2);
}

int pos1X = 50;
int pos2X = 0;
int pos3X = 0;
int speed1 = 3;
int speed2 = 3;
int speed3 = 3;

void moveCar()
{
   pos1X = pos1X + speed; // the object will change at each refreshment
  if (pos1X > height || pos1X < 0) {
  speed1 = -speed1; // reverse the direction
  }

}


void drawCars()
{
  background(255);
  moveCar();
  drawCar(x, 100, 64, color(200, 200, 0));
  drawCar(50, 75, 32, color(0, 200, 100));
  drawCar(80, 175, 40, color(200, 0, 0));

}
