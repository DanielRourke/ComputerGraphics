

  

  void intializeGroupIconTypes()
  {
      groupIconType = new ArrayList<String>();
     // groupIconType.add("empty");
     // groupIconType.add("default");
      groupIconType.add("circle");
      groupIconType.add("square");
      groupIconType.add("C:/Users/pc-user/Documents/University/Repos/Computer Graphics/Assignment/Try_2/Sketch_190418a/data/clockworkorange.jpg");
      groupIconType.add("dynamic");
      groupIconType.add("dynamic");
      groupIconType.add("dynamic");
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
