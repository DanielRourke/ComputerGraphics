

void setupTable()
{
         table = new Table();
         table.addColumn("Type");
         table.addColumn("Width");
         table.addColumn("Height");
         table.addColumn("Breadth");
         table.addColumn("Radius");
         table.addColumn("posX");
         table.addColumn("posY");
         table.addColumn("posZ");
         table.addColumn("rotX");
         table.addColumn("rotY");
         table.addColumn("rotZ");
         //table.addColumn("colR");
         //table.addColumn("ColG");
         //table.addColumn("colB");
         //table.addColumn("colA");
         table.addColumn("Col");  
         table.addColumn("stoR");
         table.addColumn("stoG");
         table.addColumn("stoB");
         table.addColumn("stoA");
         table.addColumn("strokeWeight");
         table.addColumn("texture");
         table.addColumn("v1");
         table.addColumn("v2");
         table.addColumn("v3");
         table.addColumn("v4");
         table.addColumn("v5");
         table.addColumn("v6");
         table.addColumn("VSize");
         table.addColumn("str");
         table.addColumn("draw");
}
   
   
void addBox(String s, float w, float b , float h, float x, float y , float z)
{
   
   TableRow newRow = table.addRow();
   
       newRow.setString("Type", s);
       newRow.setFloat("Width",w );
       newRow.setFloat("Height",h );
       newRow.setFloat("Breadth",b );
       newRow.setFloat("posX", x);
       newRow.setFloat("posY", y);
       newRow.setFloat("posZ", z);
}
         
void addSphere(String s, float x, float y , float z, float r)
{
    TableRow newRow = table.addRow();
       newRow.setString("Type", s);
       newRow.setFloat("Radius", r );
       newRow.setFloat("posX", x);
       newRow.setFloat("posY", y);
       newRow.setFloat("posZ", z);
   
}
 
 void addToroid(String s, float w, float b , float h,float x, float y , float z, float rx, float ry , float rz)
 {
   TableRow newRow = table.addRow();
       newRow.setString("Type", s);
       newRow.setFloat("Width",w );
       newRow.setFloat("Height",h );
       newRow.setFloat("Breadth",b );
       newRow.setFloat("posX", x);
       newRow.setFloat("posY", y);
       newRow.setFloat("posZ", z);
       newRow.setFloat("rotX", rx);
       newRow.setFloat("rotY", ry);
       newRow.setFloat("rotZ", rz);
   
 }
         
 void addTube(String s, float w, float b , float h,float x, float y , float z)
 {
   TableRow newRow = table.addRow();
       newRow.setString("Type", s);
       newRow.setFloat("Width",w );
       newRow.setFloat("Height",h );
       newRow.setFloat("Breadth",b );
       newRow.setFloat("posX", x);
       newRow.setFloat("posY", y);
       newRow.setFloat("posZ", z);
 }
 
 void addCone(String s, float w, float b , float h,float x, float y , float z)
 {
   TableRow newRow = table.addRow();
       newRow.setString("Type", s);
       newRow.setFloat("Width",w );
       newRow.setFloat("Height",h );
       newRow.setFloat("Breadth",b );
       newRow.setFloat("posX", x);
       newRow.setFloat("posY", y);
       newRow.setFloat("posZ", z);
 }
 
 void addBezTube(String s, float w, float b , float h, PVector[] pointArray , int size)
 {
      TableRow newRow = table.addRow();
       newRow.setString("Type", s);
       newRow.setFloat("Width",w );
       newRow.setFloat("Height",h );
       newRow.setFloat("Breadth",b );
       newRow.setInt("VSize", size);
       newRow.setFloat("posX", pointArray[0].x);
       newRow.setFloat("posY", pointArray[0].y);
       newRow.setFloat("posZ", pointArray[0].z);
       newRow.setFloat("rotX", pointArray[1].x);
       newRow.setFloat("rotY", pointArray[1].y);
       newRow.setFloat("rotZ", pointArray[1].z);
       
       if(size > 2)
       {
           newRow.setFloat("v1", pointArray[2].x);
           newRow.setFloat("v2", pointArray[2].y);
           newRow.setFloat("v3", pointArray[2].z);
       }

       if(size > 3)
       {
           newRow.setFloat("v4", pointArray[3].x);
           newRow.setFloat("v5", pointArray[3].y);
           newRow.setFloat("v6", pointArray[3].z);
       }

 }

         
