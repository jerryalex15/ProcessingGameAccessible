class Player {
  int x;
  int y;
  int rows, cols;
  float sz;
  int lightRadius;
  int[][] grid;
  boolean isMoved;
  SoundFile alertSound;

  Player(float size, int lightR, int[][] griD, int col, int row, SoundFile alertSound) {
    this.alertSound = alertSound;
    this.grid = new int[col][row];
    for (int i = 0; i < row; i++) {
      for (int j = 0; j < col; j++) {
        this.grid[j][i] =  griD[j][i];
      }
    }  
    this.rows = row;
    this.cols = col;
    this.x = 1;
    this.y = 1;
    this.sz = size;
    this.lightRadius = lightR;
    this.isMoved = false;
  }

  void move(int direction) {
    if (direction == UP && y > 0 && this.grid[x][y - 1] != '1') { 
      y--;
      this.isMoved = true;
    } else if (direction == DOWN && y < this.rows - 1 && this.grid[x][y + 1] != '1') {
      y++;
      this.isMoved = true;
    } else if (direction == LEFT && x > 0 && this.grid[x - 1][y] != '1') {
      x--;
      this.isMoved = true;
    } else if (direction == RIGHT && x < this.cols - 1 && this.grid[x + 1][y] != '1') {
      x++;
      this.isMoved = true;
    }
  }

  void display() {
    fill(0, 0, 255);
    rect(x * sz, y * sz, sz, sz);
  }
}
