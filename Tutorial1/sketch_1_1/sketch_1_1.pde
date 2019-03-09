//Exercise:1.
//Write a simple Processing program to draw an ellipse
//at the centre of the display areawith a size of 400×400 pixels.
size(400,400);
background(255);
smooth();

// Set ellipses and rets to Center mode
ellipseMode(CENTER);




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



rectMode(CENTER);




// draw Zoog's head
fill(255);
ellipse(200,70,60,60);

// draw Zoog's eyes
fill(0);
ellipse(185,65,22,16);
ellipse(215,65,22,16);
// draw Zoog's eyes
fill(255);
ellipse(185,65,10,10);
ellipse(215,65,10,10);
// draw Zoog's eyes
fill(0);
ellipse(185,65,2,2);
ellipse(215,65,2,2);

// Draw Zoog's mouth
stroke(0);
fill(150);
rect(200,90,10,10);

// draw Zoog's legs
strokeWeight(5);

//Left leg
fill(255);
bezier(230,280, 250,320, 220,370 , 260,370);

//point(230,280);
//point(250,320);
//point(220,370);
//point(260,370);

//Right Leg
fill(255);
bezier(170,280,150,320,180,370,140,370);
//point(170,280);
//point(150,320);
//point(180,370);
//point(140,370);

//draw Zoog's Arms
//Left 
bezier(230,120, 270,160, 260,200, 275,200);
point(230,120);
point(275,200);

//Right
bezier(170,120, 130,160, 140,200, 125,200);
point(170,120);
point(125,200);

//belt
noStroke();
fill(128,70,27);
rect(200,255,90,10);
//buckle
noFill();
strokeWeight(2);
stroke(218,145,0);
rect(200,255,10,10); 
line(200,255,205,255);

//pants
noStroke();
fill(195, 176, 145);
//right leg side
quad(155,260, 205,260, 195,340, 150,340);
//left leg side
quad(245,260, 195,260, 205,340, 255,340);
//
