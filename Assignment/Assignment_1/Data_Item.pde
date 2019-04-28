



abstract class DataItem 
{
  String name;
  String gender;
  float x;
  float y;
  int group;
  int year;
  int grade;
  
  PShape itemShape;
  int rad;
  float itemScale;
  boolean selected;
  
  color fillColor;
  int drawOptionStrokeWeight;
  boolean drawOptionFill;
  boolean drawOptionShowLabel;

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
   rad = int(grade * itemScale);
   selected = false;
   
   fillColor = color(settings.yearColor[year - 2000]);
   drawOptionStrokeWeight = settings.stroke;
   drawOptionFill = settings.fill;
   drawOptionShowLabel = settings.label;
   
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
     for (int i = itemShape.getChildCount() -1 ; i >=0 ;i-- )
     {
            itemShape.getChild(i).setFill(drawOptionFill);
     }
     
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
  
  void updateOutline()
  {
          for (int i = itemShape.getChildCount() -1 ; i >=0 ;i-- )
          {
            if (drawOptionStrokeWeight > 0)
              itemShape.getChild(i).setStrokeWeight(drawOptionStrokeWeight);
            else
              itemShape.getChild(i).setStroke(false);
          }
  }
  
  void removeChildren()
  {
           for (int i = itemShape.getChildCount() -1 ; i >=0 ;i-- )
          {
            itemShape.removeChild(i);
          }
    
  }
  float getSide(PVector A, PVector B, PVector C)
  {
    return ((B.x + x ) - (A.x + x)) * (C.y - (A.y + y)) - ((B.y + y) - (A.y + y)) * (C.x - (A.x + x));
  }
  
  void display(float xmin, float ymin, float xs, float ys, float xx, float yy, float w, float h)
  {
    //translate x and y to grid coords
     float posX = map(x ,xmin , xs, xx, xx + w);
     float posY = map(y , ymin, ys, yy + h, yy);
    shape(itemShape, posX , posY);
    
    if(drawOptionShowLabel)
    {
        textAlign(CENTER, TOP);
        textSize(width / 100);
        text(name, posX , posY + rad);
    }
  }
  


};


class squareDataItem extends DataItem
{
  PVector points[];
  squareDataItem(String n, String g, float xx, float yy, int grp, int yr, int grd, float scale)
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
    updateOutline();
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
     updateShape();
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
    updateOutline();
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
    points = new PVector[group + 3];
    angle = TWO_PI/(group+3);
    rad = int(grade *  itemScale);
    updateShape();
  }
  
  @Override
  void updateShape()
  {
    removeChildren();
    for (int i = 0; i < (group + 3) ; i++)
    {
      points[i] = new PVector((rad * cos(angle * i)),( rad * sin(angle * i)));
    }
    PShape groupShape = createShape();
    groupShape.beginShape();
    
    for (int i = 0; i <(group + 3) ; i++)
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
    updateOutline();
   
  }
  
  @Override
  boolean isInside(float pointX, float pointY)
  {
        PVector P = new PVector(pointX, pointY);
            for (int i = 0; i < (group + 3)  ; i++)
                if ( getSide(points[i], points[(i+ 1) % (group+3)], P) < 1)
                   return false;
                
        return true;
  };
  
};

class imageDataItem extends DataItem
{
  PVector[] points;
  PImage image;
  String location;
  imageDataItem(String n, String g, float xx, float yy, int grp, int yr, int grd, float scale, String dir)
  {
   super(n,  g, xx, yy, grp,  yr,grd, scale); 
   location = dir;
   points = new PVector[4];
   updateShape();
  }
  
  @Override
  void updateShape()
  {
    println("calling iamge constictor");
    removeChildren();
    points[0] = new PVector(0 - rad, 0 - rad);
    points[1] = new PVector(0 - rad, 0 + rad);
    points[2] = new PVector(0 + rad, 0 + rad);
    points[3] = new PVector(0 + rad, 0 - rad);
    
    PShape groupShape = createShape();
    groupShape.beginShape();
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
    updateImage();
    updateColor();
    updateOutline();
    
  } 
  
  void updateImage()
  {
   image = loadImage(location);
   image.resize(rad*2,rad*2);
  }
  
    @Override
  boolean isInside(float pointX, float pointY)
  {
        PVector P = new PVector(pointX, pointY);
        
            for (int i = 0; i < 4 ; i++)
            {
               if ( getSide(points[i], points[(i + 1 )% 4], P) > -1)
                     return false;
            }
        return true;
  };
  
  //makes the main shape with no fil but gender shape as normal
  @Override
  void updateColor()
  {
       if(itemShape.getChildCount() > 1)
       {
          itemShape.getChild(0).setFill(drawOptionFill);
          itemShape.getChild(0).setFill(fillColor);
          itemShape.getChild(1).setFill(false);
       }
       else
          itemShape.getChild(0).setFill(false);

       
      if(selected)
      {
           if(itemShape.getChildCount() > 1)
           {
              itemShape.getChild(0).setFill((color(0,0, 255,120)));
              itemShape.getChild(1).setFill(true);
              itemShape.getChild(1).setFill((color(0,0, 255,120)));
           }
           else
           {
              itemShape.getChild(0).setFill(true);
              itemShape.getChild(0).setFill((color(0,0, 255,120)));
           }
      }
  
  }
          
  void display(float xmin, float ymin, float xs, float ys, float xx, float yy, float w, float h)
  {
    //translate x and y to grid coords
     float posX = map(x ,xmin , xs, xx, xx + w);
     float posY = map(y , ymin, ys, yy + h, yy);
    image(image, posX, posY);
    shape(itemShape, posX , posY);
    
    imageMode(CENTER);
    if(drawOptionShowLabel)
    {
        textAlign(CENTER, TOP);
        textSize(width / 100);
        text(name, posX , posY + rad);
    }
  }
  


};
