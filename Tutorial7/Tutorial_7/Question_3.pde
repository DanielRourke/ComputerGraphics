
void question3()
{
     image(image1, 0 ,0);
}

void mouseReleased()
{
    if(initialised)
    {
       initialised = false;
    }
    else
    {
     int mx = constrain(mouseX, 0 , image1.width);
     int my = constrain(mouseY, 0 , image1.height);     
     mouseXCopyPos = mx;
     mouseYCopyPos = my;
     initialised = true;
    }
}

void mousePressed()
{
   int mx = constrain(mouseX, 0 , image1.width);
   int my = constrain(mouseY, 0 , image1.height); 
   if(initialised)
   {
     image1.copy(mouseXCopyPos ,mouseYCopyPos, 50,50, mx,my,50, 50);
  
   }
  
}
