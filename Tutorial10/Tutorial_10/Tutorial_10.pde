import peasy.*;
PeasyCam cam;
import shapes3d.utils.*;
import shapes3d.*;

Ellipsoid e;
Box b;
void setup() {
size(800,800, P3D);
cam = new PeasyCam(this, 100);
cam.setMinimumDistance(800);
cam.setMaximumDistance(2000);

//e = new Ellipsoid(this, 40 ,30);
//b = new Box(this, 10,222,22);
 // question1Setup();
  question2Setup();
  question3Setup();
}

void draw() {
background(0);
//e.draw();
//b.draw();
//question1();
question3();
}
