/*
Game: Space Invaders
game designer: Andreas Lopez-muro
reg: 33354608
module title: foundations of programing.
Music composer: NemeisTheory
*/

//All attributes and classes used in game.
private Spaceship spaceship; //this represents spaceship object.
private int score, bossScore; // score is the game score for how many enemies killed, and bossScore is used for the life points of the Boss.
private boolean gameOver; //a state in which to declare true or false depending on when either the spaceship is destroyed or the boss is destroyed.

/*holds the number of frames while the draw function is called. 
This is used so we can release enemies with a certain amount of new frames. With every frame, the draw function is called.*/
private int startFrame; 

private Bullet[] bullets = new Bullet[0];//this holds an array of bullets for the spaceship.

//Another array of bullets in case the main array runs out of bullets. By doing this, the main array will have time to reload the next set of bullets.
private Bullet[] spareBullets = new Bullet[0];

private EnemyObject[] enemies= new EnemyObject[0];//An array to hold enemy objects in the game.
private EnemyObject[] spareEnemies = new EnemyObject[0];//same exact immplementation as the sparebullets array.

private Background background;//sets the image for the background.
private PImage bgImage, SIimage;// there are two images used, bgImage (used for the main game) and SIimage (used as a title for the menu screen).

private EnemyExplode explosion;//A GIF image used as an effect for an enemy is destoryed.
private Timer timer = new Timer();// used to set when the Boss is going to arrive and the enemies disappear.

private BossObject boss;//a class to represnet the end boss of the game and its determined movements.
private EBullet eBullet;//an object that represents the bullet of the enemies. when the game starts, all enemies have one bullet to fire.
EnemyObject enemy ;

int spaceshipScore = 1000;//used for the life points of the spaceship. Once the spaceship is hit five times, the game is over

//this identies whether the player is the menu stage or the main game stage. Depending on which stage the controls will change.
private boolean userEnterPlaying = false;

//attributes for the main menu screen.
private star neuerStern;//this is to call the object to show stars on screen when in the menu.
private ArrayList<star> starArray = new ArrayList<star>();//An array that holds the amount of stars seen on screen.

//dimensions in which the stars appears.
private float h2;//=height/2
private float w2;//=width/2
private float d2;//=diagonal/2


private int numberOfStars = 20000;

//there are two thousand stars on screen that appear and disappear once they go off the screen. This function is to spawn fifty new stars for every star that disappears.
private int newStars =50;

private MakeStars makeStars;//this class is used to make the stars appear on screen.

//attributes for music.
private boolean menuMusic = true;//music for the main menu. It stops when the player presses s.
private boolean playGameMusic = true;//standard music for the game
private boolean BOSSMusic = true; //music for when the boss arrives after 95.2 seconds of playing the game.
private boolean gameOverMusic = true;//music triggered for when spaceshipScore is zero.

/*class which declares different fucntions to play diffenrent tracks of music depending the stage of the game.
 they're all in one generic function so the stop() fucntion can work on all music tracks.*/
private GameMusic gameMusic = new GameMusic();

//--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

void setup() { 
   size(900, 900); //size of the frame.
   intializeGame();//a method used to call all of the functions of game and show the menu.

}
void intializeGame(){
   startGame();//function to start the game and displaying the menu.
   
   background = new Background();//this is getting the refference to the background of the frame.
   bgImage = background.getImage();//setting the background image of the game.
   imageMode(CENTER);//this puts the image at the center of the frame.
   
   spaceship = new Spaceship();//this is a method to create the spaceship object from the class Spaceship.
   boss = new BossObject(-40,300,0.8797979,0);//this is a boss object and it's set to appear off the screen. Then it appears in 95.2 seconds with its assigned movements.
   
   makeStars = new MakeStars();//This to create the stars for the main menu.
   makeStars.aSetup();//Function to set up the dimensions of the stars.

}
//--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

