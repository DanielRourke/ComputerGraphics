


class DBezTube extends BezTube
{
  int drawT;
  String texPath;
  Float w;
  Float b;
  Float h;
  PVector pointArray[];
  int size;
   DBezTube(PApplet app ,PVector[] p)
   {
     
     super(app, new P_Bezier3D(p, p.length), 7 ,7,7);
    w = 7.0;
    b =  7.0;
    h = 7.0;
    pointArray = p;
    size = p.length;
   }
  
  
    DBezTube(PApplet app ,TableRow row, PVector[] p)
    {
       
      super(app, new P_Bezier3D(p, p.length), (int)row.getFloat("Width"),(int)row.getFloat("Breadth"), (int)row.getFloat("Height") );
      drawT =  row.getInt("drawT");
     super.scale(row.getFloat("scale"));
            if(drawT == 1)
       {
             drawMode(Shape3D.SOLID);
             fill(row.getInt("Col"));
       }
       else if (drawT == 2)
       {
         drawMode( Shape3D.WIRE);
         stroke(row.getInt("strCol"));
         strokeWeight(row.getFloat("strWeight"));
       }
       else if(drawT == 3)
       {
        drawMode(Shape3D.SOLID | Shape3D.WIRE);
         fill(row.getInt("Col"));
         stroke(row.getInt("strCol"));
         strokeWeight(row.getFloat("strWeight"));
       }
       
       else if( drawT == 4)
       {
         texPath = row.getString("texPath" );
         super.drawMode(S3D.TEXTURE);
         super.setTexture(texPath);
       }
    }
    
    
    float[] getPosArray()
  {
      TableRow newRow = table.addRow();
       newRow.setString("Type", "DBezTube");
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

       newRow.setFloat("scale", scale());
       newRow.setInt("drawT", drawT);
       
       
       if(drawT == 1 || drawT == 3)
       {
         newRow.setInt("Col", fillColor);
       }
       else if (drawT == 2 || drawT == 3)
       {
         println(super.stroke());
         newRow.setInt("strCol", stroke());
         newRow.setFloat("strWeight", strokeWeight());
       }
       else if (drawT == 4)
       {
         newRow.setString("texPath", texPath);
       }
       
       return null;
  }
    
      void drawMode(int mode)
  {
    if(mode ==Shape3D.SOLID)
    {
      drawT =1;
    }
    else if(mode == Shape3D.WIRE)
    {
      drawT = 2 ;
    }
    else if(mode == (Shape3D.WIRE | Shape3D.SOLID))
    {
      drawT = 3;
    }
    else if(mode == Shape3D.TEXTURE)
    {
      drawT = 4;
    }
    
    
  }
  
    void setTexture(String s)
  {
    super.setTexture(s, 2 ,1);
    
    drawT = 4;
    texPath = s;
  }
}
