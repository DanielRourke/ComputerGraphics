
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

class NewFileListener implements ActionListener
{
  void actionPerformed(ActionEvent e)
  {
    currentFile = new  File(sketchPath("/data")+"/data" + month() + "_" + day() + "_" + hour() + "_" + minute() + "_" + second() +".csv"); 
    createOutput(currentFile);
     gridEmpty = true;
 //   selectInput("Select a file to write to:", "createNewFile", newFile);
  }
}

boolean createNewFile(File selection)
{
    if (selection == null) {
        println("what");
        return false;
  } else {
   // println(selection);
    createOutput(selection);
    return true;
  }
  
}

void fileSelected(File selection) {
  if (selection == null) {
    println("Window was closed or the user hit cancel.");
  } else {
    println("User selected " + selection.getAbsolutePath());
  }
}


class OpenListener implements ActionListener
{
  void actionPerformed(ActionEvent e)
  {
    selectInput("Open data file ", "openSelectedFile");
  }
}

void openSelectedFile(File selection) {
  if (selection != null)
  {
      currentFile = selection;
      grid.loadItems();
  }
}

class SaveListener implements ActionListener
{
  void actionPerformed(ActionEvent e)
  {
    grid.saveItems();
  }
}
class SaveAsListener implements ActionListener
{
  void actionPerformed(ActionEvent e)
  {
    selectOutput("Save File As" , "saveAsSelectedFile", currentFile);
  }
}

void saveAsSelectedFile(File selection)
{
    if (selection != null)
  {
      currentFile = selection;
      grid.saveItems();
  }
}

class ExitListener implements ActionListener
{
  void actionPerformed(ActionEvent e)
  {
    System.exit(0);
  }
}

class resizeListener implements ComponentListener 
{  
        // This method is called after the component's size changes
       void componentResized(ComponentEvent evt) {
            Component c = (Component)evt.getSource();
    
            // Get new size
            Dimension newSize = c.getSize();
           println(newSize);
           grid.resizeGrid();
        }
        
        void  componentMoved(ComponentEvent evt)
        {
          
        }
        void  componentShown(ComponentEvent evt)
        {
          
        }
        
        void  componentHidden(ComponentEvent evt)
        {
          
        }
        
        
}
