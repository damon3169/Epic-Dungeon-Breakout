class Score {
  
  int scoreMonstre;
  
  Score (int scoreBase){
    scoreMonstre = scoreBase;
  }
  
  void startScore(){
    textSize(20);
    fill(#FFFFFF);
    text(scoreMonstre,660, 20);
  }
  
  void scoreUp()
  
    {
      scoreMonstre += 1;
    }
    
    
  String[] stringScore(){
  String[] table=new String[1];
  table[0]=str(scoreMonstre);
  
  return table;}
}
