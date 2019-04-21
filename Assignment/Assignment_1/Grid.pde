




class Grid
{
 int xspread;
 int yspread;
 float x;
 float y;
 float w;
 float h;
 float xunit;
 float yunit;
 
 Grid()
 {
   
   x = width / 14;
   y = height / 14;
   xspread = 100;
   yspread = 100;
   w = width - x - x;
   h = height - y - y;
   xunit =  w / xspread;
   yunit =  h / yspread;
 };
 
 void drawGrid()
 {
  line(x , y + h,x+  w , y + h);
   
   for(int i = 0; i <= xspread; i += 10)
   {
     line(x + (i * xunit), y + h, x + (i * xunit), y + h + (2 * yunit));
   }
   
   line(x , y + h, x ,y);
   
   for(int i = 0; i <= yspread; i += 10)
   {
     line(x, y + h -(i * yunit), x - (2 * xunit), y + h - (i * yunit));
   }
   
   
 };
};
