class Cannon {
  float x, y;
  float vx;
  float friction;
  
  Cannon(float x, float y, float vx) {
    this.x = x;
    this.y = y;
    this.vx = vx;
  }
  
  // apply friction to slow the cannons
  void applyFriction(float friction) {
    vx = vx * friction;
    x += vx;
  }
  
  // display the cannon object
  void display() {
    pushMatrix();
    stroke(250);
    fill(0);
    rect(x+5, y-30, 20, 30);
    rect(x, y, 30, 30);
    popMatrix();
  }
}
