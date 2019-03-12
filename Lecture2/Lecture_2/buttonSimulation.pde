boolean button = false;
int x = 100;
int y = 100;
int w = 100;
int h = 75;

void buttonSimulation(){
  if (button) 
  {
    background(255); // white background
    stroke(0); // black outline
  }
  else
  {
    background(0);
    stroke(255);
  }
    fill(175);
    rect(x, y, w, h); // draw the button
}
  
  
  
void mousePressed() 
{
  if (mouseX > x && mouseX < x+w && mouseY >
  y && mouseY < y+h) 
  {
    button = !button;
  }
}
