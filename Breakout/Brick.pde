class Brick{
  float screenWidth = 1366; //set to your maxX
  float screenHeight = 768; //set to your maxY
  int brickX, brickY, brickWidth, brickHeight;
  boolean alive;
  int red = int(random(50,255));
  int green = int(random(50,255));
  int blue = int(random(50,255));
  
  Brick(int x, int y, int w, int h, boolean a){
    brickX = x;
    brickY = y;
    brickWidth = w;
    brickHeight = h;
    alive = a;
  }

  void display(){
    fill(red,green,blue);
    rect(brickX, brickY, brickWidth, brickHeight);
  }



}
