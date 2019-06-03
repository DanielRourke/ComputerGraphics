


//public void saveShapes()
//{

//   for (int i  = 0; i < shapes.size(); i++)
             
               
               
//               addBox("Box", sizeX, sizeY , (sizeX + sizeY)/2, 
//                       (int)(cam.getPosition()[0] * 0.70),
//                       (int)(cam.getPosition()[1]* 0.70) ,
//                       (int)(cam.getPosition()[2] * 0.70 ));
               
               
//               println(shapes.get(i));
//               println(shapes.get(i).fill());
//               println(shapes.get(i).getPosVec());
//               println(shapes.get(i).getRotVec());
//               println(shapes.get(i).drawMode());
//               //get w b h;
//               println(shapes.get(i).getPosArray());
              
              
              
//               TableRow row = table.getRow(i);
//               println(row.getString("Type") , i);
               
//               println(red(c));
//            //   row.setInt("col", c);
//               //row.setFloat("colG", (int)green(c));
//               //row.setFloat("colB", (int)blue(c));
//               //row.setFloat("colA", (int)alpha(c));
//             }
//}





Table table;


public void saveShapes()
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
         table.addColumn("strCol");
         //table.addColumn("stoG");
         //table.addColumn("stoB");
         //table.addColumn("stoA");
         table.addColumn("strWeight");
         //table.addColumn("texPath");
         //table.addColumn("v1");
         //table.addColumn("v2");
         //table.addColumn("v3");
         //table.addColumn("v4");
         //table.addColumn("v5");
         //table.addColumn("v6");
         //table.addColumn("VSize");
         //table.addColumn("str");
         table.addColumn("drawT");
   for (int i  = 0; i < shapes.size(); i++)
   {
     println("saving", shapes.get(i));
            shapes.get(i).getPosArray(); 
           
  }
  
  
   saveTable(table, "/data/shapes.csv");
  
}

void loadShapes2()
{
  table = loadTable("/data/shapes.csv" , "header");
  {
    for (TableRow row :  table.rows()) 
    {
      
       String type = row.getString("Type");
           
           if(type.equals("Box"))
           {
            
                 DBox box = new DBox(this, row);
                 shapes.add(box);           
           }
           //else if(type.equals("Ellipsoid"))
           //{
           //      Ellipsoid sphere= new Ellipsoid(this, 20 ,30);
           //      sphere.setRadius(row.getFloat("Radius"));
           //      sphere.moveTo( row.getFloat("posX") ,
           //                     row.getFloat("posY") ,
           //                     row.getFloat("posZ"));
           //      if(row.getInt("draw") == 1)
           //      {
           //          sphere.fill(color(row.getInt("colR"),row.getInt("colG"),row.getInt("colB"),row.getInt("colA")));
           //      }
           //      shapes.add(sphere);
           //}
           //else if(type.equals("Toroid"))
           //  {
           //      Toroid toroid= new Toroid(this, 20 ,30);
           //      toroid.setRadius( row.getFloat("Width"),row.getFloat("Breadth"),row.getFloat("Height"));
           //      toroid.moveTo( row.getFloat("posX") ,
           //                     row.getFloat("posY") ,
           //                     row.getFloat("posZ"));
           //      toroid.rotateTo( row.getFloat("rotX"),
           //                       row.getFloat("rotY"),
           //                       row.getFloat("rotZ") );
           //      if(row.getInt("draw") == 1)
           //      {
           //          toroid.fill(color(row.getInt("colR"),row.getInt("colG"),row.getInt("colB"),row.getInt("colA")));
           //      }
           //      shapes.add(toroid);
           //}
           //else if(type.equals("Tube"))
           //{
           //          Tube tube= new Tube(this, 20 ,30);
           //          tube.setSize(row.getFloat("Width"),
           //                       row.getFloat("Breadth"),
           //                       row.getFloat("Width"), 
           //                       row.getFloat("Breadth"),
           //                       row.getFloat("Height"));
           //          tube.moveTo( row.getFloat("posX") ,
           //                       row.getFloat("posY") ,
           //                       row.getFloat("posZ"));
           //          if(row.getInt("draw") == 1)
           //          {
           //              tube.fill(color(row.getInt("colR"),row.getInt("colG"),row.getInt("colB"),row.getInt("colA")));
           //          }
           //          shapes.add(tube);
           //}
           
           //else if(type.equals("Cone"))
           //{
           //        Cone cone = new Cone(this, 20);
           //        cone.setSize(row.getFloat("Width"),  row.getFloat("Breadth"),row.getFloat("Height"));
           //        cone.moveTo( row.getFloat("posX") ,
           //                       row.getFloat("posY") ,
           //                       row.getFloat("posZ"));
           //       if(row.getInt("draw") == 1)
           //        {
           //            cone.fill(color(row.getInt("colR"),row.getInt("colG"),row.getInt("colB"),row.getInt("colA")));
           //        }
           //        shapes.add(cone); 
           //}
           //else if(type.equals("BezTube"))
           //{
           //    int s = row.getInt("VSize");
           //     PVector[] pointArray = new PVector[s];
               
           //     pointArray[0] = new PVector(row.getFloat("posX") ,
           //                                 row.getFloat("posY") ,
           //                                 row.getFloat("posZ"));
           //     pointArray[1] = new PVector( row.getFloat("rotX"),
           //                                  row.getFloat("rotY"),
           //                                  row.getFloat("rotZ") );
           //     if(s >2){
           //       pointArray[2] = new PVector( row.getFloat("v1"),
           //                                    row.getFloat("v2"),
           //                                    row.getFloat("v3"));
           //     }
           //     if(s>3){
           //       pointArray[3] = new PVector( row.getFloat("v4"),
           //                                    row.getFloat("v5"),
           //                                    row.getFloat("v6"));
           //     }
                  
           //     P_Bezier3D bez;
           //     BezTube btube;
           //     bez = new P_Bezier3D(pointArray, s);
           //     btube = new BezTube(this, bez, (int)row.getFloat("Width"),(int)row.getFloat("Breadth"), (int)row.getFloat("Height") );
                
           //      if(row.getInt("draw") == 1)
           //      {
           //        btube.fill(color(row.getInt("colR"),row.getInt("colG"),row.getInt("colB"),row.getInt("colA")));
           //      }
           //     shapes.add(btube);
           //}
           //else if(type.equals("Texter"))
           //{
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
