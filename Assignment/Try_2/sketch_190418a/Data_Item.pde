



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
  color fillColor;
  PShape itemShape;
  float itemScale;
  boolean selected;
  
public
  DataItem(String n, String g, float xx, float yy, int grp, int yr, int grd, float scale) 
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
   fillColor = color(yearColor[year - 2000]);
   selected = false;
   itemShape = createShape(GROUP);
  };
  void updateSize(float scale)
  {
    itemScale = sqrt(scale);
    rad = int(grade *  itemScale);
    updateShape();
  }
  
  void increaseSize()
  {
      grade++;
      rad = int(grade *  itemScale);
      updateShape();
  }
  
  void decreaseSize()
  {
    if(grade > 1)
      grade--;
     rad = int(grade *  itemScale);
     updateShape();
  }
  void updatePosition(float xx, float yy)
  {
       x = xx;
       y = yy;
  }
  boolean isInside(float pointX, float pointY) {return false;};
    void updateShape(){};
    
  void updateColor()
  {
     if(selected)
     {
          for (int i = itemShape.getChildCount() -1 ; i >=0 ;i-- )
          {
            itemShape.getChild(i).setFill(color(0,0, 255,120));
          }
     }
     else
     {
         for (int i = itemShape.getChildCount() -1 ; i >=0 ;i-- )
          {
            itemShape.getChild(i).setFill(fillColor);
          }
     } 
      
  }
  
  void removeChildren()
  {
           for (int i = itemShape.getChildCount() -1 ; i >=0 ;i-- )
          {
            itemShape.removeChild(i);
          }
    
  }
  int getSide(PVector A, PVector B, PVector C)
  {
    return int(((B.x + x ) - (A.x + x)) * (C.y - (A.y + y)) - ((B.y + y) - (A.y + y)) * (C.x - (A.x + x)));
  }

};


class squareDataItem extends DataItem
{
  PVector points[];
  squareDataItem(String n, String g, float xx, float yy, int grp, int yr, int grd, float scale )
  {
   super(n,  g, xx, yy, grp,  yr,grd, scale); 
   
   points = new PVector[4];
   updateShape();
  }
  

  @Override
  void updateShape()
  {
    removeChildren();
    points[0] = new PVector(0 - rad, 0 - rad);
    points[1] = new PVector(0 - rad, 0 + rad);
    points[2] = new PVector(0 + rad, 0 + rad);
    points[3] = new PVector(0 + rad, 0 - rad);
    PShape groupShape = createShape();
    groupShape.beginShape();
 //   updateColor();
    for (int i = 0; i < 4 ; i++)
    {
        groupShape.vertex(points[i].x,  points[i].y);
    }
    groupShape.endShape(CLOSE);
    
      if(gender.equals("Male"))
    {
          PShape genderShape = createShape(RECT,-rad,-rad*1.5,rad*2,rad/4);
          itemShape.addChild(genderShape);
    }
    itemShape.addChild(groupShape);
    updateColor();
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
  circleDataItem(String n, String g, float xx, float yy, int grp, int yr, int grd, float scale)
  {
     super(n,  g, xx, yy, grp,  yr,grd , scale);
     updateSize(grd);
  }
  

  @Override
  void updateShape()
  {
    removeChildren();
    PShape groupShape = createShape(ELLIPSE,0,0,rad*2,rad*2);
    if(gender.equals("Male"))
    {
          PShape genderShape = createShape(RECT,-rad,-rad*1.5,rad*2,rad/4);
          itemShape.addChild(genderShape);
    }
    itemShape.addChild(groupShape);
    updateColor();
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
  
  dynamicDataItem(String n, String g, float xx, float yy, int grp, int yr, int grd, float scale)
  {
    super(n, g, xx, yy, grp, yr,grd , scale); 
    points = new PVector[group];
    angle = TWO_PI/group;
    rad = int(grade *  itemScale * 1.25);
    updateShape();
  }
  @Override
  void updateShape()
  {
    removeChildren();
    for (int i = 0; i < group ; i++)
    {
      points[i] = new PVector((rad * cos(angle * i)),( rad * sin(angle * i)));
    }
    PShape groupShape = createShape();
    groupShape.beginShape();
    
    for (int i = 0; i < group ; i++)
    {
       groupShape.vertex(points[i].x,  points[i].y);
    }
    groupShape.endShape(CLOSE);
   
      if(gender.equals("Male"))
    {
          PShape genderShape = createShape(RECT,-rad,-rad*1.5,rad*2,rad/4);
          itemShape.addChild(genderShape);
    }
    itemShape.addChild(groupShape);
    updateColor();
   
   
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