void draw() { 

  //if the user didn't start the game yet, it plays the menu music along with a message on how to start the game.
  if (!userEnterPlaying){
      if(menuMusic){
           gameMusic.menuMusic(this);//calls the gamemusic function menumusic to play the menu music whilst in the menu.
           menuMusic = false;//this is to insure that the draw function doesn't play the first second of the music again and again. It just plays the music normally.
      }
      makeStars.aDraw();//function that actually draws the animated stars on the screen
      fill(255); //white colour for the text on how to start game.
      textAlign(CENTER); //used to set the textbox at the center of its spawning point.
      text("To start the Game: PRESS S", width/2, height/2);//message on how to start game set in the middle of the frame.
      
   //"Space Invaders" title text
      PImage SIimage, STimage;
      SIimage = loadImage("Titles/Menutile.png");
      SIimage.resize(700,50);
      image(SIimage, width/2, 200);
      
   //"Start" title text
      STimage = loadImage("Titles/Start.png");
      STimage.resize(300,50);
      image(STimage, width/2, 400);
       }// game menu code ends here
       
  //------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
 
  else{ 
    /*This is adjusting the framerate for the user to play the game at a normal speed because the frame rate of the stars is diffenert. 
    this helps the game run smoothly as different elements have different framerates. this also helps avoid crashing the game.*/
      frameRate(70);
      
      
      if(playGameMusic){
  
        /*Because the menu music is the first thing the player hears when starting the game,
        this function stops the menu music as soon as the main game music starts so there is no overlapping with music tracks */
           gameMusic.stopMusic();
           
           gameMusic.gameMusic(this);//calls the function to play normal game music.
           playGameMusic = false;//this is to insure that the draw function doesn't play the first second of the music again and again. It just plays the music normally
      }
      gameOn();//this is called when the player presses S. this calls all the sprites, functions for the sprites, backgrounds, and music to activate. Therefore intializing all the elements for the game.
  }
 
}// end of draw()

//--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

public void gameOn(){

  background(bgImage); //upon press s, the main background image for the game appears.
   timer.showTimer();//upon press s, start timer for when boss appears.

  spaceship.showSpaceship();//upon press s, show the spaceship object.

    if(keyPressed){
    keyDown();//this is to handle the keys of the spaceship for its navigation.
  }
  
  // if we're still playing           
  if (!gameOver) { //if the game is not over yet.

     if(timer.passedTime > 0100){//the timer fucntion. If 95.2 seconds has pass, show the boss,remove all enemies, and start the BOSSMusic.
     
     
         if(BOSSMusic){
       
           gameMusic.stopMusic();//this is to stop the previous track from overlapping with the boss music.
           gameMusic.BOSSMusic(this);//declare BOSSMusic
           BOSSMusic = false;//to avoid the first second of the track to play constantly.
           
          } 
          
      //boss's movements.
         updateBoss(); //this is handling the movements of the boss, making it move left to right and vice versa.
         updateBullets(); //this is to handle the bullet of the boss.
         checkBossCollisions();//this is to check if the boss is hit or not by the spaceship.
         checkBossSpaceshipCollisions();//this is to check if the spaceship is hit by the boss.
     }// boss timer ends here
//--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    
  /* if  (timer.passedTime < 95000){// if the time is less than 95.2 seconds, enemies start attacking the spaceship.
         updateEnemies();//the movement of the enemies, making them move left to right.
         updateBullets();//this is to handle the bullet of the enemies.
         checkCollisions();//this checks whether the enemy is hit or not by the spaceship.
         checkEnemySpaceshipCollisions();//this is to check whether the enemy bullet hits the spaceship or if it doesn't.
   }*/
   
   if  (spaceshipScore == 0 || bossScore == 0){ //if life points equal zero.
     gameOver = true; //if the spaceship score is zero or if the bosscscore is zero, the game is over.
   }
   
  } // game over ends here
  
//----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
 //Gameoverscreen
  else {
    if (spaceshipScore == 0){ //if the life points of the spaceship runs out (if spaceship is hit five times).
      spaceship.removeSpaceship(false);
    GameOverScreen deathScreen = new GameOverScreen();//reffernce for the game over title text.
    PImage GOSimage = deathScreen.getImage(); //setting the title text for image when in the game over stage.
    
    image(GOSimage,width/2,height/2);//game over tile text is setted at the centre of the frame.
 
       if(gameOverMusic){
        gameMusic.stopMusic();//this is to stop the previous track from overlapping with the game music.
       gameMusic.gameOverMusic(this);//declaring game over music.
       gameOverMusic = false;//to avoid the first second of the track to play constantly.
       
       }
    
  }
  else if (bossScore == 0){//if the boss is detroyed.
      YouWinScreen winScreen = new YouWinScreen();//reffernce for the "you win" title text to appear when boss is destroyed. 
      PImage winimage = winScreen.getImage();//setting "you win" title text.
    
    image(winimage,width/2,height/2);//setting at the centre of the frame.

       if(gameOverMusic){
       gameMusic.stopMusic();//this is to stop the previous track from overlapping with the boss music.
       gameMusic.gameOverMusic(this);
       gameMusic.gameWinMusic(this);//declaring the "you win" theme.
       gameOverMusic = false;//to avoid the first second of the track to play constantly.
       }
  
  }
  
  }//end of else.
  
  
  // display the score in the top left corner
  fill(255); //white colour.
  text("Game Score", 50, 20 );//A game score to keep track on how many enemies killed.
  text(score, 120, 20);//The actually score contain the enemy kill count as integars. It's set to be placed next to the "Game score" text.
  
  text("Boss HP: ", 250 , 20 );//boss HP tracks the amount of hits needed or hits remaining to destroy the boss.
  text(bossScore, 300, 20);// works almost the same as the "game score" counter but in reverse.
  
  text("Left Shield HP: ", 425 , 20 );//boss HP tracks the amount of hits needed or hits remaining to destroy the boss.
  text("Right Shield HP: ", 625 , 20 );//boss HP tracks the amount of hits needed or hits remaining to destroy the boss.
  
  text("HP: ", 850 , 20 );//HP tracks the amount hits remaining until the spaceship is destroyed by the fifth hit.
  text(spaceshipScore, 875, 20);//works exaclty like the "boss HP" counter.
}

