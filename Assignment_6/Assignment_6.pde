//maxX = 1366, maxY = 768

Game myGame = new Game();
Ball ball1;
Ball ball2;
Paddle leftPaddle;
Paddle rightPaddle;

int ballNumber = 5;

//Variables to control speed boundaries of ball
int maxSpd = 10;
int minSpd = 1;

//Creating array to store balls
Ball[] balls = new Ball[5];

void setup() //runs once
{
  //Ball vars
  int ballDiameter = 50;
  int ballX = int(myGame.screenWidth/2) - 50;
  int ballY = int(myGame.screenHeight/2);
  
  //Using loop to generate balls
  for(int i = 0; i< ballNumber; i++){
    //Initializing x and y speed as random values between speed boundaries
    int xSpd = int(random(minSpd, maxSpd));
    int ySpd = int(random(minSpd, maxSpd));
    Ball ball = new Ball(ballX, ballY, ballDiameter, xSpd, ySpd );
    balls[i] = ball;
  }
  
  //Rect vars
  int rectWidth = 40;
  int rectHeight= 200;
  int leftX = 0;
  int rightX = int(myGame.screenWidth) - rectWidth;
  int leftY = int(myGame.screenHeight)/2 - rectHeight/2;
  int rightY = int(myGame.screenHeight)/2 - rectHeight/2;
  
  leftPaddle = new Paddle(leftX, leftY, rectWidth, rectHeight);
  rightPaddle = new Paddle(rightX, rightY, rectWidth, rectHeight);
  
  fullScreen(); //Sets the program to run in full screen mode
  
}

void draw() //runs forever
{ 
  background(0);
  leftPaddle.display();
  rightPaddle.display();

  myGame.setGameMode();
  myGame.movePaddles(leftPaddle, rightPaddle);
  
  //Using loop to call ball methods
  for(int i = 0; i< ballNumber; i++){
    balls[i].display();
    balls[i].move(myGame);
    balls[i].checkWall(myGame);
    balls[i].checkPaddle(leftPaddle, rightPaddle);
  }
 
  
  myGame.displayScore();
  
}
