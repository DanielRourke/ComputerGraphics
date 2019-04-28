 /*
 DECLARATION
 Daniel Rourke 19386993
 I hold a copy of this assignment that I can produce if the original is lost or damaged.
 
 I hereby certify that no part of this assignment/product has been copied from any other student’s 
 work or from any other source except where due acknowledgement is made in the assignment.  
 
 No part of this assignment/product has been written/produced for me by another person except
 where such collaboration has been authorised by the subject lecturer/tutor concerned
 
 */
 
 
 
 import javax.swing.*;
 import java.awt.*;
 import java.awt.event.*;

Settings settings;
Menu_Bar mp;
Grid grid;
void setup()
{
  size(1000,1000);
  surface.setResizable(true);
  grid = new Grid();
  buildMenuBar();
  settings = new Settings();
};

void draw()
{
    background(135,206,250);
    grid.drawGrid();
    settings.applyFilters();
};
