
float mouseClickX;
float mouseClickY;
float shapeType = -1;
boolean drawingActive = false;


void mousePressed(){
  
  //if shape begin drawing
  if(shapeType >= 0){
      drawingActive = true;
      mouseClickX = mouseX;
      mouseClickY = mouseY;
  }
  
  println(mouseX, mouseY);

}


void mouseReleased()
{
  if(drawingActive){
    
      float sizeX =(mouseX - mouseClickX) / (width / cam.getPosition()[2]);
      float sizeY =(mouseY - mouseClickY)/ (height / cam.getPosition()[2]);
      
      switch((int)shapeType)
      {
       case 0:
           Box b = new Box(this,sizeX, sizeY, (sizeX + sizeY)/2);
           b.moveTo(cam.getPosition()[0] * 0.70 ,cam.getPosition()[1]* 0.70 ,cam.getPosition()[2] * 0.70 );
           center.addShape(b);
           drawingActive = false;
           shapeType = -1;
           break;
       case 1:
           Ellipsoid s= new Ellipsoid(this, 20 ,30);
           s.setRadius((sizeX + sizeY)/4);
           println(cam.getPosition()[0] * 0.60 ,cam.getPosition()[1]* 0.60 ,cam.getPosition()[2] * 0.60);
           s.moveTo(cam.getPosition()[0] * 0.60 ,cam.getPosition()[1]* 0.60 ,cam.getPosition()[2] * 0.60 );
           center.addShape(s);
           drawingActive = false;
           shapeType = -1;
           break;
       case 2:
           Toroid t= new Toroid(this, 20 ,30);
           t.setRadius(( sizeX+ sizeY)/24,( sizeX+ sizeY)/42,( sizeX+ sizeY)/12);
           
           println(cam.getPosition()[0] * 0.60 ,cam.getPosition()[1]* 0.60 ,cam.getPosition()[2] * 0.60);
           t.moveTo(cam.getPosition()[0] * 0.60 ,cam.getPosition()[1]* 0.60 ,cam.getPosition()[2] * 0.60 );
           t.rotateBy(radians(90), 0, 0);
           center.addShape(t);
           drawingActive = false;
           shapeType = -1;
           break;
       default:
       println(shapeType);
           break;
      }
  }
  
   
}

void keyPressed()
{
  
  
  println(key);
  if (key == 'p')
  {
    isCameraActive = !isCameraActive;
    cam.setActive(isCameraActive);
  }
}
