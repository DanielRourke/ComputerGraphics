

void question1()
{
  
  
  PImage image1= loadImage("pic1.jpeg");
  PImage image2 = loadImage ("pic2.jpg");
  
  image(image1, 0,0);
  int mx = constrain(mouseX, 0 , image2.width);
  int my = constrain(mouseY, 0 , image2.height);
  copy(image2,0,0,width/ 3, (0 + my)/ 2, 0,0, width, (0 + my));
}


//MASK

//size(200, 200);
//PImage img;
//img = loadImage("myimage.jpg");
//background(255);
//// change transparency without the tint
//tint(255, 102);
//image(img, 0, 0, 200, 200);
//// tint to yellow, alpha 153
//tint(255, 204, 0, 153);
//image(img, 50, 50, 200, 200);


//size(200, 200);
//PImage img;
//img = loadImage("myimage.jpg");
//image(img, 0, 0);
//PImage crop = get();
////image(crop, 0, 100);
