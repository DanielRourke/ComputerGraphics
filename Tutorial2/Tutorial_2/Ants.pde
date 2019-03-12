class Ant
{
  int posX;
  int posY;
  int w;
  int h;
  color shade;
 Ant(int x, int y, int s)
 {
   posX = x;
   posY = y;
   this.w = s;
   this.h = s;
   shade = color(random(0,255));
 }
 
 void randomize()
 {
   shade = color(random(0,255));
 }
 
 void display()
 {
   noStroke();
   fill(shade);
  rect(posX, posY, w, h) ;
 }
 
}


void drawAntsFor()
{
  
  for (int i = 0; i < width/size ; i ++)
  {
    for(int j = 0; j < height/size ; j ++)
    {

      Ant ant = new Ant(i*size,j*size,size);
      ant.display();
    }
    
  }
}

void drawAntsWhile()
{
  
  int i = 0;
  while ( i < width/size )
  {
    int j = 0;
    while ( j < height/size)
    {

      Ant ant = new Ant(i*size,j*size,size);
      ant.display();
      
      j++;
    }
    
   i++ ; 
  }
}
