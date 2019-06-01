import java.util.*; 
import shapes3d.utils.*;
import shapes3d.*;

import controlP5.*;
ControlP5 cp5;

import peasy.*;
PeasyCam cam;
boolean isCameraActive = false;




public void settings()
{
  
    size(800,800, P3D);
}


Box center;
ArrayList<Shape3D> shapes = new ArrayList<Shape3D>();

void setup() {
  cam = new PeasyCam(this, 0, 0, 0, 300);
  cam.setMinimumDistance(50);
  cam.setMaximumDistance(3000);
  cam.setActive(isCameraActive);
  
  center = new Box(this ,10,10,10);
  //center.moveTo(width/2,height/2, 0);
  
  //Add Menu Buttons
   setButtons();
   
   
   drawingActive = false;
   shapeType = -1;
}


void draw(){
  background(0);
  center.draw();
  gui();
}
