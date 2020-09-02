class Paddle{
  float screenWidth = 1366; //set to your maxX
  float screenHeight = 768; //set to your maxY
  int paddleX, paddleY, rectWidth, rectHeight;
  
  Paddle(int x, int y, int w, int h){
    paddleX = x;
    paddleY = y;
    rectWidth = w;
    rectHeight = h;
  
  }

  void display(){
    fill(#bada55);
    rect(paddleX, paddleY, rectWidth, rectHeight);
  }



}
