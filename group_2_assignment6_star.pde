StarShoot star;
StarShoot star2;
int counter;

void setup(){
  size(500,500); 
  counter = 1;
  background(200);
  star = new StarShoot(50, 450, 8, -18, 45);
  star2 = new StarShoot(450, 450, -8, -18, 45);
}

void draw(){

    if (counter < 40){
    background(200);
    star.applyForces(1, 0.2);
    star.display();
    star2.applyForces(1, 0.2);
    star2.display();
    }
    counter++;
    //causes the star to dissapears from 40-200 frames
    if(counter == 40){
      background(200);
    }
    if(counter > 200){
      counter = 0;
      //resets the hoops to original position
      star = new StarShoot(50, 450, 8, -18, 45);
      star2 = new StarShoot(450, 450, -8, -18, 45);
    }
    
}
