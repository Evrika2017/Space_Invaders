/*
Game: Space Invaders
game designer: Andreas Lopez-muro
reg: 33354608
module title: foundations of programing.
Music composer: NemeisTheory
*/
class Bullet { 

  float xPos; //x position of the enemy.
  float yPos; //y position of the enemy.
  float wide = 10;//width of the bullet.
  float tall = 50;//width of the bullet.
  float velY;//velocity of the y-axis. it makes the bullet move upwards across the screen.
  PImage SBullet;
    
  boolean enabled; //to validate whether the spaceship's bullet are still on screen. if it's false, then the bullet is removed. all the bullets have limited lifespan when visble on screen.

  Bullet(float loc) { 
    SBullet = loadImage("Titles/greenLaserRay copy.png");//image sprite for spaceship's bullet.
    SBullet.resize(20,30);
       reset(loc);
  }  

  void reset(float l) { 
    xPos = l; 
    //xPos = width/2; 
    yPos = height - 95; //spawing point of the spaceship's bullets.
    velY = -30;
    enabled = true; 
}
  
  
 

  void update() { 
  
    yPos+=velY;

     image(SBullet,xPos,yPos);
    
  }
}

