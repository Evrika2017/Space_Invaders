/*
Game: Space Invaders
game designer: Andreas Lopez-muro
reg: 33354608
module title: foundations of programing.
Music composer: NemeisTheory
*/
import ddf.minim.*;//calling the minim libary in processing

class GameMusic{
AudioPlayer player;
Minim minim;

//--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

//normal game theme that plays when player presses s to start game.
void gameMusic(Object o){
  try{
minim=new Minim(o);
 player=minim.loadFile("Music_for_game/18712_newgrounds_digie-.mp3");//locate file
 player.play();//when opened play this
 player.loop();//play the track when it ends.
   }
   catch (Exception e ){
      e.printStackTrace();
   }
}
//--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

//boss theme that plays after 95.2 seconds of playing the game (when the boss appears).
void BOSSMusic(Object o){
  try{
minim=new Minim(o);
 player=minim.loadFile("Music_for_game/BOSS.mp3");//locate file
 player.play();//when opened play this
 player.loop();//play the track when it ends
   }
   catch (Exception e ){
      e.printStackTrace();
   }
}
//--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

//game over theme that plays when player dies.
void gameOverMusic(Object o){
    try{
minim=new Minim(o);
 player=minim.loadFile("Music_for_game/GameOver.mp3");//locate file
 player.play();//when opened play this
 player.loop();//play the track when it ends
   }
   catch (Exception e ){
      e.printStackTrace();
   }
}
//--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

// the "you win" theme that plays when beat the boss.
void gameWinMusic(Object o){
    try{
minim=new Minim(o);
 player=minim.loadFile("Music_for_game/YouWin.mp3");//locate file
 player.play();//when opened play this
 player.loop();//play the track when it ends
   }
   catch (Exception e ){
      e.printStackTrace();
   }
}
//------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- 
 
//menu music that plays at the start screen.
void menuMusic(Object o){
    try{
minim=new Minim(o);
 player=minim.loadFile("Music_for_game/Menu theme.mp3");//locate file
 player.play();//when opened play this
 player.loop();//play the track when it ends
   }
   catch (Exception e ){
      e.printStackTrace();
   }
} 
//--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
 
//used to stop tracks from overlapping with each other when declaring certain tracks using methods with gameMusic class.
void stopMusic(){
    player.close();
    minim.stop();
  }


}//end of class
