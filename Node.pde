// Classe représentant un nœud du graphe
class Node {
  int x;
  int y;
  float g;  // Coût du chemin du début jusqu'ici
  float h;  // Heuristique : estimation du coût restant jusqu'à la fin
  float f;  // Coût total : g + h
  Node previous;  // Nœud précédent dans le chemin optimal

  Node(int x, int y) {
    this.x = x;
    this.y = y;
    this.g = 0;
    this.h = 0;
    this.f = 0;
    this.previous = null;
  }

  ArrayList<Node> neighbors(Graph graph) {
    ArrayList<Node> result = new ArrayList<Node>();

    // Déplacements possibles : haut, bas, gauche, droite
    int[] dx = {0, 0, -1, 1};
    int[] dy = {-1, 1, 0, 0};

    for (int i = 0; i < 4; i++) {
      int newX = x + dx[i];
      int newY = y + dy[i];

      if (newX >= 0 && newX < graph.grid.length && newY >= 0 && newY < graph.grid[0].length && graph.grid[newX][newY] != '1') {
        result.add(new Node(newX, newY));
      }
    }

    return result;
  }

  boolean equals(Node other) {
    return this.x == other.x && this.y == other.y;
  }
}
