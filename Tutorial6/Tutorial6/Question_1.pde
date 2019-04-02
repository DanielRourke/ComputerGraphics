

void question1()
{
  players[0].display();
  players[1].display();
  
  
   if(keyPressed)
   {
        if(key == CODED)
        {
            if(keyCode == UP)
            {
              players[playerIndex].y -= 1;
            }
            else if(keyCode == RIGHT)
            {
              players[playerIndex].x += 1;
            }
            else if(keyCode == LEFT)
            {
              players[playerIndex].x -= 1;
            }
            else if(keyCode == DOWN)
            {
              players[playerIndex].y += 1;
            }
            
        }
        else if(key == '1')
        {
          playerIndex = 0;
        }
        else if(key == '2')
        {
          playerIndex = 1;
        }
   }
  
}

class Player
{
  int id;
  int x;
  int y;
  int size;
  Player(){}
  Player(int i, int s)
  {
    id = i;
    size = s;
  }
  void display()
  {
    if (id == 0)
    {
      rectMode(CENTER);
      fill(255,0,0);
      rect(x,y,size,size);
    }
    else if(id == 1)
    {
      ellipseMode(CENTER);
      fill(0,0,255);
      ellipse(x,y,size,size);
    }
  }
};


void keyPressed()
{


}
