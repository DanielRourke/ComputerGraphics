


Grid grid;
void setup()
{
  size(800,800);
  grid = new Grid();
}

void draw()
{
  background(135,206,250);
  grid.drawGrid();
  grid.drawDataItems();
  grid.checkHover();
}
