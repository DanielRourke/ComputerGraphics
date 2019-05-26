


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
  Car(PApplet app, color wColour, color bColour, float bSize, float wSize)
  {
        //make base
        // parent = new Box(app, 200 * bodySize,125 * bodySize,100 * bodySize);
        bodyColor = bColour;
        wheelColor = wColour;
        bodySize = bSize;
        wheelSize = wSize;
        base = new Box(app, 200 * bodySize,50 * bodySize,100 * bodySize);
        base.fill(bodyColor);
        this.addShape(base);
        
        
        //make body
        body = new Box(app, 100 * bodySize, 50 * bodySize, 100 * bodySize);
        body.fill(bodyColor);
        body.moveTo(20 * bodySize, -45 * bodySize, 0);
        this.addShape(body);
        
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
          this.addShape(wheels[0]);
          this.addShape(wheels[1]);
          this.addShape(wheels[2]);
          this.addShape(wheels[3]);
          

          //make windshield
          windshield = new Tube(app, 10,3);
          windshield.setSize(30 * bodySize, 30 * bodySize, 30 * bodySize, 30 * bodySize, 100 * bodySize);
          windshield.moveTo(-30 * bodySize, -40 * bodySize, 0);
          windshield.rotateBy(radians(90), radians(30), 0);
          windshield.drawMode(Shape3D.ALL);
          windshield.fill(bodyColor,Tube.S_CAP);
          windshield.fill(bodyColor,Tube.E_CAP);
          this.addShape(windshield);
       
                  
                  
                  
       // this.fill(bodyColor);
       moveTo(width/2,height/2,-800);
         
  }
  public void test()
  {
    
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
  public void moveTo(float x, float y, float z)
  {
    println("calling this");
    moveTo(new PVector(x,y,z));
    for (int i = 0 ; i < this.children.size(); i ++)
    {
        this.children.get(i).moveTo(new PVector(z,y,z));
    }
    
     body.moveTo(20 * bodySize, -45 * bodySize, 0);
     windshield.moveTo(x -30 * bodySize, y- 40 * bodySize, 0);
     wheels[0].moveTo(x -75 * wheelSize, y + 35* wheelSize, 60* wheelSize);
     wheels[1].moveTo(x-75* wheelSize, y + 35* wheelSize, -60* wheelSize);
     wheels[2].moveTo(x +75* wheelSize, y +35* wheelSize, 60* wheelSize);
     wheels[3].moveTo(x +75* wheelSize, y +35* wheelSize, -60* wheelSize);
  }
  void draw()
  {
    for (int i = 0 ; i < this.children.size(); i ++)
    {
      this.children.get(i).draw();
    }
    
  
  }
  
  void calcShape(){
  }
  
    public Shape3D pickShapes(PApplet papplet, int x, int y){
    if(pickBuffer == null || pickBuffer.width != papplet.width || pickBuffer.height != papplet.height){
      pickBuffer = (PGraphics3D) papplet.createGraphics(papplet.width, papplet.height, P3D);
    }
    pickBuffer.beginDraw();
    // Set the camera same as the drawing surface
    pickBuffer.camera.set(((PGraphicsOpenGL)papplet.g).camera);
    pickBuffer.projection.set(((PGraphicsOpenGL)papplet.g).projection);
    pickBuffer.modelview.set(((PGraphicsOpenGL)papplet.g).modelview);
    pickBuffer.noSmooth();
    pickBuffer.noLights();
    pickBuffer.noStroke();
    pickBuffer.background(WHITE);

    // Draw to the buffer
    pickModeOn = true;
    drawAll();
    pickBuffer.endDraw();

    int c = pickBuffer.get(x,y);
    pickModeOn = false;

    // Next line inserted just to get a copy of the buffer for testing
    // make sure it is commented out before release.
    //img = pickBuffer.get(); 
    
    //for(int i = 0 ; i  < pickMap.size(); i ++)
    //{
    //  println(pickMap.get(i));
    //}
    
    return pickMap.get(c);
  }
 
}
