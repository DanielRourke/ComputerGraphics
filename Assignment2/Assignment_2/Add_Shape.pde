
float mouseClickX;
float mouseClickY;
float shapeType = -1;
boolean drawingActive = false;
Vector<PVector> points = new Vector<PVector>();

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
    
      //float sizeX =(mouseX - mouseClickX) / (width / cam.getPosition()[2]);
      //float sizeY =(mouseY - mouseClickY)/ (height / cam.getPosition()[2]);
      float sizeX =(mouseX - mouseClickX) / 8;
      float sizeY =(mouseY - mouseClickY)/ 8;
      
      switch((int)shapeType)
      {
       case 0:
           Box box = new Box(this,sizeX, sizeY, (sizeX + sizeY)/2);
           box.moveTo(cam.getPosition()[0] * 0.70 ,cam.getPosition()[1]* 0.70 ,cam.getPosition()[2] * 0.70 );
           center.addShape(box);
           drawingActive = false;
           shapeType = -1;
           break;
       case 1:
           Ellipsoid sphere= new Ellipsoid(this, 20 ,30);
           sphere.setRadius((sizeX + sizeY)/2);
           println(cam.getPosition()[0] * 0.60 ,cam.getPosition()[1]* 0.60 ,cam.getPosition()[2] * 0.60);
           sphere.moveTo(cam.getPosition()[0] * 0.60 ,cam.getPosition()[1]* 0.60 ,cam.getPosition()[2] * 0.60 );
           center.addShape(sphere);
           drawingActive = false;
           shapeType = -1;
           break;
       case 2:
           Toroid toroid= new Toroid(this, 20 ,30);
           toroid.setRadius(( sizeX+ sizeY)/12,( sizeX+ sizeY)/16,( sizeX+ sizeY)/6);
           
           println(cam.getPosition()[0] * 0.60 ,cam.getPosition()[1]* 0.60 ,cam.getPosition()[2] * 0.60);
           toroid.moveTo(cam.getPosition()[0] * 0.60 ,cam.getPosition()[1]* 0.60 ,cam.getPosition()[2] * 0.60 );
           toroid.rotateBy(radians(90), 0, 0);
           center.addShape(toroid);
           drawingActive = false;
           shapeType = -1;
           break;
           
        case 3:
           Tube tube= new Tube(this, 20 ,30);
           tube.setSize(sizeX/2,sizeY/2,sizeX/2,sizeY/2, (sizeX + sizeY)/2);
           tube.moveTo(cam.getPosition()[0] * 0.60 ,cam.getPosition()[1]* 0.60 ,cam.getPosition()[2] * 0.60 );
           center.addShape(tube);
           drawingActive = false;
           shapeType = -1;
           break;
        case 4:
           Cone cone = new Cone(this, 20);
           cone.setSize(sizeX/2,sizeX/2, sizeY);
           cone.moveTo(cam.getPosition()[0] * 0.60 ,cam.getPosition()[1]* 0.60 ,cam.getPosition()[2] * 0.60 );
           center.addShape(cone);
           drawingActive = false;
           shapeType = -1;
           break;
        case -2:
           points.add(new PVector(cam.getPosition()[0],cam.getPosition()[1],cam.getPosition()[2]));
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
