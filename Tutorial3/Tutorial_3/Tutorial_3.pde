

void setup()
{
  size(400,100);
  
}

void draw()
{
 // drawCube();
  //drawCubeWithTriangles();
  noFill();
  
  int triangles = 10;
  
  float leftx = 0.05 * width;
  float lefty = 0.75 * height;
  float topx = 0.1 * width;
  float topy = 0.1 * height;
  float rightx = 0.15 * width;
  float righty = 0.75 * height;
  
  float distance = (width - 0.1) / triangles;
  
  beginShape();
  vertex(0.025 * width, height);
  vertex(0.050 * width,0.750 *height);
  vertex(0.1 * width, 0.1*height);
  
  for (int i = 1; i <= triangles ; i++)
  {
    vertex(leftx,lefty);
    vertex(topx,topy);
    vertex(x,y);
    
    
    
  }
  //vertex((1-0.1) * width, 0.1*height);
  vertex((1-0.050) * width,0.750 *height);
  vertex((1-0.025) * width, height);
  endShape(CLOSE);
}
