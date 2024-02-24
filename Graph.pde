// Classe représentant le graphe
class Graph {
  int[][] grid;

  Graph(int[][] grid, int col, int row) {
    this.grid = new int[col][row];
    arrayCopy(grid, this.grid);
  }
}
