


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
    

    if (dist(shuttleX,shuttleY, targetX,targetY) < 50 && speed > 0.3)
    {
        speed = speed - 0.0001; 
    }
    else if (speed < 0.1)
    {
      speed = speed + 0.001; 
    }
    
   
    
    targetX =x;
    targetY = y;
    shuttleX += (targetX - shuttleX) * speed;
    shuttleY += (targetY - shuttleY) * speed;
    image(shuttle, shuttleX,shuttleY);
    
   
}
