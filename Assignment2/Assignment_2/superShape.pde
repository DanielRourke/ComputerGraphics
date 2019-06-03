

class SuperShape extends Shape3D
{
  Shape3D parent;
  
  void draw()
  {
      parent.draw();
  }
  
  void calcShape()
  {
    
  }
}
