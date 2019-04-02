

void question2()
{
  
  if(keyPressed)
  //{
  //if (key == ' ') { 
        
  //      if (//line + word < totalLenth)
  //      {
  //        //line[index] += word
  //      }
  //      else
  //      {
  //        //index++
  //        //line[index] += word
  //      }
        
        
  //      letters = ""; // clear the lett
  //    }
  //    else {
  //        letters = letters + key;
  //    }
  //    if (key == ENTER) {
  //      index++;
  //    }

      

  //}
  textSize(32);
  text(letters, 10,30, 350, 150);
}

void keyTyped()
{
  letters = letters + key;
}
