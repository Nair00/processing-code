class Star{
  float x;
  float y;
  float depth;
  float pdepth;
  
  float w = width / 2;
  float h = height / 2;
  
  Star() {
    x = random(-w, w);
    y = random(-h, h);
    depth = random(0, w);
    
    pdepth = depth;
  }
  
  void Update(){
    depth = depth - speed;
    if(depth < 1){
      x = random(-w, w);
      y = random(-h, h);
      depth = w;
      
      pdepth = depth;
    }
  }
  
  void Show(){
    fill(255);
    noStroke();
    
    float sx = map(x / depth, 0, 1, 0, w);
    float sy = map(y / depth, 0, 1, 0, h);
    
    float size = map(depth, w, 0, 0, maxsize);
    ellipse(sx, sy, size, size);
    
    float px = map(x / pdepth, 0, 1, 0, w);
    float py = map(y / pdepth, 0, 1, 0, h);
    
    pdepth = depth;
    
    stroke(255);
    strokeWeight(size);
    line(px, py, sx, sy);

  }
}
