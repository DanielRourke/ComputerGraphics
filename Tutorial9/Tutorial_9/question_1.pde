

void question1()
{
 noStroke();
fill(220, 150,100 ); //draw a filled circle
sphere(200); 
}

void question2()
{
  rotate(-TWO_PI/4);
  float angle = TWO_PI/5;
  float rad = 100;
  beginShape();
  for(int i = 0; i < 5 ; i++)
  {
    vertex(rad * cos(angle * i), rad * sin(angle * i));
  }
  endShape(CLOSE);
  
}

void question3()
{
  ///done
}

float moonPosX = width/5;
float moonPosZ = 0;
float incrementer = 5;
float moonDirectionX;
float moonDirectionZ;
float angle2 = TWO_PI/256;

void question4()
{
noStroke();

pushMatrix();
rotateY(angle2);
translate(-width/2, 0, 0);
fill(100, 100, 100);//draw gray moon Ball
sphere(50); 
angle2 -= TWO_PI/256;
popMatrix();
fill(0,0,200 ); //draw a blue earth ball
sphere(200); 

}
float orbitSpeed = TWO_PI/256;
float angle3 = orbitSpeed;
float shuttlePosX = -200;
float shuttleSpeed = 0.5;

void question5()
{
    noStroke();
    pushMatrix();
    rotateY(angle3);
    translate(-width/2, 0, 0);
    fill(100, 100, 100);//draw gray moon Ball
    sphere(50);
    popMatrix();
    pushMatrix();
    rotateY(angle3);
    translate(shuttlePosX, 0, 50);
    fill(200, 200 ,0);
    box(25);
    angle3 -= orbitSpeed;
    if(shuttlePosX != -width/2)
        shuttlePosX -= shuttleSpeed;
    popMatrix();
    fill(0,0,200 ); //draw a blue earth ball
    sphere(200); 
}
