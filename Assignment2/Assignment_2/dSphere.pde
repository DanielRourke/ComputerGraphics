


class DSphere extends Ellipsoid
{
  Float w;
  Float b;
  Float h;
  Float r;
  //PVector pos;
  //PVector rot;
  //color fillColour;
  //color strokeColour;
  //float strokeWeight;
  //PVector [] points;
  //int pvSize;
  int drawT;
  String texPath;
  
  DSphere(PApplet app,  int nbrSlices, int nbrSegments)
  {
    super(app, nbrSlices ,nbrSegments);
  }
  
  DSphere(PApplet app,  TableRow row)
  {
    super(app, 20 , 30);
    w = row.getFloat("Width");
    b =  row.getFloat("Breadth");
    h = row.getFloat("Height");
    super.setRadius(w);
    super.moveTo(row.getFloat("posX") ,
                           row.getFloat("posY") ,
                            row.getFloat("posZ"));
    super.rotateTo( row.getFloat("rotX"),
                                  row.getFloat("rotY"),
                                  row.getFloat("rotZ") );
                            
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
  
  // void setDraw(int d)
  //{
  //  drawT = d;
  //}
  
  //int getDraw()
  //{
  //  return drawT;
  //}

  void setRadius(float radius)
  {
    super.setRadius(radius);
    w = radius;
    b = radius;
    h = radius;
  }
  
  
  void setTexture(String s)
  {
    super.setTexture(s);
    
    drawT = 4;
    texPath = s;
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
    
    super.drawMode(mode);
  }
  
  float[] getPosArray()
  {
       TableRow newRow = table.addRow();
        
       newRow.setString("Type", "DSphere");
       newRow.setFloat("Width",w );
       newRow.setFloat("Height",h );
       newRow.setFloat("Breadth",b );
       newRow.setFloat("posX", x());
       newRow.setFloat("posY", y());
       newRow.setFloat("posZ", z());
       newRow.setFloat("rotX", rot.x);
       newRow.setFloat("rotY", rot.y);
       newRow.setFloat("rotZ", rot.z);
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

}
