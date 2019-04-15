

void question4()
{
  int mx = constrain(mouseX, 0 , image1.width);
 int my = constrain(mouseY, 0 , image1.height);
 
 image1.loadPixels();
  
  for (int x = 0; x < image1.width ; x++)
  {
    for (int y = 0; y < image1.height; y++)
    {
          int i = y * image1.width + x;
          float r = red(image1.pixels[i]);
          float g = green(image1.pixels[i]);
          float b = blue(image1.pixels[i]);
          image1.pixels[i] = color(r + 255,g,b);
    }
    
  }
  
  for (int x = (image1.width/2); x < image1.width ; x++)
  {
    for (int y =(image1.height/2); y < image1.height; y++)
    {
          int i = y * image1.width + x;
          int k = (y - (image1.height/2)) * image1.width + (x - image1.width/2);
          image1.pixels[i] = image1.pixels[k];
    }
    
  }
 image1.updatePixels();
   image(image1, 0,0, width,height);
}
