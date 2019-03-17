
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



abstract class Part
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
    
    void setColor(color in_col)
    {
     col = in_col; 
    }
    
    abstract void drawPart(Coord position, float w, float h );
}

class Body extends Part
{
    Body(Coord o, Coord s, color c)
    {
     super(o,s,c); 
    }
    void drawPart(Coord position, float w, float h )
    {
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
    void drawPart(Coord position, float w, float h )
    {
      fill(255);
      stroke(col);
      strokeWeight(1);
      ellipse(position.x + (offset.x * w ),position.y + (offset.y * h ),scale.x * w,scale.y * h);
     }
}

class Limb extends Part
{
    Coord hipPoint;
    Coord kneePoint;
    Coord anklePoint;
    Coord footPoint;
    Limb(Coord h, Coord k,Coord a, Coord f, color c)
    {
     setColor(c);
     hipPoint = h;
     kneePoint = k;
     anklePoint = a;
     footPoint = f;
    }
    void drawPart(Coord position, float w, float h )
    {
      fill(255);
      stroke(col);
      strokeWeight(1);
      bezier(position.x +( hipPoint.x * w),
             position.y +( hipPoint.y * h),
             position.x +( kneePoint.x * w),
             position.y +( kneePoint.y * h),
             position.x +( anklePoint.x * w),
             position.y +( anklePoint.y * h),
             position.x +( footPoint.x * w),
             position.y +( footPoint.y * h));
     }
}

class p extends Part
{
    p(Coord o, Coord s, color c)
    {
     super(o,s,c); 
    }
    
    void drawPart(Coord position, float w, float h )
    {
      // draw Zoog's head
      fill(255);
      stroke(col);
      strokeWeight(5);
      point(position.x + (offset.x * w ),position.y + (offset.y * h ));
     }

}


class Person
{
    Coord position;
    float w;
    float h;
    Body body;
    Head head;
    Limb armLeft;
    Limb armRight;
    Limb legLeft;
    Limb legRight;
    float speedV;
    float speedH;
    
    
    Person(Coord pos, float in_w, float in_h)
    {
       position = pos;
       w = in_w;
       h = in_h;  
    }
    
    Person(Coord pos, float in_w, float in_h, color c, float sV, float sH)
    {
                //              xoffset yoffset         xwidth yhieght   color
       body = new Body(new Coord(0.50f, 0.55f),new Coord(0.60f, 0.5f),c);
       head = new Head(new Coord(0.50f, 0.20f),new Coord(0.40f, 0.20f),c);
       armLeft = new Limb(new Coord(0.31f, 0.35f),new Coord(0.05f, 0.40f),new Coord(0.05f, 0.50f),new Coord(0.05, 0.60f),c);
       armRight = new Limb(new Coord(1- 0.31f,  0.35f),new Coord(1 - 0.05f,  0.40f),new Coord(1 - 0.05f,  0.50f),new Coord(1- 0.05f,  0.60f),c);
       legLeft = new Limb(new Coord(0.30f, 0.74f),new Coord(0.20f, 0.82f),new Coord(0.40, 0.95f),new Coord(0.15f, 0.95f),c);
       legRight = new Limb(new Coord(1 -0.30f, 0.74f),new Coord(1 - 0.20f, 0.82f),new Coord(1 - 0.40, 0.95f),new Coord( 1 -0.15f, 0.95f),c);
       position = pos;
       w = in_w;
       h = in_h;
       speedV= sV;
       speedH = sH;
    }
    
    void drawPerson()
    {
        body.drawPart(position, w ,h);
        head.drawPart(position, w ,h);
        armLeft.drawPart(position, w ,h);
        armRight.drawPart(position, w ,h);
        legLeft.drawPart(position, w ,h);
        legRight.drawPart(position, w ,h);
    }
    void setSpeed(float v ,float h)
    {
       speedV = v;
       speedH = h;
    }
    
    void movePerson()
    {
      position.x  = position.x + speedV;
      if(position.x + w > width || position.x < 0)
      {
          speedV = -speedV;
      }
      position.y  = position.y + speedH; 
      if(position.y + h > height || position.y < 0)
      {
         speedH = -speedH; 
      }
    }
}


void drawPeople()
{
  for (int i = 9; i > 0 ; i--)
  {
     people[i].drawPerson();
     people[i].movePerson();
  }
 
  
}
