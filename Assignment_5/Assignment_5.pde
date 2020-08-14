//maxX = 1366, maxY = 768

Game myGame = new Game();
Ball ball1;
Ball ball2;
Paddle leftPaddle;
Paddle rightPaddle;

void setup() //runs once
{
  //Ball vars
  int ball1Diameter = 50;
  int ball1X = int(myGame.screenWidth/2) - 50;
  int ball1Y = int(myGame.screenHeight/2);
  int ball1Xspd = 3;
  int ball1Yspd = 4;
  
  int ball2Diameter = 50;
  int ball2X = int(myGame.screenWidth/2) + 50;
  int ball2Y = int(myGame.screenHeight/2);
  int ball2Xspd = 6;
  int ball2Yspd = 3;
  
  //Rect vars
  int rectWidth = 40;
  int rectHeight= 200;
  int leftX = 0;
  int rightX = int(myGame.screenWidth) - rectWidth;
  int leftY = int(myGame.screenHeight)/2 - rectHeight/2;
  int rightY = int(myGame.screenHeight)/2 - rectHeight/2;
  
  leftPaddle = new Paddle(leftX, leftY, rectWidth, rectHeight);
  rightPaddle = new Paddle(rightX, rightY, rectWidth, rectHeight);
    
   ball1 = new Ball(ball1X, ball1Y, ball1Diameter, ball1Xspd, ball1Yspd);
   ball2 = new Ball(ball2X, ball2Y, ball2Diameter, ball2Xspd, ball2Yspd);
  
  fullScreen(); //Sets the program to run in full screen mode
  
}

void draw() //runs forever
{ 
  background(0);
  leftPaddle.display();
  rightPaddle.display();
  
  ball1.display();
  ball2.display();
  myGame.setGameMode();
  myGame.movePaddles(leftPaddle, rightPaddle);
  ball1.move(myGame);
  ball2.move(myGame);
  
  ball1.checkWall(myGame);
  ball2.checkWall(myGame);
  ball1.checkPaddle(leftPaddle, rightPaddle);
  ball2.checkPaddle(leftPaddle, rightPaddle);
  
  myGame.displayScore();
  
}
