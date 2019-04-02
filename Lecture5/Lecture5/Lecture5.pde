//int x =0;
//int y =0;

//int px = 0;
//int py = 0;
//void setup()
//{
//  size(400,400);
  
//}

//void draw()
//{
//  line(px,py,x,y);
//}

//void mouseClicked()
//{
//  if(x != 0)
//  {
//   px = x;
//   py = y;
//    x = mouseX;
//    y = mouseY;
//  }
//  else
//  {
//    x = mouseX;
//    y = mouseY;
//  }
//}


int x = 100;
int y = 100;
int radius = 40;
color col = color(255,255,255);
void setup() {
size(200, 200);
}
void draw()
{
    fill(col);
    ellipse(x, y, 2*radius, 2*radius);
}

void mouseClicked()
{
      float d = (mouseX - x)*(mouseX - x)
    + (mouseY - y)*(mouseY - y);
    d = sqrt(d);
  if(d < radius)
  {
      if (mouseButton == LEFT)
      {
        col = color(255, 0, 0);
      }
      else if(mouseButton == RIGHT)
      {
        col = color(0, 0, 255);
      }
  }
  else
  {
    col = color(0,0,0);
  }

}
