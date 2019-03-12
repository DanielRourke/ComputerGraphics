void colorBoxes()
{
      if (mouseX < width/3) {
        background(255); // clear the previous drawing
        fill(255, 0, 0); // red colour
        rect(0, 0, width/3, height);
      }
      else if (mouseX < 2*width/3) {
        background(255); // clear the previous drawing
        fill(0, 255, 0); // green colour
        rect(width/3, 0, width/3, height);
      }
      else
      {
        background(255); // clear the previous drawing
        fill(0, 0, 255); //blue colour
        rect(2*width/3, 0, width/3, height);
      }
}
