import processing.sound.*;

SoundFile bounce;
SoundFile bounceBrique;
  SoundFile Garlax01;

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
int lifeBase = 100;
float TimerSong = 153;
float TimerSongBegin;
SoundFile music;
PImage blizzardskull;
boolean isInIntro = true;

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
   bounce = new SoundFile(this, "Barre.wav");
   bounceBrique = new SoundFile(this, "Brique.wav");
   Garlax01 = new SoundFile(this, "Garlax01.wav");
          textFont(font);
   TimerSongBegin = second();
  music = new SoundFile(this, "Battle.wav");
  music.play();
            blizzardskull=loadImage("blizzardskull.png");
}

void draw() {
    if (second() - TimerSongBegin >= TimerSong) 
    {
      music.play();
    }
   if (menu.getIsGamePlaying()){
     if(isInIntro){
      background(200);
     text("Les ténèbres envahissent peu à peu le royaume ! La peur est présente dans les coeurs de tous les habitants de Cyfandresse...",100,60);
     text("Le dragon  Garlax doit être anéanti ! Caché dans son antre, seul un magicien puissant peut vaincre le monstre ! ",100,140);
     text("Le peuple de Cyfandresse demande donc de l'aide au plus grand magicien du royaume : Poul-Le-Git !",100,220);
     text("La sagesse et la puissance de Poul-Le-Git rivaliseront elles avec la haine de Garlax ?",100,300);
     text("Commandes :",100,380);
     text("Déplacez le bâton magique de Poul-Le-Git à l'aide de votre souris pour faire rebondir les boules magiques",100,450);
     text("Votre boule magique doit rentrer en contact avec 3 briques élémentaires pour attaquer Garlax",100,510);
     text("Vous avez 60 secondes pour sauver le royaume !",100, 570);
     
     
     if(keyCode == ENTER){
       isInIntro = false;
      }
     }
     else {
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
               //brique basique
               else if (rand >= 7 &&  rand <= 13){
                 Brique brick = new Brique (posXBrique, posYBrique,ball1,0,player,#000000) ;
                 bricks.add(brick);
               }// autre emplacement vide
               
               posXBrique = posXBrique + (brickWidth+60);
             }
             posXBrique = 30;
             posYBrique = posYBrique + (60);
          }
          //Augmentation du pourcentage de vide
          randomMax += 10 ;
         }
         //Affiche et fait la collision de toutes les briques
         for (int i = 0; i < bricks.size(); i++) {
           bricks.get(i).createBrick();
         }
         //Affiche les pv du monstre et secoue+ change couleur du monstre si prends dommage
         monster.showLife();
         //Attaque le monstre si trois elements recuperer
         player.spellCast();
         //Affiche les spells recuperer
         player.showSpell();
         noStroke();
         textSize(20);
         fill(#FFFFFF);
         text(startTimer.getTime(),20,20); //Timer
         startTimer.countDown(); //Timer
         scoreMonstre.startScore(); //Score
         //Fais en sorte que la barre suive la souris
         barre.spawnBarre(mouseX-barre.widthObject/2,550);
         //Affiche la balle + trace balle et gere collision balle
         ball1.createBall();
         //Si effet dommage fini
         if(monster.tookDamage && millis() - monster.time >= damageColorDuraton){
             println("test");
             noTint();
             monster.tookDamage = false;
             monster.life = monster.newlife;
             monster.lastDamage = 0;
         }
        }
        //Sinon Game Over
        else{
          //Ecran Game Over
          clear();
          println("Game Over");
          image(blizzardskull,0,0);
              blizzardskull.resize(1400,600);
               if(mousePressed){
                     saveStrings("save.txt",scoreMonstre.stringScore());
                     monster.newlife = 100;
                     monster.life = 100;
                     lifeBase = 100;
                     randomMax = 13;
                     scoreMonstre.scoreMonstre = 0;
                     player.life = 3;
                     startTimer.Time = 60;
                     firstTime = true;
                     startTimer.timerEnd = false;
                     menu.isGamePlaying = false;
                     player.bricksElements.removeAll(player.bricksElements);
                    }
        }
       }
       //Sinon Win
       else {
       //Ecran Win
 
                 clear();
                 fill(#FFFFFF);
                          textSize(50);

                 text("Poul-Le-Git terrassa Garlax et",350,300);
                 text("sauva le royaume de Cyfandresse", 350,400);
                    if(mousePressed){
                      monster.newlife = lifeBase+10;
                      monster.life = lifeBase+10;
                      lifeBase = lifeBase+10;
                      randomMax = 13;
                      firstTime = true;
                      startTimer.Time = 60;
                      player.bricksElements.removeAll(player.bricksElements);
                      scoreMonstre.scoreUp();
                      saveStrings("save.txt",scoreMonstre.stringScore());

                    }
       }
   }
   }
    else  {
    menu.MakeMenu();
  }
  
}

void keyPressed() {
  if(keyCode == ESC){
  exit();
  }
}

//Replace balle
void replaceBall(){
          ball1.posX = random(100,500);
          ball1.posY = 280;
          //ball1.vx = 3;
          ball1.vy = -5;
}