// startGame destroys all the bullets, targets, and it resets everything so it starts the game again. 
void startGame() { 

  // reset the score.
  score = 0; 
  bossScore = 999;//amount of hits needed to kill the boss.
  // destroy all the targets
  for (int i =0;i<enemies.length; i++) {
    destroyEnemy(enemies[i]);
  } 
  // destroy all the bullets
  for (int i =0;i<bullets.length; i++) {
    destroyBullet(bullets[i]);
  } 

   startFrame = frameCount;// set the startFrame to now (the current frame) and start the game.
  gameOver = false;//when game starts game over is false because the circumstance has not occurred yet.
}



void updateEnemies() { 
      
  if (frameCount%8 == 0) makeEnemy();// every 15 frames make a new target

  // iterate through the targets
   for (int i =0; i<enemies.length; i++) { 
   // set a local variable to point at the enemy at index i
      
    EnemyObject enemy = enemies[i];  
    // if it's disabled then skip this one
    // and carry on through the for loop.
    
    if (!enemy.enabled) continue; 
    // otherwise update it
     
       enemy.update(spaceship.x);//This is to insure that enemies only shoot when their x coordinates matches the spaceship's.
  
    /* if it's gone off to the right of the screen, get rid of it. 
    The enemy needs to be detroyed and removed from game when it goes out of frame because the game will crash if enemies keep piling up.*/
    if (enemy.x > 20000){
    destroyEnemy(enemy);
   
}
   }
}
   
void updateBoss(){
 
    if (boss.enabled) {
      
      boss.update(spaceship.x);//works the same way as the enemy.update(spaceship.x) method but it affects the boss.
      
    }
}

