class Player {
  int life = 3;
  ArrayList<BriqueElementFeu> bricksElements;
  int spellNumber = 3;
  Monster monster;
  Player(Monster monster){
  this.monster = monster;
  bricksElements = new ArrayList<BriqueElementFeu>();
  }
  
  
  
  void spellCast(){
  if (bricksElements.size() == spellNumber) {
  for (int i =0; i<bricksElements.size(); i ++ ){
    println(bricksElements.get(i).colorBrick);
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
  
        bricksElements.removeAll(bricksElements);
  }
  }
}
}
