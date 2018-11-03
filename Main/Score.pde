class Score


{
  
int scoreMonstre;

Score (int scoreBase){
  scoreMonstre = scoreBase;
}

void startScore(){
  textSize(14);
  fill(#FFFFFF);
  text(scoreMonstre,680, 590);
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
