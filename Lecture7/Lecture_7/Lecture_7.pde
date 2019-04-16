

float beginX = 100.0; // initial x-coordinate
float beginY = 00.0; // initial y-coordinate
float endX = 100.0; // final x-coordinate
float endY = 200.0; // final y-coordinate
float distX; // x-axis distance to move
float distY; // y-axis distance to move
float x = 0.0; // current x-coordinate
float y = 0.0; // current y-coordinate
float step = 0.02; // size of each step (0.0 to 1.0);
float pct = 0.0; // percentage traveled (0.0 to 1.0);


void setup() {
    size(200, 200);
    noStroke();
    smooth();
    distX = endX - beginX;
    distY = endY - beginY;
}

void draw() {
  
 
  
    fill(0, 12);
    rect(0, 0, width, height);
    pct += step;
    if (pct < 1.0) {
    x = beginX + pct*distX;
    y = beginY + pct*distY;
    }
    fill(255);
    ellipse(x, y, 20, 20);
    
    println(y);
    if (y > endY -1)
    {
      println("swap");
      float temp = endY;
      endY = beginY;
      beginY = y;
      distX = endX - beginX;
      distY = endY - beginY;
      pct = 0.0;
    }

}
