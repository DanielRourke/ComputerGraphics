

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

class DynamicObject
{
 Coord offset;
 Coord scale;
 color col;
 DynamicObject()
 {
   offset = new Coord(0.0f, 0.0f);
   scale = new Coord(1.0f, 1.0f);
   col = color(255);
 }
 DynamicObject(Coord o, Coord s, color c)
 {
  offset = o;
  scale = s;
  col = c;
 }
  
}

//class Leg extends DynamicObject
class Leg
{
  Coord hipPoint;
  Coord kneePoint;
  Coord anklePoint;
  Coord footPoint;
  Leg(Coord h, Coord k,Coord a, Coord f)
  {
   hipPoint = h;
   kneePoint = k;
   anklePoint = a;
   footPoint = f;
  }
  //Leg(Coord h, Coord k,Coord a, Coord f, Coord o, Coord s, color c)
  //{
  //  super(o,s,c);
  // hipPoint = h;
  // kneePoint = k;
  // anklePoint = a;
  // footPoint = f;
  //}
  
  void dynamicDraw(Coord offset, Coord scale, color col)
  {
    //  fill(255);
//  bezier(230,280, 250,320, 220,370 , 260,370);
  fill(col);
  bezier(hipPoint.x + offset.x * scale.x ,
         hipPoint.y + offset.y * scale.y, 
         kneePoint.x + offset.x * scale.x,
         kneePoint.y + offset.y * scale.y, 
         anklePoint.x + offset.x * scale.x,
         anklePoint.y + offset.y * scale.y,
         footPoint.x + offset.x * scale.x,
         footPoint.y + offset.y * scale.y);
  }
}
