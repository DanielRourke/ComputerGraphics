import peasy.*;
PeasyCam cam;
void setup() {
size(800,800, P3D);
cam = new PeasyCam(this, 100);
cam.setMinimumDistance(800);
cam.setMaximumDistance(2000);
}
void draw() {
background(0);
//lights(); // turn on the light
noStroke();
fill(0, 0, 255); // blue face
sphere(200); // draw sphere on top of box
fill(100, 100, 100);// gray eyes
pushMatrix();
translate(70, -80, 150);
sphere(40); // right eye
popMatrix();
pushMatrix();
translate(-70, -80, 150);
sphere(40); // left eye
popMatrix();
pushMatrix();
translate(0, 0, 200);
box(40, 40, 80); // nose
popMatrix();
pushMatrix();
translate(0, 450, 0);
sphere(300); //body
popMatrix();
pushMatrix();
fill(0, 0, 255); // blue face
translate(250, 200, 0);
box(40,300,80); // right arm
popMatrix();
pushMatrix();
translate(-250, 200, 0);
box(40,300,80); //left arm
popMatrix();
pushMatrix();
fill(0, 0, 255); // right leg
translate(250, 800, 0);
box(40,300,80); // n
popMatrix();
pushMatrix();
translate(-250, 800, 0);
box(40,300,80); // left leg
popMatrix();
}
