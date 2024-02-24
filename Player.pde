class Player {
  int x;
  int y;
  int rows, cols;
  float sz;
  int lightRadius;
  int[][] grid;

  Player(float size, int lightR, int[][] griD, int col, int row) {
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
  }

  void move(int direction) {

    if (direction == UP && y > 0 && this.grid[x][y - 1] != '1') { 
      y--;
    } else if (direction == DOWN && y < this.rows - 1 && this.grid[x][y + 1] != '1') {
      y++;
    } else if (direction == LEFT && x > 0 && this.grid[x - 1][y] != '1') {
      x--;
    } else if (direction == RIGHT && x < this.cols - 1 && this.grid[x + 1][y] != '1') {
      x++;
    }
  }

  void display() {
    
    fill(0, 0, 255);
    rect(x * sz, y * sz, sz, sz);
  }
}
