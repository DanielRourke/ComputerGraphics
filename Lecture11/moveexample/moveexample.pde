import shapes3d.utils.*;
import shapes3d.*;
Shape3D[] shapes = new Shape3D[20];
float a;


void setup(){
    size(400,400,P3D);
    cursor(CROSS);
    float size;
    for (int i = 0; i < shapes.length; i++){
    size = 5 + (int)random(10);
    int type = (int)(random(10));
    if (type % 2 == 0) 
    {
        shapes[i] = new
        Box(this,size,size,size);
    }
    else {
        Ellipsoid e = new
        Ellipsoid(this,20,30);
        e.setRadius(size);
        shapes[i] = e;
    }
    shapes[i].moveTo(random(-22,22),
    random(-22,22), random(-22,22));
    shapes[i].fill(randomColor());
    shapes[i].stroke(color(64,0,64));
    shapes[i].strokeWeight(1.2);
    shapes[i].drawMode(Shape3D.SOLID);
    }
}


void draw(){
    background(128);
    //camera(70 * sin(a), 10, 70 * cos(a), 0,
    //0, 0, 0, 1, 0);
    ambientLight(200,200,200);
    directionalLight(128, 128, 128, -1, 0, -1);
    for (int i = 0; i < shapes.length; i++)
    {
      shapes[i].draw();
    }
    a += 0.002;
}
    Shape3D picked;
    float mX;
    float mY;
 void mousePressed()
 {
        picked =
        Shape3D.pickShape(this,mouseX, mouseY);
        if(picked != null){
            picked.fill(color(0,0,255));
            mX = mouseX;
            mY = mouseY;
        }
 }
 
 void mouseReleased()
 {
   if(picked != null)
      picked.moveBy(mouseX - mX, mouseY - mY, 0);
   
 }
        

int randomColor(){
    return color(random(160,200),
    random(20,160), random(160,200));
}
