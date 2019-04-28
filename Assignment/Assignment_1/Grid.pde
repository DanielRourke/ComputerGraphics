




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
 
 ArrayList<DataItem> dataItems;
 
 Data data;
 
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
   dataItems = new ArrayList<DataItem>();
   data = new Data();
 };
 
  Grid(File file)
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
   dataItems = new ArrayList<DataItem>();
   data = new Data(file);
   createDataItems();
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
   if(dataItems.size() > 0)
   {
      for (int i = 0 ; i < dataItems.size(); i++)
      {
        dataItems.get(i).updateSize(xunit + yunit);
      }
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
   
   
   
   if(dataItems.size() > 0)
   {
     drawDataItems();
   }
 };
 
   void drawDataItems()
   {
    for (int i = 0 ; i < dataItems.size(); i++)
    {
      dataItems.get(i).display(xmin, ymin, xspread, yspread, x, y, w ,h);
      
      if(lastSelectedIndex != -1)
      {
        String info = ("X: " + int(dataItems.get(lastSelectedIndex).x) + "\nY: " + int(dataItems.get(lastSelectedIndex).y) + 
        "\nGender: " +dataItems.get(lastSelectedIndex).gender + "\nGrade: " +dataItems.get(lastSelectedIndex).grade+  
        "\nGroup: " +dataItems.get(lastSelectedIndex).group + "\nYear: " + dataItems.get(lastSelectedIndex).year);
        fill(255,100);
         rect(mouseX, mouseY - 12*yunit, 10*xunit, 12*yunit);
        
         textSize(int(   sqrt(width * height) / 100));
         textAlign(LEFT);
        fill(0);
         text(info,mouseX , mouseY - 12*yunit, 10*xunit, 12*yunit);
      }
    }
   };

   void removeLastSelected()
   {
     if (lastSelectedIndex != -1)
         dataItems.remove(lastSelectedIndex);
   }
   
   void createDataItem(String n, String g,float xx, float yy,int grp, int yr,int grd)
   { //<>//
  
            if (settings.groupIconType[grp].equals("circle"))
            {
               dataItems.add(new circleDataItem(n,  g, xx, yy, grp, yr, grd, yunit + xunit));
            }
            else if (settings.groupIconType[grp].equals("square"))
            {
                dataItems.add(new squareDataItem(n,  g, xx, yy, grp, yr, grd, yunit + xunit));
            }
            else if (settings.groupIconType[grp].equals("dynamic"))
            {
               dataItems.add(new dynamicDataItem(n, g, xx, yy, grp, yr, grd, yunit + xunit));
            }
            else
            {
                 dataItems.add( new imageDataItem(n, g, xx, yy, grp, yr, grd, yunit + xunit, settings.groupIconType[grp] ));
            }
   }
   void createDataItemOnMouse(String n, String g,int grp, int yr,int grd)
   {
          //convery mouse x y to grid relative x y
           float xx = map(mouseX, x, x + w ,xmin , xspread);
           float yy = map(mouseY, y + h, y, ymin, yspread);
     
            if (settings.groupIconType[grp].equals("circle"))
            {
               dataItems.add(new circleDataItem(n,  g, xx, yy, grp, yr, grd, yunit + xunit));
            }
            else if (settings.groupIconType[grp].equals("square"))
            {
                dataItems.add(new squareDataItem(n,  g, xx, yy, grp, yr, grd, yunit + xunit));
            }
            else if (settings.groupIconType[grp].equals("dynamic"))
            {
               dataItems.add(new dynamicDataItem(n, g, xx, yy, grp, yr, grd, yunit + xunit));
            }
            else
            {
                 dataItems.add( new imageDataItem(n, g, xx, yy, grp, yr, grd, yunit + xunit, settings.groupIconType[grp] ));
            }
   }
   
     void createDataItems()
    {
        dataItems.clear();
        if(!data.empty)
          for (TableRow row :  data.table.rows()) 
            createDataItem(row.getString("Name"),row.getString("Gender"),row.getFloat("X"),row.getFloat("Y"),row.getInt("Group"),row.getInt("Year of Birth"),(row.getInt("Grade") + 1));
    };
    
    void updateData()
    {
         data.table = new Table();
         
         data.table.addColumn("Name");
         data.table.addColumn("X");
         data.table.addColumn("Y");
         data.table.addColumn("Group");
         data.table.addColumn("Gender");
         data.table.addColumn("Year of Birth");
         data.table.addColumn("Grade");

        for (int i = 0; i <  dataItems.size(); i++)
        {
            TableRow newRow = data.table.addRow();
            newRow.setString("Name", dataItems.get(i).name);
            newRow.setInt("X", int(dataItems.get(i).x));
            newRow.setInt("Y", int(dataItems.get(i).y));
            newRow.setInt("Group", dataItems.get(i).group);
            newRow.setString("Gender", dataItems.get(i).gender);
            newRow.setInt("Year of Birth", dataItems.get(i).year);
            newRow.setInt("Grade", dataItems.get(i).grade - 1);
        }

    };
    
    
    void clearSelectedItems()
    {
       for (int i = 0; i < dataItems.size(); i++)
       {
         dataItems.get(i).selected = false;
         dataItems.get(i).updateColor();
       }
           lastSelectedIndex = -1;
    }
    
    void addSelectedItem()
    {
        for (int i = dataItems.size() - 1; i >=0 ; i--)
        {
           if( dataItems.get(i).isInside( map(mouseX , x, x + w ,xmin , xspread), 
            map(mouseY , y + h, y, ymin, yspread)))
            {
              dataItems.get(i).selected = true;
              dataItems.get(i).updateColor();
              lastSelectedIndex = i;
              break;
            }
        }
    }
    
    
    void moveSelectedItems()
    {
        
        float xdiff = 0;
        float ydiff = 0;
        
        if(lastSelectedIndex != -1)
        {
            xdiff = grid.dataItems.get(lastSelectedIndex).x;
            ydiff = grid.dataItems.get(lastSelectedIndex).y;
        }
        
        for (int i = 0 ; i < dataItems.size(); i++)
        {
          if (dataItems.get(i).selected)
          {
              grid.dataItems.get(i).x +=  map(mouseX, x, x + w ,xmin , xspread) - xdiff;
              grid.dataItems.get(i).y +=  map(mouseY, y + h, y, ymin, yspread) - ydiff;
             
          }
        }
    }
    
    void increaseSelectedItems()
    {
        for (int i = 0 ; i < dataItems.size(); i++)
        {
          if (dataItems.get(i).selected)
          {
              grid.dataItems.get(i).increaseSize();
             
          }
        }
    }
    
    void decreaseSelectedItems()
    {
        for (int i = 0 ; i < dataItems.size(); i++)
        {
          if (dataItems.get(i).selected)
          {
              grid.dataItems.get(i).decreaseSize();
             
          }
        }
    }
    
    int countSelectedItems()
    {
      int ret = 0;
        for (int i = 0 ; i < dataItems.size(); i++)
          if (dataItems.get(i).selected)
            ret++;
       return ret;
    }
    
    void updateDataItemsDrawSettings()
    {
        for (int i = 0 ; i < dataItems.size(); i++)
        {
              grid.dataItems.get(i).drawOptionFill = settings.fill;
              grid.dataItems.get(i).drawOptionStrokeWeight = settings.stroke;
              grid.dataItems.get(i).drawOptionShowLabel = settings.label;
              grid.dataItems.get(i).updateShape();
        }
    }
    
    
    
};
