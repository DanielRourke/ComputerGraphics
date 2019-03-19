

void setup()
{
  size(400,200);
}

void draw()
{
    noStroke();
    fill(0);
    beginShape();
    vertex(10, 100);
    for (int i = 0; i <= 400; i+= 60) {
      vertex(10 + i, 50);
      vertex(40 + i,50);
      vertex(40 + i,70);
      vertex(70 + i,70);
      
    }
    vertex(410, 100);
    endShape();
    
    strokeWeight(5);
    point(10,100);
    point(10,50);
    point(40,50);
    point(40,70);
    point(70,70); 
}
