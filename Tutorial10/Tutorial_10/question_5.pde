class line
{
  int size;
  Shape3D[] block;
  Shape3D parent;
  
  line(int s ,PApplet p, int y)
  {
      size = s;
      block = new Shape3D[s];
      int offsetX = (int)5.5 * 22;
      int offsetY = y;
      PApplet papplet = p;
      parent = new Box(p,0,0,0);
      
      for(int i = 0; i < s; i++)
          {
              block[i] = new Box( papplet, 20,7,10);
              block[i].setTexture("brick-"+((int)(random(100)% 3) + 1)+".jpg");
              block[i].drawMode(Shape3D.TEXTURE);
              
              Box mortar = new Box( papplet, 2,7,9);
              mortar.setTexture("mortar.jpg");
              mortar.drawMode(Shape3D.TEXTURE);
              mortar.moveTo(-11,0,0);
              
              Box brick  = new Box( papplet, 20,7,10);
              brick.setTexture("brick-"+((int)(random(100)% 3 + 1))+".jpg");
              brick.drawMode(Shape3D.TEXTURE);
              brick.moveTo(-11,-7,0);
              
              Box mortar2 = new Box( papplet, 2,7,9);
              mortar2.setTexture("mortar.jpg");
              mortar2.drawMode(Shape3D.TEXTURE);
              mortar2.moveTo(0,-7,0);
              
             block[i].addShape(mortar);
             block[i].addShape(mortar2);
             block[i].addShape(brick);
             block[i].moveTo(offsetX, offsetY, 0);
             offsetX -= 22;
             
             parent.addShape(block[i]);
          }
          
          parent.rotateBy(0,0,0);
  }
  void drawLine()
  {
      //for (int i = 0 ; i < wallSize; i++)
      //{
      //  block[i].draw();
      //}
      
      parent.draw();
  }
  
}

line[] wall;
line[] wall2;
Shape3D[] block;

Shape3D line;
int wallSize = 10;


Box wallBack;
Box wallFront;
Box wallLeft;
Box wallRight;


Box ttop;
Tube leg1, leg2, leg3, leg4;

Box chair, cBack;
Tube cleg1, cleg2, cleg3, cleg4;


void question5Setup()
{
  //line= new Box(this,0,0,0);
  
  
  
  wall = new line[wallSize];
  int y = 0;
  for(int i = 0; i < wallSize; i++)
  {
    wall[i] = new line(10, this, y);
    y += 14;
  }
  
   wall2 = new line[wallSize];
  y = 0;
  for(int i = 0; i < wallSize; i++)
  {
    wall2[i] = new line(10, this, y);
    y += 14;
  }
  
     wallBack = new Box(this, 800,800,20);
     wallBack.moveTo(new PVector(0,0,-400));
      wallBack.setTexture("wall.jpg");
      wallBack.drawMode(Shape3D.TEXTURE);
     
     wallFront= new Box(this, 800,800,20);
     wallFront.moveTo(new PVector(0,0,400));
     wallFront.setTexture("wall.jpg");
     wallFront.drawMode(Shape3D.TEXTURE);
     
     
     wallLeft = new Box(this, 800,800,20);
     wallLeft.moveTo(new PVector(400,0,0));
     wallLeft.rotateBy(0,radians(90), 0);
     wallLeft.setTexture("wall.jpg");
     wallLeft.drawMode(Shape3D.TEXTURE);
     
     wallRight= new Box(this, 800,800,20);
     wallRight.moveTo(new PVector(-400,0,0));
     wallRight.rotateBy(0, radians(90), 0);
     wallRight.setTexture("wall.jpg");
     wallRight.drawMode(Shape3D.TEXTURE);
     //wallLeft;
     //wallRight;
     
     
     ttop = new Box(this, 200, 5, 100);
ttop.fill(color(40, 40, 150));
ttop.drawMode(Shape3D.SOLID);
ttop.drawMode(Shape3D.TEXTURE);
ttop.setTexture("ttop.jpg");
ttop.moveTo(0, -100, 100);
// create 4 legs
leg1 = new Tube(this, 10, 10);
leg1.setSize(6, 6, 4, 4);
leg1.fill(color(40, 40, 40));
leg1.drawMode(Shape3D.SOLID);
leg1.moveTo(-90, 60, -40);
ttop.addShape(leg1);
leg2 = new Tube(this, 10, 10);
leg2.setSize(6, 6, 4, 4);
leg2.fill(color(40, 40, 40));
leg2.drawMode(Shape3D.SOLID);
leg2.moveTo(-90, 60, 40);
ttop.addShape(leg2);
leg3 = new Tube(this, 10, 10);
leg3.setSize(6, 6, 4, 4);
leg3.fill(color(40, 40, 40));
leg3.drawMode(Shape3D.SOLID);
leg3.moveTo(90, 60, 40);
ttop.addShape(leg3);
leg4 = new Tube(this, 10, 10);
leg4.setSize(6, 6, 4, 4);
leg4.fill(color(40, 40, 40));
leg4.drawMode(Shape3D.SOLID);
leg4.moveTo(90, 60, -40);
ttop.addShape(leg4);

  ttop.moveTo(0,250,0);



     chair = new Box(this, 100, 5, 100);
      chair.fill(color(40, 40, 150));
      chair.drawMode(Shape3D.SOLID);
      cBack = new Box(this, 100, 5, 100);
      cBack.fill(color(40, 40, 150));
      cBack.drawMode(Shape3D.TEXTURE);
      cBack.setTexture("chair.jpg");
      
      cBack.rotateBy(radians(90),0, 0);
      cBack.moveTo(0,-50,-50);
      chair.addShape(cBack);
chair.drawMode(Shape3D.TEXTURE);
chair.setTexture("chair.jpg");


// create 4 legs
cleg1 = new Tube(this, 10, 10);
cleg1.setSize(6, 6, 4, 4, 75);
cleg1.fill(color(40, 40, 40));
cleg1.drawMode(Shape3D.SOLID);
cleg1.moveTo(-45, 40, -40);
chair.addShape(cleg1);
cleg2 = new Tube(this, 10, 10);
cleg2.setSize(6, 6, 4, 4, 75);
cleg2.fill(color(40, 40, 40));
cleg2.drawMode(Shape3D.SOLID);
cleg2.moveTo(-45, 40, 40);
chair.addShape(cleg2);
cleg3 = new Tube(this, 10, 10);
cleg3.setSize(6, 6, 4, 4, 75);
cleg3.fill(color(40, 40, 40));
cleg3.drawMode(Shape3D.SOLID);
cleg3.moveTo(45, 40, 40);
chair.addShape(cleg3);
cleg4 = new Tube(this, 10, 10);
cleg4.setSize(6, 6, 4, 4, 75);
cleg4.fill(color(40, 40, 40));
cleg4.drawMode(Shape3D.SOLID);
cleg4.moveTo(45, 40, -40);
chair.addShape(cleg4);


  chair.moveTo(0,300,-150);
}

void question5()
{
  
  //for (int i = 0 ; i < wallSize; i++)
  //{
  //   wall[i].drawLine();
  //}
wallBack.draw();
//wallFront.draw();
wallRight.draw();
wallLeft.draw();
ttop.draw();
chair.draw();
 
}
