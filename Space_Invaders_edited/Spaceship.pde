/*
Game: Space Invaders
game designer: Andreas Lopez-muro
reg: 33354608
module title: foundations of programing.
Music composer: NemeisTheory
*/
public class Spaceship{
  
   PImage SSimage;
   float x = width/2;//starting position of the spaceship.
   float y = height - 30;//this determines at which height is the spaceship going to be fixed on the y-axis
   float wide;//width of the spaceship
   float tall;//height of the spaceship
   float targetSize = 80 ; //the width of the area of the spaceship can be damaged by enemies and the boss.
   boolean enabled = true;//to validate whether the spaceship's bullet are still on screen. if it's false, then the bullet is removed.
   
  Spaceship(){
    SSimage = loadImage("spaceships for course work/Protaganist.png");//image sprite for spaceship, which the player controls.
  }
  
  void showSpaceship(){
     SSimage.resize(90,45);
     imageMode(CENTER);
     image(SSimage,x,y);//image sprite for spaceship with starting coordinates.
   
    

     
}

void removeSpaceship(boolean state){
  enabled = state;//this stops all control function of the spaceship when the game is over.
  
}
  

void update(float speed){
  
  if(!enabled) return;
  
  x += speed*5.11111111*5.1111111111;//aceleration of the spaceship to give the sprite very smooth movement.
  pushMatrix();
  translate(x, y) ;
  image(SSimage,x,y);
  popMatrix();
  
}
boolean hitTest(int xpos, int ypos) { 
    
    return (dist(x, y, xpos, ypos) < targetSize/2); //this returns true if the bullet is in range of the target.
    
    
    
  }

}



