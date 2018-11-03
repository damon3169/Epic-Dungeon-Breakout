class Barre {
float posX;
float posY;
float widthObject;
ArrayList<PVector> listPosBarre = new ArrayList<PVector>();


Barre (float posX,float posY,float widthObject) {
  this.posX = posX;
  this.posY = posY;
  this.widthObject =widthObject ;
}

float getPosX() {
 return posX;
}

float getPosY() {
 return posX;
}

void setPosX(float X) {
    this.posX = X;

}

void setPosY(float Y) {
 this.posY = Y;
}

float getwidthObject() {
 return widthObject;
}

void spawnBarre(float X,float Y) 
{
    setPosX( X);
    setPosY( Y);
    if(X < 600 && X > 0){
      rect(X,Y,widthObject,10);
    }
    else if (X > 600){
       rect(680-widthObject,Y,widthObject,10);

    }
    else if (X < 0){
       rect(0,Y,widthObject,10);

    }
  
}

}
