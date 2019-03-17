

//class Coord
//{
// float x;
// float y;
// Coord(float inputX, float inputY)
// {
//  x = inputX;
//  y = inputY;
// }
//}

//class DynamicObject
//{
//   Coord offset;
//   Coord scale;
//   color col;
//   DynamicObject()
//   {
//     offset = new Coord(0.0f, 0.0f);
//     scale = new Coord(1.0f, 1.0f);
//     col = color(255);
//   }
//   DynamicObject(Coord o, Coord s, color c)
//   {
//    offset = o;
//    scale = s;
//    col = c;
//   }
    
//}

//class DynamicProperties
//{
//   Coord offset;
//   Coord scale;
//   color col;
//   DynamicProperties()
//   {
//     offset = new Coord(0.0f, 0.0f);
//     scale = new Coord(1.0f, 1.0f);
//     col = color(255);
//   }
//   DynamicProperties(Coord o, Coord s, color c)
//   {
//    offset = o;
//    scale = s;
//    col = c;
//   }
    
//}

//class Person
//{
//   DynamicProperties props;
//   Leg leftLeg;
//   Leg rightLeg;
   
//   Person()
//   {
//     props = new DynamicProperties(new Coord(0.0f, 0.0f),new Coord(1.0f, 1.0f), color(255));
//     rightLeg = new Leg(new Coord(230.0,280.0),new Coord( 250.0,320.0),
//             new Coord( 220.0,370.0) , new Coord(260.0,370.0));
//    leftLeg = new Leg(new Coord(170.0,280.0),new Coord( 150.0,320.0),
//             new Coord( 180.0,370.0) , new Coord(140.0,370.0));
//   }
//   Person(Coord o, Coord s, color c)
//   {
//    props = new DynamicProperties(o,s,c);
//     rightLeg = new Leg(new Coord(230.0,280.0),new Coord( 250.0,320.0),
//             new Coord( 220.0,370.0) , new Coord(260.0,370.0));
//    leftLeg = new Leg(new Coord(170.0,280.0),new Coord( 150.0,320.0),
//             new Coord( 180.0,370.0) , new Coord(140.0,370.0));
//   }
   
//   void dynamicDraw()
//   {
//     rightLeg.dynamicDraw(props.offset, props.scale, props.col);
//     leftLeg.dynamicDraw(props.offset, props.scale , props.col);
//   }
   

  
//}

////class Leg extends DynamicObject
//class Leg
//{
//    Coord hipPoint;
//    Coord kneePoint;
//    Coord anklePoint;
//    Coord footPoint;
//    Leg(Coord h, Coord k,Coord a, Coord f)
//    {
//     hipPoint = h;
//     kneePoint = k;
//     anklePoint = a;
//     footPoint = f;
//    }

//    void dynamicDraw(Coord offset, Coord scale, color col)
//    {

//    fill(255);
//    stroke(col);
//    bezier(hipPoint.x + offset.x,
//           hipPoint.y + offset.y, 
//           (kneePoint.x + offset.x) * scale.x,
//           (kneePoint.y + offset.y) * scale.y, 
//           (anklePoint.x + offset.x) * scale.x,
//           (anklePoint.y + offset.y) * scale.y,
//           (footPoint.x + offset.x) * scale.x,
//           (footPoint.y + offset.y) * scale.y);
//    }
//}
