

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
