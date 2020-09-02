class Game{
  float screenWidth = 1366; //set to your maxX
  float screenHeight = 768; //set to your maxY
  int textSize = 24;
  
  //Game vars
  boolean gameStart = false;
  
  //Text Variables
  int text = 0;
  int textX = int(screenWidth * 1/2); 
  int textY = int(screenHeight/2); 
  

  
  
  void incrementScore(){
    text+=10;
  
  }
  
  void displayScore(){
    fill(#ff00ff);
    textSize(textSize);
    text(text, textX, textY);
    
  }
  
  void setGameMode(){
    if(mousePressed){
      gameStart = true;
      text = 0;
    }
    
  }

  
  void movePaddle(Paddle paddle){
      paddle.paddleX = constrain(0, mouseX - paddle.rectWidth/2, int(screenWidth) - paddle.rectWidth);
    }


}
