


class Car extends Shape3D
{
    Shape3D parent;
    Box base;
    Box body;
    Toroid[] wheels;
    Tube windshield;
    color wheelColor;
    color bodyColor;
    float bodySize;
    float wheelSize;
    int position;
  Car(PApplet app, color wColour, color bColour, float bSize, float wSize, int pos)
  {
        super();
        position = pos;
        //make base
        parent = new Box(app,0,0,0);
        bodyColor = bColour;
        wheelColor = wColour;
        bodySize = bSize;
        wheelSize = wSize;
        base = new Box(app, 200 * bodySize,50 * bodySize,100 * bodySize);
        base.fill(bodyColor);
        parent.addShape(base);
        
        
        //make body
        body = new Box(app, 100 * bodySize, 50 * bodySize, 100 * bodySize);
        body.fill(bodyColor);
        body.moveTo(20 * bodySize, -45 * bodySize, 0);
        parent.addShape(body);
        
        //make wheels
        wheels = new Toroid[4];
        for (int i = 0; i < 4 ;i ++)
        {
           wheels[i] = new Toroid(app, 30, 20);
           wheels[i].setRadius(9 * wheelSize,6* wheelSize,18* wheelSize);
           wheels[i].fill(wheelColor);
           
        }
        
          wheels[0].moveTo(-75 * wheelSize, 35* wheelSize, 60* wheelSize);
          wheels[0].rotateBy(radians(90), 0, 0);
          wheels[1].moveTo(-75* wheelSize, 35* wheelSize, -60* wheelSize);
          wheels[1].rotateBy(radians(90), 0, 0);
          wheels[2].moveTo(75* wheelSize, 35* wheelSize, 60* wheelSize);
          wheels[2].rotateBy(radians(90), 0, 0);
          wheels[3].moveTo(75* wheelSize, 35* wheelSize, -60* wheelSize);
          wheels[3].rotateBy(radians(90), 0, 0);
          parent.addShape(wheels[0]);
          parent.addShape(wheels[1]);
          parent.addShape(wheels[2]);
          parent.addShape(wheels[3]);
          

          //make windshield
          windshield = new Tube(app, 10,3);
          windshield.setSize(30 * bodySize, 30 * bodySize, 30 * bodySize, 30 * bodySize, 100 * bodySize);
          windshield.moveTo(-30 * bodySize, -40 * bodySize, 0);
          windshield.rotateBy(radians(90), radians(30), 0);
          windshield.drawMode(Shape3D.ALL);
          windshield.fill(bodyColor,Tube.S_CAP);
          windshield.fill(bodyColor,Tube.E_CAP);
          parent.addShape(windshield);
       
         this.addShape(parent);         
                  
                  
       // this.fill(bodyColor);
       moveTo(start[position].x, start[position].y,start[position].z);
       parent.moveTo(start[position]);
  }
  public void drive()
  {
      if(parent.x() != end[position].x)
      {
               moveBy(-1,0,0);
       parent.moveBy(-1,0,0);
      }
      else
      {
         moveTo(start[position].x, start[position].y,start[position].z);
       parent.moveTo(start[position]);
      }

  }
  float fade = 255;
  public void fade()
  {
     fade -= 0.50;
     bodyColor = color (red(bodyColor),green(bodyColor),blue(bodyColor), fade);
     resetColours();
  }
  
  public void setBodyColour(color bodyColor)
  {
      body.fill(bodyColor);
      windshield.fill(bodyColor,Tube.S_CAP);
      windshield.fill(bodyColor,Tube.E_CAP);
      base.fill(bodyColor);
  }
  
  public void setWheelColour(color wheelColor)
  {
       for (int i = 0; i < 4 ;i ++)
           wheels[i].fill(wheelColor);

  }
  
  void setBodySize()
  {
    
  }
  
  void setWheelSize()
  {
    
  }
  
  void resetColours()
  {
       setBodyColour(bodyColor);
       setWheelColour(wheelColor);
  }
  
  @Override
  void fill(color col)
  {
        setBodyColour(col);
       setWheelColour(col);
  }
  @Override
  public void moveBy(float x, float y, float z)
  {
     
        moveBy(new PVector(x,y,z));
        parent.moveBy(x,y,z);
    
  }
  @Override
  public void moveTo(float x, float y, float z)
  {
    println("calling this", x ,x ,z);
    moveTo(new PVector(x,y,z));
    parent.moveTo(x,y,z);
  }
  void draw()
  {
    //for (int i = 0 ; i < this.children.size(); i ++)
    //{
    //  this.children.get(i).draw();
    //}
    drive();
    parent.draw();
    
    
  
  }
  
  void calcShape(){
  }
  
    
 
}
