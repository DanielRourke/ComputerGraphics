

void readFile()
{
  
  int numberOfMales = 0;
  int numberOfFemales = 0;
  int numberOfPeople = 0;
  String [] lines = loadStrings("file1.csv");
  int startingIndex = 0;
  
  for (int i = 0; i < lines.length; i++) {
    if (lines[i].startsWith("Person 1")) { // start parsing
        startingIndex = i;
        break;
    }
  }
  
  for(int i = startingIndex; i < lines.length; i++)
  {
    String[] data = split(lines[i], ',');
    numberOfPeople++;
    if (data[4].equals("Male"))
    {
      numberOfMales++;
    }
    else if(data[4].equals("Female"))
    {
      numberOfFemales++;
    }
  }
  
  text("Males " + numberOfMales ,25,25);
  text("Females " + numberOfFemales ,25,50);
  text("Total " + numberOfPeople, 25, 75);
}


void readFile2()
{
    rectMode(CORNER);
    String [] lines = loadStrings("file2.csv");
    int w = split(lines[0], ',').length;
    
    //size(w * 200, 200);
    
    for (int i = 0; i < lines.length; i++)
    {
       String[] data = split(lines[i], ',');
       
    
       if(data[0].equals("Subtotal - weekday"))
       {
           fill(0,0,255);
           for(int j = 1; j < data.length; j++)
           {
             rect(10 + j * 100, height - int(data[j])/1000  , 20, int(data[j])/1000);
           }
       }
       else if(data[0].equals("Subtotal - Saturday"))
       {
           fill(0,255,0);
           for(int j = 1; j < data.length; j++)
           {
             rect(10 + j * 100 +20, height - int(data[j])/1000 , 20, int(data[j])/1000);
           }
       }
       else if(data[0].equals("Subtotal - Sunday"))
       {
           fill(255,0,0);
           for(int j = 1; j < data.length; j++)
           {
             rect(10 + j * 100 +40,height - int(data[j])/1000 , 20, int(data[j])/1000);
           }
       }
         
       
    }
    
}