//enemis bullets
void updateBullets() {

  // iterate through the bullets array
  for (int i=0; i<bullets.length; i++) {
    // set a local variable to point at the 
    // bullet at index i
     Bullet bullet = bullets[i]; 
    // if it's enabled, then update it
    if (bullet.enabled) {
       bullet.update(); 
      // and if it's off the top of the screen, 
      // get rid of it
      if (bullet.yPos<0) destroyBullet(bullet);
    }
  }
}

// check all the bullets against all the targets
void checkCollisions() { 
  explosion = new EnemyExplode(); 
  // the outer loop goes through all the targets
  for (int i =enemies.length-1; i>=0; i--) {       

    EnemyObject enemy = enemies[i]; 
    // if it's disabled skip this one and continue to the 
    // next target
     if (!enemy.enabled) continue; 

    // the inner loop goes through each bullet. 
    for (int j = 0; j<bullets.length; j++) { 

      Bullet bullet = bullets[j];
      // if it's enabled and it's inside the target we're checking
      // (from the outer loop)... 
      if ((bullet.enabled) && (enemy.hitTest(round(bullet.xPos), round(bullet.yPos)))) { 

        // destroy the target and destroy the bullet
        frameRate(30);//this determines how fast the animation runs when an enemy is destroyed.
        explosion.showExplosion(enemy.x, enemy.y);
        
        //when the enemy dies, their bullet gets destoryed along with them, and the score increase by 1.
        destroyEnemy(enemy); 
        destroyBullet(bullet);
        score++; 
        
        // and break out of the inner loop so we 
        // don't check any of the other bullets 
        // against this target. 
        break;
      }
    }
  }
}

//collision with boss

// check all the bullets against all the targets
void checkBossCollisions() { 
   explosion = new EnemyExplode(); //setting the refference for the explosion effect for when the boss gets hit.
    BossObject  theBoss = boss; 
    // the inner loop goes through each bullet. 
    for (int j = 0; j<bullets.length; j++) { 

      Bullet bullet = bullets[j];
      // if it's enabled and it's inside the target we're checking
      if ((bullet.enabled) && (boss.hitTest(round(bullet.xPos), round(bullet.yPos)))) { 
        // destroy the target and destroy the bullet
        
        /*determines how fast the explosion effect plays.
        The boss explosion effect is seperate from the enemies because if any aesthetic changes need to be made seperately,
        then we can do so without affecting the other*/
        frameRate(15);
        explosion.showExplosion(boss.x, boss.y);//insure the explosion effect plays where the boss is in the frame.
        destroyBullet(bullet);
        bossScore--;//when the boss is hit decrement its HP.
        //theBoss.changeImage();
      
        if (bossScore == 0){//If the boss HP runs out
           destroyBoss(theBoss);//the boss is removed from the frame.
        }
      
       // break;
      }
    }

}

//checking the collison of the bullets between the spaceship and the enemy.
// check all the bullets against all the targets
void checkEnemySpaceshipCollisions() { 

  explosion = new EnemyExplode(); 
  // the outer loop goes through all the targets
  for (int i =enemies.length-1; i>=0; i--) {       

    Spaceship  ship = spaceship; 
   
      enemy = enemies[i];
      EBullet ebullet = enemy.getEBullet();;
      
      if ((ebullet.enabled) && (ship.hitTest(round(ebullet.xPos), round(ebullet.yPos)))) { 
      
        //     destroy the target and destroy the bullet
        explosion.showExplosion(ship.x, ship.y);
       // ship.showTint2();
        spaceshipScore -= 1;//when spaceship gets hit, reduce the HP by 1.
        destroyEBullet(ebullet);//destroy the enemies' bullets when it collides with the spaceship.
        
        }
      }
}

