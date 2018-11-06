class Menu {
  

int state = stateMenu;
PFont font;

int cols, rows;
int scl = 20;
int w = 200;
int h = 3000;

float x = 50;
float y = 180;
float v = 160;
float b = 30;

float flying = 0;

float[][] terrain;

boolean isGamePlaying = false;

Menu(){

  smooth();
  font = createFont("ARCARTER-78.vlw", 14);
  textFont(font);
  textMode(MODEL);
  cols = w / scl;
  rows = h/ scl;
  terrain = new float[cols][rows];
  isGamePlaying = false;
} 
void MakeMenu()
{
  showMenu();  //<>//
  
     flying -= 0.07;
  
    float yoff = flying;
    for (int y = 0; y < rows; y++) {
      float xoff = 0;
      for (int x = 0; x < cols; x++) {
        terrain[x][y] = map(noise(xoff, yoff), -1, 2, -150, 250);
        xoff += 0.2;
      }
      yoff += 0.3;
    }


    stroke(255,0,0,100);
    fill(0);
  
    translate(width/2, height/2+50);
    rotateX(PI/3);
    translate(-w/2, -h/2);
    for (int y = 0; y < rows-1; y++) {
      beginShape(TRIANGLE_STRIP);
      for (int x = 0; x < cols; x++) {
        vertex(x*scl, y*scl, terrain[x][y]);
        vertex(x*scl, (y+1)*scl, terrain[x][y+1]);
        //rect(x*scl, y*scl, scl, scl);
      }
      endShape();
    } 
  
}
boolean getIsGamePlaying() {
  return isGamePlaying;
}
 //<>//

void showMenu() {
  background(255, 0, 0, 0);
  textSize(32);
  text(" Epic Dungeon Breakout ", 40, 50, 3);
  textSize(14);
  text(" Click Here To Play ", 50, 200);
  //
  text(" Press Any Key To Exit ", 50, 300);
    if(mouseX>x && mouseX <x+w && mouseY>y && mouseY <y+b){
      cursor(HAND);
    }
    else {cursor(ARROW);}
   noStroke();
   noFill();
   rect(x,y,v,b);
  
   if(mousePressed){
  if(mouseX>x && mouseX <x+w && mouseY>y && mouseY <y+b){
    playTheGame();
    noCursor();

 
  }
   }
  

void playTheGame() {
 isGamePlaying = true;
} 





}
