int q = 0;
int speed = 1;

void bouncingBall() {
background(255);
q = q + speed; // the object will change at each refreshment
if (q > height || q < 0) {
speed = -speed; // reverse the direction
}
stroke(0);
fill(175);
ellipse(100, q, 32, 32);
} 
