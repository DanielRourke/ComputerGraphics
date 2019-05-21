import peasy.*;
PeasyCam cam;
import shapes3d.utils.*;
import shapes3d.*;

Ellipsoid e;
Box b;
void setup() {
size(800,800, P3D);
cam = new PeasyCam(this, 800);
cam.setMinimumDistance(100);
cam.setMaximumDistance(2000);

//e = new Ellipsoid(this, 40 ,30);
//b = new Box(this, 10,222,22);
 // question1Setup();
  question2Setup();
  question3Setup();
  question4Setup();
  question5Setup();
}

void draw() {
background(0);
//e.draw();
//b.draw();
//question1();
//question3();
//question4();
question5();
}
