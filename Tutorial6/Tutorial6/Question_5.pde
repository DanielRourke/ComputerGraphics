void question5()
{
    if(!sceneSetup)
  {
      surface.setSize(400, 400);
      sceneSetup = true;
  }
    background(0);
    int s = second();
    int m = minute();
    int h = hour();
    // the function nf() spaces the numbers nicely
    String t = nf(h,2) + ":" + nf(m, 2) + ":" + nf(s,2);
    
    text(t, 10, 55);
    stroke(255);
    
    
    float secondsAngle = (TWO_PI/60) * (s - 15);
    float minutesAngle = (TWO_PI/60) * (m - 15);
    float hoursAngle = (TWO_PI/12) * (h-3);
    hoursAngle += ( ((TWO_PI/12) / 60) * (m));
    //hour plus minutes    1 hour / 60
    
    float x = width/2;
    float  y = height/2;
   // rotate(PI/2);
   ellipseMode(CENTER);
   noFill();
   ellipse(x,y, 380, 380);
   
   
    strokeWeight(1);
    line(x,y, x + (x * cos(secondsAngle )* 0.8),y + ( y * sin(secondsAngle )* 0.8));
    strokeWeight(3);
    line(x,y, x + (x * cos(minutesAngle )* 0.6),y + ( y * sin(minutesAngle )* 0.6));
    strokeWeight(5);
    line(x,y, x + (x * cos(hoursAngle )* 0.4) ,y + ( y * sin(hoursAngle )* 0.4)) ;



    float angle = (TWO_PI/12);
    
    
      for(int i = 1; i < 13; i++)
      {
         textAlign(CENTER, CENTER);
         text(i, x + (x * cos(angle * (i  + 9 % 12)) * 0.9),y + ( y * sin(angle * (i  + 9 % 12))* 0.9));
         point(x + (x * cos(angle * (i  + 9 % 12)) * 0.80),y + ( y * sin(angle * (i  + 9 % 12))* 0.80));
         
      }



  
  //  rotate(TWO_PI/60 * s);
    
    
    //stroke(255);
    //line(0, 0, width/3, height/3);
    
    
    //strokeWeight(3);
    //translate(width/2, height/2);
    //rotate(PI/60 * m);
    //line(0, 0, width/3, height/3);
    //strokeWeight(6);
    //translate(width/2, height/2);
    //rotate(PI/60 * m);
    //line(0, 0, width/3, height/3);

  // line(width/2, height/2, width/2*cos(PI/3),height/2*sin(PI/3));
}
