class Ball {
float posX;
float posY;
float vy;
float vx;
float widthBall;
ArrayList<PVector> hist = new ArrayList<PVector>();
float sizeTraceBall,traparenceTraceBall;


Ball (float posX,float posY,float widthObject,float vy,float vx) {
  this.posX = posX;
  this.posY = posY;
  this.widthBall =widthObject ;
  this.vy =vy;
  this.vx = vx;
}

void setVx (float vx){
  this.vx = vx;
}

void setVy (float vy){
  this.vy = vy;
}

void createBall(){
  float ax = 0;
  float ay = 0;
  vx = vx + ax;
  vy = vy + ay;
  posX = posX + vx;
  posY = posY + vy;
  fill(0);  
  ellipse(posX,height-posY,widthBall,widthBall);
    this.setBallCollision(barre);
  this.drawStoreTrace() ;
}

void drawStoreTrace() {
   PVector newpos= new PVector(posX,height-posY);
     sizeTraceBall = 0;
  traparenceTraceBall = 0;
    hist.add(newpos);
    if (hist.size()>15) hist.remove(0);
   for (int i=0;i<hist.size();i++) {   
     fill(0,traparenceTraceBall);
     ellipse(hist.get(i).x, hist.get(i).y, sizeTraceBall, sizeTraceBall);
     sizeTraceBall =sizeTraceBall +1.25;
     traparenceTraceBall = traparenceTraceBall +2.3;
  }
}

void setBallCollision(Barre barre) {
  if( posY>48 && posY<55 ){
    if( posX>barre.getPosX() && posX< barre.getPosX()+(barre.getwidthObject()/2) ){
      vy = -vy;
      if (vx>0){
        vx = -vx;
      }
    }
    if( posX> barre.getPosX()+(barre.getwidthObject()/2) && posX< barre.getPosX()+barre.getwidthObject() ){
      vy = -vy;
      if (vx<0){
        vx = -vx;
      }
    }
    /*float dif = barre.listPosBarre.get(0).x -barre.listPosBarre.get(1).x;
     if (Math.abs(dif)> 15){
      // faire acceler la balle
     }*/
    
  }
  
   if( posY>=600 ){
    vy = -vy;
  }
  
  
  if ( posX<=0 || posX>=600 ){
    vx = -vx;
  }

}


}
