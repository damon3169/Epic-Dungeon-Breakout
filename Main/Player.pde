class Player {
  int life = 3;
  ArrayList<Brique> bricksElements;
  int spellNumber = 3;
  Monster monster;
  Player(Monster monster){
  this.monster = monster;
  bricksElements = new ArrayList<Brique>();
  }
  
  //Affiche les spells récuperer 
  void showSpell() {
    float posXSpeel = 20;
    float posYSpeel = 550;
    if (bricksElements.size()> 0){
      for (int i =0; i<bricksElements.size(); i ++ ){
         switch(bricksElements.get(i).id){
            case 1 :
              fill(#F22E32);
              ellipse(posXSpeel, posYSpeel, 20, 20);
            break;
            case 2 :
              fill(#2D7BDE);
              ellipse(posXSpeel, posYSpeel, 20, 20);
            break;
            case 3 :
              fill(#FFFFFF);
              ellipse(posXSpeel, posYSpeel, 20, 20);
            break;
          }
        posXSpeel += 25;
      }
    }
  }
  
  // Attaque le monstre si spellNumber elements recuperer
  void spellCast(){
    //si x element dans le spell alors fait des dommages au monstres en fonction des elements du spell
  if (bricksElements.size() == spellNumber) {
    for (int i =0; i<bricksElements.size(); i ++ ){
      switch(bricksElements.get(i).id){
          case 1 :
            monster.takeDamage(15);
          break;
          case 2 :
            monster.takeDamage(10);
          break;
          case 3 :
            monster.takeDamage(5);
          break;
        }
        firstTime = true;
    }
    //Vide le tableau d'element
        bricksElements.removeAll(bricksElements);
        replaceBall();
  }
}
}
