void question5()
{
    if(!sceneSetup)
  {
      surface.setSize(200, 200);
      sceneSetup = true;
  }
    background(255);
    int s = second();
    int m = minute();
    int h = hour();
    // the function nf() spaces the numbers nicely
    String t = nf(h,2) + ":" + nf(m, 2) + ":" + nf(s,2);
    
    text(t, 10, 55);
    stroke(1);
    //strokeWeight(1);
    //translate(width/2, height/2);
    //rotate(PI/60 * s);
    line(0, 0, width/3, height/3);
    strokeWeight(3);
    translate(width/2, height/2);
    rotate(PI/60 * m);
    line(0, 0, width/3, height/3);
    strokeWeight(6);
    translate(width/2, height/2);
    rotate(PI/60 * m);
    line(0, 0, width/3, height/3);

   //line(width/2, height/2, width/2*cos(PI/3),height/2*sin(PI/3));
}
