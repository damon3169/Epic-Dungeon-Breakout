import processing.sound.*;

Barre barre;
Ball ball1,ball2,ball3;
Timer startTimer;
Menu menu;
<<<<<<< HEAD
ArrayList<Brique> bricks;
=======
Score scoreMonstre; // score
>>>>>>> 3aadee8e9be52f97a548a1781515ba60afe69aa8

final int stateMenu                  = 0;
final int statePlayTheGame      = 1;
final int stateRules = 2;
float brickWidth = 20;
boolean firstTime;
float posXBrique ;
float posYBrique;


void setup() {
  size(700, 600, P3D);
  noFill();
  noStroke();
  smooth();
 barre = new Barre(300,590, 70);
 // ball2 = new Ball(500,450,15,5, 3);
 startTimer = new Timer(60);
 menu = new Menu();
 scoreMonstre = new Score(0);
  ball1 = new Ball(500,500,15,5, 3, scoreMonstre);
 }

void draw() {
   if (menu.getIsGamePlaying()){
      background(200);
     fill(0);
     if (!startTimer.timerEnd){
         if (firstTime)
         {
           firstTime = false;
           for (int i = 0;i<20; i++ ){
             
             //Brique brick = posXBrique
           }
         }
         noStroke();
         text(startTimer.getTime(),20,20); //Timer
         startTimer.countDown(); //Timer
         scoreMonstre.startScore(); //Score
         barre.spawnBarre(mouseX-barre.widthObject/2,550);
         ball1.createBall();
         // ball2.createBall();
        }
        else {
          println("Game Over");
        }
       }
    else  {
    menu.MakeMenu();
  }

  if (mousePressed) {

  }
  




}

void mouseMoved() {
    PVector newpos= new PVector(barre.posX,barre.posY);
        barre.listPosBarre.add(newpos);
    if (barre.listPosBarre.size()>2) barre.listPosBarre.remove(0);
    
}

void keyPressed() {
  exit();
}
