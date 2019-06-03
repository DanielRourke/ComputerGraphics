
float wireWeight = 1;
float shapeType = -1;

boolean isPickingActive = false;
boolean isCameraActive = false;
boolean drawingActive = false;
boolean addTextActive;
boolean running;




float mouseClickX;
float mouseClickY;




//control the actions of the buttons
public void controlEvent(ControlEvent theEvent) {
  println(picked);
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
                
            }
               
    
            cam.setActive(isCameraActive);
            shapeType = eventValue;
            
       }
       else if(eventName.equals("BezTube Begin/End"))
       {
            shapeType = eventValue;
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
        
        if (eventName.equals("Add Fill"))
        {
            addFill();
        }
        
        if (eventName.equals("Add Texture"))
        {
            addTexture();
        }
        
       if (eventName.equals("Add Wire"))
        {
            addWire();
        }
        
        
        if (eventName.equals("Add Wire And Fill"))
        {
            addFillAndWire();
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
        
        ///enables adding of text
        if (eventName.equals("Add Text"))
        {
             addTextActive = true;
        }
        
        if (eventName.equals("Pick Shape"))
        {
              isCameraActive = true;
             cam.setActive(isCameraActive);
             isPickingActive = true;
        }
        
        if (eventName.equals("Save"))
        {
              saveShapes();
        }
        
        if (eventName.equals("Load"))
        {
             loadShapes2();
        }
    
  }
       
    
}
