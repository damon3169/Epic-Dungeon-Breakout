class Ball {
float posX;
float posY;
float vy;
float vx;
float widthBall;
ArrayList<PVector> hist = new ArrayList<PVector>();
float sizeTraceBall,traparenceTraceBall;
Score scoreMonstre;


Ball (float posX,float posY,float widthObject,float vy,float vx, Score score) {
  this.posX = posX;
  this.posY = posY;
  this.widthBall =widthObject ;
  this.vy =vy;
  this.vx = vx;
  scoreMonstre = score;
}

void setVx (float vx){
  this.vx = vx;
}

void setVy (float vy){
  this.vy = vy;
}

float getVx (){
  return vx;
}

float getVy ( ){
  return vy ;
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
    //collision avec extrémité gauche de la barre
    if( posX>barre.getPosX() && posX<barre.getPosX()+5 ){
      vy = -vy;
      scoreMonstre.scoreUp();
      if (vx>0){
        vx = -vx;
        
      }
      vx = vx *1.5;
      
    }
    //collision avec extrémité droite de la barre
    else if( posX> barre.getPosX()+ barre.getwidthObject()-5 && posX< barre.getPosX()+barre.getwidthObject() ){
      vy = -vy;
      scoreMonstre.scoreUp();
          println(vx);
      if (vx<0){
        vx = -vx;
      }
      vx = vx *1.5;
            

    }
    
    else if( posX>barre.getPosX() && posX< barre.getPosX()+(barre.getwidthObject()/2) ){
      //collision avec la gauche de la barre
      vy = -vy;
      scoreMonstre.scoreUp();
      if (vx>0){
        vx = -vx;
      }
    }
    else if( posX> barre.getPosX()+(barre.getwidthObject()/2) && posX< barre.getPosX()+barre.getwidthObject() ){
      //collision avec la droite de la barre
      vy = -vy;
      scoreMonstre.scoreUp();
      if (vx<0){
        vx = -vx;
      }
    }
  }
  
   if( posY>=600 ){
    vy = -vy;
  }
  
  
  if ( posX<=0 || posX>=700 ){
    vx = -vx;
  }

}


}
