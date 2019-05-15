import shapes3d.*;
import shapes3d.animation.*;
import shapes3d.utils.*;

//Box tableTop;
void setup()
{
  size(600,600, P3D);
  //tableTop = new Box(this, 50, 50,200);
  fill(204);

}


float mouseYdrag=0.0;
void draw()
{
    //tableTop.draw();
    lights();
    background(0);
    // Change height of the camera with mouseY
    camera(30.0, mouseYdrag, 220.0, // eyeX, eyeY, eyeZ
      0.0, 0.0, 0.0, // centerX, centerY, centerZ
      0.0, 1.0, 0.0); // upX, upY, upZ
    noStroke();
    box(90);
    stroke(255);
    line(-100, 0, 0, 100, 0, 0);
    line(0, -100, 0, 0, 100, 0);
    line(0, 0, -100, 0, 0, 100);
}


void mouseDragged()
{
 if (mouseButton == LEFT) {
   mouseYdrag = mouseY;
 }
}
