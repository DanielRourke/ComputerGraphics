//Exercise:1.
//Write a simple Processing program to draw an ellipse
//at the centre of the display areawith a size of 400×400 pixels.
size(400,400);

//The width and height of the ellipse are 
//100 pixelsand 200 pixels respectively. 
//Save and run the program.'
ellipse(200,200,100,200);


//Exercise:2.
//Draw mutiple shapes on a sketch that includes at least
//2 points, 1 line, 1 rectangle, 1 circle, i ellipse, 
//1 triangle and 1 quadrilateral 

fill(255,165,0);
quad(0,50,50,0,100,150,150,100);

strokeWeight(0);
fill(200,20,200);
rect(20,20, 80, 80);

strokeWeight(10);
point(50,50);
strokeWeight(7);
point(60,60);
strokeWeight(4);
point(70,70);

strokeWeight(2);
line(30,70,70,30);

fill(0,255,0);
ellipse(35,35,15, 15);


//strokeWeight(1);
//point(105,105);
strokeWeight(1);
fill(50);
triangle(105,105, 130,105, 105,130 );
