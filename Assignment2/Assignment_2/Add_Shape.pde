
float mouseClickX;
float mouseClickY;
float shapeType = -1;
boolean drawingActive = false;
boolean fillColor = false;
boolean fillTexture = false;
boolean fillWire = false;
float wireWeight = 1;

File texture;

ArrayList<PVector> points = new ArrayList<PVector>();

void addShape()
{
  if(drawingActive){
    
      //float sizeX =(mouseX - mouseClickX) / (width / cam.getPosition()[2]);
      //float sizeY =(mouseY - mouseClickY)/ (height / cam.getPosition()[2]);
      float sizeX =(mouseX - mouseClickX) / 8;
      float sizeY =(mouseY - mouseClickY)/ 8;
      
    
      
      
      switch((int)shapeType)
      {
       case 1:
           shapes3d.Box box = new shapes3d.Box(this,sizeX, sizeY, (sizeX + sizeY)/2);
           box.moveTo((int)(cam.getPosition()[0] * 0.70) ,(int)(cam.getPosition()[1]* 0.70) ,(int)(cam.getPosition()[2] * 0.70 ));
           applyFill(box);
           shapes.add(box);
           drawingActive = false;
           shapeType = -1;
           break;
       case 2:
           Ellipsoid sphere= new Ellipsoid(this, 20 ,30);
           sphere.setRadius((sizeX + sizeY)/2);
           sphere.moveTo(cam.getPosition()[0] * 0.60 ,cam.getPosition()[1]* 0.60 ,cam.getPosition()[2] * 0.60 );
           applyFill(sphere);
          //center.addShape(sphere);
           shapes.add(sphere);
           drawingActive = false;
           shapeType = -1;
           break;
       case 3:
           Toroid toroid= new Toroid(this, 20 ,30);
           toroid.setRadius(( sizeX+ sizeY)/12,( sizeX+ sizeY)/16,( sizeX+ sizeY)/6);
           
           println(cam.getPosition()[0] * 0.60 ,cam.getPosition()[1]* 0.60 ,cam.getPosition()[2] * 0.60);
           toroid.moveTo(cam.getPosition()[0] * 0.60 ,cam.getPosition()[1]* 0.60 ,cam.getPosition()[2] * 0.60 );
           toroid.rotateBy(radians(90), 0, 0);
           applyFill(toroid);
           //center.addShape(toroid);
           shapes.add(toroid);
           drawingActive = false;
           shapeType = -1;
           break;
           
        case 4:
           Tube tube= new Tube(this, 20 ,30);
           tube.setSize(sizeX/2,sizeY/2,sizeX/2,sizeY/2, (sizeX + sizeY)/2);
           tube.moveTo(cam.getPosition()[0] * 0.60 ,cam.getPosition()[1]* 0.60 ,cam.getPosition()[2] * 0.60 );
           applyFill(tube);
           shapes.add(tube);
           //center.addShape(tube);
           drawingActive = false;
           shapeType = -1;
           break;
        case 5:
           Cone cone = new Cone(this, 20);
           cone.setSize(sizeX/2,sizeX/2, sizeY);
           cone.moveTo(cam.getPosition()[0] * 0.60 ,cam.getPosition()[1]* 0.60 ,cam.getPosition()[2] * 0.60 );
           applyFill(cone);
           shapes.add(cone);
           //center.addShape(cone);
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

//creates a bezShape Tube from predifined Points
void createbezShapeTube()
{
            P_Bezier3D bez;
            BezTube btube;
            println(points.size());
            PVector[] pointArray = new PVector[points.size()];
            int i = 0;
            for (PVector pv : points)
            {
              println(pv);
              pointArray[i] = pv;
              i++;
            }

            bez = new P_Bezier3D(pointArray, i);
            btube = new BezTube(this, bez, 7, 7, 7);
            applyFill((Shape3D)btube);
            //center.addShape(btube);
            shapes.add(btube);
}

color getColor()
{
    
    color colorPick =  color(255);
    int alpha;
    Color jColor = new Color(255);
    jColor  = JColorChooser.showDialog(null,"Java Color Chooser", jColor);
    if(jColor!=null) 
    {
      println(jColor);
      colorPick = jColor.getRGB();
      alpha = jColor.getAlpha();
      println(alpha);
      
    }
    
    return colorPick;

}

void getTexture()
{
  
}



public void applyFill(Shape3D shape){
  
      if(fillColor && fillWire)
      {
          shape.drawMode(Shape3D.SOLID | Shape3D.WIRE);
          shape.fill(getColor());
          shape.stroke(getColor());
          shape.strokeWeight(wireWeight);
      }
      else if(fillColor)
      {
        shape.drawMode(Shape3D.SOLID);
        shape.fill(getColor());
      }
      else if(fillWire)
      {
         shape.drawMode(Shape3D.WIRE);
         shape.stroke(getColor());
         shape.strokeWeight(wireWeight);
      }
      else if(fillTexture)
      {
         //if(texture != null)
         //{
         //   shape.drawMode(Shape3D.TEXTURE);
         //   shape.setTexture(texture.getAbsolutePath());
         //}
          
      }
      
      
      shape.pickColor(color(255,255,255));
}

void  textureSelected(File selection) {
  if (selection == null) {
      println("Window was closed or the user hit cancel.");
  } else {
     texture = selection;
  }
  

}
