
Ellipsoid sphere;
float sphereX;
float sphereY;
float sphereZ;



void question1Setup()
{
 
  //cam = new PeasyCam(this, 200);
  //cam.setMinimumDistance(400);
  //cam.setMaximumDistance(2000);
  sphere = new Ellipsoid(this, 20 ,30);
  sphereX = 0.0;
  sphereY = 0.0;
  sphereZ = 0.0;
 // camera();
}


void question1()
{
  sphereX = mouseX;
  println(sphereX, mouseX/2, sphereY, mouseY/2 , sphereZ);
  if(keyPressed && keyCode == SHIFT)
  {
    sphereZ = mouseY;
  }
  else
  {
    sphereY = mouseY; 
  }
  sphere.moveTo(new PVector(sphereX, sphereY, sphereZ));
  sphere.draw();

}
