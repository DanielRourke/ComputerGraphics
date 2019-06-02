
boolean addTextActive;
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
