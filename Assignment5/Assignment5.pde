// maxX = 1366 , maxY = 768
 

float screenWidth = 1366; //set to your maxX
float screenHeight = 768; //set to your maxY


boolean gameOn = false; //new variable to start ball's movement
boolean leftPaddleOverlap=false;
boolean rightPaddleOverlap=false;
Game game= new Game();
Ball ball= new Ball(683,368,5);// create first ball
Paddle lPaddle = new Paddle(0,0,20,90);// creation of Left Paddle
Paddle rPaddle = new Paddle(1346,678,20,90); // creation of right paddle
Ball ball2= new Ball(683,368,-8); // create second ball
  void setup()
  {
  fullScreen(); //Sets the program to run in full screen mode  
}

void draw() //runs continuously until the program is stopped
{
  
  background(0);  //sets the background grey

  lPaddle.display(); //display left paddle
  rPaddle.display(); // display right paddle
  ball.display(); // display ball 1
  game.setGameMode(); // set game to start
  ball.move(game); // move ball
  game.displayScore(); // display scores
  game.movePaddles(lPaddle, rPaddle); // move left and right paddles
  ball.checkWall(game); // Bounce ball off walls
  ball.checkPaddles(lPaddle,rPaddle); // Bounce ball off paddles
  

  ball2.display();
  ball2.move(game);
  ball2.checkWall(game);
  ball2.checkPaddles(lPaddle,rPaddle);

    
 
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
  
  class Paddle
  { 
    float w,h,x,y; //width,height,x-position,y-position
    
    Paddle(float paddleX, float paddleY, float paddleWidth, float paddleHeight)
  {
  //initializations
  x= paddleX;
  y= paddleY;
  w= paddleWidth;
  h= paddleHeight;
  }
    void display(){
    fill(0,0,255); //  sets the inner colour of the rectangle
    stroke(128,128,128);
    rect(x, y, w, h); //draws a rectangle
   
  }
    void move(){
     y =constrain(mouseY, 0, screenHeight-h); //constrain paddle
    
  }
  
  }
  
  class Game
  {
   boolean gameOn;
   Paddle leftPaddle,rightPaddle;
   Ball ball;
   int player1Score, player2Score;
   
   Game(){
   gameOn=false;
   player1Score=0;
   player2Score=0;
 }
  
 void setGameMode(){
    if (mousePressed ) 
    gameOn = true;
 }
  
  void movePaddles(Paddle leftPaddle, Paddle rightPaddle){
    if(gameOn){

      if(mouseX > screenWidth/2 )
      
     rightPaddle.move();
    
    else
    
    leftPaddle.move(); // move left paddle 
  }
  }
  void displayScore(){
       text(player1Score, 783, 384);//writes text on screen
   
    text(player2Score , 534 , 384);//writes text on screen

    textSize(60); //set text size to 20
  }
  
  void incrementLeftScore(){
    player1Score++;
  }
  
  void incrementRightScore(){
    player2Score++;
  }
  
  
  
  }
  class Ball
  {
    float x,y,radius; //Ball x and y positions
    int xSpeed,ySpeed; // Ball speed of movement
    Game game;
 
  Ball(float xPosition, float yPosition, int speed){
  radius= 25;
  x=xPosition;
  y=yPosition;
  xSpeed=speed;
  ySpeed=speed;
}

  void display(){
    fill(255);
    ellipse(x, y, radius, radius); //draws an ellipse
  }
   
   void move(Game game){
     if(game.gameOn){   
       x += xSpeed;
       y += ySpeed;
      }

  }
  
  void checkWall(Game game){
        // if ball crosses right side
   if(x>screenWidth){
     game.gameOn = false;
     game.incrementRightScore();
     x=683;
      y=384;
        }
     
     // if ball crosses the left side
     if( x<0){ 
      game.gameOn = false;
      game.incrementLeftScore();
      x=683;
      y=384;
     }
     
     //Check if ball hits top or bottom walls
  if ((y-radius < 0) || (y+radius) > screenHeight) {

    ySpeed = ySpeed * -1;  //Reverse direction
    }
  }
  
  void checkPaddles(Paddle lPaddle, Paddle rPaddle){
     boolean rightPaddleOverlap= doesOverlap(rPaddle.x,rPaddle.y,rPaddle.w,rPaddle.h,x,y,radius);
    if(rightPaddleOverlap){
      xSpeed= xSpeed *-1;
    }
    
    boolean leftPaddleOverlap= doesOverlap(lPaddle.x,lPaddle.y,lPaddle.w,lPaddle.h,x,y,radius);
    if(leftPaddleOverlap){
      xSpeed= xSpeed *-1;
      }
    }
  }
