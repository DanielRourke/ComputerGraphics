
void question2()
{
    
  PImage image1= loadImage("pic3.jpg");
  int mx = constrain(mouseX, 0 , image1.width);
  int my = constrain(mouseY, 0 , image1.height);

  image(image1, 0,0);
 

    int count = image1.width * image1.height;
    image1.loadPixels();
    loadPixels();
    // print(image1.width , " ", image1.height, " " , count , 500/image1.width , " ", 501 % image1.width);
    
    
    for (int i = 0; i < count; i++) {
    
    // int x = i / image1.width;
    // int y = i % image1.width;
    //pixels[i] = pixels[x* image1.width + y];
    
    pixels[i] = pixels[(i * image1.width ];

 
  }
    updatePixels();

}
