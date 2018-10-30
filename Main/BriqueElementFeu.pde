class BriqueElementFeu extends Brique{
  color colorBrick =  #FF1212;
  int id = 1;
  Player player;
  
  BriqueElementFeu(float posX, float posY, Ball ball,Player player) {
    super(posX,posY,ball);
    this.player = player;
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
       player.bricksElements.add(this);
      }
    }
  }
  
  private void brickTakeDamage(int damage){
    life -= damage;
  }
}
