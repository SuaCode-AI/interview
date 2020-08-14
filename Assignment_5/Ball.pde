class Ball{
  float screenWidth = 1366; //set to your maxX
  float screenHeight = 768; //set to your maxY
  int ballX, ballY, ballDiameter, ballXspd, ballYspd; 
  
  Ball(int x, int y, int diameter, int xSpeed, int ySpeed){
    ballX = x;
    ballY = y;
    ballDiameter = diameter;
    ballXspd = xSpeed;
    ballYspd = ySpeed;
  }

  void display(){
    fill(#ffffff);
    ellipse(ballX, ballY, ballDiameter, ballDiameter);
  }

  void move(Game game){
    if(game.gameStart){
      ballX += ballXspd;
      ballY += ballYspd;
    }
    
  }
  
  void checkWall(Game game){
    
    if(ballY - ballDiameter/2 < 0 || ballY + ballDiameter/2 > screenHeight){
      ballYspd *= -1;
    }
    
    
    if(ballX - ballDiameter/2 < 0 ){
      game.gameStart = false;
      game.incrementRightScore();
      
      ballXspd *= -1;
      ballX = int(screenWidth/2);
      ballY = int(screenHeight/2);
    }else if(ballX + ballDiameter/2 > screenWidth){
      game.gameStart = false;
      game.incrementLeftScore();
      
      ballXspd *= -1;
      ballX = int(screenWidth/2);
      ballY = int(screenHeight/2);
    }
  
  }
  
  
  void checkPaddle(Paddle leftPaddle, Paddle rightPaddle){
    
    if( doesOverlap(leftPaddle.paddleX, leftPaddle.paddleY, leftPaddle.rectWidth, leftPaddle.rectHeight, ballX, ballY, ballDiameter/2) || 
    doesOverlap(rightPaddle.paddleX, rightPaddle.paddleY, rightPaddle.rectWidth, rightPaddle.rectHeight, ballX, ballY, ballDiameter/2) ){
      ballXspd *= -1;
    }
  
  
  }
  
  
  
  boolean doesOverlap(float xPaddle, float yPaddle, float widthPaddle, float heightPaddle, float xBall, float yBall, float radius) {

  float ballLeftEdge = xBall-radius; //left edge of ball
  float ballBottomEdge = yBall+radius; //bottom edge of ball
  float ballRightEdge = xBall+radius; //right edge of ball
  float ballTopEdge = yBall-radius; //top edge of ball

  float paddleLeftEdge = xPaddle; //left edge of paddle
  float paddleBottomEdge = yPaddle+heightPaddle; //bottom edge of paddle
  float paddleRightEdge = xPaddle+widthPaddle; //right edge of paddle
  float paddleTopEdge = yPaddle; //top edge of paddle

  if (ballBottomEdge >= paddleTopEdge //Check if bottom edge of ball and top edge of paddle overlap
    && ballTopEdge <= paddleBottomEdge //Check if top edge of ball and bottom edge of paddle overlap
    && ballLeftEdge <= paddleRightEdge //Check if left edge of ball and right edge of paddle overlap
    && ballRightEdge >= paddleLeftEdge ) //Check if right edge of ball and left edge of paddle overlap
  {   
    return true;
  } else { 
    return false;
  }
}


}
