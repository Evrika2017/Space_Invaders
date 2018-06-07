/*
Game: Space Invaders
game designer: Andreas Lopez-muro
reg: 33354608
module title: foundations of programing.
Music composer: NemeisTheory
*/
public class EnemyExplode{


   PImage SSimage;
 
 EnemyExplode(){
    SSimage = loadImage("enemy_explosion/explosion.gif");//gif animation that plays when an enemy dies.
  }
  
  void showExplosion(float a, float b){//the float variables a and b, are used as coordinates to display the explosion right where the enemy is.
     SSimage.resize(180,100);
     imageMode(CENTER);
 
     image(SSimage, a,  b);//image with dynamic coordinates to appear at the enemy's most recent position before death.

     
}

}
