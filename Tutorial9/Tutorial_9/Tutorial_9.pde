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
question5();
}
