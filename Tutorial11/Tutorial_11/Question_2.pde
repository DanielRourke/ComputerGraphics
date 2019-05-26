
Car[] cars;
Car car1;

void question2Setup()
{
    cars = new Car[5];
    //cam = new PeasyCam(this, 200);
    //cam.setMinimumDistance(400);
    //cam.setMaximumDistance(2000);
    cars[0] = new Car(this, color(255,0,0), color(0,0,255), 1,1);
    cars[1] = new Car(this, color(0,0,255), color(255,0,0), 1.5,1.5);
    cars[2] = new Car(this, color(0,255,0), color(0,255,0), 1,1);
    cars[3] = new Car(this, color(255,0,0), color(0,255,0), 2,2);
    cars[4] = new Car(this, color(255,255,0), color(0,255,255), 0.5,0.5);

   camera(width/2.0, height/2.0, (height/2.0) / tan(PI*30.0 / 180.0), width/2.0, height/2.0, 0, 0, 1, 0);

  
}

void question2()
{
  
  //for(int i = 0 ; i < 5 ; i++)
  //{
  // cars[i].draw(); 
  //}

  //cars[0].draw();
  cars[3].draw();
// println(cars[3]);

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
        println(picked.getParent());
        picked.getParent().fill(color(255,255,255));
        
  }


}
void mouseReleased()
{
  if(picked != null){
      picked.getParent().moveBy(mouseX - originalX ,mouseY - originalY,0.0);
   //   cam.setActive(true);
      for(int i = 0; i < 5; i++)
      {
       cars[i].resetColours(); 
      }  
      picked = null;
  }
}
