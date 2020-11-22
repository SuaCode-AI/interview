void settings(){size(0,0);}
class Code {
Code(){ }

int screenWidth = 960; //setting screen width
int screenHeight = 480; //setting screen height

int leftPaddleX = 0;
int leftPaddleY = 0;
int rightPaddleX = 940;
int rightPaddleY = 380;
int paddleWidth = 20;
int paddleHeight = 100;


int ballX = 480;
int ballY = 240;
int ballRadius = 30;
int centreX = 480;
int centreY = 240;


int player1Score = 0;
int player2Score = 0;
int sizeText = 80;
int player1ScorePositionX = 250;
int player2ScorePositionX = 750;
int playerScorePositionY = 270;


int ballXSpeed = 3;
int ballYSpeed = 4;
int reverseSpeed = -1;


boolean gameOn = false;


boolean hasOverlappedLeftPaddle = false;
boolean hasOverlappedRightPaddle = false;

void once()
{fullScreen ();  //sets mode to full screen
}

void forever()
{background (10,20,25); // sets the background colour

movePaddles ();  //calling function to move paddles

checkLeftPaddle ();  //calling function to check left paddle

checkRightPaddle ();  //calling function to check right paddle

displayScores (player1Score, player1ScorePositionX, playerScorePositionY);  //calling function to display left player score

displayScores (player2Score, player2ScorePositionX, playerScorePositionY);  //calling function to display right player score

displayBall (ballX, ballY, ballRadius);  //calling function to display ball

displayPaddles (leftPaddleX, leftPaddleY, paddleWidth, paddleHeight);  //calling function to display left paddle

displayPaddles (rightPaddleX, rightPaddleY, paddleWidth, paddleHeight);  //calling function to display right paddle

moveBall ();  //calling function to move the ball

checkWall ();  //calling function to check when the ball hits the walls

setGameMode ();  //calling function to set game mode

}



void movePaddles (){
if (mouseX <(screenWidth/2)) {
leftPaddleY = constrain (mouseY, 0, screenHeight - paddleHeight);

}else {
rightPaddleY = constrain (mouseY, 0, screenHeight - paddleHeight);
}
}


boolean doesOverlap(int xPaddle, int yPaddle, int widthPaddle, int heightPaddle, int xBall, int yBall, int radius) {
int ballLeftEdge = xBall-radius; //left edge of ball
int ballBottomEdge = yBall+radius; //bottom edge of ball
int ballRightEdge = xBall+radius; //right edge of ball
int ballTopEdge = yBall-radius; //top edge of ball
int paddleLeftEdge = xPaddle; //left edge of paddle
int paddleBottomEdge = yPaddle+heightPaddle; //bottom edge of paddle
int paddleRightEdge = xPaddle+widthPaddle; //right edge of paddle
int paddleTopEdge = yPaddle; //top edge of paddle
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

void checkLeftPaddle() {
hasOverlappedLeftPaddle = doesOverlap (leftPaddleX, leftPaddleY, paddleWidth, paddleHeight, ballX, ballY, ballRadius);
if (hasOverlappedLeftPaddle) {
ballXSpeed = ballXSpeed * reverseSpeed;
}
}

void checkRightPaddle() {
hasOverlappedRightPaddle = doesOverlap(rightPaddleX, rightPaddleY, paddleWidth, paddleHeight, ballX, ballY, ballRadius);
if (hasOverlappedRightPaddle) {
ballXSpeed = ballXSpeed * reverseSpeed;
}
}

void displayScores (int s, int x, int y){
fill (255, 20, 255);  //setting text fill colour
stroke (255, 255, 255);  //setting text outline colour
textSize (sizeText);  //setting text size
text (player1Score, player1ScorePositionX, playerScorePositionY);  //left player score
text (player2Score, player2ScorePositionX, playerScorePositionY);  //right player score
}

void displayBall (int x, int y, int radius) {
fill (2, 255,255);  //setting ball fill colour
stroke (255, 255, 255);  //setting ball outline colour
ellipse (ballX, ballY, ballRadius, ballRadius);  //drawing the ball
}


void displayPaddles (int x, int y, int w, int h) {
fill (255,0,0);  //setting paddle fill colour
stroke (255,255,255); //setting paddle outline colour
rect (leftPaddleX, leftPaddleY, paddleWidth, paddleHeight);  //drawing left paddle
rect (rightPaddleX, rightPaddleY, paddleWidth, paddleHeight);  // drawing right paddle
}

void moveBall () {
if (gameOn) {

ballX = ballX + ballXSpeed;
ballY = ballY + ballYSpeed;
}else {
ballX = centreX;  //setting the ball to the centre
ballY = centreY;
}
}


void checkWall () {

if (ballY-ballRadius <= 0 || ballY+ballRadius >= screenHeight){
ballYSpeed = ballYSpeed * reverseSpeed;  //changing the ball direction
}


if (ballX-ballRadius <= 0) {
player2Score = player2Score + 1; //increasing right player score
gameOn = false;  //setting game off
ballXSpeed = ballXSpeed * reverseSpeed;  //reversing ball direction
ballYSpeed = ballYSpeed * reverseSpeed;

}else if (ballX+ballRadius >= screenWidth) {
player1Score = player1Score + 1;  //increasing right player score
gameOn = false;
ballXSpeed = ballXSpeed * reverseSpeed;
ballYSpeed = ballYSpeed * reverseSpeed;
}
}

boolean setGameMode() {
if (mousePressed) {
gameOn = true;  //starting the game
}
return gameOn;
}
	
boolean unsetBoolean = true;
float unset = 999.0;
float lpx()
{
	return rightPaddleX;
}
float lpy()
{
	return rightPaddleY;
}
float lpw()
{
	return paddleWidth;
}
float lph()
{
	return paddleHeight;
}
float rpx()
{
	return leftPaddleX;
}
float rpy()
{
	return leftPaddleY;
}
float rpw()
{
	return paddleWidth;
}
float rph()
{
	return paddleHeight;
}
float ls()
{
	return player2Score;
}
float lsx()
{
	return player2ScorePositionX;
}
float sy()
{
	return playerScorePositionY;
}
float rs()
{
	return player1Score;
}
float rsx()
{
	return player1ScorePositionX;
}
float b1x()
{
	return ballX;
}
float b1y()
{
	return ballY;
}
float b1xspeed()
{
	return ballXSpeed;
}
float b1yspeed()
{
	return ballYSpeed;
}
float b1w()
{
	return ballRadius;
}
boolean gon()
{
return gameOn;
}
float b1h()
{
	return ballRadius;
}
int getMouseX(){ return mouseX; }
int getMouseY(){ return mouseY; }
// Create setters
void setlpx(float x)
{
	rightPaddleX = (int) x;
}
void setlpy(float x)
{
	rightPaddleY = (int) x;
}
void setlpw(float x)
{
	paddleWidth = (int) x;
}
void setlph(float x)
{
	paddleHeight = (int) x;
}
void setrpx(float x)
{
	leftPaddleX = (int) x;
}
void setrpy(float x)
{
	leftPaddleY = (int) x;
}
void setrpw(float x)
{
	paddleWidth = (int) x;
}
void setrph(float x)
{
	paddleHeight = (int) x;
}
void setls(float x)
{
	player2Score = (int) x;
}
void setlsx(float x)
{
	player2ScorePositionX = (int) x;
}
void setsy(float x)
{
	playerScorePositionY = (int) x;
}
void setrs(float x)
{
	player1Score = (int) x;
}
void setrsx(float x)
{
	player1ScorePositionX = (int) x;
}
void setb1x(float x)
{
	ballX = (int) x;
}
void setb1y(float x)
{
	ballY = (int) x;
}
void setb1xspeed(float x)
{
	ballXSpeed = (int) x;
}
void setb1yspeed(float x)
{
	ballYSpeed = (int) x;
}
void setb1w(float x)
{
	ballRadius = (int) x;
}
void setgon(boolean x)
{
	gameOn = x;
}
void setb1h(float x)
{
	ballRadius = (int) x;
}
void setMouseX(int x){ mouseX = x; }
void setMouseY(int y){ mouseY = y; }

}
