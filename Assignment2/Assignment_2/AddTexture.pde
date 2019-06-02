



void addTexture()
{
          
             if (picked.tag.equals("Box"))
             {
               picked.drawMode(S3D.TEXTURE);
               selectInput("Select a Texture" , "boxTexture");
             }
             else if (picked.tag.equals("Ellipsoid"))
             {
               picked.drawMode(S3D.WIRE |S3D.TEXTURE);
               picked.strokeWeight(0);
               selectInput("Select a Texture" , "boxTexture");
             }
             else if (picked.tag.equals("Toroid"))
             {
                picked.drawMode(Shape3D.TEXTURE);
               selectInput("Select a Texture" , "toroidTexture");
             }
             else if (picked.tag.equals("Tube"))
             {
                     //picked.drawMode(S3D.TEXTURE , S3D.S_CAP | S3D.E_CAP);
                     selectInput("Select a Texture" , "tubeTexture");
             }
             else if (picked.tag.equals("Cone"))
             {
               picked.drawMode(Shape3D.TEXTURE, S3D.CONE);
               selectInput("Select a Texture" , "coneTexture");
             }
             else if (picked.tag.equals("BezTube"))
             {
                     //picked.drawMode(S3D.TEXTURE);
                     //picked.drawMode(S3D.TEXTURE, S3D.BOTH_CAP);
                     selectInput("Select a Texture" , "beztubeTexture");
             }
             
             
     
            cam.reset();

}



void  boxTexture(File selection) {
  if (selection == null) {
      println("Window was closed or the user hit cancel.");
  } else {
     picked.setTexture(selection.getAbsolutePath());
     picked = null;
  }
}


void  coneTexture(File selection) {
  if (selection == null) {
      println("Window was closed or the user hit cancel.");
  } else {
    if( picked instanceof Cone)
    {
      Cone c = (Cone)picked;
      c.setTexture(selection.getAbsolutePath(), S3D.CONE);
    }
     
     picked = null;
  }
}


void  toroidTexture(File selection) {
  if (selection == null) {
      println("Window was closed or the user hit cancel.");
  } else {
    if( picked instanceof Toroid)
    {
      Toroid c = (Toroid)picked;
      c.setTexture(selection.getAbsolutePath(), 6, 1);
    }
     
     picked = null;
  }
}


void  tubeTexture(File selection) {
  if (selection == null) {
      println("Window was closed or the user hit cancel.");
  } else {
    if( picked instanceof Tube)
    {
      Tube c = (Tube)picked;
      c.setTexture(selection.getAbsolutePath(), 2 ,1);
       c.drawMode(S3D.TEXTURE);
    }
     
     picked = null;
  }
}


void  beztubeTexture(File selection) {
  if (selection == null) {
      println("Window was closed or the user hit cancel.");
  } else {
    if( picked instanceof BezTube)
    {
      BezTube c = (BezTube)picked;
      c.setTexture(selection.getAbsolutePath(), 2 ,1);
      //c.setTexture(selection.getAbsolutePath(), S3D.S_CAP);
      //c.setTexture(selection.getAbsolutePath(), S3D.E_CAP);
       c.drawMode(S3D.TEXTURE);
    }
     
     picked = null;
  }
}
