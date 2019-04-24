



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
  PShape itemShape;
  int index;
  float itemScale;
  boolean selected;
public
  DataItem(String n, String g, float xx, float yy, int grp, int yr, int grd, float scale , int idx) 
  {
   name = n;
   gender = g;
   x = xx;
   y = yy;
   group = grp;
   year = yr;
   grade = grd;
   itemScale = sqrt(scale);
   
   rad = int(grade *  itemScale);
   fillColor = color(  255 + ((year - 2000) *  -51  ),0 + ((year - 2000) *  51  ) ,0  );
   index = idx;
   selected = false;
  };
  void updateSize(int grd)
  {
      grade = grd;
      rad = int(grade *  itemScale);
  }
  void updatePosition(float xx, float yy)
  {
       x = xx;
       y = yy;
  }
  boolean isInside(float pointX, float pointY) {return false;};
  int getSide(PVector A, PVector B, PVector C)
  {
    return int(((B.x + x ) - (A.x + x)) * (C.y - (A.y + y)) - ((B.y + y) - (A.y + y)) * (C.x - (A.x + x)));
  }

};


class squareDataItem extends DataItem
{
  PVector points[];
  squareDataItem(String n, String g, float xx, float yy, int grp, int yr, int grd, float scale ,int idx)
  {
   super(n,  g, xx, yy, grp,  yr,grd, scale ,idx); 
   itemShape = createShape();
   points = new PVector[4];
   updateShape();
  }
  
   @Override
  void updateSize(int grd)
  {
      grade = grd;
      rad = int(grade *  itemScale);
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
  boolean isInside(float pointX, float pointY)
  {
        PVector P = new PVector(pointX, pointY);
        
            for (int i = 0; i < 4 ; i++)
            {
               
               if ( getSide(points[i], points[(i + 1 )% 4], P) >= 0)
                     return false;
            }
         

        return true;
  };
  
};




class circleDataItem extends DataItem
{
  circleDataItem(String n, String g, float xx, float yy, int grp, int yr, int grd, float scale ,int idx)
  {
     super(n,  g, xx, yy, grp,  yr,grd , scale ,idx);
     updateSize(grd);
  }
  
  void updateSize(int grd)
  {
      grade = grd;
      rad = int(grade * itemScale * 0.85);
      updateShape();
  }
  
  void updateShape()
  {
    itemShape = createShape(ELLIPSE,0,0,rad*2,rad*2);
    itemShape.setFill(fillColor);
  } 
  
  @Override
  boolean isInside(float pointX, float pointY)
  {
    float d = (pointX -x)*(pointX -x) + (pointY -y)*(pointY -y);d = sqrt(d);
    return d < rad;
  }
  
};


class dynamicDataItem extends DataItem
{
  PVector points[];
  float angle;
  
  dynamicDataItem(String n, String g, float xx, float yy, int grp, int yr, int grd, float scale ,int idx)
  {
    super(n, g, xx, yy, grp, yr,grd , scale ,idx); 
    points = new PVector[group];
    angle = TWO_PI/group;
    rad = int(grade *  itemScale * 1.25);
    itemShape = createShape();
    updateShape();
     
  }
  @Override
  void updateSize(int grd)
  {
      grade = grd;
      rad = int(grade *  itemScale * 1.25);
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
  boolean isInside(float pointX, float pointY)
  {
        PVector P = new PVector(pointX, pointY);
            for (int i = 0; i < group ; i++)
                if ( getSide(points[i], points[(i+ 1) % group], P) <= 0)
                   return false;
                
        return true;
  };
  
};
