/*
Game: Space Invaders
game designer: Andreas Lopez-muro
reg: 33354608
module title: foundations of programing.
Music composer: NemeisTheory
*/
class GameOverScreen{
    PImage GOSImage, TImage;
    
  
  PImage getImage(){
    GOSImage = loadImage("Titles/cooltext116575478969829.png");//tilte text for the game over stage when the player dies.
    GOSImage.resize(692,86);//resized to fit the original dimensions of the image in its png form.
    return GOSImage;
    
}

}
