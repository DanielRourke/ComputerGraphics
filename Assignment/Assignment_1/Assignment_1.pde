Menu_bar mp;
Table dataTable;
DataItem[] dataItems;
float scale;
float innerScale;
int gridHeight;
int gridWidth;
int gridXOffset;
int gridYOffset;
 PFont font;
   PFont smallfont;
int selectedIndex;
void setup()
{
  size(800,800);
    buildMenuBar();
    
    font = loadFont("ArialNarrow-48.vlw");
    textFont(font);
    smallfont = loadFont("ArialMT-24.vlw");
   // textAlign(CENTER, BOTTOM);
    
    
    //table = loadTable("assign1data.csv", "header");
    //println(table.getRowCount() + " total rows in table"); 


    //for (TableRow row : table.rows()) 
    //{
    //    int id = row.getInt("Group");
    //    String species = row.getString("Gender");
    //    String name = row.getString("Name");
    //    println(name + " (" + species + ") has an ID of " + id);
    //}
    
    scale = width / 200;
    gridXOffset = int(scale * 15);
    gridYOffset = int(scale * 15);
    gridHeight = int(height - gridXOffset * 2);
    gridWidth= int(width  - gridXOffset * 2);
    innerScale =  gridWidth /200;
    textSize(int(5 * scale));
    println(scale);
    openFile();
}

void draw()
{
  
  // shift the origin(0, 0) to the lower-left corner
 // background(0);
  //translate(0, height);
  //scale(1.0, 1.0);
  strokeWeight(0);
  background(0,100,200);
  rectMode(CORNER);
  fill(255,255);
  rect(gridXOffset, gridYOffset, gridWidth, gridHeight);
  stroke(0);
  strokeWeight(1.0 * scale);
  
  
   textFont(font);
  textSize(int(5 * scale));
  textAlign(CENTER, CENTER);
  line(gridXOffset, gridHeight +  gridYOffset,gridWidth + gridXOffset , gridHeight +  gridYOffset);// draw x-axis
  for( int i = 0 ; i < 11 ; i++  )
  {
    line(gridXOffset + (i * (gridWidth / 10)),  gridHeight +  gridYOffset - (2 * scale),gridXOffset + (i * (gridWidth / 10)), gridHeight +  gridYOffset + (2 * scale)  );
    text(i * 100, gridXOffset + (i * (gridWidth / 10)), gridHeight +  gridYOffset + (5 * scale) );
  }
  text(" X ",gridXOffset + gridWidth / 2, gridHeight  +  gridYOffset + (10 * scale));
  
  
textAlign(CENTER, CENTER);
  line(gridXOffset, gridHeight +  gridYOffset ,gridXOffset ,  gridYOffset);// draw x-axis
  for( int i = 0 ; i < 11 ; i++  )
  {
    line(gridXOffset - (2 * scale), gridYOffset + (i * gridHeight/10),gridXOffset + (2 * scale),gridYOffset + (i * gridHeight/10)) ;
    text(i * 100, gridXOffset - (5 * scale), gridHeight+ gridYOffset - (i * gridHeight/10));
  }
  text(" Y ",(4 * scale), gridYOffset + gridHeight/2 );
  

  
  //line(0, 1, 0, height);// draw y-axis
  smooth();
  noStroke();
  //fill(255, 204);
 // ellipse(0, 0, 45, 45);          // draw at the origin
 // ellipse(width/2, height/2, 45, 45);
 // ellipse(width, height, 45, 45);
  //String mousePos = "X: " + mouseX + "Y: " +  mouseY; 
 // text(mousePos, mouseX,mouseY);

 int counterCauseJavaDoesNotHavePointersWTF = 0;
 int selectedIndex = -1;
 
 for(DataItem item: dataItems)
 {
   
   item.display();
   if (item.isInside(mouseX, mouseY))
   {
     selectedIndex = counterCauseJavaDoesNotHavePointersWTF;
   }
   counterCauseJavaDoesNotHavePointersWTF++;
 }
 
 if(selectedIndex != -1)
 {
   dataItems[selectedIndex].displayInfo();
 }
 
 //dataItems[21].display();
 //dataItems[21].isInside(mouseX, mouseY);
 
}

void openFile()
{
     dataTable = loadTable("assign1data.csv", "header");
    println( dataTable.getRowCount() + " total rows in table"); 

    dataItems = new DataItem[dataTable.getRowCount()];
    int index = 0;

    for (TableRow row :  dataTable.rows()) 
    {
        String n = row.getString("Name");
        String g = row.getString("Gender");
        float xx = gridXOffset + (gridWidth * (row.getFloat("X") / 1000));
        println(xx);
        float yy = gridYOffset + (gridHeight - (gridHeight * (row.getFloat("Y") / 1000)));
        println(yy);
        int grp = row.getInt("Group")  +1;
        int yr = row.getInt("Year of Birth");
        int grd = row.getInt("Grade");
        
        if ( grp == 1)
        {
           dataItems[index] = new circleDataItem(n,  g, xx, yy, grp, yr, grd);
        }
        else if (grp == 2)
        {
           dataItems[index] = new squareDataItem(n,  g, xx, yy, grp, yr, grd);
        }
        else
        {
           dataItems[index] = new dynamicDataItem(n,  g, xx, yy, grp, yr, grd);
        }
        println(dataItems[index]);
        
        index++;   
    }
  
}

/*
  Array or table? of objects
  
  
  read file
  
  one object have rows info as datamembers and atrributes for display
  
  
  x y grid for object

  dymanic window size
  

*/
