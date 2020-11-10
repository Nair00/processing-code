Star[] stars = new Star[400];
float speed;
float maxsize = 4;

void setup(){
  size(800, 800);
  for(int i = 0; i < stars.length; i++){
    stars[i] = new Star();
  }
}

void draw(){
  speed = map(mouseX, 0, width, 1, 40);
  
  background(0, 0, 0);
  translate(width / 2, height / 2);
  for(int i = 0; i < stars.length; i++){
    stars[i].Update();
    stars[i].Show();
  }
}
