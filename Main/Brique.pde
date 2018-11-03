class Brique {
  float widthBrick = 40;
  float heigthBrick = 10;
  float posX;
  float posY;
  color colorBrick =  #000000;
  int life = 1;
  int dammage;
  Ball ball;
  int id = 0;
  Player player;
  
  Brique(float posX, float posY, Ball ball, int id, Player player,color colorBrick) {
    this.posX = posX;
    this.posY = posY;
    this.ball = ball;
    this.id = id;
    this.player = player;
    this.colorBrick = colorBrick;
  }
  
  public void createBrick() {
    if (life> 0){
      fill(colorBrick);
      rect(posX,posY,widthBrick,heigthBrick);
      isCollideBall();
    }
  }
  
  private void isCollideBall(){
    //detect si collision avec balle, si brique possede element alors ajoute l'element au sort du joueur
     if (ball.getposX()+ball.getwidthBall()/2 >= this.posX && ball.getposX()-ball.getwidthBall()/2<=  this.posX + widthBrick){ 
       if (600-(ball.getposY()-ball.getwidthBall()/2) >= this.posY && 600-(ball.getposY()+ball.getwidthBall()/2)<=  this.posY + heigthBrick){
         brickTakeDamage(1);
         ball.addNumberBricksAtFrame(1);
         ball.setVy( -ball.getVy());
         if (id!= 0){
           player.bricksElements.add(this);
           delay(20);
         }
        }
      
    }
  }
  
  private void brickTakeDamage(int damage){
    life -= damage;
  }
}
