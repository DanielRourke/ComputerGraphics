  PImage image1;
  PImage image2;
  
  int mouseXCopyPos;

  Menu_bar mp;
  
  //MenuBar menuBar;
  //Menu fileMenu, fontMenu;
  //MenuItem exitItem, increaseSizeItem, decreaseSizeItem;
  //Frame mainFrame;
  
  int mouseYCopyPos;
  boolean initialised = false;
  String letters = "";
  int fontSize;
void setup()
{
  //mainFrame = new Frame();
  //menuBar = new MenuBar();
  
  //exitItem = new MenuItem("Exit");
  //exitItem.addActionListener(new ExitListener());
  
  //fileMenu = new Menu("File");
  //fileMenu.add(exitItem);
  
  //increaseSizeItem = new MenuItem("Increase +");
  //decreaseSizeItem = new MenuItem("Decrease -");
  
  //increaseSizeItem.addActionListener(new IncreaseSizeListener());
  //decreaseSizeItem.addActionListener(new DecreaseSizeListener());
  
  //fontMenu = new Menu("Font");
  //fontMenu.add(increaseSizeItem);
  //fontMenu.add(decreaseSizeItem);
  
  //menuBar.add(fileMenu);
  //menuBar.add(fontMenu);
  
  //mainFrame.setMenuBar(menuBar);
  //mainFrame.setVisible(true);
  //surface.frame.setMenuBar(menuBar);
  fontSize = 42;
  
   buildMenuBar();
  size(400,400);
    image1 = loadImage ("earth400400.jpg"); 
}

void draw()
{
 // question1();
  //question2();
 //question3();
 question4();
// question6();
}
