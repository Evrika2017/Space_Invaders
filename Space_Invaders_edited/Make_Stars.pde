/*
Game: Space Invaders
game designer: Andreas Lopez-muro
reg: 33354608
module title: foundations of programing.
Music composer: NemeisTheory
*/

//source code for the stars is from openProcessing.com
public class MakeStars{
  
void aSetup() {
  
//dimensions of the stars.
  w2=  width/2;
  h2=  height/2;
  d2 = dist(0, 0, w2, h2);
  
  //making the stars by making the object of the star class.
  noStroke();
  neuerStern= new star();
  frameRate(9000);//individual frame rate of the stars.
}

void aDraw() {
  fill(0, map(dist(500, 500, w2, h2), 0, d2, 255, -10));//this is to draw the stars.
  rect(0, 0, width, height);//shape of the stars
  fill(255);//colour of the stars.
  neuerStern.render();//sets the lifespan of the stars to die out out when it reachs the screen.
  for (int i = 0; i<newStars; i++) { //iterating new stars and adding them into a star arraylist.
    starArray.add(new star());//arraylist for stars.
  }

  //extracting the stars from the arraylist and allows them to move across the screen.
  for (int i = 0; i<starArray.size(); i++) {//this mnakes the stars grow in size as it gets closer to the screen.
    //if the stars disappears from any point exit, then remove it. works the same as remove enemy function.
    if (starArray.get(i).x<0||starArray.get(i).x>width||starArray.get(i).y<0||starArray.get(i).y>height) starArray.remove(i);
    
    //else part of the if statement.
    starArray.get(i).move(); //intiate move function
    starArray.get(i).render();//intiate lifespan.
  }
    if (starArray.size()>numberOfStars) {//if the stars grow a certian size whilst reaching the end point, remove the star.
     for (int i = 0; i<newStars; i++) {
      starArray.remove(i);
    }
  }
}
}

