

void drawTriangles()
{
    fill(0);

  int triangles = 12;

  //float leftx = 0.05 * width;
  float lefty = 0.65 * height;
  //float topx = 0.075 * width;
  float topy = 0.1 * height;
  //float rightx = 0.10 * width;
  float righty = 0.65 * height;

  float distance = (width * 0.025);
  float leftx = distance;
  beginShape();
  vertex(0.025 * width, height);
 // vertex(0.050 * width, 0.750 *height);
  //vertex(0.1 * width, 0.1*height);

  for (int i = 1; i <= triangles; i++)
  {
    leftx += distance;
    vertex(leftx, lefty);
     leftx += distance;
    vertex(leftx, topy);
     leftx += distance;
    vertex(leftx, righty);
  }
  //vertex((1-0.1) * width, 0.1*height);
 // vertex((1-0.050) * width, 0.70 *height);
  vertex((leftx += distance), height);
  endShape(CLOSE); 
}
