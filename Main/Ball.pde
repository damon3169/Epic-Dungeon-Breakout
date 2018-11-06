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
  float baseAngle;
  float newAngle;
  
  Ball (float posX,float posY,float widthObject,float vy,float vx, Score score) {
    this.posX = posX;
    this.posY = posY;
    this.widthBall =widthObject ;
    this.vy =vy;
    this.vx = vx;
    scoreMonstre = score;
    PVector vector = new PVector (vx,vy);
    baseAngle = PVector.angleBetween(vector,new PVector (0,1)); 
    newAngle = baseAngle;
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
  
  //Permet de compter nb de briques a la frame
  void addNumberBricksAtFrame(float newnumberBricksAtFrame){
    numberBricksAtFrame +=  newnumberBricksAtFrame;
  }
  
  //cree la balle et test les collisions
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
  
  //Dessine et enregistre la trace de la balle
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
  
  //Fonction qui test les collisions et modifie la trajectoire de la balle si necessaire
  void setBallCollision(Barre barre) {
    if( posY>48 && posY<55 ){
      //collision avec extrémité gauche de la barre
      if( posX+widthBall/2>=barre.getPosX() && posX-widthBall/2<=barre.getPosX()+5 ){
        vy = -vy;
         if (vx>0){
          vx = -vx;
        }
        vx = vx*cos(-30)-vy*sin(-30);
  
        newAngle = baseAngle-30;
        bounce.play();
      }
      //collision avec extrémité droite de la barre
      else if( posX+widthBall/2 >= barre.getPosX()+ barre.getwidthObject()-5 && posX-widthBall/2<= barre.getPosX()+barre.getwidthObject() ){
        vy = -vy;
        scoreMonstre.scoreUp();
        if (vx<0){
          vx = -vx;
        }
        vx = vx*cos(30)-vy*sin(30);
        newAngle = baseAngle+30;
        bounce.play();
      }
      
      //collision avec la gauche de la barre
      else if( posX+widthBall/2>=barre.getPosX() && posX-widthBall/2<= barre.getPosX()+(barre.getwidthObject()/2) ){
        vy = -vy;
        scoreMonstre.scoreUp();
                  if (newAngle != baseAngle ) {
       vx = 3;
        }
        if (vx>0){
          vx = -vx;
        }
        bounce.play();
      }
       
      //collision avec la droite de la barre
      else if( posX+widthBall/2>= barre.getPosX()+(barre.getwidthObject()/2) && posX-widthBall/2<= barre.getPosX()+barre.getwidthObject() ){
        vy = -vy;
                   if (newAngle != baseAngle ) {
       vx = -3;
        }
        if (vx<0){
          vx = -vx;
        }
        bounce.play();
      }
    }
    //Fais rebondir balle en y
     if( posY+widthBall/2>=600 ){
  
      vy = -vy;
     
    }
    
    //Fais rebondir balle en x
    if ( posX-widthBall/2<=0 || posX+widthBall/2>=680 ){
  
      vx = -vx;
    }
  
  }

}
