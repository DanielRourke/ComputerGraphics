
void question2Setup()
{
  question1Setup();
  for (int i = 0; i < 10; i++)
  {

      int rnd = (int)random(0,100);
      color col;
      if(rnd > 66 )
          col = color(255,0,0);
      else if (rnd > 33 )
           col = color(0,255,0);
       else
           col = color(0,0,255);
      
      int rnd2 = (int)random(0,100);
      if(rnd2 > 66)
      {
        randomSphere[i].drawMode(Shape3D.WIRE);
        randomSphere[i].stroke(col);
      }
      else if(rnd2 >33)
      {
          randomSphere[i].drawMode(Shape3D.SOLID);
          randomSphere[i].fill(col);
      }
       

          

      
  
  }
}


void question2()
{
  for (int i = 0; i < 10; i++)
  {
      randomSphere[i].draw();
      randomBox[i].draw();
  }
}
