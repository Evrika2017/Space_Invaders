/*
Game: Space Invaders
game designer: Andreas Lopez-muro
reg: 33354608
module title: foundations of programing.
Music composer: NemeisTheory
*/
class BossObject { 
  
  
 private PImage bossImage;
  float x = 0; //starting position for when it appears.
  float y = 0; //starting position for when it appears.
  float velX = 0; 
  float velY = 0; 
  //boolean stte = false ;//
  float targetSize = 175;//this determines the width of the area where the boss can be damaged by the spaceship's bullets.
  boolean enabled = true; ////means the bullet is active if true. if false, it will disappear from screen.
  BBullet eBullet1;
  private int turns = 1;//this function moves the boss from left to right. it acts as a counter for the direction of the boss' movements.
    
  
//--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------    
  BossObject(float xpos, float ypos, float velx, float vely) { 
    
    x = xpos; 
    y = ypos; 
    velX = velx; 
    velY = vely;   
    
    bossImage = loadImage("spaceships for course work/Enemies/boss.png");//loading sprite image for boss.
   
    
    
    smooth();
    bossImage.resize(500,500);

   eBullet1 = new BBullet();

    
  }
//-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- 
  void showBoss(){
        image(bossImage,x,y);//image sprite: boss.
       
    
  }
  BBullet getBBullet(){
  return eBullet1 ;
}

boolean go = true; 
//--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  void update(float ssX) { //odd numbers move the boss to the right.
    if(!enabled) return;    

    if(x < width && (turns%2 != 0)){
    x+=velX; 
    y+=velY;
     if (x > width){
       turns +=1;
     }
  }
//--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  else if (x > 0 && (turns%2 == 0)){ //even numbers move the boss to the left.
     x-=velX; 
    y-=velY;
     if (x < 0){
       turns +=1;
     }
   
  }
//--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------    
    noStroke(); 
    image(bossImage,x,y);//updated image for when the boss changes direction.
//--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------    
    if(x < ssX && go){//spaceship x coordiantes, it is trigger for when the boss has to fire.
     eBullet1.reset(x,y);//a reloading function to get a new bullet for boss.
     }
     
     else{ go = false;
      eBullet1.update();
      if (eBullet1.yPos>900){
        go=true;
      }
     }  
    
    
  }
//--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------  
  boolean hitTest(int xpos, int ypos) { 
    
    return (dist(x, y, xpos, ypos) < targetSize/2); //this returns true if the bullet is in range of the spaceship to attack it.
    
  }
//--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------  

  void changeImage(){
  float dimension = bossImage.width * bossImage.height;
  bossImage.loadPixels();
  
  for(int i=0;i<dimension;i+=3){
   bossImage.pixels[i] = color(255,0,0);
  }
  bossImage.updatePixels();
}
      
}//end of class
