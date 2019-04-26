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
    JMenuItem action_new = new JMenuItem("New");
    JMenuItem action_open = new JMenuItem("Open");
    JMenuItem action_save = new JMenuItem("Save");
    JMenuItem action_save_as = new JMenuItem("Save As");
    JMenuItem action_exit = new JMenuItem("Exit");

    font_menu.add(increase_font_size);
    font_menu.add(decrease_font_size);
    file_menu.add(action_new);
    file_menu.add(action_open);
    file_menu.add(action_save);
    file_menu.add(action_save_as);
    file_menu.add(action_exit);
    
    action_new.addActionListener(new NewFileListener());
    action_open.addActionListener(new OpenListener());
    action_save.addActionListener(new SaveListener());
    action_save_as.addActionListener(new SaveAsListener());
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
