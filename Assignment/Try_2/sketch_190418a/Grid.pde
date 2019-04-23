




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
 Grid()
 {
   x = width / 10;
   y = height / 10;
   textSize = width / 50;
   xspread = 1000;
   xmin = 0;
   yspread = 1000;
   ymin = 0;
   w = width - x - x;
   h = height - y - y;
   xunit =  w / 100;
   yunit =  h / 100;
   loadItems();
   clearSelectedItems();
 };
 
 void drawGrid()
 {
   fill(255);
   rect(x,y,w,h);
    line(x , y + h,x+  w , y + h);
   for(int i = 0; i <= 100; i += 10)
   {
     line(x + (i * xunit), y + h, x + (i * xunit), y + h + (2 * yunit));
     textAlign(CENTER, TOP);
     textSize(textSize);
     fill(0);
     text(nf(i * (xspread/10) , 0 ,1), x + (i * xunit), y + h + (2 * yunit));
   }
   text(bottom, x + (50 * xunit), y + h + ( 6  * yunit));

   
   line(x , y + h, x ,y);
   for(int i = 0; i <= 100; i += 10)
   {
     line(x, y + h -(i * yunit), x - (2 * xunit), y + h - (i * yunit));
       pushMatrix();
       translate(x - (2 * xunit), y + h - (i * yunit));
       rotate(-TWO_PI/4);
       textAlign(CENTER, BOTTOM);
        text(nf(i *  (yspread/10), 0 ,1), 0,0);
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
      shape(dataItems[i].itemShape, map(dataItems[i].x ,xmin , xspread, x, x + w), 
      map(dataItems[i].y , ymin, yspread, y + h, y));
    }
   };
   
 
 
     void loadItems()
    {
         dataTable = loadTable("assign1data.csv", "header");
        println( dataTable.getRowCount() + " total rows in table"); 
    
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
            int grp = row.getInt("Group")  +1;
            int yr = row.getInt("Year of Birth");
            int grd = row.getInt("Grade");
            
            if ( grp == 1)
            {
               dataItems[index] = new circleDataItem(n,  g, xx, yy, grp, yr, grd, 2* xunit,index);
            }
            else if (grp == 2)
            {
               dataItems[index] = new squareDataItem(n,  g, xx, yy, grp, yr, grd,2 *xunit ,index);
            }
            else
            {
               dataItems[index] = new dynamicDataItem(n,  g, xx, yy, grp, yr, grd,2 * xunit,index);
            }
            println(dataItems[index]);
            
            index++;   
        }
      
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
      //    rect( map(dataItems[itemHover].x ,xmin , xspread, x, x + w), 
      //map(dataItems[itemHover].y + (10 * yunit) , ymin, yspread, y + h, y), 6 * xunit ,6 * yunit);
      
          text(dataItems[itemHover].x , map(dataItems[itemHover].x ,xmin , xspread, x, x + w), 
      map(dataItems[itemHover].y + (5 * yunit) , ymin, yspread, y + h, y));
           text( dataItems[itemHover].y , map(dataItems[itemHover].x ,xmin , xspread, x, x + w), 
      map(dataItems[itemHover].y + (10 * yunit) , ymin, yspread, y + h, y));
        }
    }
    
    
    void clearSelectedItems()
    {
       for (int i = 0; i < dataItems.length; i++)
           dataItems[i].selected = false;
    }
    
    void addSelectedItem()
    {
        for (int i = 0 ; i < dataItems.length; i++)
        {
           if( dataItems[i].isInside( map(mouseX , x, x + w ,xmin , xspread), 
            map(mouseY , y + h, y, ymin, yspread)))
            {
              dataItems[i].selected = true;
              println("item " + i + "added");
            }
        }
    }
    
    
    void moveSelectedItems()
    {
        for (int i = 0 ; i < dataItems.length; i++)
        {
          if (dataItems[i].selected)
          {
            float xdiff =  map(mouseX , x, x + w ,xmin , xspread) - grid.dataItems[i].x    ;
            float ydiff =  map(mouseY , y + h, y, ymin, yspread) - grid.dataItems[i].y   ;
        
            grid.dataItems[i].x += xdiff;
            grid.dataItems[i].y += ydiff;
            println(i);
          }
        }
      
        //float xdiff = grid.dataItems[selectedItem].x - map(mouseX , x, x + w ,xmin , xspread);
        //float ydiff = grid.dataItems[selectedItem].y - map(mouseY , y + h, y, ymin, yspread);
        
        //grid.dataItems[selectedItem].x += xdiff;
        //grid.dataItems[selectedItem].y += ydiff;
        
       // grid.dataItems[selectedItem].x = map(mouseX , x, x + w ,xmin , xspread);
       // grid.dataItems[selectedItem].y = map(mouseY , y + h, y, ymin, yspread);
        
    }
};


void mousePressed()
{
    if(keyCode == 17)
    {
        grid.addSelectedItems();
    }
    else
    {
        grid.clearSelectedItems();
        grid.addSelectedItems();
    }
}

void mouseReleased()
{
  
  //  println(grid.selectedItem);
  //  if(grid.selectedItem != -1)
  //  {
  //      grid.moveSelectedItem();
  //  }
  //  grid.selectedItem = -1;
  
   grid.moveSelectedItems();
   grid.clearSelectedItems();
}

//void mouseDragged()
//{
//  grid.moveSelectedItems();
//  grid.clearSelectedItems();
//}


void keyPressed()
{
  println(keyCode);
  
}
