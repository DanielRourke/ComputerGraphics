

  

  void intializeGroupIconTypes()
  {
    groupIconType = new String[10];
    groupIconType[0] = "circle";
    groupIconType[1] = "square";
    groupIconType[2] = "dynamic";
    groupIconType[3] = "C:/Users/pc-user/Documents/University/Repos/Computer Graphics/Assignment/Try_2/Sketch_190418a/data/clockworkorange.jpg";
    groupIconType[4] = "C:/Users/pc-user/Documents/University/Repos/Computer Graphics/Assignment/Try_2/sketch_190418a/data/baseball.jpg";
    groupIconType[5] = "dynamic";
    groupIconType[6] = "dynamic";
    groupIconType[7] = "dynamic";
    groupIconType[8] = "dynamic";
    groupIconType[9] = "dynamic";
  }

  //void getObject()
  //{
  // // return new squareDataItem();
    
  //}
  
  class groupIconDialouge extends JFrame implements ItemListener
  {
    ArrayList<String> groupIconType;
    groupIconDialouge()
    {
      groupIconType = new ArrayList<String>();
      groupIconType.add("circle");
      groupIconType.add("square");
      groupIconType.add("dynamic");
      groupIconType.add("C:/Users/pc-user/Documents/University/Repos/Computer Graphics/Assignment/Try_2/Sketch_190418a/data/baseball.jpg");
      groupIconType.add("C:/Users/pc-user/Documents/University/Repos/Computer Graphics/Assignment/Try_2/Sketch_190418a/data/tv.jpg");
      groupIconType.add("C:/Users/pc-user/Documents/University/Repos/Computer Graphics/Assignment/Try_2/Sketch_190418a/data/tri.jpg");
      groupIconType.add("C:/Users/pc-user/Documents/University/Repos/Computer Graphics/Assignment/Try_2/Sketch_190418a/data/clockworkorange.jpg");

      
      
       for (int i = 0 ; i < 10 ; i++)
        {
            add(new JLabel("Minimize demo"));
            
            if (i == 3)
            {
              String[] items = new String[groupIconType.size() - 1];
              for (int j = 0 ,dex = 0; j < groupIconType.size() ; j ++ )
              {
                 if (!groupIconType.get(j).equals("dynamic"))
                 {
                   items[dex] = groupIconType.get(j);
                   dex++;
                 }
              }
              
              add(new JComboBox(items));
            }
            else
            {
              String[] items = new String[groupIconType.size()];
              for (int j = 0 ; j < groupIconType.size() ; j ++ )
                   items[j] = groupIconType.get(j);
               add(new JComboBox(items));
            }
            
            
          
        }
      
  
     

    }
    
    
    public void itemStateChanged(ItemEvent e) 
    { 
        //// if the state combobox is changed 
        //if (e.getSource() == c1) { 
  
        //    l1.setText(c1.getSelectedItem() + " selected"); 
        //} 
    } 
  }
