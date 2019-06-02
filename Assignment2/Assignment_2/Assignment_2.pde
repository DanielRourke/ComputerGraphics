import java.util.*; 
import shapes3d.utils.*;
import shapes3d.*;
import controlP5.*;
import javax.swing.*;
import java.awt.*;
import java.awt.event.*;
import peasy.*;


PeasyCam cam;
ControlP5 cp5;
ArrayList<Shape3D> shapes;
ArrayList<String> text;

shapes3d.Box center;


 
public void settings()
{
  
    size(800,800, P3D);
}

void setup() {
  //camera setup
  cam = new PeasyCam(this, 0, 0, 0, 300);
  cam.setMinimumDistance(50);
  cam.setMaximumDistance(3000);
  cam.setActive(isCameraActive);
  
   //Add Menu Buttons
   setButtons();
   running = true;
  
  center = new shapes3d.Box(this ,10,10,10);

   
   
   //shape settings 
   drawingActive = false;
   isPickingActive = false;
   shapeType = -1;
   wireWeight = 1;
   
   shapes = new ArrayList<Shape3D>();


  textSetup();
  setupTable();
  
      Shape3D.pickShape(this,mouseX, mouseY);
}


void draw(){
  background(0);
  center.draw();

     
  for (Shape3D shape : shapes)
  {
         shape.draw();     
  }
  

  gui();
}


Shape3D picked;
color previousColor;

void mousePressed(){
  //save mouse coords
      mouseClickX = mouseX;
      mouseClickY = mouseY;
      
      if(shapeType > 0)
      {
        drawingActive = true;
      }
      else if( shapeType == -2)
      {
         drawingActive = true;
      }
      
      
      
      
      if(isPickingActive)
      {
         isPickingActive = false;
         //release last picked item
         //if(picked != null)
         //    //picked.fill(previousColor);
          
          picked = Shape3D.pickShape(this,mouseX, mouseY);
          
          if (picked != null){
            
                for (Shape3D shape : shapes)
                {
                       if (shape == picked)
                       {
                                    
                         //added cause Box fill returns error
                         
                          previousColor = shape.fill();
                          //println(previousColor);
                          shape.fill(color(255,255,0));
                       }
                }

             // picked.fill(color(255,255,0));
      }


      //addFill();
  }
    
}


void mouseDragged()
{

          //if (picked != null)
          //{
          //  picked.moveTo((int)(cam.getPosition()[0] * 0.70) ,(int)(cam.getPosition()[1]* 0.70) ,(int)(cam.getPosition()[2] * 0.70 ));
          //}
          

}


void mouseReleased()
{

     thread("addShape");
     
     //if(key == 'm')
     //{
     //     if (picked != null)
     //     {
     //       picked.moveTo((int)(cam.getPosition()[0] * 0.70) ,(int)(cam.getPosition()[1]* 0.70) ,(int)(cam.getPosition()[2] * 0.70 ));
     //       picked = null;
     //     }
     //}
     
          //if (picked != null)
          //{
          //    picked = null;
          //}
}

String tempString = ""; 

void keyPressed()
{  
  
    textBuilder();
    
    fillAdder();
    
    if(key == 'm')
    {
          if (picked != null)
          {
            picked.moveTo((int)(cam.getPosition()[0] * 0.70) ,(int)(cam.getPosition()[1]* 0.70) ,(int)(cam.getPosition()[2] * 0.70 ));
            picked.fill(previousColor);
            picked = null;
          }
    }

}
