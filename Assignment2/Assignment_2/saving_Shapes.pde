
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
         table.addColumn("v6");
         
          //for (Shape3D shape : shapes)
          //{
          //   TableRow newRow = table.addRow();
            
          //  newRow.setString("Type", shape.tag);
          //  newRow.SetFloat("Width", );
          //  newRow.SetFloat("Height", );
          //  newRow.SetFloat("Breadth", );
          //  newRow.SetFloat("Radius", );
          //  newRow.SetFloat("posX", );
          //  newRow.SetFloat("posY", );
          //  newRow.SetFloat("posZ", );
          //  newRow.SetFloat("rotX", );
          //  newRow.SetFloat("rotY", );
          //  newRow.SetFloat("rotZ", );
          //   newRow.setInt("colR", );
          //   newRow.setInt("ColG", );
          //   newRow.setInt("colB", );
          //   newRow.setInt("colA", );
          //   newRow.setInt("stoR", );
          //   newRow.setInt("stoG", );
          //   newRow.setInt("stoB", );
          //   newRow.setInt("stoA", );
          //  newRow.SetFloat("strokeWeight", );
          //  newRow.SetString("texture", );
          //  newRow.SetFloat("", );
            
          //}
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
 
 void addBezTube(String s, float w, float b , float h, PVector[] pointArray )
 {
      TableRow newRow = table.addRow();
       newRow.setString("Type", s);
       newRow.setFloat("Width",w );
       newRow.setFloat("Height",h );
       newRow.setFloat("Breadth",b );
       newRow.setFloat("posX", pointArray[0].x);
       newRow.setFloat("posY", pointArray[0].y);
       newRow.setFloat("posZ", pointArray[0].z);
       newRow.setFloat("rotX", pointArray[1].x);
       newRow.setFloat("rotY", pointArray[1].y);
       newRow.setFloat("rotZ", pointArray[1].z);
       if(pointArray.length > 2)
       {
           newRow.setFloat("v1", pointArray[2].x);
           newRow.setFloat("v2", pointArray[2].y);
           newRow.setFloat("v3", pointArray[2].z);
       }

       if(pointArray.length > 3)
       {
           newRow.setFloat("v4", pointArray[3].x);
           newRow.setFloat("v5", pointArray[3].y);
           newRow.setFloat("v6", pointArray[3].z);
       }

 }

          
 
void createBox()
{
  shapes3d.Box box = new shapes3d.Box(this,row.getFloat("Width");,row.getFloat("Height"), row.getFloat("Breadth"));
}

void createSphere()
{
}

void create Toroid()
{
  
}

void createTube()
{
  
}

void createCone();
{
  
}

void createBezTube();
{
  
}

  


void loadShapes()
{
  table = loadTable("shapes.csv" , "header");
 
  {
    for (TableRow row :  table.rows()) 
    {
            
           String type =  row.getString("Type");
           
           if(type.equals("Box"))
           {
               shapes3d.Box box = new shapes3d.Box(this,row.getFloat("Width");,row.getFloat("Height"), row.getFloat("Breadth"));
               box.moveTo(row.getFloat("posX") ,
                          row.getFloat("posY") ,
                          row.getFloat("posZ"));
               shapes.add(box);           
           }
           else if(type.equals("Ellipsoid"))
           {
               Ellipsoid sphere= new Ellipsoid(this, 20 ,30);
               sphere.setRadius(row.getFloat("Radius"));
               sphere.moveTo( row.getFloat("posX") ,
                              row.getFloat("posY") ,
                              row.getFloat("posZ"));
             shapes.add(sphere);
           }
           else if(type.equals("Toroid"))
           {
             Toroid toroid= new Toroid(this, 20 ,30);
           toroid.setRadius( row.getFloat("Width"),row.getFloat("Height"),row.getFloat("Breadth");
           toroid.moveTo( row.getFloat("posX") ,
                          row.getFloat("posY") ,
                          row.getFloat("posZ"));
           toroid.rotateTo( row.getFloat("rotX"),
                            row.getFloat("rotY"),
                            row.getFloat("rotZ") );
           shapes.add(toroid);
           }
           
           
           
           
                   row.getFloat("Width");
                   row.getFloat("Height");
                   row.getFloat("Breadth");
                   row.getFloat("posX");
                   row.getFloat("posY");
                   row.getFloat("posZ");
                   row.getFloat("rotX");
                   row.getFloat("rotY");
                   row.getFloat("rotZ");
                   row.getFloat("v1");
                   row.getFloat("v2");
                   row.getFloat("v3");
                   row.getFloat("v4");
                   row.getFloat("v5");
                   row.getFloat("v6");
                   row.getFloat("Radius");

  }
  
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
