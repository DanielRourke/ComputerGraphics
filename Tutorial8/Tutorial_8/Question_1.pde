
PImage earth;
PImage moon;
PImage shuttle;
float angle;


void question1()
{
  //  background(204);
    angle += 0.01;
    float dist = 4 + sin(angle);
    
    pushMatrix();
    translate(width/2, height/2);
    rotate(-angle);
    image(earth ,0,0);
    popMatrix();
    
  
    pushMatrix();
    translate(width/2, height/2);
    rotate(angle);
    translate(width/dist, height/dist );
    rotate(angle);
    image(moon, 0,0);
    popMatrix();
  

}
