import java.util.Random;

class Projectiles extends Projectile{
  ArrayList<Projectile> projectilesList = new ArrayList<Projectile>();
  int numProjectiles;
  
  Projectiles(float _x, float _y, float _vx, float _vy, float _r, float _m, float _dragCoeff, int numProjectiles){
    super(_x, _y, _vx, _vy, _r, _m, _dragCoeff); // could prolly pass projectile here instead.
    for (int i = 0; i < numProjectiles; i++){
      float magX = _vx * random(0, 2);
      float vox = magX * getDirection();
      
      float magY = _vy * random(0, 2);
      float voy = magY * getDirection();
      projectilesList.add(new Projectile(_x, _y, vox, voy, _r / numProjectiles, _m / numProjectiles, _dragCoeff));
    }
  }
  
  int getDirection(){
    Random rand = new Random();
    int n = rand.nextInt(2);
    if (n == 0){return -1;} 
    else {return 1;}
  }
  
  PVector getAirResistance(Projectile p){
    float airDensity = 1.25;
    float a = p.r * p.r * PI;
    float scale = 1000;
    float x = (.5 * airDensity * (p.vx * p.vx) * p.dragCoeff * a) / scale;
    float y = (.5 * airDensity * (p.vy * p.vy) * p.dragCoeff * a) / scale;
    
    // determine directions
    if (p.vx > 0){
      x = x * -1;
    }
    if (p.vy > 0){
      y = y * -1;
    }
    PVector airR = new PVector(x, y);
    return airR;
  }
  
  void run(){
    for (Projectile p : projectilesList){
      p.display();
      PVector airR = getAirResistance(p);
      p.applyForces(airR.x, airR.y + 0.2);
    }
  }
}
  
    
