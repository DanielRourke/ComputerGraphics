
int playerIndex;
Player players[] = new Player[2];
String lines[] = new String[3];
String letters = "";
int lineIndex = 0;


void setup()
{
  players[0] = new Player(0, 50);
  players[1] = new Player(1, 50);
  size(400,400);
  players[0].x = 100;
  players[0].y = 300;
  players[1].x = 200;
  players[1].y = 300;
  surface.setResizable(true);
  frameRate(60);
}

void draw()
{
  
 // question1();
  //question2();
    //question3();
    //question4();
    question5();
}
