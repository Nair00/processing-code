class Box{
  PVector pos;
  float size;
  
  Box(float x, float y, float z, float size_){
    pos = new PVector(x, y, z);
    size = size_;
  }
  
  ArrayList<Box> generate(){
    ArrayList<Box> boxes = new ArrayList<Box>();
    for(int i = -1; i < 2; i++){
      for(int j = -1; j < 2; j++){
        for(int k = -1; k < 2; k++){ 
          if(abs(i) + abs(j) + abs(k) <= 1) continue;
          float newSize = size / 3;
          Box b = new Box(pos.x + i*newSize, pos.y + j*newSize, pos.z + k*newSize,newSize);
          boxes.add(b);
        }
      }
    }
    return boxes;
    
  }
  
  void show(){
    pushMatrix();
    translate(pos.x, pos.y, pos.z);
    box(size);
    popMatrix();
  }
}
