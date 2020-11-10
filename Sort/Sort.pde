float[] array;
float[] oldArray;

int size = 600;
int i = 0;
int j = 0;
int step = 30;

void setup(){
  fullScreen();
  //size(840, 600);
  array = new float[size];
  for(int i = 0; i < size; i++){
    array[i] = random(0, height);
  }
  oldArray = new float[size];
  for(int i = 0; i < size; i++){
    oldArray[i] = array[i];
  }
}

void keyPressed(){
  switch (key){
    case 's':
      step = step + 30;
      break;
    case 'a':
      step = step - 30;
      break;
    case 'r':
      step = 1;
      for(int i = 0; i < size; i++){
        array[i] = oldArray[i];
      }
      i = j = 0;
      break;
  }
}

void draw(){
  
  background(0);
  float xSection = width / size;
  //fill(255);
  for(int i = 0; i < size; i++){
    if(this.j == i){
      fill(0,255,0);
    }
    else{
      fill(255);
    }
    rect(i * xSection, height - array[i], width / size, array[i]);
  }
  for(int i = 0; i < step; i++){
    bubbleSort(array);
  }
}

void bubbleSort(float[] arr){
  int n = arr.length; 
  if(i >= n-1) return;
  if(j >= n-i-1) {j = 0; i++;}
  if (arr[j] > arr[j+1]) 
    { 
        // swap arr[j+1] and arr[i] 
        float temp = arr[j]; 
        arr[j] = arr[j+1]; 
        arr[j+1] = temp; 
    }
  j++;
}
