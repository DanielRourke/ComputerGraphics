
int lastSelectedIndex = -1;
boolean mutipleSelected;


  //if ctrl is pressed you can selected mutiple items
  //if you right click you get a popupmenu;
void mousePressed()
{

   if(keyIndex != 17)
           grid.clearSelectedItems();
   
   grid.addSelectedItem();
   
   if(mouseButton == RIGHT)
        mp.popupmenu.show(mp.frame, mouseX, mouseY);

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
    grid.data = new Data(); 
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
      grid.data.empty = true;
      grid.data.loadData(selection);
      grid.createDataItems();
  }
}

class SaveListener implements ActionListener
{
    void actionPerformed(ActionEvent e)
    {
        grid.updateData();
        grid.data.saveData();
    }
}
class SaveAsListener implements ActionListener
{
    void actionPerformed(ActionEvent e)
    {
        selectOutput("Save File As" , "saveAsSelectedFile", grid.data.currentFile);
    }
}

void saveAsSelectedFile(File selection)
{
  if (selection != null)
  {
       grid.updateData();
       grid.data.saveDataAs(selection);
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
        settings.fill = false; 
        grid.updateDataItemsDrawSettings();
    }
    else if (e.getStateChange() == 1)
    {
         settings.fill = true; 
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
    
    if(result != null)
    {
           m = matchAll(result, "[0-9]");
    
        if(m != null && m.length == result.length() )
        {
            settings.stroke = int(result);
            grid.updateDataItemsDrawSettings();
        }
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
        settings.label = false; 
        grid.updateDataItemsDrawSettings();
    }
    else if (e.getStateChange() == 1)
    {
         settings.label = true; 
         grid.updateDataItemsDrawSettings();
    }
  }
}


class AdjustTintListener implements ActionListener
{
  void actionPerformed(ActionEvent e)
  {
    color colorPick =  color(255);
    int alpha;
    Color jColor = new Color(255);
    jColor  = JColorChooser.showDialog(null,"Java Color Chooser", jColor);
    if(jColor!=null) 
    {
      println(jColor);
      colorPick = jColor.getRGB();
      alpha = jColor.getAlpha();
      println(alpha);
      settings.tintColor = color(colorPick,alpha);
    }

  }
}

class AdjustFilterListener implements ActionListener
{
  void actionPerformed(ActionEvent e)
  {
    Object[] filters = { "GRAY", "INVERT", "ERODE" , "DILATE" , "NONE" };
    Object selection = JOptionPane.showInputDialog(null, "Apply which Filter",
        "Group Icon", JOptionPane.QUESTION_MESSAGE, null, filters, "NONE");
        
    if(selection.equals("GRAY"))
        settings.filterType = GRAY;
    else if(selection.equals("INVERT"))
       settings.filterType = INVERT;
    else if(selection.equals("ERODE"))
        settings.filterType = ERODE;
    else if(selection.equals("DILATE"))
        settings.filterType = DILATE;
    else
      settings.filterType = -1;
  }
}

class SaveSettingsListener implements ActionListener
{
    void actionPerformed(ActionEvent e)
    {
        settings.saveSettings();
    }
}

class LoadSettingsListener implements ActionListener
{
    void actionPerformed(ActionEvent e)
    {
        settings.loadSettings();
    }
}

class IconSelectListener implements ActionListener
{
  void actionPerformed(ActionEvent e)
  {
    Object[] groupIndex = { "0", "1", "2" , "3" ,"4", "5", "6" ,"7", "8","9" };
    Object selection = JOptionPane.showInputDialog(null, "Which Group Icon to Change?",
        "Group Icon", JOptionPane.QUESTION_MESSAGE, null, groupIndex, "0");
        
    if(selection == null)
      return;
    
    int index = int(selection.toString());
        
    selection = JOptionPane.showInputDialog(null, "Which Group Icon to Change?",
            "Group Type", JOptionPane.QUESTION_MESSAGE, null, settings.groupIconType, "circle");
    if(selection == null)
          return;
          
    settings.groupIconType[index] = selection.toString();
  }
}

String imageDir = new String();
class FileSelectListener implements ActionListener
{
  void actionPerformed(ActionEvent e)
  {
    selectInput("Open data file ", "openSelectedIcon");
  }
}

void openSelectedIcon(File selection) {
  
  if (selection != null)
  {
        Object[] groupIndex = { "0", "1", "2" , "3" ,"4", "5", "6" ,"7", "8","9" };
        Object selectionIndex = JOptionPane.showInputDialog(null, "Which Group Icon to Change?",
            "Group Icon", JOptionPane.QUESTION_MESSAGE, null, groupIndex, "0");
            
        if(selectionIndex == null)
          return;
          
        int index = int(selectionIndex.toString());
        imageDir = selection.getAbsolutePath();
        String temp = new String("");
        for (int i = 0; i < imageDir.length(); i++)
        {
             if(imageDir.charAt(i) == '\\')
             {
              temp += '/';
             }
             else
             {
              temp += imageDir.charAt(i);
             }
         }
         imageDir = temp;
         settings.groupIconType[index] = imageDir;
         for(int i =0 ; i  < 10; i++)
         {
           println(settings.groupIconType[i]);
         }
          
    }
    else
    {
      imageDir = "circle";
    }
}


class AddItemListener implements ActionListener
{
  void actionPerformed(ActionEvent e)
  {
    new InputFrame();
  }
}

class DeleteItemListener implements ActionListener
{
  void actionPerformed(ActionEvent e)
  {
    grid.removeLastSelected();
  }
}


 // This method is called after the component's size changes
class resizeListener implements ComponentListener 
{  
     void componentResized(ComponentEvent evt) 
     {
         //Component c = (Component)evt.getSource();
          // Dimension newSize = c.getSize();
          // println(newSize);
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
