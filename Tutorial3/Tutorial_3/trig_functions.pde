
void drawTrig()
{
   strokeWeight(0);
  smooth();
  fill(255, 20);
  float angle = 0.0;
  float scaleVal = 18.0;
  float angleInc = PI/77.0;
  for (int offset = -10; offset <= width+10; offset+= 5)
  {
    for (int y = 0; y <= height; y += 2) 
    {  
      float x = offset + sin(angle) * scaleVal;
     // noStroke();
      stroke(233,5,255);
      rect(x, y, 50, 10);
      
     //point(x, y);
      angle += angleInc;
    }
    
    angle += PI;
  } 
}
