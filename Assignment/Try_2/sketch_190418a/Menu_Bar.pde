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
    //JMenu font_menu = new JMenu("Font");
    JMenu settings_menu = new JMenu("Settings");
    JMenu icons_menu = new JMenu("Group Icons");
    JMenu group_0_menu = new JMenu("Group 0");
    JMenu group_1_menu = new JMenu("Group 1");
    JMenu group_2_menu = new JMenu("Group 2");
    JMenu group_3_menu = new JMenu("Group 3");
    JMenu group_4_menu = new JMenu("Group 4");
    JMenu group_5_menu = new JMenu("Group 5");
    JMenu group_6_menu = new JMenu("Group 6");
    JMenu group_7_menu = new JMenu("Group 7");
    JMenu group_8_menu = new JMenu("Group 8");
    JMenu group_9_menu = new JMenu("Group 9");
    
    menu_bar.add(file_menu);
   // menu_bar.add(font_menu);
    menu_bar.add(settings_menu);
    menu_bar.add(icons_menu);

    icons_menu.add(group_0_menu);
    icons_menu.add(group_1_menu);
    icons_menu.add(group_2_menu);
    icons_menu.add(group_3_menu);
    icons_menu.add(group_4_menu);
    icons_menu.add(group_5_menu);
    icons_menu.add(group_6_menu);
    icons_menu.add(group_7_menu);
    icons_menu.add(group_8_menu);
    icons_menu.add(group_9_menu);

    // Create and add simple menu item to one of the drop down menu
    //JMenuItem increase_font_size = new JMenuItem("Increase Font Size");
    //JMenuItem decrease_font_size = new JMenuItem("Decrease Font Size");
    
    JMenuItem new_file = new JMenuItem("New");
    JMenuItem open_file = new JMenuItem("Open");
    JMenuItem save_file = new JMenuItem("Save");
    JMenuItem save_file_as = new JMenuItem("Save As");
    JMenuItem action_exit = new JMenuItem("Exit");
    
    JCheckBoxMenuItem shape_fill = new JCheckBoxMenuItem("Fill Shapes", true);
    JMenuItem shape_border = new JMenuItem("Border Size");
    JCheckBoxMenuItem label_show = new JCheckBoxMenuItem("Show Labels", true);
    
    JMenuItem combo_select = new JMenuItem("Select");
    JMenuItem file_select = new JMenuItem("Browse");

    //font_menu.add(increase_font_size);
   // font_menu.add(decrease_font_size);
    file_menu.add(new_file);
    file_menu.add(open_file);
    file_menu.add(save_file);
    file_menu.add(save_file_as);
    file_menu.add(action_exit);
    
    settings_menu.add(shape_fill);
    settings_menu.add(shape_border);
    settings_menu.add(label_show);
    
    group_0_menu.add(combo_select);
    group_0_menu.add(file_select);
    
    group_1_menu.add(combo_select);
    group_1_menu.add(file_select);
    
    group_2_menu.add(combo_select);
    group_2_menu.add(file_select);
    
    group_3_menu.add(combo_select);
    group_3_menu.add(file_select);
        
    group_4_menu.add(combo_select);
    group_4_menu.add(file_select);
    
    group_5_menu.add(combo_select);
    group_5_menu.add(file_select);
    
    group_6_menu.add(combo_select);
    group_6_menu.add(file_select);
    
    group_7_menu.add(combo_select);
    group_7_menu.add(file_select);
    
    group_8_menu.add(combo_select);
    group_8_menu.add(file_select);
    
    group_9_menu.add(combo_select);
    group_9_menu.add(file_select);
    
    new_file.addActionListener(new NewFileListener());
    open_file.addActionListener(new OpenListener());
    save_file.addActionListener(new SaveListener());
    save_file_as.addActionListener(new SaveAsListener());
    action_exit.addActionListener(new ExitListener());
     
    shape_fill.addItemListener(new ChangeFillListener());
    shape_border.addActionListener(new ChangeBorderListener());
    label_show.addItemListener(new ChangelabelShowListener());
    
    
    combo_select.addItemListener()
    file_select.addItemListener();
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
