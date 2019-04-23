

float beginX = 0;
float beginY = 0;
float speed = 1.0;
float easing = 0.02;
float shuttleX;
float shuttleY;
float spaceX;
float spaceY;
float targetX = width/2;
float targetY = height/8;


void setup() {
size(800, 800);
earth = loadImage("earth-icon(2).png");
moon = loadImage("moon-icon(2).png");
shuttle = loadImage("shuttle-icon.png");
moon.resize(width/6, height/6);
shuttle.resize(width/8,height/8);
shuttleX = width /2;
shuttleY = height /2;
spaceX = width/2;
spaceY = height/8;

imageMode(CENTER);
}
void draw() {
 //question1();
  //question2();
 question3();

}
