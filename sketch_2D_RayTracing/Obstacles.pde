class Circle{
  PVector pos;
  float r;
  float shade;
  
  Circle(float x_, float y_, float r_, float shade_){
    pos = new PVector(x_, y_);
    r = r_;
    shade = shade_;
  }
  
  void show(){
    fill(int(shade));
    noStroke();
    ellipse(pos.x,pos.y,r,r);
  }
}

class Rectangle{
  PVector pos;
  PVector size;
  float shade;
  
  Rectangle(float x_, float y_, float w_, float h_, float shade_){
    pos = new PVector(x_, y_);
    size = new PVector(w_, h_);
    shade = shade_;
  }
  
  void show(){
    fill(int(shade));
    noStroke();
    rect(pos.x,pos.y,size.x,size.y);
  }
}
