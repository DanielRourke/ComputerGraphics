


class DSphere extends Ellipsoid
{
  Float w;
  Float b;
  Float h;
  Float r;
  PVector pos;
  PVector rot;
  color fillColour;
  color strokeColour;
  float strokeWeight;
  PVector [] points;
  int pvSize;
  int drawT;
  
  DSphere(PApplet app,  int nbrSlices, int nbrSegments)
  {
    super(app, nbrSlices ,nbrSegments);
    points = null;
    pvSize = 0;
  }
  
   void setDraw(int d)
  {
    drawT = d;
  }
  
  int getDraw()
  {
    return drawT;
  }

  void setRadius(float radius)
  {
    super.setRadius(radius);
    w = radius;
    b = radius;
    h = radius;
  }
  
  
    float[] getPosArray(){
    float [] ret = new float[3];
    ret[0] = w;
    ret[1] = b;
    ret[2] = h;
    
    return ret;
    
  }

}
