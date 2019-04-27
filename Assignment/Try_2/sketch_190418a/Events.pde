
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
  }
}

boolean createNewFile(File selection)
{
    if (selection == null) {
        return false;
  } else {
    createOutput(selection);
    return true;
  }
  
}

//void fileSelected(File selection) {
//  if (selection == null) {
//    println("Window was closed or the user hit cancel.");
//  } else {
//    println("User selected " + selection.getAbsolutePath());
//  }
//}


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
      println(selection);
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


class ChangeFillListener implements ItemListener
{
  void itemStateChanged(ItemEvent e)
  {
    if (e.getStateChange() == 2)
    {
        grid.fill = false; 
        grid.updateDataItemsDrawSettings();
    }
    else if (e.getStateChange() == 1)
    {
         grid.fill = true; 
         grid.updateDataItemsDrawSettings();
         
    }
  }
}

//check if string is all Numbers and not empty
// Update all dataItems to have new border (strokeWieght)
class ChangeBorderListener implements ActionListener
{
  void actionPerformed(ActionEvent e)
  {
    String result = JOptionPane.showInputDialog(frame, "Please enter a boder size");
    String[][] m ;
    m = matchAll(result, "[0-9]");

    if(m != null && m.length == result.length() )
    {
        grid.stroke = int(result);
        grid.updateDataItemsDrawSettings();
    }
  }
}

class ChangelabelShowListener implements ItemListener
{
  
  void itemStateChanged(ItemEvent e)
  {
    println(e.getStateChange());
        if (e.getStateChange() == 2)
    {
        grid.label = false; 
        grid.updateDataItemsDrawSettings();
    }
    else if (e.getStateChange() == 1)
    {
         grid.label = true; 
         grid.updateDataItemsDrawSettings();
    }
  }
}


class OpenIconListener implements ActionListener
{
  void actionPerformed(ActionEvent e)
  {
    println("select thigns");
  //  selectInput("Open data file ", "openSelectedIcon");
  }
}

void openSelectedIcon(File selection) {
  if (selection != null)
  {
      //selection;
    //  println(selection);
    //  grid.loadItems();
  }
}


 // This method is called after the component's size changes
class resizeListener implements ComponentListener 
{  
   
     void componentResized(ComponentEvent evt) 
     {
         Component c = (Component)evt.getSource();
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
