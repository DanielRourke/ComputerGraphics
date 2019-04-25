
int lastSelectedIndex = -1;
boolean mutipleSelected;
void mousePressed()
{
  if(keyIndex != 17)
    {
       grid.clearSelectedItems();
    }
    grid.addSelectedItem();
}

//void mouseReleased()
//{ 
  
//  if(keyIndex == 17)
//  {
//      grid.moveSelectedItems();
//  }
//  else
//  {
//    if(grid.countSelectedItems() > 1)
//        grid.moveSelectedItems();
//    else
//        grid.clearSelectedItems();
//  }
   
//}

void mouseReleased()
{ 
  if(keyIndex != 17)
    grid.clearSelectedItems();
}


void mouseDragged()
{
  grid.moveSelectedItems();
}

int keyIndex;

void keyPressed()
{
  println(keyCode);
  keyIndex = keyCode;
  if (keyIndex == 107)
  {
    grid.increaseSelectedItems();
  }
  else if(keyIndex == 109)
  {
    grid.decreaseSelectedItems();
  }
}


void mouseWheel( processing.event.MouseEvent evt) {
  float e = evt.getCount();
  if(e>0)
  {
    grid.increaseSelectedItems();
  }
  else
  {
     grid.decreaseSelectedItems();
  }
  println(e);
}

void keyReleased()
{
  keyIndex = -1;
}
