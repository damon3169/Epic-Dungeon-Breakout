import processing.sound.*;

Barre barre;
Ball ball1,ball2,ball3;
Timer startTimer;


void setup() {
  size(600,600);
  noFill();
  noStroke();
  smooth();
 barre = new Barre(300,590, 70);
 ball1 = new Ball(500,500,15,5, 3);
 // ball2 = new Ball(500,450,15,5, 3);
 startTimer = new Timer(10);

}

void draw() {
  
  background(200);
  
  startTimer.countDown(); //Timer
  fill(0); //Timer
  text(startTimer.getTime(),20,20); //Timer
 
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
