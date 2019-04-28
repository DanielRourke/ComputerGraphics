

class Settings
{
  color[] yearColor;
  String[] groupIconType;
  int stroke;
  boolean fill;
  boolean label;
  color tintColor;
  int filterType;
  
  Settings()
  {
      intializeGroupIconTypes();
      intializeYearColors();
      
      stroke = 1;
      fill = true;
      label = true;
      tintColor = color(255,0);
      filterType = -1;
  }
  
   void intializeGroupIconTypes()
  {
      groupIconType = new String[10];
      groupIconType[0] = "circle";
      groupIconType[1] = "square";
      groupIconType[2] = "dynamic";
      groupIconType[3] = "dynamic";
      groupIconType[4] = "dynamic";
      groupIconType[5] = "dynamic";
      groupIconType[6] = "dynamic";
      groupIconType[7] = "dynamic";
      groupIconType[8] = "dynamic";
      groupIconType[9] = "dynamic";
  }
  
  void intializeYearColors()
  {
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
  }
  
  void applyFilters()
  {
     if(settings.filterType != -1)
     {
       filter(settings.filterType);
     }
     
     fill(settings.tintColor);
     rect(0,0, width, height);
  }
  
  void saveSettings()
  {
      Table table = new Table();
      table.addColumn("yearColorR");
      table.addColumn("yearColorG");
      table.addColumn("yearColorB");
      table.addColumn("yearColorA");
      table.addColumn("tintColorR");
      table.addColumn("tintColorG");
      table.addColumn("tintColorB");
      table.addColumn("tintColorA");
      table.addColumn("groupIconType");
      table.addColumn("stroke");
      table.addColumn("fill");
      table.addColumn("label");
      table.addColumn("filterType");

       TableRow row = table.addRow();
       row.setFloat("yearColorR", red(yearColor[0]));
       row.setFloat("yearColorG", green(yearColor[0]));
       row.setFloat("yearColorB", blue(yearColor[0]));
       row.setFloat("yearColorA", alpha(yearColor[0]));

       row.setFloat("tintColorR", red(tintColor));
       row.setFloat("tintColorG", green(tintColor));
       row.setFloat("tintColorB", blue(tintColor));
       row.setFloat("tintColorA", alpha(tintColor));
       
              
       row.setString("groupIconType", groupIconType[0]);
       row.setInt("stroke", stroke);
       
       if(fill)
         row.setInt("fill" , 1);
       else
         row.setInt("fill" , 0);
         
       if(label)
         row.setInt("label" , 1);
       else
         row.setInt("label" , 0);
       
       row.setInt("filterType", filterType);
      
      for (int i = 1; i <  10; i++)
        {
         
            TableRow newRow = table.addRow();
             newRow.setFloat("yearColorR", red(yearColor[i]));
             newRow.setFloat("yearColorG", green(yearColor[i]));
             newRow.setFloat("yearColorB", blue(yearColor[i]));
             newRow.setFloat("yearColorA", alpha(yearColor[i]));
             newRow.setString("groupIconType", groupIconType[i]);
        }
        
        saveTable(table, "/data/settings.csv");
  }
  
  void loadSettings()
  {
    Table table = loadTable("/data/settings.csv" , "header");
    
    TableRow row = table.getRow(0);
       stroke = row.getInt("stroke");
     //  println(stroke);
       filterType = row.getInt("filterType");
      // println(filterType);
       if(row.getInt("fill") == 1)
         fill = true;
       else
         fill = false;
         
       if(row.getInt("label") == 1)
         label = true;
       else
         label = false;
     // println(fill, label);
      color c = color(int(row.getFloat("tintColorR")),int(row.getFloat("tintColorG")),int(row.getFloat("tintColorB")));
      tintColor = color(c,int(row.getFloat("tintColorA")));   
     // print(tintColor);
         
     for (int i = 0; i <  10; i++)
     {
          row = table.getRow(i);
          c = color(int(row.getFloat("yearColorR")),int(row.getFloat("yearColorG")),int(row.getFloat("yearColorB")));
          yearColor[i] = color(c,int(row.getFloat("yearColorA")));
          // print(yearColor[i]);
          groupIconType[i] = row.getString("groupIconType");
     }
     
     grid.updateDataItemsDrawSettings();
    
  }
  
  
}
