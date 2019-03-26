

void drawEquationFive()
{
  smooth();
 for (int x = 0; x < width; x++)
 {
   float n = norm(x, 0.0, width);  // range 0.0 to 1.0
   float y = 1 - pow(n, 4);           // calculate curve
   y = y*width;                   // range 0.0 to width
   point(x, y);
 } 
}

void drawEquationSix()
{
    smooth();
 for (int x = 0; x < width; x++)
 {
   float n = norm(x, 0.0, width);  // range 0.0 to 1.0
   float y = pow(n, 8);           // calculate curve
   y = y*width;                   // range 0.0 to width
   rect(x, y, 10, 10);
 } 
}

void drawXYPlane()
{
  fill(10);
  line(0,height/2, width, height/2);
  line(width/2, 0, width/2, height);
  int textOffset = 10;
  
  int index = -5;
  for (int i = 0 ;i <= width; i += width /10)
  {
    line(i , (height/2) + (height / 50), i , (height/2) - (height / 50));
    text(index, i , (height/2) + (height / 50) + textOffset);
    index++;
  }
  index = 5;
  for (int i = 0 ;i <= height; i += height /10)
  {
    line((width /2) - (width / 50), i, (width /2) + (width / 50) ,i);
    text(index,(width /2) + (width / 50) + textOffset, i );
    index--;
  }
}

class Pos
{
  int axis;
  int unit;
  float value;
  
  Pos(float divisions, float max)
  {
    axis = round(max /2);
    unit = round(axis / (divisions /2));
    value = 0.0;
  }

  int position()
  {
    return (round(value * unit)) + axis;
  }

  int positionInv()
  {
    return height - ((round(value * unit)) + axis);
  }
  
  void setValueByPosition(float position)
  {
    value = (position - axis) / unit;
  }
 
}


void drawChallangeEquatoin()
{
  
  Pos X = new Pos(10, width);
  Pos Y = new Pos(10, height);
  drawXYPlane();
   X.value = -5.0;
   
   while (X.value < 5.0)
   {
     Y.value = 1 - pow(X.value, 4);
     if ( Y.value >= -5.0 || Y.value <= 5.0)
     {
           break;
     }
     X.value += 0.1;
   }
   noFill();
   stroke(0,0,255);
   strokeWeight(4);
   beginShape();
   curveVertex(X.position(), Y.position());
   while (X.value < 5.0)
   {
     Y.value =  1 - pow(X.value, 4);
     if ( Y.value >= -5.0 || Y.value <= 5.0)
     {
          curveVertex(X.position(), Y.positionInv());
           
     }
     X.value += 0.01;
   }
  endShape();
}
