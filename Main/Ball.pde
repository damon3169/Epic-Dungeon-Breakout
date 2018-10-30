class Ball {
float posX;
float posY;
float vy;
float vx;
float widthBall;
ArrayList<PVector> hist = new ArrayList<PVector>();
float sizeTraceBall,traparenceTraceBall;
Score scoreMonstre;
float numberBricksAtFrame =0;


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

float getVy (){
  return vy;
}

float getwidthBall() {
 return widthBall;
}

float getposX (){
  return posX;
}

float getposY ( ){
  return posY ;
}


void addNumberBricksAtFrame(float newnumberBricksAtFrame){
  numberBricksAtFrame +=  newnumberBricksAtFrame;
}

void createBall(){
  float ax = 0;
  float ay = 0;
    if (numberBricksAtFrame % 2 == 0 && numberBricksAtFrame !=0){
    vy = -vy;
  }
  vx = vx + ax;
  vy = vy + ay;
  posX = posX + vx;
  posY = posY + vy;
  fill(0);  
  ellipse(posX,height-posY,widthBall,widthBall);
    this.setBallCollision(barre);
  this.drawStoreTrace() ;
  numberBricksAtFrame = 0;

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
     sizeTraceBall =sizeTraceBall +1;
     traparenceTraceBall = traparenceTraceBall +2.3;
  }
}

void setBallCollision(Barre barre) {
  if( posY>48 && posY<55 ){
    //collision avec extrémité gauche de la barre
    if( posX+widthBall/2>=barre.getPosX() && posX-widthBall/2<=barre.getPosX()+5 ){
      vy = -vy;
      scoreMonstre.scoreUp();
      if (vx>0){
        vx = -vx;
      }
      vx = vx *1.5;
      
    }
    //collision avec extrémité droite de la barre
    else if( posX+widthBall/2 >= barre.getPosX()+ barre.getwidthObject()-5 && posX-widthBall/2<= barre.getPosX()+barre.getwidthObject() ){
      vy = -vy;
      scoreMonstre.scoreUp();
      if (vx<0){
        vx = -vx;
      }
      vx = vx *1.5;
            

    }
    
    else if( posX+widthBall/2>=barre.getPosX() && posX-widthBall/2<= barre.getPosX()+(barre.getwidthObject()/2) ){
      //collision avec la gauche de la barre
      vy = -vy;
      scoreMonstre.scoreUp();
      if (vx>0){
        vx = -vx;
      }
    }
    else if( posX+widthBall/2>= barre.getPosX()+(barre.getwidthObject()/2) && posX-widthBall/2<= barre.getPosX()+barre.getwidthObject() ){
      //collision avec la droite de la barre
      vy = -vy;
      scoreMonstre.scoreUp();
      if (vx<0){
        vx = -vx;
      }
    }
  }
  
   if( posY+widthBall/2>=600 ){
    vy = -vy;
  }
  
  
  if ( posX-widthBall/2<=0 || posX+widthBall/2>=700 ){
    vx = -vx;
  }

}

}
