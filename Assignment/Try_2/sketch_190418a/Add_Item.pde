
import javax.swing.*;
import java.awt.*;
import java.awt.event.*;

class InputFrame extends JFrame
{
  JPanel panel = new JPanel();
  JLabel labelName =   new JLabel("Name:   ");
  JLabel labelGroup =  new JLabel("Group:  ");
  JLabel labelGrade =  new JLabel("Grade:  ");
  JLabel labelGender = new JLabel("Gender: ");
  JLabel labelYear =   new JLabel("Year:   ");
  
  JTextField textName =   new JTextField(4);
  JTextField textGroup =  new JTextField(4);
  JTextField textGrade =  new JTextField(4);
  JTextField textGender = new JTextField(4);
  JTextField textYear =   new JTextField(4); 
  
  JButton btnAdd = new JButton("Add");
  JButton btnCancel = new JButton("Cancel");

  

  InputFrame()
  {
    super("Add Item");    
    setSize( 200, 200 );
    panel.setLayout(new GridLayout(6,2));
    add(panel);  
    panel.add(labelName);
    panel.add(textName);
    panel.add(labelGroup);
    panel.add(textGroup);
    panel.add(labelGrade);
    panel.add(textGrade);
    panel.add(labelGender);
    panel.add(textGender);
    panel.add(labelYear);
    panel.add(textYear);
    panel.add(btnAdd);
    panel.add(btnCancel);
        
    btnAdd.addActionListener(new ActionListener()
    {  
        public void actionPerformed(ActionEvent e)
        {  
          String temp;
          String name;
          String gender;
          int group = -1;
          int year = -1;
          int grade = -1;
          boolean fail = false; 
            
            name = textName.getText();
            temp = "";
            temp = textGroup.getText();
            if( validateNumber(temp))
             group = int(temp);
           else
             fail = true;;
            temp = "";
            temp = textGrade.getText();
            if( validateNumber(temp))
              grade = int(temp);
           else
             fail = true;
            temp = "";
            gender = textGender.getText();
            temp = "";
            temp = textYear.getText();
            if( validateNumber(temp))
              year = int(temp);
           else
             fail = true;
           
           if(fail)
           {
             JOptionPane.showMessageDialog(new JFrame(), "Bad Input", "Bad Input",
              JOptionPane.ERROR_MESSAGE);
           }
           else
           {
               grid.createDataItemOnMouse(name, gender, group, year, grade + 1);
               setVisible(false);
               dispose();
           }
        }  
    });   
        
    btnCancel.addActionListener(new ActionListener()
    { 
        public void actionPerformed(ActionEvent e)
        {  
           setVisible(false);
           dispose();
        }  
    });           
        
    this.setVisible( true );   
    this.setLocationRelativeTo(null);
  }

} 


boolean validateNumber(String input)
{
    String[][] m ;
    
    if(input != null)
    {  
        m = matchAll(input, "[0-9]");
    
        if(m != null && m.length == input.length() )
        {
            return true;
        }
    }
    return false;
}
