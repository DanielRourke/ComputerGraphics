import shapes3d.utils.*;
import shapes3d.*;
import controlP5.*;
import peasy.*;

ControlP5 cp5;

PeasyCam cam;

Button myButton;
int numShapes = 10;
Shape3D [] shapes;
boolean isCameraActive = false;
boolean isFilled = true;
color pickedShapeColor = color(0, 0, 255);
int pickedItem = -1;

void setup() {
  size(1000, 1000, P3D);
  cam = new PeasyCam(this, 0, 0, 0, 300);
  cam.setMinimumDistance(200);
  cam.setMaximumDistance(1000);
  cam.setActive(isCameraActive);
  
  cp5 = new ControlP5(this);
                 
  cp5.addButton("Camera ON/OFF")
               .setValue(3)
               .setPosition(10,20)
               .setSize(100,20)
               ;
              
  cp5.addButton("Red")
               .setValue(10)
               .setPosition(10,50)
               .setSize(100,20)
               ;
               
   cp5.addButton("Green")
               .setValue(11)
               .setPosition(10,80)
               .setSize(100,20)
               ;             
   
   cp5.addButton("Blue")
               .setValue(12)
               .setPosition(10,110)
               .setSize(100,20)
               ;
  cp5.setAutoDraw(false);
  shapes = new Shape3D[numShapes];
  for (int i = 0; i < numShapes; i++)
  {
    int size = 20 + (int)random(100);
    int type = (int)(random(10));
    if (type % 2 == 0) {
      shapes[i] = new Box(this,size,size,size);
    }
    else {
      Ellipsoid e = new Ellipsoid(this,20,30);
      e.setRadius(size);
      shapes[i] = e;
    }
    shapes[i].moveTo(random(-400, 400), random(-400, 400), random(-400, 400));
    shapes[i].fill(randomColor());    
    shapes[i].drawMode(Shape3D.SOLID);
  }
}

void draw() {
  
  background(0);  
  noStroke();
  
  for (int i = 0; i < numShapes; i++) {
    shapes[i].draw();
  }
  
  gui();
}

public void controlEvent(ControlEvent theEvent) {
  println(theEvent.getController().getName());  
  String eventName = theEvent.getController().getName();
 if (eventName.equals("Camera ON/OFF"))
  {
    isCameraActive = !isCameraActive;
    cam.setActive(isCameraActive);    
  }
  else if (eventName.equals("Red"))
  {
    pickedShapeColor = color(255, 0 ,0);
    print("Red Color is selected \n");
  }
  else if (eventName.equals("Green"))
  {
    pickedShapeColor = color(0, 255 ,0);
    print("Green Color is selected \n");
  }
  else if (eventName.equals("Blue"))
  {
    pickedShapeColor = color(0, 0 ,255);
    print("Blue Color is selected \n");
  }
}

void mousePressed() {
  Shape3D picked = Shape3D.pickShape(this,mouseX, mouseY);
  if(picked != null) {
    for (int i = 0; i < numShapes; i++) {
      if (shapes[i] == picked) {
        pickedItem = i;
      }
    }
  }
  else
  {
    pickedItem = -1;
  }
  
  if(pickedItem >= 0)
  {
    shapes[pickedItem].fill(pickedShapeColor);
  }
}  

int randomColor(){
  return color(random(160,200), random(20,160), random(160,200));
}

  
void gui() {
  hint(DISABLE_DEPTH_TEST);
  cam.beginHUD();
  cp5.draw();
  cam.endHUD();
  hint(ENABLE_DEPTH_TEST);
}