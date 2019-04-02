
boolean sceneSetup =false;
void question3()
{
  if(!sceneSetup)
  {
    
  players[0].x = 100;
  players[0].y = 300;
  players[1].x = 200;
  players[1].y = 300;
  sceneSetup = true;
  }
  background(255);
  players[0].display();
  players[1].display();
  
  
  if(mousePressed)
  {
    for(int i = 0 ; i < players.length ; i++)
    {
        float d = (mouseX - players[i].x)*(mouseX - players[i].x)
            + (mouseY - players[i].y)*(mouseY - players[i].y);
        d = sqrt(d);
    
        if(d < (players[i].size/2))
        {
          players[i].x = mouseX;
          players[i].y = mouseY;
        }
    }
     
    
  }
  
}
