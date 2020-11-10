float angleX = 0;
float prevX = 0;
float angleY = 0;
float prevY = 0;
float rotateSpeedRate = 0.01;

Box box;
ArrayList<Box> sponge;

void setup(){
  size(400, 400, P3D);
  sponge = new ArrayList<Box>();
  
  box = new Box(0, 0, 0, 200);
  sponge.add(box);
}
void mousePressed(){
  ArrayList<Box> next = new ArrayList<Box>();
  for(Box b: sponge)
  {
    ArrayList<Box> newBoxes = b.generate();
    next.addAll(newBoxes);
  }
  sponge = next;
}

void draw() {
  background(35);
  noStroke();
  fill(150);
  lights();
  
  translate(width / 2, height / 2);
  //rotateX(angle);
  //angle = angle + 0.05;
  
  rotateY(angleX);
  angleX = angleX + (mouseX - prevX) * rotateSpeedRate;
  prevX = mouseX;
  
  rotateX(angleY);
  angleY = angleY + (mouseY - prevY) * rotateSpeedRate;
  prevY = mouseY;
  for(Box b: sponge){
    b.show(); 
  }
  //box.show();
}
