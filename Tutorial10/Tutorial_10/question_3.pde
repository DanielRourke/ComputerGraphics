
Shape3D car2;
Box car;
Box body;
Toroid[] wheels;
Tube windshield;



void question3Setup()
{
  car = new Box(this, 200,50,100);

  //car.addShape(bodyBase);
  
  wheels = new Toroid[4];
  for (int i = 0; i < 4 ;i ++)
  {
     wheels[i] = new Toroid(this, 30, 20);
     wheels[i].setRadius(9,6,18);
     wheels[i].fill(color(0,255,0));
     
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
    
    body = new Box(this, 100, 50, 100);
    body.fill(color(255,0,0));
    body.moveTo(20, -45, 0);
    car.addShape(body);
    //wheels[1].moveTo();
    //wheels[2].moveTo();
    //wheels[3].moveTo();
  windshield = new Tube(this, 10,3);
  windshield.setSize(30, 30, 30, 30, 100);
  windshield.moveTo(-30, -40, 0);
  windshield.rotateBy(radians(90), radians(30), 0);
  windshield.drawMode(Shape3D.ALL);
  windshield.fill(color(255,0,0),Tube.S_CAP);
  windshield.fill(color(255,0,0),Tube.E_CAP);

  car.addShape(windshield);
  
  car.fill(color(255,0,0));
 
  //test.rotateBy(0, radians(45), 0);
  
  car2 = car;
}

void question3()
{
     //test.draw();
     for(int i = 0; i < 4; i++)
     {
     //  wheels[i].draw();
     }
     car.draw();
  
}
