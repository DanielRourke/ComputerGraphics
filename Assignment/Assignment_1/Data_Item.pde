


class DataItem
{
private
  String name;
  String gender;
  float x;
  float y;
  int group;
  int year;
  int grade;
  
public
  DataItem() {};
  void displayItem()
  {
    switch(group)
    {
     case 0:
       rect(x,y , 25 * group, 25 * group);
       break;
     case 1:
       ellipse(x,y , 25 * group, 25 * group);   
       break;
      case 2:
       
       break;
      case 3:
      
        break;
      case 4:
       
        break;  
    }
  }
};
