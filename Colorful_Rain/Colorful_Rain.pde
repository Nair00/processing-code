Drop[] drops = new Drop[300];

float maxDepth = 20;
float minSize = 10;
float maxSize = 20;
float gravScale = 0.3;
float minSpeed = 1;
float maxSpeed = 20;

void setup(){
  size(640, 480);
  for(int i = 0; i < drops.length; i++){
    drops[i] = new Drop();
  }
}

void draw(){
  background(104, 170, 235);
  for(int i = 0; i < drops.length; i++){
    drops[i].update();
    drops[i].show();
  }
}
