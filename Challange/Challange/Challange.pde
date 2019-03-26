
PFont font;
String letters = "";
PrintWriter output;

void setup() {
  size(100, 100);
  fill(0);
  font = loadFont("ArialNarrow-Italic-48.vlw");
  textFont(font);
  // create a new file in the sketch directory
  output = createWriter("words.txt");
}

void draw() {
  background(204);
  text(letters, 5, 50);
}



void keyPressed() {
  if (key == ' ') {    // Spacebar pressed
  
  if (letters.indexOf('.') == -1)
  {
    int f = int(letters);
     output.println(nf(f, 10));
  }
  else
  {
    float f = float(letters);
    output.println(nf(f,6,4));
  }
 
    letters = ""; // clear the letter string
  }
  else {
    letters = letters + key;
  }
  
  if (key == ENTER) {
    output.flush(); // write the remaining data
    output.close(); // finish the file
    exit(); // exit the program
  }
} 

void orderOperations(string )
{
  //variables 
  //operators
  
  // 2x + 1
  
  
  //4 + 6 / 2
  
  //return (   6 , / , 2   )
  
  // return (     )
  ///return 
}


float cal(String[] expression)
{
  if(expression[0] is whole number && expression[1] is operator && expression[2] is whole number)
  
  else
  return expresion
  
  
}
