//maxX = 1366, maxY = 768

Game myGame = new Game();
Ball ball1;
Ball ball2;
Paddle leftPaddle;
Paddle rightPaddle;

int ballNumber = 5;

//Variables to control speed boundaries of ball
int xSpd = 4;
int ySpd = 5;

//Brick vars
int brickPadding = 33;
int brickX = brickPadding;
int brickY = 0;
int brickHeight = 30;
int brickWidth = 100;
int bricksPerRow = 13;
int numRows = 10;
int brickNumber = bricksPerRow*numRows;
Brick[] brick = new Brick[300];
  

Paddle paddle;
Ball ball;

void setup() //runs once
{
  //Ball vars
  int ballDiameter = 50;
  int ballX = int(myGame.screenWidth/2) - 50;
  int ballY = int(myGame.screenHeight/2);
  
  //Using loop to generate balls
  
  ball = new Ball(ballX, ballY, ballDiameter, xSpd, ySpd );
  
  //Rect vars
  int rectWidth = 200;
  int rectHeight= 40;
  int padY = int(myGame.screenHeight - rectHeight);
  int padX = int(myGame.screenWidth)/2 - rectWidth/2;
  
  paddle = new Paddle(padX, padY, rectWidth, rectHeight);
  
  fullScreen(); //Sets the program to run in full screen mode
  
  for(int i = 0; i< brickNumber; i++){
    brick[i] = new Brick(brickX, brickY, brickWidth, brickHeight, true);
    brickX += brickWidth;
    if(brickX + brickWidth > myGame.screenWidth - brickPadding){
      brickX = brickPadding;
      brickY += brickHeight;
    }
  }
  
}

void draw() //runs forever
{ 
  background(0);
  paddle.display();

  myGame.setGameMode();
  myGame.movePaddle(paddle);

  ball.display();
  ball.move(myGame);
  ball.checkWall(myGame);
  ball.checkPaddle(paddle);
  
  //Using loop to call ball methods
  for(int i = 0; i< brickNumber; i++){
    if(brick[i].alive){
      brick[i].display();
      ball.checkBrick(brick[i], myGame);
    }
  }
 
  
  myGame.displayScore();
  
}
