/*
Game: Space Invaders
game designer: Andreas Lopez-muro
reg: 33354608
module title: foundations of programing.
Music composer: NemeisTheory
*/

//a class to represent the background of the main game.
class Background{
  PImage bgImage;
  
  PImage getImage(){
    bgImage = loadImage("Backgrounds/Sunrise_in_Space_by_gucken.jpg");//background for main game
    bgImage.resize(900,900);//settings to resize the background to fit the frame.
    return bgImage;
    
}
}
