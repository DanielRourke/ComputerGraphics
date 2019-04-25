 import javax.swing.*;
  import java.awt.*;
  import java.awt.event.*;

void buildMenuBar() {
  mp = new Menu_Bar(this, "Assignment 1", width, height + 52);
}

public class Menu_Bar {
  JFrame frame;

  public Menu_Bar(PApplet app, String name, int width, int height) {
    System.setProperty("apple.laf.useScreenMenuBar", "true");
    frame = (JFrame) ((processing.awt.PSurfaceAWT.SmoothCanvas)app.getSurface().getNative()).getFrame();
    frame.setTitle(name);
    frame.setSize(width, height);
    frame.setResizable(true);
    frame.addComponentListener(new resizeListener());

    // Creates a menubar for a JFrame
    JMenuBar menu_bar = new JMenuBar();
    // Add the menubar to the frame
    frame.setJMenuBar(menu_bar);
    // Define and add two drop down menu to the menubar
    JMenu file_menu = new JMenu("File");
    JMenu font_menu = new JMenu("Font");

    menu_bar.add(file_menu);
    menu_bar.add(font_menu);

    // Create and add simple menu item to one of the drop down menu
    JMenuItem increase_font_size = new JMenuItem("Increase Font Size");
    JMenuItem decrease_font_size = new JMenuItem("Decrease Font Size");
    JMenuItem action_exit = new JMenuItem("Exit");

    font_menu.add(increase_font_size);
    font_menu.add(decrease_font_size);
    file_menu.add(action_exit);
    
    
     action_exit.addActionListener(new ExitListener());
     //increase_font_size.addActionListener(new IncreaseSizeListener());
     //decrease_font_size.addActionListener(new DecreaseSizeListener());
     
    //class ExitListener implements ActionListener
    //{
    //  void actionPerformed(ActionEvent e)
    //  {
    //    System.exit(0);
    //  }
    //}
  
    //class IncreaseSizeListener implements ActionListener
    //{
    // void actionPerformed(ActionEvent e)
    // {
    //   fontSize = fontSize + 2;
    // }
    //}
  
    //class DecreaseSizeListener implements ActionListener
    //{
    //   void actionPerformed(ActionEvent e)
    //   {
    //     fontSize = fontSize - 2;
    //   }
    //} 
    
    


    frame.setVisible(true);
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

//class IncreaseSizeListener implements ActionListener
//{
// void actionPerformed(ActionEvent e)
// {
//   fontSize = fontSize + 2;
// }
  
//}


//class DecreaseSizeListener implements ActionListener
//{
// void actionPerformed(ActionEvent e)
// {
//   fontSize = fontSize - 2;
// }
//}
