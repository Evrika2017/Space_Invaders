/*
Game: Space Invaders
game designer: Andreas Lopez-muro
reg: 33354608
module title: foundations of programing.
Music composer: NemeisTheory
*/
class EBullet { 

  float xPos;//x position of the enemy.
  float yPos;//y position of the enemy.
  float wide = 10;//width of the bullet.
  float tall = 10;//width of the bullet.
  float velY;//velocity of the y-axis. it makes the bullet move downwards across the screen.
  PImage enemyBullet;//image sprite for enemy's bullet.
    
  boolean enabled; //means the bullet is active if true. if false, it will disappear from screen.
  
//--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  EBullet() { 
    xPos = width/2; 
    yPos = 0; 
    velY = 10;//this determines the speed of which the bullet travels.
    enabled = true; 

     enemyBullet = loadImage("Titles/redLaserRay.png");//image sprite for the enemies' bullet.
     enemyBullet.resize(30,10);
  }  
//--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  void reset(float l1, float l2) { 
    xPos = l1; 
    yPos = l2; 
    velY = 7;
    enabled = true; 

    image(enemyBullet,xPos,yPos);//image sprite with start coordinates.
}
//--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------  
  boolean getYpos(){
  
     return yPos == 700;//it returns true if the bullet is still in active window, and false if otherwise.
  }
 
//--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  void update() { 

    yPos+=velY;

    image(enemyBullet,xPos,yPos);
       
    
  }
}//end of class

