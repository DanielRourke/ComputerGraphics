
















color getColor()
{
    color colorPick =  color(255);
    int alpha;
    Color jColor = new Color(255);
    jColor  = JColorChooser.showDialog(null,"Java Color Chooser", jColor);
    if(jColor!=null) 
    {
      println(jColor);
      colorPick = jColor.getRGB();
      alpha = jColor.getAlpha();
      println(alpha);
      
    }
    
    println(red(colorPick));
    return colorPick;
}



void fillAdder()
{
  if(picked != null)
  {
     if(key == 'f')
     {
       addFill();
     }
     else if(key == 'w')
     {
         addWire();
     }
     else if(key == 't')
      {
        addTexture(); 
      }
      else if(key == 'g')
      {
        addFillAndWire();
      }
    
  }

  
  
}


void addFill()
{
   
       //for (int i  = 0; i < shapes.size(); i++)
       //{
       //  if (shapes.get(i) == picked)
       //   {
                 //shapes.get(i).drawMode(Shape3D.SOLID
                 picked.drawMode(Shape3D.SOLID);
                 picked.fill(getColor());
                 //previousColor = shapes.get(i).fill();

                 
       //   }
       //}

             //for (Shape3D shape : shapes)
             //{
             //          if (shape == picked)
             //          {
             //            shape.drawMode(Shape3D.SOLID);
             //            shape.fill(getColor());
             //            previousColor = shape.fill();
             //            println(previousColor);
             //          }
             //}
                         
             //println(picked);
             
             //picked.drawMode(Shape3D.SOLID);
             //picked.fill(getColor());
             picked = null;
             

            
}


void addWire()
{
  
                             picked.drawMode(Shape3D.WIRE);
                             picked.stroke(getColor());
                             picked.strokeWeight(wireWeight);
                            
        
            //println(picked);
            //picked.drawMode(Shape3D.WIRE);
            //picked.stroke(getColor());
            //picked.strokeWeight(wireWeight);
            //picked.fill(previousColor);
            picked = null;
}

void addFillAndWire()
{
            picked.drawMode(Shape3D.SOLID | Shape3D.WIRE);
            picked.fill(getColor());
            picked.stroke(getColor());
            picked.strokeWeight(wireWeight);
            picked = null;
}
