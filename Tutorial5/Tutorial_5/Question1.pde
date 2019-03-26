

void drawQ1()
{
  translate(70,0);
  fill(255,0,0);
  rect(50,50, 50,30);
  translate(0,50);
  fill(0,255,0);
  rect(50,50, 50,30);
  translate(-70,0);
  fill(0,0,255);
  rect(50,50, 50,30);
  translate(0,50);
  fill(255,0,255);
  rect(50,50, 50,30);
}


void drawQ2()
{
  pushMatrix(); 
  translate(70,0);
  fill(255,0,0);
  rect(50,50, 50,30);
  pushMatrix(); 
  translate(0,50);
  fill(0,255,0);
  rect(50,50, 50,30);
  pushMatrix();
  translate(-70,0);
  fill(0,0,255);
  rect(50,50, 50,30);
  pushMatrix(); 
  translate(0,50);
  popMatrix();
  popMatrix();
  popMatrix();
  popMatrix();
  fill(255,0,255);
  rect(50,50, 50,30);
}



void drawQ3()
{
  translate(70,0);
  rotate(PI/16);
  fill(255,0,0);
  rect(50,50, 50,30);
  translate(0,50);
  rotate(PI/16);
  fill(0,255,0);
  rect(50,50, 50,30);
  translate(-70,0);
  rotate(PI/8);
  fill(0,0,255);
  rect(50,50, 50,30);
  translate(0,50);
  rotate(-PI/4);
  fill(255,0,255);
  rect(50,50, 50,30);
}

void drawQ4()
{
  translate(70,0);
  rotate(PI/16);
  fill(255,0,0);
  rect(50,50, 50,30);
  translate(0,50);
  rotate(PI/16);
  fill(0,255,0);
  
  int count = 0;
  for(float i = 1; i <= 2; i += 0.25)
  {
      pushMatrix();
      scale(i);
      rect(50,50, 50,30);
      count++;
  }
  
  for(int i = 0; i < count; i++)
  {
    popMatrix();
  }

  translate(-70,0);
  rotate(PI/8);
  fill(0,0,255);
  rect(50,50, 50,30);
  translate(0,50);
  rotate(-PI/4);
  fill(255,0,255);
  rect(50,50, 50,30);
}


void drawQ5()
{
  translate(70,0);
  
  pushMatrix();
  translate(75,65);
  rotate(PI/4);
  fill(255,0,0);
  rect(-25,-15, 50,30);
  popMatrix();
  
  translate(0,50);
  
  pushMatrix();
  fill(0,255,0);
  rectMode(CENTER);
  
  translate(75,65);
  rotate(PI/2);
  rect(0,0, 50,30);
  
  popMatrix();
  
  rectMode(CORNER);
  translate(-70,0);
  fill(0,0,255);
  rect(50,50, 50,30);
  translate(0,50);
  fill(255,0,255);
  rect(50,50, 50,30);
}

void drawtest()
{
  rotate(PI/16);
  fill(255,0,0);
  rect(50,50, 50,30);
  rotate(PI/16);
  fill(0,255,0);
  rect(50,50, 50,30);
  rotate(PI/8);
  fill(0,0,255);
  rect(50,50, 50,30);
  rotate(-PI/4);
  fill(255,0,255);
  rect(50,50, 50,30);
}