void loadShapes()
{
  table = loadTable("/data/shapes.csv" , "header");
  {
    for (TableRow row :  table.rows()) 
    {
           String type = row.getString("Type");
           
           if(type.equals("Box"))
           {
            
                 shapes3d.Box box = new shapes3d.Box(this,row.getFloat("Width"), row.getFloat("Breadth"),row.getFloat("Height"));
                 box.moveTo(row.getFloat("posX") ,
                            row.getFloat("posY") ,
                            row.getFloat("posZ"));
                 if(row.getInt("draw") == 1)
                 {
                   box.fill(color(row.getInt("colR"),row.getInt("colG"),row.getInt("colB"),row.getInt("colA")));
                 }
                 
                 shapes.add(box);           
           }
           else if(type.equals("Ellipsoid"))
           {
                 Ellipsoid sphere= new Ellipsoid(this, 20 ,30);
                 sphere.setRadius(row.getFloat("Radius"));
                 sphere.moveTo( row.getFloat("posX") ,
                                row.getFloat("posY") ,
                                row.getFloat("posZ"));
                 if(row.getInt("draw") == 1)
                 {
                     sphere.fill(color(row.getInt("colR"),row.getInt("colG"),row.getInt("colB"),row.getInt("colA")));
                 }
                 shapes.add(sphere);
           }
           else if(type.equals("Toroid"))
             {
                 Toroid toroid= new Toroid(this, 20 ,30);
                 toroid.setRadius( row.getFloat("Width"),row.getFloat("Breadth"),row.getFloat("Height"));
                 toroid.moveTo( row.getFloat("posX") ,
                                row.getFloat("posY") ,
                                row.getFloat("posZ"));
                 toroid.rotateTo( row.getFloat("rotX"),
                                  row.getFloat("rotY"),
                                  row.getFloat("rotZ") );
                 if(row.getInt("draw") == 1)
                 {
                     toroid.fill(color(row.getInt("colR"),row.getInt("colG"),row.getInt("colB"),row.getInt("colA")));
                 }
                 shapes.add(toroid);
           }
           else if(type.equals("Tube"))
           {
                     Tube tube= new Tube(this, 20 ,30);
                     tube.setSize(row.getFloat("Width"),
                                  row.getFloat("Breadth"),
                                  row.getFloat("Width"), 
                                  row.getFloat("Breadth"),
                                  row.getFloat("Height"));
                     tube.moveTo( row.getFloat("posX") ,
                                  row.getFloat("posY") ,
                                  row.getFloat("posZ"));
                     if(row.getInt("draw") == 1)
                     {
                         tube.fill(color(row.getInt("colR"),row.getInt("colG"),row.getInt("colB"),row.getInt("colA")));
                     }
                     shapes.add(tube);
           }
           
           else if(type.equals("Cone"))
           {
                   Cone cone = new Cone(this, 20);
                   cone.setSize(row.getFloat("Width"),  row.getFloat("Breadth"),row.getFloat("Height"));
                   cone.moveTo( row.getFloat("posX") ,
                                  row.getFloat("posY") ,
                                  row.getFloat("posZ"));
                  if(row.getInt("draw") == 1)
                   {
                       cone.fill(color(row.getInt("colR"),row.getInt("colG"),row.getInt("colB"),row.getInt("colA")));
                   }
                   shapes.add(cone); 
           }
           else if(type.equals("BezTube"))
           {
               int s = row.getInt("VSize");
                PVector[] pointArray = new PVector[s];
               
                pointArray[0] = new PVector(row.getFloat("posX") ,
                                            row.getFloat("posY") ,
                                            row.getFloat("posZ"));
                pointArray[1] = new PVector( row.getFloat("rotX"),
                                             row.getFloat("rotY"),
                                             row.getFloat("rotZ") );
                if(s >2){
                  pointArray[2] = new PVector( row.getFloat("v1"),
                                               row.getFloat("v2"),
                                               row.getFloat("v3"));
                }
                if(s>3){
                  pointArray[3] = new PVector( row.getFloat("v4"),
                                               row.getFloat("v5"),
                                               row.getFloat("v6"));
                }
                  
                P_Bezier3D bez;
                BezTube btube;
                bez = new P_Bezier3D(pointArray, s);
                btube = new BezTube(this, bez, (int)row.getFloat("Width"),(int)row.getFloat("Breadth"), (int)row.getFloat("Height") );
                
                 if(row.getInt("draw") == 1)
                 {
                   btube.fill(color(row.getInt("colR"),row.getInt("colG"),row.getInt("colB"),row.getInt("colA")));
                 }
                shapes.add(btube);
           }
           else if(type.equals("Texter"))
           {
             //TODO: fix Words
             //println("got here");
             //TextShape t = new TextShape(row.getString("str"), 
             //                       row.getFloat("posX") ,
             //                       row.getFloat("posY") ,
             //                       row.getFloat("posZ") ,
             //                       row.getFloat("rotX"),
             //                       row.getFloat("rotY"),
             //                       row.getFloat("rotZ") );
             //                       println("but not here here");
             // shapes.add(t);
             // break;
           }
           
  }
  
}

}    


//void getColors()
//{
    
//       for (int i  = 0; i < shapes.size(); i++)
//       {
         
                 
//                 color colorpick = shapes.get(i).fill();
//                 previousColor = shapes.get(i).fill();
//                 TableRow row = table.getRow(i);
 
//             row.setFloat("colR", red(colorPick));
//           row.setFloat("colG", green(colorPick));
//           row.setFloat("colB", blue(colorPick));
//           row.setFloat("draw", 1);
                 
//          }
//       }

  
//}
           
           //        row.getFloat("Width");
           //        row.getFloat("Height");
           //        row.getFloat("Breadth");
           //        row.getFloat("posX");
           //        row.getFloat("posY");
           //        row.getFloat("posZ");
           //        row.getFloat("rotX");
           //        row.getFloat("rotY");
           //        row.getFloat("rotZ");
           //        row.getFloat("v1");
           //        row.getFloat("v2");
           //        row.getFloat("v3");
           //        row.getFloat("v4");
           //        row.getFloat("v5");
           //        row.getFloat("v6");
           //        row.getFloat("Radius");
           //        row.getInt("VSize");
//class ShapeItems
//{
//  String type;
//  float posX;
//  float posY;
//  float posZ;
//  float rotX;
//  float rotY;
//  float rotZ;
//  String colour;
//  String strokeColour
//  String 
//}
