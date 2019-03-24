

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
