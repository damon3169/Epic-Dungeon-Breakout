class MAIN_MENU {
final int stateMenu                  = 0;
final int statePlayTheGame      = 1;
final int stateRules = 2;
int state = stateMenu;


PFont font;

MAIN_MENU(){}



void setup()
{
  // runs only once
  //
  size(700, 600);
  smooth();
  font = createFont("ARCARTER-78.vlw", 14);
  textFont(font);
} // func
//
void draw()
{
  // the main routine. It handles the states.
  // runs again and again
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
  } // switch
  //
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
  background(255, 0, 0, 100);
  fill(0);
  textSize(52);
  text(" Epic Dungeon Brékout ", 60, 100, 3);
  textSize(14);
  text("Press 1 To Play The Game ", 100, 200);
  text("Press 2 Rules ", 100, 220);
  //
  text("Press x to quit ", 100, 260);
  //
} // func

void handleStatePlayTheGame() {
  background(255, 0, 0);
  fill(0);
  textSize(32);
  text(" Play The Game ", 150, 100, 3);
  textSize(14);
  text("This is the fucking game, got ya ", 100, 200);
  //
} // func
//

void handleStateRules() {
  background(255, 204, 0);
  fill(0);
  textSize(32);
  text(" The Rules ", 150, 100, 3);
  textSize(14);
  text("..... some text ", 100, 200);
  //
} // func
// ----------------------------------------------------------------
//
}
