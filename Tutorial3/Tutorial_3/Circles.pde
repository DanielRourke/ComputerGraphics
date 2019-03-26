

void draw100RandomCircles()
{
    for(int i = 0; i < 100; i++)
  {
    noStroke();
    ellipseMode(CENTER);
    fill(random(0,255));
    float size =  random(0,width / 4);
    ellipse(random(0, width), random(0,height),size,size);
  }
}
