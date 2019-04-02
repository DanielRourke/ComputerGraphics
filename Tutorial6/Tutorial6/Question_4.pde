

void question4()
{
    
  String [] datalines = loadStrings("data.txt");
 
 
 
  for (int i = 0; i < datalines.length ; i++)
  {
    String[] data = splitTokens(datalines[i], ", " );
    
    if (data.length > 0)
    {
        if (data[0].equals("ellipse"))
        {
          ellipse( int(data[1]), int(data[2]), int(data[3]), int(data[4]));
        }
        else if (data[0].equals("line"))
        {
          line(int(data[1]), int(data[2]), int(data[3]), int(data[4]));
        }
        else if (data[0].equals("rect"))
        {
          rect(int(data[1]), int(data[2]), int(data[3]), int(data[4]));
        }
      
    }


    
  }
}
