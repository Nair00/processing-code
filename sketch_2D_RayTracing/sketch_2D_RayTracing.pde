Eye eye;
ArrayList<Circle> circles = new ArrayList<Circle>();
ArrayList<Rectangle> rectangles = new ArrayList<Rectangle>();

boolean follow;

float angle;

void setup(){
  size(920, 600);
  eye = new Eye(width / 2, height / 2);
  for(int i = 0; i < 4; i++){
    Circle c = new Circle(random(0, width), random(0, height), random(20, 150), 0);
    circles.add(c);
  }
  /*for(int i = 0; i < 4; i++){
    Rectangle r = new Rectangle(random(0, width), random(0, height), random(20, 150), random(20, 150), 0);
    rectangles.add(r);
  }*/
  
  follow = false;
}

void keyPressed(){
  if(key == 'q'){
    Circle c = new Circle(mouseX, mouseY, random(20, 150), 0);
    circles.add(c);
  }
  //if(key == 'w'){
  //  Rectangle r = new Rectangle(random(0, width), random(0, height), random(20, 150), random(20, 150), 0);
  //  rectangles.add(r);
  //}
  
  if(key == 's'){
    follow = !follow;
  }
  
}

void mousePressed(){
  eye.pos.x = mouseX;
  eye.pos.y = mouseY;
}

void draw(){
  background(100);
  
  if(follow == true){
    eye.followMouse();
  }
  else{
    eye.updateSight();
  }
  eye.show();
  
  for(Circle c : circles){
    c.show();
  }
  
  angle = atan2(mouseY - eye.pos.y, mouseX - eye.pos.x);
  
  noFill();
  stroke(0);
  //ellipse(eye.pos.x, eye.pos.y, distToNearestObstacle(eye.pos) * 2, distToNearestObstacle(eye.pos) * 2);
  //ellipse(intersection(eye.pos, distToNearestObstacle(eye.pos)).x, intersection(eye.pos, distToNearestObstacle(eye.pos)).y, 10, 10);
  rayMarch(eye.pos);
}

float distToCircle(Circle c, PVector pos){
  return (c.pos.dist(pos) - c.r / 2);
}


float distToNearestObstacle(PVector pos){
  float len = max(width, height);
  for(Circle c : circles){
    len = min(distToCircle(c, pos), len);
  }
  
  return len;
}

void rayMarch(PVector pos){
  float len = distToNearestObstacle(pos);
  
  if(len > 1 && len < width){
    ellipse(pos.x, pos.y, len * 2, len * 2);
    rayMarch(intersection(pos, len));
  }
}

PVector intersection(PVector pos, float len){
    return new PVector(pos.x + cos(angle) * len, pos.y + sin(angle) * len);
}
