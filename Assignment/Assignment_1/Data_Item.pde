
int getSide(PVector A, PVector B, PVector C)
{
  
  return int((B.x - A.x) * (C.y - A.y) - (B.y - A.y) * (C.x - A.x));
}


abstract class DataItem 
{
private
  String name;
  String gender;
  float x;
  float y;
  int group;
  int year;
  int grade;
  int rad;
  int fillColor;
  int borderThickness;
public
  DataItem(String n, String g, float xx, float yy, int grp, int yr, int grd) 
  {
   name = n;
   gender = g;
   x = xx;
   y = yy;
   group = grp;
   year = yr;
   grade = grd;
   rad = int(grade * scale);
   fillColor = color(  255 + ((year - 2000) *  -51  ),0 + ((year - 2000) *  51  ) ,0  );
  };
  void updateSize(int grd)
  {
      grade = grd;
      rad = int(grade * scale);
  }
  void updatePosition(float xx, float yy)
  {
       x = xx;
       y = yy;
  }
  void display() {};
  boolean isInside(int pointX, int pointY) {return false;};
};


class squareDataItem extends DataItem
{
  squareDataItem(String n, String g, float xx, float yy, int grp, int yr, int grd)
  {
   super(n,  g, xx, yy, grp,  yr,grd); 
  }
  
  @Override
  void display()
  {
     fill(fillColor);
    rectMode(CENTER);
    rect(x,y,rad*2, rad*2);
  }
  @Override
  boolean isInside(int pointX, int pointY)
  {
    return (pointX > x-rad && pointX < x+rad && pointY < y+rad && pointY > y-rad);
  };
  
};


class circleDataItem extends DataItem
{
  circleDataItem(String n, String g, float xx, float yy, int grp, int yr, int grd)
  {
   super(n,  g, xx, yy, grp,  yr,grd); 
  }
  
  @Override
  void display()
  {
     fill(fillColor);
    ellipseMode(CENTER);
    ellipse(x,y,rad*2, rad*2);
  }
  
  @Override
  boolean isInside(int pointX, int pointY)
  {
    float d = (pointX -x)*(pointX -x) + (pointY -y)*(pointY -y);d = sqrt(d);
    return d < rad;
  }
  
};


class dynamicDataItem extends DataItem
{
  PVector points[];
  float angle;
  
  dynamicDataItem(String n, String g, float xx, float yy, int grp, int yr, int grd)
  {
    super(n, g, xx, yy, grp, yr,grd); 
    points = new PVector[group];
    angle = TWO_PI/group;
    rad = int(grade * scale * 1.25);
    updateShape();
 
  }
  @Override
  void updateSize(int grd)
  {
      grade = grd;
      rad = int(grade * scale * 1.25);
      updateShape();
  }
  
  @Override
  void updatePosition(float xx, float yy)
  {
       x = xx;
       y = yy;
       updateShape();
  }
  
  void updateShape()
  {
    for (int i = 0; i < group ; i++)
    {
      points[i] = new PVector(x +(rad * cos(angle * i)), y +( rad * sin(angle * i)));
    }
  }
  
  @Override
  void display()
  {
    fill(fillColor);
    beginShape();
    for (int i = 0; i < group ; i++)
    {
        vertex(points[i].x,  points[i].y);
    }
    endShape(CLOSE);
  }
  @Override
  boolean isInside(int pointX, int pointY)
  {
        PVector P = new PVector(pointX, pointY);
        
            for (int i = 1; i < group ; i++)
            {
                if ( getSide(points[i - 1], points[i], P) >= 0)
                {
                   println(false);
                   return false;
                }
            }
        println(true);
        return true;
  };
  
};





//class triangleDataItem extends DataItem
//{
//  int r;
//  PVector A;
//  PVector B;
//  PVector C;
  
//  @Override
//  void display()
//  {
//    r = grade * 12;
//    A = new PVector(x, y -(2.0/3.0 * r));
//    B = new PVector(x - (1.0/2.0 * r),y + (1.0/3.0 * r));
//    C = new PVector(x + (1.0/2.0 * r),y + (1.0/3.0 * r));
//    triangle(A.x, A.y,B.x ,B.y,C.x , C.y);
//  }
//  @Override
//  boolean isInside(int pointX, int pointY)
//  {
//        float d = (pointX -x)*(pointX -x) + (pointY -y)*(pointY -y);d = sqrt(d);
//        PVector P = new PVector(pointX, pointY);
        
//        return (d < r && getSide(A,B,P) < 0 && getSide(B,C,P) < 0 && getSide(C,A,P) < 0 );
//  };
  
//};


//class pentagonDataItem extends DataItem
//{
//  int r;
//  PVector A;
//  PVector B;
//  PVector C;
//  PVector D;
//  PVector E;
//  @Override
//  void display()
//  {
//    r = grade * 6;
//    A = new PVector(x, y - r);
//    B = new PVector(x - (r + (1.0/3.0 * r)), y - (1.0/3.0 * r));
//    C = new PVector(x - 1.0/2.0 * r,y + r);
//    D = new PVector(x + 1.0/2.0 * r,y + r);
//    E = new PVector(x + (r + (1.0/3.0 * r)), y - (1.0/3.0 * r));
//    beginShape();
//    vertex(A.x, A.y);
//    vertex(B.x, B.y);
//    vertex(C.x, C.y);
//    vertex(D.x, D.y);
//    vertex(E.x, E.y);
//    endShape();
//  }
//  @Override
//  boolean isInside(int pointX, int pointY)
//  {
//        float d = (pointX -x)*(pointX -x) + (pointY -y)*(pointY -y);d = sqrt(d);
//        PVector P = new PVector(pointX, pointY);
        
//        return (d < r && getSide(A,B,P) < 0 && getSide(B,C,P) < 0 && getSide(C,A,P) < 0 )  ; 
//  };
  
//};



//class hexagonDataItem extends DataItem
//{
//  int r;
//  PVector points[];
//  PVector A;
//  PVector B;
//  PVector C;
//  PVector D;
//  PVector E;
//  void updateShape()
//  {
//    r = grade * 6;
//    float angle = TWO_PI/6;
//    for (int i = 0; i < 6 ; i++)
//    {
//      points[i] = new PVector ( x + (r * cos(angle)* i),y + ( y * sin(angle)* i));
//    }
//  }
  
//  @Override
//  void display()
//  {
//    updateShape();
    
//    beginShape();
//    for (int i = 0; i < 6 ; i++)
//    {
//        vertex(points[i].x,  points[i].y);
//    }
//    endShape();
//  }
//  @Override
//  boolean isInside(int pointX, int pointY)
//  {
//        float d = (pointX -x)*(pointX -x) + (pointY -y)*(pointY -y);d = sqrt(d);
//        PVector P = new PVector(pointX, pointY);
        
//        return (d < r && getSide(A,B,P) < 0 && getSide(B,C,P) < 0 && getSide(C,A,P) < 0 )  ; 
//  };
  
//};
