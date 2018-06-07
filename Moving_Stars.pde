/*
Game: Space Invaders
game designer: Andreas Lopez-muro
reg: 33354608
module title: foundations of programing.
Music composer: NemeisTheory
*/

//source code for the stars is from openProcessing.com

//intialises the represented attributes and functions of the stars.
class star {
  float x, y, speed, d, age,sizeIncr;
  int wachsen;
  star() {
    x = random(width);
    y = random(height);
    speed = random(0.2, 5);
    wachsen= int(random(0, 2));
    if(wachsen==1)d = 0;
    else {
      d= random(0.2, 3);
    }
    age=0;
    sizeIncr= random(0,0.03);
  }
  
  //render the stars on the screen.
  void render() {
   age++;
     if (age<200){
       if (wachsen==1){
         d+=sizeIncr;
         if (d>3||d<-3) d=3;
       }else {
         if (d>3||d<-3) d=3;
         d= d+0.2-0.6*noise(x, y, frameCount);
       }
       
 
     }
     else{
       if (d>3||d<-3) d=3;
     }
    
    ellipse(x, y, d*(map(noise(x, y,0.001*frameCount),0,1,0.2,1.5)), d*(map(noise(x, y,0.001*frameCount),0,1,0.2,1.5)));
  }
  void move() {
    x =x-map(500, 0, width, -0.05*speed, 0.05*speed)*(w2-x); 
    y =y-map(500, 0, height, -0.05*speed, 0.05*speed)*(h2-y);
  }
}


