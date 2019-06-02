




ArrayList<PVector> points = new ArrayList<PVector>();


void addShape()
{
  if(drawingActive){
    
      float sizeX =(mouseX - mouseClickX) / 4;
      float sizeY =(mouseY - mouseClickY)/ 4;
      
   
      switch((int)shapeType)
      {
       case 1:
           shapes3d.Box box = new shapes3d.Box(this,sizeX, sizeY, (sizeX + sizeY)/2);
           box.moveTo((int)(cam.getPosition()[0] * 0.70) ,(int)(cam.getPosition()[1]* 0.70) ,(int)(cam.getPosition()[2] * 0.70 ));
           shapes.add(box);
           picked = shapes.get(shapes.size() - 1);
           println(picked);
           drawingActive = false;
           shapeType = -1;
           break;
       case 2:
           Ellipsoid sphere= new Ellipsoid(this, 20 ,30);
           sphere.setRadius((sizeX + sizeY)/2);
           sphere.moveTo(cam.getPosition()[0] * 0.60 ,cam.getPosition()[1]* 0.60 ,cam.getPosition()[2] * 0.60 );
           shapes.add(sphere);
           picked = shapes.get(shapes.size() - 1);
           drawingActive = false;
           shapeType = -1;
           break;
       case 3:
           Toroid toroid= new Toroid(this, 20 ,30);
           toroid.setRadius(( sizeX+ sizeY)/12,( sizeX+ sizeY)/16,( sizeX+ sizeY)/6);
           toroid.moveTo(cam.getPosition()[0] * 0.60 ,cam.getPosition()[1]* 0.60 ,cam.getPosition()[2] * 0.60 );
           toroid.rotateBy(radians(90), 0, 0);
           shapes.add(toroid);
           picked = shapes.get(shapes.size() - 1);
           drawingActive = false;
           shapeType = -1;
           break;
           
        case 4:
           Tube tube= new Tube(this, 20 ,30);
           tube.setSize(sizeX/2,sizeY/2,sizeX/2,sizeY/2, (sizeX + sizeY)/2);
           tube.moveTo(cam.getPosition()[0] * 0.60 ,cam.getPosition()[1]* 0.60 ,cam.getPosition()[2] * 0.60 );
           shapes.add(tube);
           picked = shapes.get(shapes.size() - 1);
           drawingActive = false;
           shapeType = -1;
           break;
        case 5:
           Cone cone = new Cone(this, 20);
           cone.setSize(sizeX/2,sizeX/2, sizeY);
           cone.moveTo(cam.getPosition()[0] * 0.60 ,cam.getPosition()[1]* 0.60 ,cam.getPosition()[2] * 0.60 );
           shapes.add(cone);
           picked = shapes.get(shapes.size() - 1);
           drawingActive = false;
           shapeType = -1;
           break;
        case -2:
            println("adding points");
            if(points.size() <4)
                 points.add(new PVector(cam.getPosition()[0],cam.getPosition()[1],cam.getPosition()[2]));
             else {
                   createbezShapeTube();
                  drawingActive = false;
                  points.clear();
             }
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
         //   applyFill((Shape3D)btube);
            //center.addShape(btube);
            shapes.add(btube);
            picked = shapes.get(shapes.size() - 1);
            println(picked);
            shapeType = 0;
}
