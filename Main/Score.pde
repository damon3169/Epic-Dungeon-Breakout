class Score


{
  
int scoreMonstre;

Score (int scoreBase){
  scoreMonstre = scoreBase;
}

void startScore(){
  
  fill(#FFFFFF);
  text(scoreMonstre,680, 590);
  textSize(14);
  
  
  
}

void scoreUp()

  {
    scoreMonstre += 1;
  }
  
  



}
