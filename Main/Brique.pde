class Brique {
  float widthBrick = 40;
  float heigthBrick = 10;
  float posX;
  float posY;
  color colorBrick =  #000000;
  int life = 1;
  int dammage;
  Ball ball;
  
  Brique(float posX, float posY, Ball ball) {
    this.posX = posX;
    this.posY = posY;
    this.ball = ball;
  }
  
  public void createBrick() {
    if (life> 0){
      fill(colorBrick);
      rect(posX,posY,widthBrick,heigthBrick);
      isCollideBall();
    }
    
  }
  
  private void isCollideBall(){
    if (ball.getposX()+ball.getwidthBall()/2 >= this.posX && ball.getposX()-ball.getwidthBall()/2<=  this.posX + widthBrick){ 
     if (600-(ball.getposY()-ball.getwidthBall()/2) >= this.posY && 600-(ball.getposY()+ball.getwidthBall()/2)<=  this.posY + heigthBrick){
       brickTakeDamage(1);
       ball.addNumberBricksAtFrame(1);
       ball.setVy( -ball.getVy());
      }
    }
  }
  
  private void brickTakeDamage(int damage){
    life -= damage;
  }
}
