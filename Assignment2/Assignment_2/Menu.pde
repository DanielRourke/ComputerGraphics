

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
               .setValue(0)
               .setPosition(10,50)
               .setSize(100,20)
               ;
               
   cp5.addButton("Sphere")
               .setValue(1)
               .setPosition(10,80)
               .setSize(100,20)
               ;             
   
   cp5.addButton("Torid")
               .setValue(2)
               .setPosition(10,110)
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
  
  //switch camera if below 0 else turn off
  if(eventValue < 0)
     isCameraActive = !isCameraActive;
   else
     isCameraActive = false;
     
    cam.setActive(isCameraActive);
    shapeType = eventValue;
  
 //if (eventName.equals("Camera ON/OFF"))
 // {
 //  
 //   shapeType = -1;
 // }
 // else if (eventName.equals("Box"))
 // {
 //   isCameraActive = false;
 //   cam.setActive(isCameraActive);
 //   drawingActive = false;
 //   shapeType = 0;
 //  theEvent.getController().getValue();
 // }
 // else if (eventName.equals("Sphere"))
 // {
 //   isCameraActive = false;
 //   cam.setActive(isCameraActive);
 //   drawingActive = false;
 //   shapeType = 1;
 // }
 // else if (eventName.equals("Blue"))
 // {
 //   //pickedShapeColor = color(0, 0 ,255);
 //   print("Blue Color is selected \n");
 // }
}


void gui() {
  hint(DISABLE_DEPTH_TEST);
  cam.beginHUD();
  cp5.draw();
  cam.endHUD();
  hint(ENABLE_DEPTH_TEST);
}
