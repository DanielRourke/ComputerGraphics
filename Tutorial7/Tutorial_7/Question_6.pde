

void question6()
{
   background(100);
  textSize(fontSize);
 // text(letters, 10,30, 350, 150);
  int firstLine = width;
  int secondLine =width;
  int thirdLine = width;
  String first = "";
  String second = "";
  String third = "";
  int index = 0;
  
  while (letters.length() > index && textWidth(first) + letters.charAt(index) < firstLine)
  {
    first = first + letters.charAt(index);
    index++;
  }
  
   float h = textDescent() + textAscent();
   text(first, 10, 0.5 * h + 30);
   
  while (letters.length() > index && textWidth(second) + letters.charAt(index) < secondLine )
  {
   second = second + letters.charAt(index);
   index++;
  }
  text(second, 10, 1.5 * h+ 30);
  
  while(letters.length() > index && textWidth(third) + letters.charAt(index) < thirdLine )
  {
     third = third + letters.charAt(index);
     index++;
  }
  text(third, 10,2.5 * h+ 30);
}

void keyTyped()
{
  letters = letters + key;
}
