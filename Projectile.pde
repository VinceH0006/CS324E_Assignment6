class Projectile {
  float x, y;
  float vx, vy;
  float ax, ay;
  float r;
  float m;
  float dragCoeff;
  
  Projectile(float _x, float _y, float _vx, float _vy, float _r, float _m, float _dragCoeff){
    x = _x;
    y = _y;
    vx = _vx;
    vy = _vy;
    r = _r;
    m = _m;
    dragCoeff = _dragCoeff;
  }
  
  void applyForces(float _fx, float _fy){
    ax = _fx / m;
    ay = _fy / m;
    vy += ay;
    vx += ax;
    y += vy;
    x += vx;
  }
  
  void display(){
    ellipse(x, y, r, r);
  }
}
