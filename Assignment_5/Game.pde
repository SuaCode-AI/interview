class Game{
  float screenWidth = 1366; //set to your maxX
  float screenHeight = 768; //set to your maxY
  int textSize = 24;
  
  //Game vars
  boolean gameStart = false;
  
  //Text Variables
  int leftText = 0;
  int leftTextX = int(screenWidth/4); 
  int leftTextY = int(screenHeight/2); 
  
  int rightText = 0;
  int rightTextX = int(screenWidth * 3/4); 
  int rightTextY = int(screenHeight/2); 
  
  
  
  void incrementLeftScore(){
    leftText++;
  
  }
  
  void incrementRightScore(){
    rightText++;
  
  }
  
  void displayScore(){
    fill(#ffffff);
    textSize(textSize);
    text(leftText, leftTextX, leftTextY);
    text(rightText, rightTextX, rightTextY);
    
  }
  
  void setGameMode(){
    if(mousePressed){
      gameStart = true;
    }
    
  }

  
  void movePaddles(Paddle leftPaddle, Paddle rightPaddle){
    if(mouseX < screenWidth/2){
      leftPaddle.paddleY = constrain(mouseY - leftPaddle.rectHeight/2, 0, int(screenHeight) - leftPaddle.rectHeight);
    }else{
      rightPaddle.paddleY = constrain(mouseY - rightPaddle.rectHeight/2, 0, int(screenHeight) - rightPaddle.rectHeight);
    }
  
  }


}
