/*
Game: Space Invaders
game designer: Andreas Lopez-muro
reg: 33354608
module title: foundations of programing.
Music composer: NemeisTheory
*/
class YouWinScreen{
    PImage winImage;
    
  
  PImage getImage(){
    winImage = loadImage("Titles/YOU WIN!.png");//image text for the "you win" title when the boss is defeated.
    winImage.resize(692,86);//settings to resize the image in its original dimensions its png form.
    return winImage;
    
}

}
