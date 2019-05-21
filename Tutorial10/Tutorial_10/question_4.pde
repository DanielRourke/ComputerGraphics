
//Ellipsoid sun, earth, moon;

//void question4Setup()
//{
//  sun = new Ellipsoid(this, 20, 30);
//  sun.setRadius(90);
//  sun.fill(color(255,255,0));
  
//  earth = new Ellipsoid(this, 20, 30);
//  earth.setRadius(60);
//  earth.fill(color(0,255,0));
  
  
//  moon = new Ellipsoid(this, 20, 30);
//  moon.setRadius(30);
//}


//void question4()
//{
//  sun.rotateBy(radians(1), 0, 0);
//  sun.draw();
//}



/**
Earth and Moon, Demonstrating the Shapes3D
library. created by Peter Lager
*/
import shapes3d.utils.*;
import shapes3d.*;
Ellipsoid sun, earth, moon, stars;


void question4Setup(){
    //size(420,380, P3D);
    //create the sun
    sun = new Ellipsoid(this, 40 ,30);
    sun.setTexture("sun.jpg");
    sun.setRadius(90);
    sun.moveTo(new PVector(0,0,0));
    sun.drawMode(Shape3D.TEXTURE);
 
    // Create the earth
    earth = new Ellipsoid(this, 40 ,30);
    earth.setTexture("earth.jpg");
    earth.setRadius(20);
    earth.moveTo(new PVector(0,0,220));
    earth.drawMode(Shape3D.TEXTURE);
    // Create the moon
    moon = new Ellipsoid(this,10,15);
    moon.setTexture("moon.jpg");
    moon.setRadius(5);
    moon.moveTo(0,0,40);
    moon.drawMode(Shape3D.TEXTURE);
    // Create the star background
    stars = new Ellipsoid(this,10,10);
    stars.setTexture("stars.jpg",5,5);
    stars.setRadius(500);
    stars.drawMode(Shape3D.TEXTURE);
    // Add the moon to the earth this makes
    // its position relative to the earth's
    earth.addShape(moon);
    sun.addShape(earth);
    frameRate(30);
}
void question4(){
// Change the rotations before drawing
sun.rotateBy(0, radians(0.6), 0);
earth.rotateBy(0, radians(1.0), 0);
moon.rotateBy(0, radians(1.0), 0);
stars.rotateBy(0, 0, radians(0.03));
background(40);
pushMatrix();
  if(peasyCamOn)
  {
      cam.setActive(true);
  }
  else
  {
    cam.setActive(false);
    camera(mouseXdrag, -190, 350, 0, 0, 0, 0, 1, 0);
  }

ambientLight(80,80,80);
directionalLight(255, 255, 255, -150,150, -80);
// Draw the earth (will cause all added shapes
// to be drawn i.e. the moon)
sun.draw();
// Reset the lights
noLights();
ambientLight(180,180,180);
stars.draw();
popMatrix();
}
float mouseXdrag =0;
boolean peasyCamOn = false;
void mouseDragged()
{
 if (mouseButton == LEFT) {
   mouseXdrag = mouseX;
 }
}

void keyPressed()
{
  if(key == 'p')
    {
      peasyCamOn = !peasyCamOn;
      println("peasy cam is on" + peasyCamOn);
    }
}
