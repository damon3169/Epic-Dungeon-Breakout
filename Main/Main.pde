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
float damageColorDuraton = 500;
PFont font;
int randomMax = 13;

void setup() {
  size(1400, 600, P3D);
  noFill();
  noStroke();
  smooth();
 barre = new Barre(300,590, 70);
 // ball2 = new Ball(500,450,15,5, 3);
 startTimer = new Timer(60);
 menu = new Menu();
font = createFont("Scriptina",50);
 scoreMonstre = new Score(0);
 ball1 = new Ball(300,200,15,5, -3, scoreMonstre);
 bricks = new ArrayList<Brique>();
 monster = new Monster();
 player = new Player(monster);
}

void draw() {
   if (menu.getIsGamePlaying()){
     textFont(font);
     //Si jeu lancer
     if(monster.newlife > 0){
       //si monstre pas mort
      background(200);
       fill(255,100,50);
           rect(680,0,20,600);

     fill(0);
     if (!startTimer.timerEnd && player.life >= 0){
       //si le joueur a encore des pv et a encore du temps
       if (ball1.getposY()<0){
         //Detecte si la balle est hors du jeu, enleve un pv au joueur et replace la balle
          player.life --;
         replaceBall();
       }
         if (firstTime || bricks.size() == 0)
         {
           //place les briques du terrain
           bricks.clear();
           firstTime = false;
           posXBrique = 30;
           posYBrique = 50;
           for (int j = 0;j<5; j++ ){
             for (int i = 0;i<680/(brickWidth+60); i++ ){
               int rand = int(random(0,randomMax));
               //random le type de brique
               //brique feu
               if (rand <= 1){
                 Brique brick = new Brique (posXBrique, posYBrique,ball1,1,player,#F22E32) ;
                 bricks.add(brick);
               }
               //brique eau
               else if(rand == 2 || rand == 3){
                 Brique brick = new Brique (posXBrique, posYBrique,ball1,2,player,#2D7BDE) ;
                 bricks.add(brick);
               }
               //bique air
               else if(rand >= 4 &&  rand <= 6){
                 Brique brick = new Brique (posXBrique, posYBrique,ball1,3,player,#FFFFFF) ;
                 bricks.add(brick);
               }
               
               else if (rand >= 7 &&  rand <= 13){
                 Brique brick = new Brique (posXBrique, posYBrique,ball1,0,player,#000000) ;
                 bricks.add(brick);
               }
               
               posXBrique = posXBrique + (brickWidth+60);
             }
             posXBrique = 30;
             posYBrique = posYBrique + (60);
          }
          randomMax += 10 ;
         }
         for (int i = 0; i < bricks.size(); i++) {
           bricks.get(i).createBrick();
         }
         monster.showLife();
         player.spellCast();
         player.showSpell();
         noStroke();
         textSize(14);
         text(startTimer.getTime(),20,20); //Timer
         startTimer.countDown(); //Timer
         scoreMonstre.startScore(); //Score
         barre.spawnBarre(mouseX-barre.widthObject/2,550);
         ball1.createBall();
         //Si effet dommage fini
         if(monster.tookDamage && millis() - monster.time >= damageColorDuraton){
           println("test");
             noTint();
             monster.tookDamage = false;
             monster.life = monster.newlife;
             monster.lastDamage = 0;
         }
         // ball2.createBall();
        }
        else{
          saveStrings("save.txt",scoreMonstre.stringScore());
          clear();
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

void replaceBall(){
          ball1.posX = random(100,500);
          ball1.posY = 280;
          //ball1.vx = 3;
          ball1.vy = -5;
}
