
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
  PShape itemShape;
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
   rad = int(grade *  innerScale);
   fillColor = color(  255 + ((year - 2000) *  -51  ),0 + ((year - 2000) *  51  ) ,0  );
  };
  void updateSize(int grd)
  {
      grade = grd;
      rad = int(grade *  innerScale);
  }
  void updatePosition(float xx, float yy)
  {
       x = xx;
       y = yy;
  }
  void display() {};
  boolean isInside(int pointX, int pointY) {return false;};
  int getSide(PVector A, PVector B, PVector C)
  {
    return int(((B.x + x ) - (A.x + x)) * (C.y - (A.y + y)) - ((B.y + y) - (A.y + y)) * (C.x - (A.x + x)));
  }
  void displayName()
  {
     textFont(smallfont);
     textAlign(CENTER, TOP);
     fill(0);
     textSize(int(2* scale));
     text(name, x, y + rad); 
  }
  
  
  void displayInfo()
  {
     fill(0,200);
     rect(x, y - 50, 50,50);
      fill(255);
     textFont(smallfont);
     textSize(12);
     textAlign(LEFT,TOP);
     text("X " + int(x),x, y - 48 );
     text("Y " + int(height - y),x, y - 38 );
      text("Y " + ((gridHeight -(y ))),x, y - 28 );
     // float yy = gridYOffset + (gridHeight - (gridHeight * (row.getFloat("Y") / 1000)));
  }
};


class squareDataItem extends DataItem
{
  PVector points[];
  squareDataItem(String n, String g, float xx, float yy, int grp, int yr, int grd)
  {
   super(n,  g, xx, yy, grp,  yr,grd); 
   itemShape = createShape();
   points = new PVector[4];
   updateShape();
  }
  
   @Override
  void updateSize(int grd)
  {
      grade = grd;
      rad = int(grade *  innerScale);
      updateShape();
  }
  
  void updateShape()
  {
    points[0] = new PVector(0 - rad, 0 - rad);
    points[1] = new PVector(0 - rad, 0 + rad);
    points[2] = new PVector(0 + rad, 0 + rad);
    points[3] = new PVector(0 + rad, 0 - rad);
   
    itemShape.beginShape();
    itemShape.fill(fillColor);
    for (int i = 0; i < 4 ; i++)
    {
        itemShape.vertex(points[i].x,  points[i].y);
    }
    itemShape.endShape(CLOSE);
  
  } 
  
  @Override
  void display()
  {  
    shape(itemShape, x ,y );
     displayName();
  }
  
  @Override
  boolean isInside(int pointX, int pointY)
  {
        PVector P = new PVector(pointX, pointY);
        
            for (int i = 0; i < 4 ; i++)
            {
             //  println(points[i].x + x , points[i].y + y, points[(i + 1) % 4].x + x , points[(i + 1) % 4].y + y, P);
                 //println("A");
                 //println(points[0].x + x , points[0].y + y, points[1].x + x , points[1].y + y, P);
                 //println(getSide(points[0], points[1], P));
                 //println(getSide(points[1], points[0], P));
                 //println("B");
                 //println(points[1].x + x , points[1].y + y, points[2].x + x , points[2].y + y, P);
                 //println(getSide(points[1], points[2], P));
                 //println(getSide(points[2], points[1], P));
                 //println("C");
                 //println(points[2].x + x , points[2].y + y, points[3].x + x , points[3].y + y, P);
                 //println(getSide(points[2], points[3], P));
                 //println(getSide(points[3], points[2], P));
                 //println("D");
                 //println(points[3].x + x , points[3].y + y, points[0].x + x , points[0].y + y, P);
                 //println(getSide(points[3], points[0], P));
                 //println(getSide(points[0], points[3], P));
              
               if ( getSide(points[i], points[(i + 1 )% 4], P) >= 0)
               {
                  // println(false);
                   return false;
               }
            //println(points[i].x + x , points[i].y + y, points[(i + 1) % 4].x + x , points[(i + 1) % 4].y + y, P);
   
       //       println(getSide(points[i], points[i + 1 % 4], P));
           //     if ( getSide(points[i], points[i + 1 % 4], P) >= 0)
              //  {
           //      //  println(false);
               //    return false;
            //    }
            }
      //  println(true);
        return true;
  };
  
};


class circleDataItem extends DataItem
{
  circleDataItem(String n, String g, float xx, float yy, int grp, int yr, int grd)
  {
     super(n,  g, xx, yy, grp,  yr,grd);
     updateSize(grd);
  }
  
  void updateSize(int grd)
  {
      grade = grd;
      rad = int(grade * innerScale * 0.85);
      updateShape();
  }
  
  void updateShape()
  {
    itemShape = createShape(ELLIPSE,0,0,rad*2,rad*2);
    itemShape.setFill(fillColor);
  } 
  
  @Override
  void display()
  {
      shape(itemShape, x ,y);
       displayName();
  }
  
  
  @Override
  boolean isInside(int pointX, int pointY)
  {
    float d = (pointX -x)*(pointX -x) + (pointY -y)*(pointY -y);d = sqrt(d);
  //  println(d < rad);
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
    rad = int(grade *  innerScale * 1.25);
    itemShape = createShape();
    updateShape();
     
  }
  @Override
  void updateSize(int grd)
  {
      grade = grd;
      rad = int(grade *  innerScale * 1.25);
      updateShape();
  }
  
  void updateShape()
  {
    for (int i = 0; i < group ; i++)
    {
      points[i] = new PVector((rad * cos(angle * i)),( rad * sin(angle * i)));
    }
    
     
    itemShape.beginShape();
    itemShape.fill(fillColor);
    for (int i = 0; i < group ; i++)
    {
        itemShape.vertex(points[i].x,  points[i].y);
    }
    itemShape.endShape(CLOSE);
   
  }
  
  @Override
  void display()
  {
      shape(itemShape, x,y);
       displayName();
  }
  @Override
  boolean isInside(int pointX, int pointY)
  {
        PVector P = new PVector(pointX, pointY);
            for (int i = 0; i < group ; i++)
            {

                 //            println("A");
                 //println(points[0].x + x , points[0].y + y, points[1].x + x , points[1].y + y, P);
                 //println(getSide(points[0], points[1], P));
                 //println(getSide(points[1], points[0], P));
                 //println("B");
                 //println(points[1].x + x , points[1].y + y, points[2].x + x , points[2].y + y, P);
                 //println(getSide(points[1], points[2], P));
                 //println(getSide(points[2], points[1], P));
                 //println("C");
                 //println(points[2].x + x , points[2].y + y, points[3].x + x , points[3].y + y, P);
                 //println(getSide(points[2], points[3], P));
                 //println(getSide(points[3], points[2], P));
                 //println("D");
                 //println(points[3].x + x , points[3].y + y, points[4].x + x , points[4].y + y, P);
                 //println(getSide(points[3], points[4], P));
                 //println(getSide(points[4], points[3], P));
                 //println("E");
                 //println(points[4].x + x , points[4].y + y, points[0].x + x , points[0].y + y, P);
                 //println(getSide(points[4], points[0], P));
                 //println(getSide(points[0], points[4], P));
            
                if ( getSide(points[i], points[(i+ 1) % group], P) < 0)
                {
              //     println(false);
                   return false;
                }
                
                
                
                
                
                
                
                
            }
      //  println(true);
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
