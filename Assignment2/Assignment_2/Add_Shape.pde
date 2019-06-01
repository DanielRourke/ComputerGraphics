
float mouseClickX;
float mouseClickY;


void mousePressed(){

  mouseClickX = mouseX;
  mouseClickY = mouseY;
  
  
  println(mouseX - width/2,mouseY - height/2);
 // b.moveTo(mouseX - width/2,mouseY - height/2, 0);
 

 
  //b.rotateTo(cam.getRotations());
 
  
  //println(cam.getRotations());
  println(cam.getPosition());
  
}


void mouseReleased()
{
  float sizeX =(mouseX - mouseClickX) / (width / cam.getPosition()[2]);
  float sizeY =(mouseY - mouseClickY)/ (height / cam.getPosition()[2]);
  
  println(sizeX, sizeY);
  if(!isCameraActive){
   Box b = new Box(this,sizeX, sizeY, (sizeX + sizeY)/2);
   b.moveTo(cam.getPosition()[0] * 0.75 ,cam.getPosition()[1]* 0.75 ,cam.getPosition()[2] * 0.75 );
   center.addShape(b);
  }
}

void keyPressed()
{
  //if(key == CODED )
  //{
  //  pushMatrix();
  //   if(keyCode == LEFT)
  //   {
  //     center.rotateBy(0,radians(90),0);
  //   }
  //   else if(keyCode == RIGHT)
  //   {
  //       center.rotateBy(0,-radians(90),0);
  //   }
  //   popMatrix();
  //}
  println(key);
  if (key == 'p')
  {
    isCameraActive = !isCameraActive;
    cam.setActive(isCameraActive);
  }
}
