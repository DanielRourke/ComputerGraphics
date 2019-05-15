
//void question6()
//{
//  /*Modify the last example in the lecture note 9 (Extrude and
//Image) so that all pixels are drawn inside a sphere. Y-coordinate values remain
//the same, x-coordinate values are distributed around a circle and z-coordinate
//values are calculated based on the average values of their RGB. If the average
//value is less than 127, the pixels are drawn at the negative half of the zcoordinate. Otherwise, the pixels are drawn at the positive half of the coordinate.
//Add animation to see the effect. You are also welcome to create various special
//effects of your choice.*/

//for ALL OF THE PIXELS
  
  
//  if(averageRGB(color pixel))
    

//}

//int averageRGB(color c)
//{
//  return (int)((red(c) + green(c) + blue(c))/3);
//}












//PImage extrude;
//int[][] rvalues; int[][] gvalues; int[][] bvalues;
//float angle = 0;

//void setup() {
//  size(800, 600, P3D);
//  // Load the image into a new array
//  extrude = loadImage("images.jpg");
//  extrude.loadPixels();
//  rvalues = new int[extrude.width][extrude.height];
//  gvalues = new int[extrude.width][extrude.height];
//  bvalues = new int[extrude.width][extrude.height];
  
//    for (int y = 0; y < extrude.height; y++) {
//      for (int x = 0; x < extrude.width; x++) {
//        color pixel = extrude.get(x, y);
//        rvalues[x][y] = (int)red(pixel);
//        gvalues[x][y] = (int)green(pixel);
//        bvalues[x][y] = (int)blue(pixel);
//      } 
//    }
//}



//void draw() {
//  background(0);
//  // Update the angle
//  angle += 0.005;
//  // Rotate around the center axis
//  translate(width/2, 0, -128);
//  rotateY(angle);
//  translate(-extrude.width/2, 100, -128);
//  // Display the image mass
//  for (int y = 0; y < extrude.height; y++) {
//    for (int x = 0; x < extrude.width; x++) {
//      stroke(rvalues[x][y], gvalues[x][y],
//      bvalues[x][y]);
//      point(x, y, -rvalues[x][y]);
//    }
//  }
//}
