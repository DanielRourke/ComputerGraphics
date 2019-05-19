

Box car;
Box body;
Toroid[] wheels;
Tube test;



void question3Setup()
{
  car = new Box(this, 200,50,100);
  body = new Box(this, 100, 50, 100);
  //car.addShape(bodyBase);
  
  wheels = new Toroid[4];
  for (int i = 0; i < 4 ;i ++)
  {
     wheels[i] = new Toroid(this, 30, 20);
     wheels[i].setRadius(9,6,18);
     
  }
  
    wheels[0].moveTo(-75, 35, 60);
    wheels[0].rotateBy(radians(90), 0, 0);
    wheels[1].moveTo(-75, 35, -60);
    wheels[1].rotateBy(radians(90), 0, 0);
    wheels[2].moveTo(75, 35, 60);
    wheels[2].rotateBy(radians(90), 0, 0);
    wheels[3].moveTo(75, 35, -60);
    wheels[3].rotateBy(radians(90), 0, 0);
    car.addShape(wheels[0]);
    car.addShape(wheels[1]);
    car.addShape(wheels[2]);
    car.addShape(wheels[3]);
    
    body.moveTo(20, -45, 0);
    car.addShape(body);
    //wheels[1].moveTo();
    //wheels[2].moveTo();
    //wheels[3].moveTo();
  test = new Tube(this, 20, 3);
  test.setSize(20, 20, 20, 20);
}

void question3()
{
     //test.draw();
     for(int i = 0; i < 4; i++)
     {
     //  wheels[i].draw();
     }
    // car.draw();
    test.draw();
}
