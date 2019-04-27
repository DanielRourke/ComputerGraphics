




class Grid
{
 float xspread;
 float yspread;
 float xmin;
 float ymin;
 float x;
 float y;
 float w;
 float h;
 float xunit;
 float yunit;
 int textSize;
 String bottom = "X";
 String side = "Y";
 float scale;
 Table dataTable;
 DataItem[] dataItems;
 int itemHover;
 //Hover_Menu hoverMenu;
 int stroke;
 boolean fill;
 boolean label;
 String[] headers;
 Grid()
 {
   x = width / 10;
   y = height / 10;
   textSize = int(   sqrt(width * height) / 50);
   xspread = 1000;
   xmin = 0;
   yspread = 1000;
   ymin = 0;
   w = width - x - x;
   h = height - y - y;
   xunit =  w / 100;
   yunit =  h / 100;
   stroke = 0;
   fill = true;
   label = true;
 //  loadItems();
  // clearSelectedItems();
  // hoverMenu = new Hover_Menu(xunit, yunit ,textSize);
 };
 
 void resizeGrid()
 {
   x = width / 10;
   y = height / 10;
   textSize = int(   sqrt(width * height) / 50);
   w = width - x - x;
   h = height - y - y;
   xunit =  w / 100;
   yunit =  h / 100;
    for (int i = 0 ; i < dataItems.length; i++)
    {
      dataItems[i].updateSize(xunit + yunit);
    }
  
   
 }
 
 
 void drawGrid()
 {
   stroke(1);
   fill(255);
   rect(x,y,w,h);
   line(x , y + h,x+  w , y + h);
   for(int i = 0; i <= 100; i += 10)
   {
     line(x + (i * xunit), y + h, x + (i * xunit), y + h + (2 * yunit));
     textAlign(CENTER, TOP);
     textSize(textSize);
     fill(0);
     text(nf(i * (xspread/100) , 0 ,1), x + (i * xunit), y + h + (2 * yunit));
   }
   text(bottom, x + (50 * xunit), y + h + ( 5  * yunit));

   
   line(x , y + h, x ,y);
   for(int i = 0; i <= 100; i += 10)
   {
     line(x, y + h -(i * yunit), x - (2 * xunit), y + h - (i * yunit));
       pushMatrix();
       translate(x - (2 * xunit), y + h - (i * yunit));
       rotate(-TWO_PI/4);
       textAlign(CENTER, BOTTOM);
        text(nf(i *  (yspread/100), 0 ,1), 0,0);
       popMatrix();
   }
   pushMatrix();
   translate(x - ( 8* xunit) , y + 50 * yunit);
   rotate(-TWO_PI/4);
   textAlign(CENTER);
   text(side,0,0);
   popMatrix();
   
 };
 
   void drawDataItems()
   {
    for (int i = 0 ; i < dataItems.length; i++)
    {
      dataItems[i].display(xmin, ymin, xspread, yspread, x, y, w ,h);
      //shape(dataItems[i].itemShape, map(dataItems[i].x ,xmin , xspread, x, x + w), 
      //map(dataItems[i].y , ymin, yspread, y + h, y));
      //textSize(10);
      //textAlign(CENTER, TOP);
      //text(dataItems[i].name, map(dataItems[i].x ,xmin , xspread, x, x + w), 
      //map(dataItems[i].y , ymin, yspread, y + h, y));
    }
   };
   
     void loadItems()
    {
        dataTable = loadTable(currentFile.getAbsolutePath(), "header");
        println( dataTable.getRowCount() + " total rows in table"); 
        
        headers = new String[dataTable.getColumnCount()];
        for (int i = 0; i < dataTable.getColumnCount(); i++)
        {
           headers[i] = dataTable.getColumnTitle(i);
        }
        
        
        dataItems = new DataItem[dataTable.getRowCount()];
        int index = 0;
    
        for (TableRow row :  dataTable.rows()) 
        {
            String n = row.getString("Name");
            String g = row.getString("Gender");
            float xx = row.getFloat("X");
            println(xx);
            float yy = row.getFloat("Y");
            println(yy);
            int grp = row.getInt("Group")  +1 ;
            int yr = row.getInt("Year of Birth");
            int grd = (row.getInt("Grade") + 1);
            
            
            
        //   println(groupIconType.get(grp -1) , grp); //<>//
            if (groupIconType[grp -1].equals("circle"))
            {
               dataItems[index] = new circleDataItem(n,  g, xx, yy, grp, yr, grd, yunit + xunit, stroke , fill, label);
            }
            else if (groupIconType[grp -1].equals("square"))
            {
               dataItems[index] = new squareDataItem(n,  g, xx, yy, grp, yr, grd, yunit + xunit, stroke, fill, label);
            }
            else if (groupIconType[grp -1].equals("dynamic"))
            {
               dataItems[index] = new dynamicDataItem(n, g, xx, yy, grp, yr, grd, yunit + xunit, stroke, fill, label);
            }
            else
            {
                dataItems[index] = new imageDataItem(n, g, xx, yy, grp, yr, grd, yunit + xunit, stroke, fill, label , groupIconType[grp -1] );
            }
            println(dataItems[index]);
            
            index++;   
        }
      gridEmpty = false;
    };
    
