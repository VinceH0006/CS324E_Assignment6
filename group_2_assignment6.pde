float gravity; // forces for gravity
float airResistance; // forces for airResistance
float projectiles; //how many projectiles arise
Projectiles projs;

//float _x, float _y, float _vx, 
//float _vy, float _r, float _m, 
//float _dragCoeff, int numProjectiles

void setup(){
  size(500, 500);
  projs = new Projectiles(100, 100, 20, 20, 32, 50, .5, 5);
}

void draw(){
  projs.run();
}
  
  
  
  
  
