

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

////move the moon left and right
//if (moonPosX == width - (width/5))
//    moonDirectionX = -incrementer;
//else if(moonPosX == width/5 )
//    moonDirectionX = +incrementer;
// //move the moon forward and back
//if(moonPosZ == width/5)
//    moonDirectionZ = +incrementer;
//else if((moonPosZ == width/5 ))
//    moonDirectionZ = -incrementer;

////increment moons position based on direction
//    moonPosX += moonDirectionX;
//    moonPosZ += moonDirectionZ;
    
//translate(moonPosX, height/2, moonPosZ);
//fill(100, 100, 100);//draw gray moon Ball
//sphere(100);
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


void question6()
{
  /*Modify the last example in the lecture note 9 (Extrude and
Image) so that all pixels are drawn inside a sphere. Y-coordinate values remain
the same, x-coordinate values are distributed around a circle and z-coordinate
values are calculated based on the average values of their RGB. If the average
value is less than 127, the pixels are drawn at the negative half of the zcoordinate. Otherwise, the pixels are drawn at the positive half of the coordinate.
Add animation to see the effect. You are also welcome to create various special
effects of your choice.*/

for ALL OF THE PIXELS
  
  
  if(averageRGB(color pixel))
    

}

int averageRGB(color c)
{
  return (int)((red(c) + green(c) + blue(c))/3);
}