    void saveItems()
    {
    
         dataTable = new Table();
         
         dataTable.addColumn("Name");
         dataTable.addColumn("X");
         dataTable.addColumn("Y");
         dataTable.addColumn("Group");
         dataTable.addColumn("Gender");
         dataTable.addColumn("Year of Birth");
         dataTable.addColumn("Grade");

        for (int i = 0; i <  dataItems.length ; i++)
        {
            TableRow newRow = dataTable.addRow();
            newRow.setString("Name", dataItems[i].name);
            newRow.setInt("X", int(dataItems[i].x));
            newRow.setInt("Y", int(dataItems[i].y));
            newRow.setInt("Group", dataItems[i].group -1);
            newRow.setString("Gender", dataItems[i].gender);
            newRow.setInt("Year of Birth", dataItems[i].year);
            newRow.setInt("Grade", dataItems[i].grade - 1);
        }
      
        
        saveTable(dataTable, currentFile.getAbsolutePath()+".csv");
    };
    
    void checkHover()
    {
      itemHover = -1;
      for (int i = 0 ; i < dataItems.length; i++)
        {
           if( dataItems[i].isInside( map(mouseX , x, x + w ,xmin , xspread), 
            map(mouseY , y + h, y, ymin, yspread)))
            {
              itemHover = i;
            }
        }
        
        if (itemHover != -1)
        {
          fill(120,120);
          
          text(nf(dataItems[itemHover].x , 0 , 1), map(dataItems[itemHover].x ,xmin , xspread, x, x + w), 
      map(dataItems[itemHover].y + (5 * yunit) , ymin, yspread, y + h, y));
          text(nf(dataItems[itemHover].y, 0 , 1 ), map(dataItems[itemHover].x ,xmin , xspread, x, x + w), 
      map(dataItems[itemHover].y + (10 * yunit) , ymin, yspread, y + h, y));
    //  dataItems[itemHover].selected = true;
     // dataItems[itemHover].updateShape();
        }
    }
    
    
    void clearSelectedItems()
    {
       for (int i = 0; i < dataItems.length; i++)
       {
         dataItems[i].selected = false;
         dataItems[i].updateColor();
       }
           lastSelectedIndex = -1;
    }
    
    void addSelectedItem()
    {
        for (int i = dataItems.length - 1; i >=0 ; i--)
        {
           if( dataItems[i].isInside( map(mouseX , x, x + w ,xmin , xspread), 
            map(mouseY , y + h, y, ymin, yspread)))
            {
              dataItems[i].selected = true;
              dataItems[i].updateColor();
              
            //  xdiff =  map(mouseX, x, x + w ,xmin , xspread) - grid.dataItems[i].x;
           //   ydiff =  map(mouseY, y + h, y, ymin, yspread) - grid.dataItems[i].y;
               lastSelectedIndex = i;
              
              break;
            }
        }
      //clickPosX = mouseX;
        //clickPosY = mouseY;
    }
    
    
    void moveSelectedItems()
    {
        println(lastSelectedIndex);
        float xdiff = 0;
        float ydiff = 0;
        
        if(lastSelectedIndex != -1)
        {
            xdiff = grid.dataItems[lastSelectedIndex].x;
            ydiff = grid.dataItems[lastSelectedIndex].y;
        }
        
        for (int i = 0 ; i < dataItems.length; i++)
        {
          if (dataItems[i].selected)
          {
              grid.dataItems[i].x +=  map(mouseX, x, x + w ,xmin , xspread) - xdiff;
              grid.dataItems[i].y +=  map(mouseY, y + h, y, ymin, yspread) - ydiff;
             
          }
        }
    }
    
    void increaseSelectedItems()
    {
        for (int i = 0 ; i < dataItems.length; i++)
        {
          if (dataItems[i].selected)
          {
              grid.dataItems[i].increaseSize();
             
          }
        }
    }
    
    void decreaseSelectedItems()
    {
        for (int i = 0 ; i < dataItems.length; i++)
        {
          if (dataItems[i].selected)
          {
              grid.dataItems[i].decreaseSize();
             
          }
        }
    }
    
    int countSelectedItems()
    {
      int ret = 0;
        for (int i = 0 ; i < dataItems.length; i++)
          if (dataItems[i].selected)
            ret++;
       return ret;
    }
    
    void updateDataItemsDrawSettings()
    {
        for (int i = 0 ; i < dataItems.length; i++)
        {
              grid.dataItems[i].drawOptionFill = fill;
              grid.dataItems[i].drawOptionStrokeWeight = stroke;
              grid.dataItems[i].drawOptionShowLabel = label;
              grid.dataItems[i].updateShape();
        }
    }
    
    
    
};
