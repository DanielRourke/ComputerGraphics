  import javax.swing.*;
  import java.awt.*;
  import java.awt.event.*;

/*

  menuBar = new MenuBar();
  
  exitItem = new MenuItem("Exit");
  exitItem.addActionListener(new ExitListener());
  
  fileMenu = new Menu("File");
  fileMenu.add(exitItem);
  
  increaseSizeItem = new MenuItem("Increase +");
  decreaseSizeItem = new MenuItem("Decrease -");
  
  increaseSizeItem.addActionListener(new IncreaseSizeListener());
  decreaseSizeItem.addActionListener(new DecreaseSizeListener());
  
  fontMenu = new Menu("Font");
  fontMenu.add(increaseSizeItem);
  fontMenu.add(decreaseSizeItem);
  
  menuBar.add(fileMenu);
  menuBar.add(fontMenu);*/



public class Menu_bar {
  JFrame frame;

  public Menu_bar(PApplet app, String name, int width, int height) {
   // System.setProperty("apple.laf.useScreenMenuBar", "true");
    frame = (JFrame) ((processing.awt.PSurfaceAWT.SmoothCanvas)app.getSurface().getNative()).getFrame();
    frame.setTitle(name);

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
     increase_font_size.addActionListener(new IncreaseSizeListener());
     decrease_font_size.addActionListener(new DecreaseSizeListener());
     
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

void buildMenuBar() {
  mp = new Menu_bar(this, "Week 7", 100, 100);
}



class ExitListener implements ActionListener
{
  void actionPerformed(ActionEvent e)
  {
    System.exit(0);
  }
}

class IncreaseSizeListener implements ActionListener
{
 void actionPerformed(ActionEvent e)
 {
   fontSize = fontSize + 2;
 }
  
}


class DecreaseSizeListener implements ActionListener
{
 void actionPerformed(ActionEvent e)
 {
   fontSize = fontSize - 2;
 }
}
