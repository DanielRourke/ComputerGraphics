
Car[] cars;
PVector start[];
PVector end[];
Car car1;
float speed = 0;

void question2Setup()
{
    cars = new Car[5];
    start = new PVector[5];
    end = new PVector[5];
    for (int i =0 ; i < 5; i ++ )
    {
      start[i] = new PVector(width, (1 +i) * (height / 6), -0);
      end[i] = new PVector(0, (1 +i) * (height / 6), -0);
    }
    
    
    
    cars[0] = new Car(this, color(255,0,0), color(0,0,255), 0.5,0.5 , 1);
    cars[1] = new Car(this, color(0,0,255), color(255,0,0), 0.5,0.5, 2);
    cars[2] = new Car(this, color(0,255,0), color(0,255,0), 0.5,0.5 , 3);
    cars[3] = new Car(this, color(255,0,0), color(0,255,0), 0.5,0.5, 4);
    cars[4] = new Car(this, color(255,255,0), color(0,255,255), 0.5,0.5, 0);
    
    
    

   camera(width/2.0, height/2.0, (height/2.0) / tan(PI*30.0 / 180.0), width/2.0, height/2.0, 0, 0, 1, 0);
}

void question2()
{
  cars[0].draw();
  cars[1].draw();
  cars[1].parent.rotateBy(radians(5),0,0);
  cars[2].draw();
  if(cars[2].parent.scale() < 3)
      cars[2].parent.scale(cars[2].parent.scale() + 0.01);
  cars[3].draw();
  cars[3].fade();
  cars[4].draw();
}
float originalX;
float originalY;

Shape3D picked;

void mousePressed()
{
  picked = Shape3D.pickShape(this, mouseX, mouseY);
  if(picked != null){
        originalX = mouseX;
        originalY = mouseY;
       // cam.setActive(false);
        println(picked.getParent().getParent());
        picked.getParent().getParent().fill(color(255,255,255));
        zMove = 0;
  }
}
void mouseReleased()
{
  if(picked != null){
      float zPos = picked.getParent().z();
      picked.getParent().moveTo(mouseX , mouseY, zPos + zMove);
      println(mouseX, mouseY, zPos + zMove);
   //   cam.setActive(true);
      for(int i = 0; i < 5; i++)
      {
       cars[i].resetColours(); 
      }  
     
  }
   picked = null;
}

float zMove = 0;
void mouseWheel( processing.event.MouseEvent evt) {
  float e = evt.getCount();
  
    if(picked != null)
    {
        if(e>0)
        {
           zMove += 30;
         // picked.getParent().getParent().moveTo(mouseX ,mouseY , zMove);
        }
        else
        {
           zMove -= 30;
          // picked.getParent().getParent().moveTo(mouseX ,mouseY , zMove);
        }

     }
  println(zMove);
}
