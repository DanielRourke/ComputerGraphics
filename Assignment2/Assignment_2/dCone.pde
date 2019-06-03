


class DCone extends Cone
{
  
    int drawT;
  String texPath;
  Float w;
  Float b;
  Float h;
  DCone(PApplet app)
  {
    super(app, 20);
  }
  
    void setTexture(String s)
  {
    super.setTexture(s);
    
    drawT = 4;
    texPath = s;
  }
  
}
