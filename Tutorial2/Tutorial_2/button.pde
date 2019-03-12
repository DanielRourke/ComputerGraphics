
class Button
{
  int posX;
  int posY;
  int w;
  int h;
  color col;
  
  Button(int x, int y, int w, int h, color col)
  {
    posX = x;
    posY = y;
    this.w = w;
    this.h = h;
    this.col = col;
  }
  
    void display()
  {
    if(mouseX > posX && mouseX < posX+w && mouseY > posY && mouseY < posY + h )
    {
      fill(col);
    }
    else
    {
      fill(175);
    }
    rect(posX,posY, w, h);
  }
}


void drawButtons()
{
    b1.display();
    b2.display();
    b3.display(); 
}
