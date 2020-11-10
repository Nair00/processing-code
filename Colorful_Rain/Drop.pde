class Drop{
  float x;
  float y;
  float z;
  float size;
  float speed;
  
  Drop(){
    x = random(0, width);
    y = random(-200, -100);
    z = random(0, maxDepth);
    size = map(z, 0, maxDepth, minSize, maxSize);
    speed = map(z, 0, maxDepth, minSpeed, maxSpeed);
  }
  
  void update(){
    float grav = map(y, 0, height, 0, gravScale);
    speed = speed + grav;
    y = y + speed;
    if(y > height){
    x = random(0, width);
    y = 0;
    z = random(0, maxDepth);
    size = map(z, 0, maxDepth, minSize, maxSize);
    speed = map(z, 0, maxDepth, minSpeed, maxSpeed);
    }
  }

  void show(){
    stroke(170, 50, 200);
    strokeWeight(map(z, 0, maxDepth, 1, 3));
    line(x, y, x, y + size);
  }
}
