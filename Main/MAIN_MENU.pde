final int stateMenu                  = 0;
final int statePlayTheGame      = 1;
final int stateRules = 2;
int state = stateMenu;
//Menu
PFont font;

int cols, rows;
int scl = 20;
int w = 200;
int h = 3000;

float flying = 0;

float[][] terrain;


void setup(){

  size(700, 600, P3D);
  smooth();
  font = createFont("ARCARTER-78.vlw", 14);
  textFont(font);
  textMode(MODEL);
  cols = w / scl;
  rows = h/ scl;
  terrain = new float[cols][rows];
} // func
//
void draw()
{
  switch (state) {
  case stateMenu:
    showMenu();
    break;
  case statePlayTheGame:
    handleStatePlayTheGame();
    break;
  case stateRules:
    handleStateRules();
    break;
  default:
    println ("Unknown state (in draw) "
      + state
      + " ++++++++++++++++++++++");
    exit();
    break;
  } 
  
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
  
} // func
// ----------------------------------------------------------------
// keyboard functions

void keyPressed() {
  // keyboard. Also different depending on the state.
  switch (state) {
  case stateMenu:
    keyPressedForStateMenu();
    break;
  case statePlayTheGame:
    keyPressedForStatePlayTheGame();
    break;
  case stateRules:
    keyPressedForStateRules();
    break;
  default:
    println ("Unknown state (in keypressed) "
      + state
      + " ++++++++++++++++++++++");
    exit();
    break;
  } // switch
  //
} // func
void keyPressedForStateMenu() {
  //
  switch(key) {
  case '1':
    state = statePlayTheGame;
    break;
  case '2':
    state = stateRules;
    break;
  case 'x':
  case 'X':
    // quit
    exit();
    break;
  default:
    // do nothing
    break;
  }// switch
  //
} // func
void keyPressedForStatePlayTheGame() {
  // any key is possible
  switch(key) {
  default:
    state = stateMenu;
    break;
  } // switch
  //
} // func
void keyPressedForStateRules() {
  // any key is possible
  switch(key) {
  default:
    state = stateMenu;
    break;
  } // switch
  //
} // func

// ----------------------------------------------------------------
// functions to show the menu and functions that are called from the menu.
// They depend on the states and are called by draw().

void showMenu() {
  background(255, 0, 0, 0);
  textSize(32);
  text(" Epic Dungeon Brékout ", 40, 50, 3);
  textSize(14);
  text("Press 1 To Play The Game ", 50, 200);
  text("Press 2 Rules ", 500, 200);
  //
  text("Press x to quit ", 500, 460);
  //
} // func

void handleStatePlayTheGame() {

  fill(0);
  textSize(32);
  text(" Play The Game ", 0, 100, 3);
  textSize(14);
  text("This is the fucking game, got ya ", 0, 100);
  //
} // func
//

void handleStateRules() {

  fill(0);
  textSize(32);
  text(" There are ", 150, 100, 3);
  textSize(14);
  text(" no rules ", 100, 200);
  //
} // func
// ----------------------------------------------------------------
//
