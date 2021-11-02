class StarShoot {
  float x;
  float y;
  float oy;
  float vx;
  float v0;
  float vy;
  float r;
  float t;
  float time;
  float gravity;
  
  StarShoot(float _x, float _oy, float _vx, float _v0, float _r){
    x = _x;
    oy = _oy;
    vx = _vx;
    v0 = _v0;
    r = _r;
  }
  
  //uses gravity as well as velocity, projectile rule
void applyForces(float time, float gravity){
      float z = oy;
        t += time;
        x += vx;
        vy = v0 + (gravity*t);
        y = z + ((vy*t) + (0.5*gravity*(t*t)));
      
  }
  
  //create a star shape
  void star(float x, float y, float radius1, float radius2, int npoints) {
  float angle = TWO_PI / npoints;
  float halfAngle = angle/2.0;
  beginShape();
  for (float a = 0; a < TWO_PI; a += angle) {
    float sx = x + cos(a) * radius2;
    float sy = y + sin(a) * radius2;
    vertex(sx, sy);
    sx = x + cos(a+halfAngle) * radius1;
    sy = y + sin(a+halfAngle) * radius1;
    vertex(sx, sy);
  }
  endShape(CLOSE);
}

  void display(){
  pushMatrix();
  fill(#F2EB0A);
  stroke(#F2EB0A);
  star(x, y, 20, 35, 5); 
  popMatrix();
  }
}
