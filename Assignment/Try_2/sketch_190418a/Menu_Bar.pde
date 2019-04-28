
void buildMenuBar() {
  mp = new Menu_Bar(this, "Assignment 1", width, height + 52);
}

public class Menu_Bar {
  JFrame frame;
  JPopupMenu popupmenu;
  
  Menu_Bar(PApplet app, String name, int width, int height) {
    System.setProperty("apple.laf.useScreenMenuBar", "true");
    frame = (JFrame) ((processing.awt.PSurfaceAWT.SmoothCanvas)app.getSurface().getNative()).getFrame();
    frame.setTitle(name);
    frame.setSize(width, height);
    frame.setResizable(true);
    frame.addComponentListener(new resizeListener());

    // Creates a menubar for a JFrame
    JMenuBar menu_bar = new JMenuBar();
    frame.setJMenuBar(menu_bar);
    
    JMenu file_menu = new JMenu("File");
    JMenu settings_menu = new JMenu("Settings");
    JMenu icons_menu = new JMenu("Group Icons");

    menu_bar.add(file_menu);
    menu_bar.add(settings_menu);
    menu_bar.add(icons_menu);
    
    JMenuItem new_file = new JMenuItem("New");
    JMenuItem open_file = new JMenuItem("Open");
    JMenuItem save_file = new JMenuItem("Save");
    JMenuItem save_file_as = new JMenuItem("Save As");
    JMenuItem action_exit = new JMenuItem("Exit");
    
    JCheckBoxMenuItem shape_fill = new JCheckBoxMenuItem("Fill Shapes", true);
    JMenuItem shape_border = new JMenuItem("Border Size");
    JCheckBoxMenuItem label_show = new JCheckBoxMenuItem("Show Labels", true);
    JMenuItem tint_adjust = new JMenuItem("Adjust Tint");
    JMenuItem filter_apply = new JMenuItem("Apply Filter");
    JMenuItem save_settings = new JMenuItem("Save Settings");
    JMenuItem load_settings = new JMenuItem("Load Settings");
    
    JMenuItem combo_select = new JMenuItem("Select");
    JMenuItem file_select = new JMenuItem("Browse");

    file_menu.add(new_file);
    file_menu.add(open_file);
    file_menu.add(save_file);
    file_menu.add(save_file_as);
    file_menu.add(action_exit);
    
    settings_menu.add(shape_fill);
    settings_menu.add(shape_border);
    settings_menu.add(label_show);
    settings_menu.add(tint_adjust);
    settings_menu.add(filter_apply);
    settings_menu.addSeparator();
    settings_menu.add(save_settings);
    settings_menu.add(load_settings);
    
    icons_menu.add(combo_select);
    icons_menu.add(file_select);
    
    new_file.addActionListener(new NewFileListener());
    open_file.addActionListener(new OpenListener());
    save_file.addActionListener(new SaveListener());
    save_file_as.addActionListener(new SaveAsListener());
    action_exit.addActionListener(new ExitListener());
     
    shape_fill.addItemListener(new ChangeFillListener());
    shape_border.addActionListener(new ChangeBorderListener());
    label_show.addItemListener(new ChangelabelShowListener());
    tint_adjust.addActionListener(new AdjustTintListener());
    filter_apply.addActionListener(new AdjustFilterListener());
    save_settings.addActionListener(new SaveSettingsListener());
    load_settings.addActionListener(new LoadSettingsListener());
    
    combo_select.addActionListener(new IconSelectListener());
    file_select.addActionListener(new FileSelectListener());

     //adds the popupMenu
      popupmenu = new JPopupMenu("popupmenu");  
      JMenuItem add_item = new JMenuItem("Add");  
      JMenuItem del_item = new JMenuItem("Delete");  
      
      popupmenu.add(add_item);
      popupmenu.add(del_item);  
    
      add_item.addActionListener(new AddItemListener());
      del_item.addActionListener(new DeleteItemListener());
    
    frame.add(popupmenu);

    frame.setVisible(true);
    
  
  }
 }
