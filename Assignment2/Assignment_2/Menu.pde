boolean running;

//setup the menu buttons
void setButtons()
{
  cp5 = new ControlP5(this);
   cp5.addButton("Camera ON/OFF")
               .setValue(-1)
               .setPosition(10,20)
               .setSize(100,20)
               ;
               
                 
  cp5.addButton("Box")
               .setValue(1)
               .setPosition(10,50)
               .setSize(100,20)
               ;
               
   cp5.addButton("Sphere")
               .setValue(2)
               .setPosition(10,80)
               .setSize(100,20)
               ;             
   
   cp5.addButton("Toroid")
               .setValue(3)
               .setPosition(10,110)
               .setSize(100,20)
               ;
               
   cp5.addButton("Tube")
               .setValue(4)
               .setPosition(10,140)
               .setSize(100,20)
               ;
  cp5.addButton("Cone")
               .setValue(5)
               .setPosition(10,170)
               .setSize(100,20)
               ;
  cp5.addButton("BezTube Begin/End")
               .setValue(-2)
               .setPosition(10,200)
               .setSize(100,20)
               ;
  cp5.addButton("Fill On/Off")
               .setValue(0)
               .setPosition(10,230)
               .setSize(100,20)
               ;
  cp5.addButton("Texture On/Off")
               .setValue(0)
               .setPosition(10,260)
               .setSize(100,20)
               ;
               
    cp5.addButton("Wire On/Off")
               .setValue(0)
               .setPosition(10,290)
               .setSize(100,20)
               ;
               
    cp5.addButton("Stroke +")
               .setValue(0)
               .setPosition(10,320)
               .setSize(40,20)
               ;
    cp5.addButton("Stroke -")
               .setValue(0)
               .setPosition(70,320)
               .setSize(40,20)
               ;
   cp5.addButton("Add Text")
               .setValue(0)
               .setPosition(10,350)
               .setSize(100,20)
               ;
   cp5.setAutoDraw(false);
}



//control the actions of the buttons
public void controlEvent(ControlEvent theEvent) {
  println(theEvent.getController().getName());  
  //get the name of the button
  String eventName = theEvent.getController().getName();
  //get the value of the button
  float eventValue = theEvent.getController().getValue();
  
  //prevents events from firing before launch
  if(running){
         //switch camera if below 0 else turn off
      if( (eventName.equals("Camera ON/OFF")) ||
          (eventName.equals("Box")) || 
          (eventName.equals("Sphere")) ||
          (eventName.equals("Toroid")) ||
          (eventName.equals("Tube")) ||
          (eventName.equals("Toroid")) ||
          (eventName.equals("Cone"))     )
       {
            
            if(eventValue < 0){
               isCameraActive = !isCameraActive;
            }
            else{
                isCameraActive = false;
                drawingActive = true;
            }
               
    
            cam.setActive(isCameraActive);
            shapeType = eventValue;
            
       }
        else if(eventName.equals("BezTube Begin/End"))
        {
    
          if(points.size()> 2)
          {
                createbezShapeTube();
                drawingActive = false;
                points.clear();
          }
          else
          {
                  isCameraActive = true;
                  cam.setActive(isCameraActive);
                  drawingActive = true;
                  points.clear();
          }
    
            
        }
        
        if (eventName.equals("Fill On/Off"))
        {
            fillColor = !fillColor;
            fillTexture = false;
        }
        
        if (eventName.equals("Texture On/Off"))
        {
            fillColor = false;
            fillTexture = !fillTexture;
            fillWire = false;
            //if(fillTexture)
            //{
            //   selectInput("Select a Texture" , "textureSelected");
            //}
        }
        
       if (eventName.equals("Wire On/Off"))
        {
            fillTexture = false;
            fillWire = !fillWire;
        }
        
        //adjust stroke weight for new Shapes
        if (eventName.equals("Stroke +"))
        {
            wireWeight += 1;
        }
        
        if (eventName.equals("Stroke -"))
        {
            if(wireWeight > 1)
            {
              wireWeight -= 1;
            }
        }
        
        
        if (eventName.equals("Add Text"))
        {
             addTextActive = true;
        }
    
  }
  
  
 
    
    
       
    
}

///draw the action buttons
void gui() {
  hint(DISABLE_DEPTH_TEST);
  cam.beginHUD();
  cp5.draw();
  cam.endHUD();
  hint(ENABLE_DEPTH_TEST);
}
