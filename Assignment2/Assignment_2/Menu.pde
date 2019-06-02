

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
  cp5.addButton("Add Fill")
               .setValue(0)
               .setPosition(10,230)
               .setSize(100,20)
               ;
  cp5.addButton("Add Texture")
               .setValue(0)
               .setPosition(10,260)
               .setSize(100,20)
               ;
               
    cp5.addButton("Add Wire")
               .setValue(0)
               .setPosition(10,290)
               .setSize(40,20)
               ;
               
   cp5.addButton("Add Wire And Fill")
               .setValue(0)
               .setPosition(70,290)
               .setSize(40,20)
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
   cp5.addButton("Pick Shape")
               .setValue(0)
               .setPosition(10,380)
               .setSize(100,20)
               ;
   cp5.addButton("Save")
               .setValue(0)
               .setPosition(10,410)
               .setSize(100,20)
               ;
    cp5.addButton("Load")
               .setValue(0)
               .setPosition(10,440)
               .setSize(100,20)
               ;
   cp5.setAutoDraw(false);
}





///draw the action buttons
void gui() {
  hint(DISABLE_DEPTH_TEST);
  cam.beginHUD();
  cp5.draw();
  cam.endHUD();
  hint(ENABLE_DEPTH_TEST);
}
