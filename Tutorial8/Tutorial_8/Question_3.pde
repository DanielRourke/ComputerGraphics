


void question3()
{

    fill(0);
    rect(0,0,width ,height);

    float w =width/2;
    float h = height/2;

    angle += 0.01;
 
    
    pushMatrix();
    translate(w, h);
    rotate(-angle);
    image(earth ,0,0);
    popMatrix();

  
    float x = w + w * cos(angle);
    float y = h + h * sin(angle);
    
      
    pushMatrix();
    translate(x, y);
    rotate(angle);
    image(moon,0,0);
    popMatrix();
    
    if (shuttleY - targetY < 0.1)
    {
      targetX = x;
      targetY = y;
    }
    
    
    
    shuttleX += (targetX - shuttleX) * easing;
    shuttleY += (targetY - shuttleY) * easing;
    image(shuttle, shuttleX,shuttleY);
    
   //intail position 
   
   //move towards moon at 0 speed
   //increase speed
   //when half way //decreast speed
   
    
    
  //  translate(width/4, height/4 );
  //  rotate(angle);
  //  image(moon, 0,0);
  //  popMatrix();
  
  //  pushMatrix();
  //  translate(w, h);
  //  rotate(angle);
    
  //  translate(width/4, height/4 );
  //  rotate(angle);
  //  image(moon, 0,0);
  //  popMatrix();
    
    // x+ sin y + cos
  
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
