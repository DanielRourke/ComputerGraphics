


PFont font;



void textSetup()
{
   text = new ArrayList<String>();
   font = createFont(  "Chunkfive.otf", 5);
   textFont(font);
   textAlign(CENTER, CENTER);
   textMode(SHAPE);
}


class TextShape extends Shape3D
{
  String text;
  float posX;
  float posY;
  float posZ;
  float rotX;
  float rotY;
  float rotZ;
  TextShape(String s, float x, float y , float z, float rx, float ry , float rz)
  {
       super();
       text = s;
       posX = x;
       posY = y;
       posZ = z;
       rotX = rx;
       rotY = ry;
       rotZ = rz;
       
       
       //TableRow newRow = table.addRow();
       //newRow.setString("Type", "Texter");
       //newRow.setString("str", s);
       //newRow.setFloat("posX", x);
       //newRow.setFloat("posY", y);
       //newRow.setFloat("posZ", z);
       //newRow.setFloat("rotX", rx);
       //newRow.setFloat("rotY", ry);
       //newRow.setFloat("rotZ", rz);
  }
  
  
  void draw()
  {
    pushMatrix();

    translate(posX, posY, posZ);
    rotateX(rotX);
    rotateY(rotY);
    rotateZ(rotZ);
    text(text,0,0,0) ;
    popMatrix();
  }
  
  void calcShape()
  {
  }
  
  void move(float x, float y , float z)
  {
       posX = x;
       posY = y;
       posZ = z;
  }
}


void textBuilder()
{
  if(key == '\n')
  {
          TextShape t = new TextShape(tempString , 
                                (int)(cam.getPosition()[0] * 0.70) ,
                                (int)(cam.getPosition()[1] * 0.70) ,
                                (int)(cam.getPosition()[2] * 0.70) ,
                                cam.getRotations()[0] ,
                                cam.getRotations()[1] ,
                                cam.getRotations()[2]  );
          shapes.add(t);
            println(" adding " , tempString);
          addTextActive = false;
          tempString = "";
          println(cam.getRotations());
  }
  else if(addTextActive)
  {
    if(key != CODED)
    {
      tempString += key;
      println(key);
    }
  }
}
