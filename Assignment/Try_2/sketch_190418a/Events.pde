
float xdiff;
float ydiff;

void mousePressed()
{
  if(keyIndex != 17)
    {
         grid.clearSelectedItems();
    }
   
    grid.addSelectedItem();
}

void mouseReleased()
{ 
  
  if(keyIndex != 17)
  {
      grid.clearSelectedItems();
      grid.moveSelectedItems();
  }
  else
  {
    grid.moveSelectedItems();
  }
   
}

int keyIndex;

void keyPressed()
{
  println(keyCode);
  keyIndex = keyCode;
}

void keyReleased()
{
  keyIndex = -1;
}
