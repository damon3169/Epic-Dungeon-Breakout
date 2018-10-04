class Barre {
float posX;
float posY;
float widthObject;

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

void setPosX(float posX) {
  this.posX = posX;
}

void setPosY(float posY) {
  this.posY = posY;
}


float getwidthObject() {
 return posX;
}

void spawnBarre(float x, float y) 
{
  fill(0);
  rect (x,y,widthObject,5);
}

}
