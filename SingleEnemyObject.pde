/*
Game: Space Invaders
game designer: Andreas Lopez-muro
reg: 33354608
module title: foundations of programing.
Music composer: NemeisTheory
*/
class EnemyObject { 
  
  
 private PImage enemyImage;

  float x = 0; 
  float y = 0; 
  float velX = 0; 
  float velY = 0; 
  boolean state = false ;
  float targetSize = 50; ////this determines the width of the area where the enemy can be damaged by the spaceship's bullets.
  EBullet eBullet; 
  
  boolean enabled = true; 
  
  EnemyObject(float xpos, float ypos, float velx, float vely) { 
    
    x = xpos; 
    y = ypos; 
    velX = velx; 
    velY = vely;
    //this randomizes the number of enemy types in the game to appear, and can be used in the load image function to create the randomization. 
    int enemyNumber = (int)random(1,13);
    smooth();
    //this loads the sprites from enemy type 1 to enemy type 13, and it randomly generates every 20 frames within gameplay.
    enemyImage = loadImage("spaceships for course work/Enemies/enemy"+enemyNumber+".png");
    enemyImage.resize(80,80);
    
    eBullet = new EBullet();
    
  }
  

//once bullet reaches destination, get another Ebullet back.
EBullet getEBullet(){
  return eBullet ;
}

void update(float ssX) { 
    
    if(!enabled) return;    
    
    x+=velX; 
    y+=velY; 
    
    noStroke(); 
    image(enemyImage,x,y);//image sprite for enemy.
    
     if(x < ssX){
     eBullet.reset(x,y);
     }
     else{
     eBullet.update();
      
     }   
  }
  
  //hittest checks if the bullet is in range of the enemy.
  boolean hitTest(int xpos, int ypos) { 
    
    return (dist(x, y, xpos, ypos) < targetSize/2); 
    
  } 
}
