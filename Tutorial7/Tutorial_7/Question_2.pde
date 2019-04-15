

void question2()
{
  
  

 // PImage image1 = loadImage ("earth400400.jpg");
  
  int mx = constrain(mouseX, 0 , image1.width);
 int my = constrain(mouseY, 0 , image1.height);
 
 imageMode(CENTER);
 translate(width/2, height/2);
 rotate(PI/2);
 image(image1, 0,0, width,height);
 
 loadPixels();
  
  for (int x = 0; x < width ; x++)
  {
    for (int y = 0; y < height; y++)
    {
      if(x >= mx && y >=my && x < (mx + 50) && y < (my + 50))
      {
          //image1.pixels[y * image1.width + x] = color(255);
          int i = y * width + x;
          float r = red(pixels[i]);
          float g = green(pixels[i]);
          float b = blue(pixels[i]);
          r = constrain(r + 150 ,0 ,255);
          b = constrain(b + 150,0 ,255);
          g = constrain(g +  150,0 ,255);
          
          pixels[i] = color(r,g,b);
      } 
    }
    
  }
 updatePixels();

}
