class Monster{
  int life = 100;
  PImage background;
  PImage monsterPic;
  float time;
  boolean tookDamage= false;
  int lastDamage ;
  int newlife;
  
  Monster(){
  background=loadImage("back_cave.png");
  monsterPic = loadImage("pipo-enemy021a.png");
  newlife = life;
  }
  
  //Enleve des pv au monsres
  void takeDamage(int damage){
    newlife -= damage;
    tint(245, 0, 0,126);
    time = millis();  
    tookDamage = true;
    lastDamage += damage;
  }
  
  //Affiche les pv du monstre et secoue+ change couleur du monstre si prends dommage
  void showLife(){
    textSize(50);
    fill(#F22E32);
    //Affiche background
    image(background, 700, 0);
    background.resize(700,600);
    //Affiche vie monstre
    text(life,800, 50);
    //Affiche monstre
    image(monsterPic, 800, 100);
    //Si en effet dommage
    if(tookDamage){
      image(monsterPic, random(790,810), 100  );
      fill(#FFFFFF);
      text("-"+lastDamage,780,100);
      textSize(700);
    }
  }

}