//checking the collison of the bullets between the spaceship and the boss.
//Boss and Spaceship colision dectector...
void checkBossSpaceshipCollisions() { 
  explosion = new EnemyExplode(); 
  // the outer loop goes through all the targets
  for (int i =enemies.length-1; i>=0; i--) {       

    Spaceship  ship = spaceship; 
   
     // enemy = enemies[i];
      BBullet ebullet = boss.getBBullet();;
      
      if ((ebullet.enabled) && (ship.hitTest(round(ebullet.xPos), round(ebullet.yPos)))) { 
      
        // destroy the target and destroy the bullet
        explosion.showExplosion(ship.x, ship.y);//insure that the explosion effect plays where the spacehip is.
        
        /*when the boss hits the spaceship, 
        the damage ratio done will automatically set the spaceship's HP to zero, regardless of how much the spaceship still has.*/
        spaceshipScore = 0;
        destroyBBullet(ebullet);//remove the boss' bullet from the frame when it collides with spaceship.
      
        }
      }
      
}

void keyReleased() {
   
  if (key==' ' && (!gameOver)) {//when the player is pressing space and the game is still running...
     fireBullet();//fire the bullet.
  }
}
void keyDown(){
  if (key == CODED){
    if (keyCode == LEFT){//if player presses left arrow key...
    
    //move the spaceship to the left by one unit across the x-axis.
      if(spaceship.x>85){//if the spaceship's x coordinates is not 85 or under, then enable mobility functions of the spaceship. If is does, remove the ability to turn left.
      spaceship.update(-1); //the speed of the spaceship. it moves in each direction by 1 unit in the x-axis.
    }
   }
    
    
    if (keyCode == RIGHT){
      
      //move the spaceship to the right by one unit across the x-axis.
      if(spaceship.x<830){//if the spaceship's x coordinates is not 830 or over, then enable mobility functions of the spaceship. If is does, remove the ability to turn right.
      spaceship.update(1);//the speed of the spaceship. it moves in each direction by 1 unit in the x-axis.
    }
   }  
  }
 
}
  
void keyPressed() { 
  if(keyCode == 'S' || keyCode == 's'){//if player presses S
     userEnterPlaying = true; //activates all intialized variables in the game.
      timer.makeTimer();//as soon as the player presses s, the boss timer starts.
  }
}

void makeEnemy() { 

  EnemyObject enemy; 
  // if we have a  enemy... 
  if (spareEnemies.length>0) { 
    // set a local variable 'enemy' to point
    // at the first in the spareEnemies array
    enemy = spareEnemies[0]; 
    // remove it from the spares
    spareEnemies = (EnemyObject[]) subset(spareEnemies, 1); 
    // and re-enable it
    enemy.enabled = true;
  } 
  else {
    // otherwise make a new enemy and add it to the enemies array
    enemy = new EnemyObject(0, 200, 9, 0); 
    enemies = (EnemyObject[]) append(enemies, enemy);
  }

  // either way, we need to reset its position
  enemy.x = 0; 
  enemy.y = random(0, height*0.6); //this randomizes the height of spawning point for every new enemy.
}

void destroyEnemy(EnemyObject enemy) { 
  // disable the enemy
   enemy.enabled = false;
  // and add it to the spares.  
//  spareEnemies = (EnemyObject[]) append(spareEnemies, enemy);
}

void destroyBoss(BossObject b) { 
  // disable the enemy
 b.enabled = false;
  // and add it to the spares.  
  //spareEnemies = (EnemyObject[]) append(spareEnemies, enemy);
}
Bullet bullet1, bullet2;
void fireBullet() {

  Bullet bullet ; 
  // if we have a spare... 
  if (spareBullets.length>0) { 
    // pull it out of the spareBullets array
    bullet = spareBullets[0]; 
  
    spareBullets = (Bullet[]) subset(spareBullets, 1); 
    // and reset it
    bullet = bullet;

    
    bullet.reset(spaceship.x);


  } 
  else {
    // otherwise, make a new one
    bullet = new Bullet(spaceship.x);

    bullets = (Bullet[]) append(bullets, bullet);

  }
}

// making all the bullets disappear whether it's off screen or it reaches its target.
void destroyBullet(Bullet bullet) { 
  bullet.enabled = false;

  spareBullets = (Bullet[]) append(spareBullets, bullet);
}

void destroyEBullet(EBullet bullet) { 
  bullet.enabled = false; 

}

void destroyBBullet(BBullet bullet) { 
  bullet.enabled = false; 

}
