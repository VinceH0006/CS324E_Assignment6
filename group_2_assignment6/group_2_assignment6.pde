// initialize a frame counter for timing of animation starting points
int counter;

float gravity; // forces for gravity
float airResistance; // forces for airResistance
float projectiles; //how many projectiles arise

// initialize all objects in order of their chronology in the animation
Cannon cannonA;
Cannon cannonB;

StarShoot starA;
StarShoot starB;

Projectiles projsA;
Projectiles projsB;

void setup(){
  size(1200, 800);
  background(200);
  frameRate(20);
  
  counter = 1;
  
  // initialize original object instances
  cannonA = new Cannon(50, 700, 10);
  cannonB = new Cannon(width-80, 700, -10);
  
  starA = new StarShoot(65, 685, 15, -28, 45);
  starB = new StarShoot(width-65, 685, -12, -25, 45);
}

void draw(){
  
    background(200);
    
    // set background scenery for flavor
    fill(220);
    rect(0, 730, width, 5);
    rect(0, 720, width, 5);
    
    fill(227, 30, 30);
    stroke(250);
    ellipse(25, 720, 35, 50);
    ellipse(width-25, 720, 35, 50);
    rect(0, 675, 30, 125);
    rect(width-30, 675, 30, 125);
  
    // logic/math guiding the cannon behavior
    // this section of the math is outside the object class because it involves the two
    // objects interacting with each other
    
    // the purpose here is to have the cannons bounce off each other
    // as well as off the boundaries of the screen
    // when making contact with the screen boundary there is an accellerator to ramp
    // their motion back up to offset friction
    if(cannonA.x < 50) {
      cannonA = new Cannon(cannonA.x, cannonA.y, 10);
    }
    if(cannonA.x + 30 > cannonB.x) {
      cannonA = new Cannon(cannonA.x, cannonA.y, (cannonA.vx * (-1)));
      cannonB = new Cannon(cannonB.x, cannonB.y, (cannonB.vx * (-1)));
    }
    if(cannonB.x > (width - 80)) {
      cannonB = new Cannon(cannonB.x, cannonB.y, -10);
    }
  
    // apply universal friction force and display
    cannonA.applyFriction(0.995);
    cannonA.display();
    cannonB.applyFriction(0.995);
    cannonB.display();
  
    // display and animate the star objects being fired out of the cannon
    if (counter < 40){
      starA.applyForces(1, 0.2);
      starA.display();
      starB.applyForces(1, 0.2);
      starB.display();
    }
    counter++;
    //causes the star to dissapears from 40-80 frames
    
    // at the 40th frame in the animation the star explodes into projectiles
    if(counter == 40){
      projsA = new Projectiles(starA.x, starA.y, 20, 20, 32, 50, .5, 5);
      projsB = new Projectiles(starB.x, starB.y, 20, 20, 32, 50, .5, 5);
      projsA.run();
      projsB.run();
    }
    if (counter > 40 && counter < 80) {
      projsA.run();
      projsB.run();
    }
    
    // at the 80th frame the entire animation resets and fires again from wherever
    // the cannons happen to be at that moment, they are not synced by design
    if(counter > 80){
      counter = 0;
      //resets the hoops to original position
      starA = new StarShoot(cannonA.x+15, cannonA.y-15, 15, -30, 45);
      starB = new StarShoot(cannonB.x+15, cannonB.y-15, -12, -25, 45);
    }   
}
