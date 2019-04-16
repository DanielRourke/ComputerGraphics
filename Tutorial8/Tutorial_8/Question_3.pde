
float beginX;
float beginY;
float endX;
float endY;

void question3()
{

    fill(0,45);
    rect(0,0,width ,height);

    angle += 0.01;
 
    
    pushMatrix();
    translate(width/2, height/2);
    rotate(-angle);
    image(earth ,0,0);
    popMatrix();
    
  
    pushMatrix();
    translate(width/2, height/2);
    rotate(angle);
    translate(width/4, height/4 );
    rotate(angle);
    image(moon, 0,0);
    popMatrix();
  
    //image(shuttle,0 ,0 );
    //translate(width/4, height/4);
    //image(shuttle, );
  
  println( abs((width/2) * cos(angle)));
  
  
  
  //pushMatrix();
 // translate(width/2, height/2);
  
 // image(shuttle, 0,0);
 // popMatrix();
 // question2();
  
  
  /*start position is center
  move towoards points at angle
  line(x,y, x + (x * cos(hoursAngle )* 0.4) ,y + ( y * sin(hoursAngle )* 0.4)) ;
   line(x,y, (width/2) + ((width/2) * cos(hoursAngle )* dist) ,(height/2) + ( (height/2) * sin(hoursAngle )* dist)) ;
  */
}
