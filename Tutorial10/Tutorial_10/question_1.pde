
Ellipsoid[] randomSphere;
Box[] randomBox;

void question1Setup()
{
  randomSphere = new Ellipsoid[10];
  randomBox = new Box[10];
  
  
  for (int i = 0; i < 10; i++)
  {
      int size = (int) random(5, 100);
      randomSphere[i] = new Ellipsoid(this, 20 ,30);
      randomSphere[i].setRadius(size);
      int x = (int) random(-500, 500);
      int y = (int) random(-500, 500);
      int z = (int) random(-500, 500);
      randomSphere[i].moveTo(new PVector(x,y,z));

      x = (int) random(5, 100);
      y = (int) random(5, 100);
      z = (int) random(5, 100);
      randomBox[i] = new Box(this, x,y,z);
      x = (int) random(-500, 500);
      y = (int) random(-500, 500);
      z = (int) random(-500, 500);
      randomBox[i].moveTo(new PVector(x,y,x));

  }
}

void question1()
{
  for (int i = 0; i < 10; i++)
  {
      randomSphere[i].draw();
      randomBox[i].draw();
  }
}
