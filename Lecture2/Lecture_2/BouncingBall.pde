
int j = 0;
int speed = 3;

void bouncingBall() 
{
  background(255);

  j = j + speed; // the object will change at each refreshment
  
  if (j > height || j < 0) 
  {
    speed = -speed; // reverse the direction
  }
  
  stroke(0);
  fill(175);
  ellipse(100, y, 32, 32);
} 
