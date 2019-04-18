Menu_bar mp;

Table table;
void setup()
{
    buildMenuBar();
    size(800,800);
    table = loadTable("assign1data.csv", "header");


    println(table.getRowCount() + " total rows in table"); 


    for (TableRow row : table.rows()) 
    {
        int id = row.getInt("Group");
        String species = row.getString("Gender");
        String name = row.getString("Name");
        println(name + " (" + species + ") has an ID of " + id);
    }
}

void draw()
{
  // shift the origin(0, 0) to the lower-left corner
  background(0);
  //translate(0, height);
  //scale(1.0, 1.0);
  line(0, 1, width, 1);// draw x-axis
  line(0, 1, 0, height);// draw y-axis
  smooth();
  noStroke();
  fill(255, 204);
  ellipse(0, 0, 45, 45);          // draw at the origin
  ellipse(width/2, height/2, 45, 45);
  ellipse(width, height, 45, 45);
  String mousePos = "X: " + mouseX + "Y: " +  mouseY; 
  text(mousePos, mouseX,mouseY);

}

/*
  Array or table? of objects
  
  
  read file
  
  one object have rows info as datamembers and atrributes for display
  
  
  x y grid for object

  dymanic window size
  

*/
