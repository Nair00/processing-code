int cols;
int rows;
int scale = 30;
float rand;

int[][] grid;
int[][] newGrid;

boolean start = false;

void setup(){
  size(600, 600);
  cols = width / scale;
  rows = height / scale;

  grid = new int[cols][rows];
  newGrid = new int[cols][rows];
  
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      //rand = random(0, 1);
      //if(rand < 0.5) grid[i][j] = 0;
      //else 
      grid[i][j] = 0;
    }
  }
}

void mousePressed(){
  int mX = int(map(mouseX, 0, width, 0, cols));
  int mY = int(map(mouseY, 0, height, 0, rows));
  if(grid[mX][mY] == 1) grid[mX][mY] = 0;
  else if(grid[mX][mY] == 0) grid[mX][mY] = 1;
  draw();
}

void keyReleased(){
  switch(key){
    case 'a':
      start = true;
      break;
    case 's':
      start = false;
      break;
  }
}

void draw(){
  frameRate(5);
  background(0);
  stroke(255);
  fill(255);
  
  show();
  if(start == true){
    check();
    cloneGrid();
  }
  cloneGridRev();
}

void cloneGrid(){
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      grid[i][j] = newGrid[i][j];
    }
  }
  /*for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      newGrid[i][j] = grid[i][j];
    }
  }*/
}

void cloneGridRev(){
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      newGrid[i][j] = grid[i][j];
    }
  }
}
void show(){
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      if(grid[i][j] == 1){
        stroke(0);
        fill(255);
      }
      else{
        stroke(255);
        fill(0);
      }
      square(i * scale,j * scale, scale);
    }
  }
}

void check(){
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      if(grid[i][j] == 0 && neighbours(i,j) == 3){
        newGrid[i][j] = 1;}
      if(grid[i][j] == 1 && (neighbours(i,j) < 2 || neighbours(i,j) > 3)){
        newGrid[i][j] = 0;}
    }
  }
}

int neighbours(int i, int j){
  int num = 0;
  if(i != 0){
    if(j!=0) if(grid[i-1][j-1] == 1) num++;
    if(grid[i-1][j] == 1) num++;
    if(j!=rows - 1) if(grid[i-1][j+1] == 1) num++;
  }
  if(j!=0) if(grid[i][j-1] == 1) num++;
  //if(grid[i][j] == 1) num++;
  if(j!=rows - 1) if(grid[i][j+1] == 1) num++;
  if(i != cols - 1){
    if(j!=0) if(grid[i+1][j-1] == 1) num++;
    if(grid[i+1][j] == 1) num++;
    if(j!=rows - 1) if(grid[i+1][j+1] == 1) num++;
  }
  
  return num;
}
