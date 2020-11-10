class Eye{
  PVector pos;
  float size;
  float angle;
  float len;
  
  Eye(float x, float y){
    pos = new PVector(x, y);
    size = 16;
    len = 1000;
  }
  void show(){
    strokeWeight(2);
    fill(255);
    ellipse(pos.x, pos.y, size, size);
  }
  
  void updateSight(){
    angle = atan2(mouseY - pos.y,mouseX - pos.x);
    strokeWeight(2);
    line(pos.x, pos.y, pos.x + cos(angle) * len, pos.y + sin(angle) * len);
  }
  
  void followMouse(){
    pos.x = mouseX;
    pos.y = mouseY;
  }
}
