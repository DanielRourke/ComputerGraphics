//Truck car;
//void set2Up()
//{
//  car = new Truck(this, color(255,0,0), color(0,0,255), 1,1);
//}


//class Truck extends Box
//{
//    Box base;
//    Box body;
//    Toroid[] wheels;
//    Tube windshield;
//    color wheelColor;
//    color bodyColor;
//    float bodySize;
//    float wheelSize;
    
    
//  Truck(PApplet app, color wColour, color bColour, float bSize, float wSize)
//  {
//        super(app,0,0,0);
 
       
//        //make base
//        bodyColor = bColour;
//        wheelColor = wColour;
//        bodySize = bSize;
//        wheelSize = wSize;
//        base = new Box(app, 200 * bodySize,50 * bodySize,100 * bodySize);
//        base.fill(bodyColor);
//        this.addShape(base);
        
        
//        //make body
//        body = new Box(app, 100 * bodySize, 50 * bodySize, 100 * bodySize);
//        body.fill(bodyColor);
//        body.moveTo(20 * bodySize, -45 * bodySize, 0);
//        this.addShape(body);
        
//        //make wheels
//        wheels = new Toroid[4];
//        for (int i = 0; i < 4 ;i ++)
//        {
//           wheels[i] = new Toroid(app, 30, 20);
//           wheels[i].setRadius(9 * wheelSize,6* wheelSize,18* wheelSize);
//           wheels[i].fill(wheelColor);
           
//        }
        
//          wheels[0].moveTo(-75 * wheelSize, 35* wheelSize, 60* wheelSize);
//          wheels[0].rotateBy(radians(90), 0, 0);
//          wheels[1].moveTo(-75* wheelSize, 35* wheelSize, -60* wheelSize);
//          wheels[1].rotateBy(radians(90), 0, 0);
//          wheels[2].moveTo(75* wheelSize, 35* wheelSize, 60* wheelSize);
//          wheels[2].rotateBy(radians(90), 0, 0);
//          wheels[3].moveTo(75* wheelSize, 35* wheelSize, -60* wheelSize);
//          wheels[3].rotateBy(radians(90), 0, 0);
//          this.addShape(wheels[0]);
//          this.addShape(wheels[1]);
//          this.addShape(wheels[2]);
//          this.addShape(wheels[3]);
          

//          //make windshield
//          windshield = new Tube(app, 10,3);
//          windshield.setSize(30 * bodySize, 30 * bodySize, 30 * bodySize, 30 * bodySize, 100 * bodySize);
//          windshield.moveTo(-30 * bodySize, -40 * bodySize, 0);
//          windshield.rotateBy(radians(90), radians(30), 0);
//          windshield.drawMode(Shape3D.ALL);
//          windshield.fill(bodyColor,Tube.S_CAP);
//          windshield.fill(bodyColor,Tube.E_CAP);
//          this.addShape(windshield);
     
                  
//       // this.fill(bodyColor);
//       moveTo(width/2,height/2,0);

//  }

//  public void setBodyColour(color bodyColor)
//  {
//      body.fill(bodyColor);
//      windshield.fill(bodyColor,Tube.S_CAP);
//      windshield.fill(bodyColor,Tube.E_CAP);
//      base.fill(bodyColor);
//  }
  
//  public void setWheelColour(color wheelColor)
//  {
//       for (int i = 0; i < 4 ;i ++)
//           wheels[i].fill(wheelColor);

//  }
  
//  void setBodySize()
//  {
    
//  }
  
//  void setWheelSize()
//  {
    
//  }
  
//  void resetColours()
//  {
//       setBodyColour(bodyColor);
//       setWheelColour(wheelColor);
//  }
  
//  @Override
//  void fill(color col)
//  {
//    println("overritting");
//        setBodyColour(col);
//       setWheelColour(col);
//  }
  
 

    
//}

//void mousePressed()
//{
//  picked = Shape3D.pickShape(this, mouseX, mouseY);
//  if(picked != null){
//        originalX = mouseX;
//        originalY = mouseY;
//       // cam.setActive(false);
//        println(picked);
//        picked.getParent().fill(color(255,255,255));
//        zMove = 0;
//  }





//}
//void mouseReleased()
//{
//  if(picked != null){
//      float zPos = picked.getParent().z();
//      picked.getParent().moveTo(mouseX , mouseY, zPos + zMove);
//      println(mouseX, mouseY, zPos + zMove);
//   //   cam.setActive(true);
//      for(int i = 0; i < 5; i++)
//      {
//       cars[i].resetColours(); 
//      }  
     
//  }
//   picked = null;
//}

//float zMove = 0;
//void mouseWheel( processing.event.MouseEvent evt) {
//  float e = evt.getCount();
  
//    if(picked != null)
//    {
//        if(e>0)
//        {
//           zMove += 30;
//         // picked.getParent().getParent().moveTo(mouseX ,mouseY , zMove);
//        }
//        else
//        {
//           zMove -= 30;
//          // picked.getParent().getParent().moveTo(mouseX ,mouseY , zMove);
//        }

//     }
//  println(zMove);
//}

////void mouseDragged()
////{
////   if(picked != null){
////      float zPos = picked.getParent().z();
////      picked.getParent().moveTo(mouseX , mouseY, zPos + zMove);
////      println(mouseX, mouseY, zPos + zMove);
////   //   cam.setActive(true);
////      for(int i = 0; i < 5; i++)
////      {
////       cars[i].resetColours(); 
////      }  
     
////  }
////   picked = null;
  
////}
