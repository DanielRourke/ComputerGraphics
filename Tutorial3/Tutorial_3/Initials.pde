
void drawD()
{
  vertex(40, 70);
  vertex(40, 20);
  bezierVertex(80, 20, 80, 80, 40, 80);
  bezierVertex(10, 80, 10, 50, 30, 65);
  endShape();
}

void drawS()
{
  beginShape();
  vertex(140, 30);
  bezierVertex( 130, 20, 100, 40, 120, 50);
  bezierVertex( 180, 80, 100, 90, 100, 70);
  endShape();
}

void drawR()
{
  beginShape();
  vertex(180, 80);
  vertex(180, 30);
  bezierVertex(220, 10, 200, 80, 180, 50);
  vertex(210, 80);
  endShape();
}


void drawIntials()
{
  smooth();
  noFill();
  beginShape();
  strokeWeight(4);
  drawD();
  drawS();
  drawR();
}
