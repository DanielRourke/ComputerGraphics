color[] yearColor;
Menu_Bar mp;
File currentFile;
boolean gridEmpty = true;
Grid grid;
void setup()
{
  size(1000,1000);
  surface.setResizable(true);
  buildMenuBar();
  yearColor = new color[10];
  yearColor[0] = color(255,102,102);
  yearColor[1] = color(255,0,0);
  yearColor[2] = color(153,0,0);
  yearColor[3] = color(77,0,0);
  yearColor[4] = color(0,77,0);
  yearColor[5] = color(0,153,0);
  yearColor[6] = color(0,255,0);
  yearColor[7] = color(102,255,102);
  yearColor[8] = color(102,255,255);
  yearColor[9] = color(0,0,255);
  
  
   selectInput("Open data file ", "openSelectedFile");
   grid = new Grid();
};

void draw()
{
  background(135,206,250);

 grid.drawGrid();
    if (!gridEmpty)
    {
          grid.drawDataItems();
          grid.checkHover();
    }


};
