import java.util.*; 
import shapes3d.utils.*;
import shapes3d.*;

import controlP5.*;
ControlP5 cp5;

import peasy.*;
PeasyCam cam;


boolean isCameraActive = false;


  
 
 import javax.swing.*;
 import java.awt.*;
 import java.awt.event.*;



 
public void settings()
{
  
    size(800,800, P3D);
}


shapes3d.Box center;

shapes3d.Box offcenter;
ArrayList<Shape3D> shapes = new ArrayList<Shape3D>();

void setup() {
  cam = new PeasyCam(this, 0, 0, 0, 300);
  cam.setMinimumDistance(50);
  cam.setMaximumDistance(3000);
  cam.setActive(isCameraActive);
  
  center = new shapes3d.Box(this ,10,10,10);
  offcenter = new shapes3d.Box(this ,10,10,10);
  offcenter.moveBy(0,0,-100);
  //center.moveTo(width/2,height/2, 0);
  
  //Add Menu Buttons
   
   setButtons();
   
   drawingActive = false;
   fillColor = false;
   fillTexture = false;
   fillWire = false;
   shapeType = -1;
   wireWeight = 1;
   texture = new File("default.txt");
   running = true;
   
}


void draw(){
  background(0);
  center.draw();
  offcenter.draw();
  for (Shape3D shape : shapes)
  {
         shape.draw();     
  }
  gui();
}
