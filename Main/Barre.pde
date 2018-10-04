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
  rect(X,Y,widthObject,10);
}

}
