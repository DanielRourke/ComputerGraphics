PShape s;

    PVector points[];
    
void setup() {
  size(400, 400, P2D);
  s = createShape();
  s.beginShape(TRIANGLE_STRIP);
  s.vertex(30, 75);
  s.vertex(40, 20);
  s.vertex(90, 75);
  s.endShape();
  points = new PVector[10];
}

void draw() {
     
    int sides = 7;
    int x = 120;
    int y = 120;
    float r = 5 * 5;
    float angle = TWO_PI/sides;
    
    for (int i = 0; i < sides ; i++)
    {
      points[i] = new PVector(x +(r * cos(angle * i)), y +( r * sin(angle * i)));
    }

    
    beginShape();
    for (int i = 0; i < sides ; i++)
    {
        vertex(points[i].x,  points[i].y);
    }
    endShape(CLOSE);
  
    for (int i = 1; i < sides ; i++)
    {
        
        vertex(points[i].x,  points[i].y);
    }
  
    
}
