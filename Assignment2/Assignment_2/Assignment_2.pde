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


shapes3d.Box center;
shapes3d.Box offcenter;
ArrayList<Shape3D> shapes;
ArrayList<String> text;
PFont font;
 
public void settings()
{
  
    size(800,800, P3D);
}




void setup() {
  cam = new PeasyCam(this, 0, 0, 0, 300);
  cam.setMinimumDistance(50);
  cam.setMaximumDistance(3000);
  cam.setActive(isCameraActive);
  
  center = new shapes3d.Box(this ,10,10,10);
  //offcenter = new shapes3d.Box(this ,10,10,10);
  //offcenter.moveBy(0,0,-100);
  //center.moveTo(width/2,height/2, 0);
  
  //Add Menu Buttons
   
   setButtons();
   running = true;
   
   //shape settings 
   drawingActive = false;
   fillColor = false;
   fillTexture = false;
   fillWire = false;
   shapeType = -1;
   wireWeight = 1;
   texture = new File("default.txt");
   shapes = new ArrayList<Shape3D>();

    text = new ArrayList<String>();
   font = createFont(  "Chunkfive.otf", 5);
   textFont(font);
   textAlign(CENTER, CENTER);
   textMode(SHAPE);
  //TextShape t = new TextShape("work" , 0 , 0, -100);
  //t.move(0,0,400);
  //shapes.add(t);
}


void draw(){
  background(0);
  center.draw();

     
  for (Shape3D shape : shapes)
  {
         shape.draw();     
  }
  
  for (Shape3D shape : shapes)
  {
         shape.draw();     
  }
  gui();
}


Shape3D picked;
color previousColor;

void mousePressed(){
      mouseClickX = mouseX;
      mouseClickY = mouseY;
      
      
  //if shape begin drawing
  if(shapeType >= 0){
    
  }
 

  picked = Shape3D.pickShape(this,mouseX, mouseY );
  if (picked != null){
    previousColor = picked.fill();
    println(picked);
    picked.fill(color(255,255,0));
  }
    
}


void mouseReleased()
{
  if(picked != null){
      picked.fill(previousColor);
      picked = null;
  }

     thread("addShape");
     
}

String tempString = ""; 

void keyPressed()
{  
  
  if(key == '\n')
  {
          TextShape t = new TextShape(tempString , 
                                (int)(cam.getPosition()[0] * 0.70) ,
                                (int)(cam.getPosition()[1] * 0.70) ,
                                (int)(cam.getPosition()[2] * 0.70) ,
                                cam.getRotations()[0] ,
                                cam.getRotations()[1] ,
                                cam.getRotations()[2]  );
          shapes.add(t);
          println(" adding " , tempString);
          addTextActive = false;
          tempString = "";
          println(cam.getRotations());
  }
  else if(addTextActive)
  {
    if(key != CODED)
    {
      tempString += key;
      println(key);
    }
  }

      

  
  
  
  //println(key);
  //if (key == 'p')
  //{
  //  isCameraActive = !isCameraActive;
  //  cam.setActive(isCameraActive);
  //}
}
