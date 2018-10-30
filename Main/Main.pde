//import processing.sound.*;

Barre barre;
Ball ball1,ball2,ball3;
Timer startTimer;
Menu menu;
ArrayList<Brique> bricks;
Score scoreMonstre; // score

final int stateMenu                  = 0;
final int statePlayTheGame      = 1;
final int stateRules = 2;
float brickWidth = 40;
boolean firstTime = true;
float posXBrique =50;
float posYBrique= 50;
Player player;
Monster monster;

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
 ball1 = new Ball(300,200,15,5, -3, scoreMonstre);
 bricks = new ArrayList<Brique>();
 monster = new Monster();
 player = new Player(monster);
}

void draw() {
   if (menu.getIsGamePlaying()){
     if(monster.life > 0){
      background(200);
     fill(0);
     if (!startTimer.timerEnd && player.life >= 0){
       if (ball1.getposY()<0){
          player.life --;
          ball1.posX = 300;
          ball1.posY = 100;
          ball1.vx = -3;
          ball1.vy = 5;
       }
         if (firstTime)
         {
           firstTime = false;
           for (int j = 0;j<5; j++ ){
             for (int i = 0;i<600/(brickWidth+10); i++ ){
               BriqueElementFeu brick = new BriqueElementFeu (posXBrique, posYBrique,ball1,player) ;
               bricks.add(brick);
               posXBrique = posXBrique + (brickWidth+10);
             }
             posXBrique = 50;
             posYBrique = posYBrique + (60);
          }
         }
         for (int i = 0; i < bricks.size(); i++) {
           bricks.get(i).createBrick();
         }
         player.spellCast();
         noStroke();
         text(startTimer.getTime(),20,20); //Timer
         startTimer.countDown(); //Timer
         scoreMonstre.startScore(); //Score
         barre.spawnBarre(mouseX-barre.widthObject/2,550);
         ball1.createBall();
         // ball2.createBall();
        }
        else{
          saveStrings("save.txt",scoreMonstre.stringScore());
          println("Game Over");
        }
       }
       else {
                 saveStrings("save.txt",scoreMonstre.stringScore());
                 clear();
                  println("You win");
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
