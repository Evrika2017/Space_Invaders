/*
Game: Space Invaders
game designer: Andreas Lopez-muro
reg: 33354608
module title: foundations of programing.
Music composer: NemeisTheory
*/
//timer class uses millis function to control the game's times and to display music at different stages of the game.
class Timer {


int savedTime;
int totalTime = 95000;//total time of gameplay before boss apears/
int  passedTime  = 0;
int seconds;


void makeTimer() {
  savedTime = millis();//time in milliseconds.

 
}

void showTimer() {
  // Calculate how much time has passed
     passedTime = millis() - savedTime;
  
  

}
}//end of class

