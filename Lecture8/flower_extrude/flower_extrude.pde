PImage extrude;
int[][] rvalues; int[][] gvalues; int[][] bvalues; int[][] avgvalues;
float angle = 0;

void setup() {
  size(800, 600, P3D);
  // Load the image into a new array
  extrude = loadImage("images.jpg");
  extrude.loadPixels();
  rvalues = new int[extrude.width][extrude.height];
  gvalues = new int[extrude.width][extrude.height];
  bvalues = new int[extrude.width][extrude.height];
  avgvalues = new int[extrude.width][extrude.height];
  
    for (int y = 0; y < extrude.height; y++) {
      for (int x = 0; x < extrude.width; x++) {
        color pixel = extrude.get(x, y);
        rvalues[x][y] = (int)red(pixel);
        gvalues[x][y] = (int)green(pixel);
        bvalues[x][y] = (int)blue(pixel);
        avgvalues[x][y] =  averageRGB(pixel);
      }
    }
    
}

int averageRGB(color c)
{
  
  int temp = (int)((red(c) + green(c) + blue(c))/3);
        
  if(temp < 127)
     return temp;
   else
     return -temp;

}


void draw() {
  background(0);
  // Update the angle
  angle += 0.055;
  
  //Rotate around the center axis
  translate(width/2, 0, -128);
  rotateY(angle);
  translate(-extrude.width/2, 100, -128);
  
  // Display the image mass
  for (int y = 0; y < extrude.height; y++) {
    for (int x = 0; x < extrude.width; x++) {
      stroke(rvalues[x][y], gvalues[x][y],
      bvalues[x][y]);
      point(width/2 * cos(angle * i),y, avgvalues[x][y]);
    }
  }
}

//points[i] = new PVector((rad * cos(angle * i)),( rad * sin(angle * i)));
