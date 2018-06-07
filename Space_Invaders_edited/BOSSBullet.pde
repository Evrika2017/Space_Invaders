/*
Game: Space Invaders
game designer: Andreas Lopez-muro
reg: 33354608
module title: foundations of programing.
Music composer: NemeisTheory
*/
class BBullet { 

  float xPos; //x position of the boss.
  float yPos; //y position of the boss.
  float wide = 50;//width of the bullet.
  float tall = 50;//height of the bullet.
  float velY; //velocity of the y-axis. it makes the bullet move downwards across the screen.
  PImage bossBullet;//sprite for the boss's bullet
  boolean enabled; //means the bullet is active if true. if false, it will disappear from screen.
//--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  BBullet() { //constructor of the BBullet
    xPos = width/2; 
    yPos = 0; 
    velY = 17;
    enabled = true; 
     bossBullet = loadImage("Titles/redLaserRay.png");
     bossBullet.resize(80,80);

  }  
//--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  void reset(float l1, float l2) { 
    xPos = l1; 
    yPos = l2; 
    velY = 17;//this determines the speed of which the bullet travels.
    enabled = true; 
    image(bossBullet,xPos,yPos); //setted sprite 
}
//--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------  
  boolean getYpos(){
  
     return yPos == 700;//it returns true if the bullet is still in active window, and false if otherwise.
  }
//-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- 

  void update() { 

    yPos+=velY;
    //stroke(255, 0, 0);
   // fill(255); 
    image(bossBullet,xPos,yPos);
       
    
  }
}//end of class

