

//void setup()
//{
//  size(400,400);
  
//}

//void draw()
//{
//  //rect(50,100, 20,40);
//  //println(nf(9.012, 0, 5));
//  //// print “9.01200”
//}


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
