
class Coord
{
 float x;
 float y;
 Coord(float inputX, float inputY)
 {
  x = inputX;
  y = inputY;
 }
}



class Part
{
    Coord offset; //ie x + offset.x * w = relative x postiion
    Coord scale;  // x * w = relative width
    color col;
    Part(Coord o, Coord s, color c)
    {
      offset = o;
      scale = s;
      col = c;
    }
    
    Part()
    {
      offset = new Coord(0.0f, 0.0f);
      scale = new Coord(1.0f, 1.0f);
      col = color(255);
    }
}

class Body extends Part
{
    Body(Coord o, Coord s, color c)
    {
     super(o,s,c); 
    }
    void drawBody(Coord position, float w, float h )
    {
        background(255);
        stroke(col);
        strokeWeight(1);
        ellipse(position.x + (offset.x * w ),position.y + (offset.y * h ),scale.x * w,scale.y * h);
         //ellipse(200,200,100,200);
    }

}

class Head extends Part
{
    Head(Coord o, Coord s, color c)
    {
     super(o,s,c); 
    }
    void drawHead(Coord position, float w, float h )
    {
      // draw Zoog's head
      fill(255);
      stroke(col);
      strokeWeight(1);
      ellipse(position.x + (offset.x * w ),position.y + (offset.y * h ),scale.x * w,scale.y * h);
  
//  // draw Zoog's eyes
//  fill(0);
//  ellipse(185,65,22,16);
//  ellipse(215,65,22,16);
//  // draw Zoog's eyes
//  fill(255);
//  ellipse(185,65,10,10);
//  ellipse(215,65,10,10);
//  // draw Zoog's eyes pupil
  
  
//  //point(mouseX, mouseY);
//  //int leftEyeX = (mouseX -215) / 100;
//  //int leftEyeY = (mouseX -65) / 100;
//  fill(0);
//  ellipse(185 ,65 ,2,2);
//  ellipse(215,65,2,2);
  
//  // Draw Zoog's mouth
//  stroke(0);
//  fill(150);
//  rect(200,90,10,10);
    }

}

class Person
{
    Coord position;
    float w;
    float h;
    Body body;
    Head head;
    
    Person(Coord pos, float in_w, float in_h)
    {
       position = pos;
       w = in_w;
       h = in_h;  
    }
    
    Person(Coord pos, float in_w, float in_h, Coord o, Coord s, color c)
    {
       body = new Body(new Coord(0.25f, 0.45f),new Coord(0.30f, 0.5f),c);
       head = new Head(o,s,c);
       position = pos;
       w = in_w;
       h = in_h;
    }
    
    void drawPerson()
    {
        body.drawBody(position, w ,h);
        head.drawHead(position, w ,h);
    }
}
