

float beginX = 0;
float beginY = 0;
float speed = 0.00;
float easing = 0.03;
float shuttleX;
float shuttleY;
float targetX;
float targetY;


void setup() {
size(800, 800);
earth = loadImage("earth-icon(2).png");
moon = loadImage("moon-icon(2).png");
shuttle = loadImage("shuttle-icon.png");
earth.resize(width/6, height/6);
moon.resize(width/12, height/12);
shuttle.resize(width/16,height/16);
shuttleX = width /2;
shuttleY = height/2;
targetX = width/2;
targetY =height/8;

angle = -1.7;

imageMode(CENTER);
}
void draw() {
 //question1();
  //question2();
 question3();

}
