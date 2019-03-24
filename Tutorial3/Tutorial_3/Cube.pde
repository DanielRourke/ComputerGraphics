

void drawCube()
{
  noFill();
  strokeWeight(3);
  beginShape();
  vertex(10, 40);
  vertex(35, 10);
  vertex(80, 10);
  vertex(55, 40);
  vertex(10, 40);
  vertex(10, 70);
  vertex(55, 70);
  vertex(80, 40);
  vertex(80, 10);
  vertex(55, 40);
  vertex(55, 70);
  endShape();
}

void drawCubeWithTriangles()
{
  noFill();
  strokeWeight(3);
  beginShape(TRIANGLE_STRIP);
  vertex(10, 40);
  vertex(35, 10);
  vertex(80, 10);
  vertex(55, 40);
  vertex(10, 40);
  vertex(10, 70);
  vertex(55, 70);
  vertex(80, 40);
  vertex(80, 10);
  vertex(55, 40);
  vertex(55, 70);
  endShape();
}
