import processing.sound.*;

Barre barre;
Ball ball1,ball2,ball3;


void setup() {
  size(600,600);
  noFill();
  noStroke();
  smooth();

 barre = new Barre(300,590, 70);
 ball1 = new Ball(500,500,15,5, 3);
 // ball2 = new Ball(500,450,15,5, 3);


}

void draw() {
  
  background(200);

    
   fill(0);
  barre.spawnBarre(mouseX-barre.widthObject/2,550);
  ball1.createBall();
  // ball2.createBall();





}

void mouseMoved() {
    PVector newpos= new PVector(barre.posX,barre.posY);
        barre.listPosBarre.add(newpos);
    if (barre.listPosBarre.size()>2) barre.listPosBarre.remove(0);
    
}
