
Table table;
void saveShapes()
{
  
  //           shapes3d.Box box = new shapes3d.Box(this,sizeX, sizeY, (sizeX + sizeY)/2);
  //         box.moveTo((int)(cam.getPosition()[0] * 0.70) ,(int)(cam.getPosition()[1]* 0.70) ,(int)(cam.getPosition()[2] * 0.70 ));
  //         shapes.add(box);
  //         picked = shapes.get(shapes.size() - 1);
  
  
  
 // w b h
 //position 
 //rotation
 //type
 //color
 // texture
 //stroke weirght
 //stoke color
 
 
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
         table.addColumn("colR");
         table.addColumn("ColG");
         table.addColumn("colB");
         table.addColumn("colA");
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
         
          for (Shape3D shape : shapes)
          {
             TableRow newRow = table.addRow();
            
            newRow.setString("Type", shape.tag);
            newRow.SetFloat("Width", );
            newRow.SetFloat("Height", );
            newRow.SetFloat("Breadth", );
            newRow.SetFloat("Radius", );
            newRow.SetFloat("posX", );
            newRow.SetFloat("posY", );
            newRow.SetFloat("posZ", );
            newRow.SetFloat("rotX", );
            newRow.SetFloat("rotY", );
            newRow.SetFloat("rotZ", );
             newRow.setInt("colR", );
             newRow.setInt("ColG", );
             newRow.setInt("colB", );
             newRow.setInt("colA", );
             newRow.setInt("stoR", );
             newRow.setInt("stoG", );
             newRow.setInt("stoB", );
             newRow.setInt("stoA", );
            newRow.SetFloat("strokeWeight", );
            newRow.SetString("texture", );
            newRow.SetFloat("", );
            
          }
   }       
   
   
   
   
         void addBox()
         {
           
           TableRow newRow = table.addRow();
           
               newRow.setString("Type", "Box");
               newRow.SetFloat("Width", );
               newRow.SetFloat("Height", );
               newRow.SetFloat("Breadth", );
               newRow.SetFloat("posX", );
               newRow.SetFloat("posY", );
               newRow.SetFloat("posZ", );
           
         }
         
         void addSphere()
         {
            TableRow newRow = table.addRow();
               newRow.setString("Type", "Ellipsoid");
               newRow.SetFloat("Radius", );
               newRow.SetFloat("posX", );
               newRow.SetFloat("posY", );
               newRow.SetFloat("posZ", );
           
         }
 
         void addToroid()
         {
           TableRow newRow = table.addRow();
               newRow.setString("Type", "Toroid");
               newRow.SetFloat("Width", );
               newRow.SetFloat("Height", );
               newRow.SetFloat("Breadth", );
               newRow.SetFloat("posX", );
               newRow.SetFloat("posY", );
               newRow.SetFloat("posZ", );
               newRow.SetFloat("rotX", );
               newRow.SetFloat("rotY", );
               newRow.SetFloat("rotZ", );
           
         }
         
         void addTube()
         {
           TableRow newRow = table.addRow();
               newRow.setString("Type", "Tube");
               newRow.SetFloat("Width", );
               newRow.SetFloat("Height", );
               newRow.SetFloat("Breadth", );
               newRow.SetFloat("posX", );
               newRow.SetFloat("posY", );
               newRow.SetFloat("posZ", );
         }
         
         void addCone()
         {
           TableRow newRow = table.addRow();
               newRow.setString("Type", "Cone");
               newRow.SetFloat("Width", );
               newRow.SetFloat("Height", );
               newRow.SetFloat("Breadth", );
               newRow.SetFloat("posX", );
               newRow.SetFloat("posY", );
               newRow.SetFloat("posZ", ); 
         }
 
 
 
 
          
 
 
 
         void move()
         {
           
         }

  


void loadShapes()
{
  
}


class ShapeItems
{
  String type;
  float posX;
  float posY;
  float posZ;
  float rotX;
  float rotY;
  float rotZ;
  String colour;
  String strokeColour
  String 
}
