class Enemy {
  int x;
  int y;
  float sz;
  int[][] grid;
  int col,row;
  boolean isEndOfTheGame = false;
  int lastMoveFrame;   // Frame du dernier déplacement
  int moveInterval = 60 * 1;  // Intervalle de déplacement en frames (1 secondes à 60 fps)

  Enemy(int[][] gridE, int col, int row, int posX, int posY, float size) {
    this.col = col;
    this.row = row;
    grid = new int[col][row];
    arrayCopy(gridE, grid);
    x = posX;
    y = posY;
    sz = size;
    
    // Initialiser le frame du dernier déplacement au début
    lastMoveFrame = frameCount;
  }
  
  void moveRandomly(){
    
  }

  void follow(Player p) {
    
    //il faut utiliser l'algorithme A*
    // Déplacer l'ennemi vers le joueur (avec une vitesse réduite)
    if (frameCount - lastMoveFrame >= moveInterval) {
      if (p.x > x  && grid[x + 1][y] != '1') {
        x++;
      } else if (p.x < x && grid[x - 1][y] != '1') {
        x--;
      } else if (p.y > y && grid[x][y + 1] != '1') {
        y++;
      } else if (p.y < y && grid[x][y - 1] != '1') {
        y--;
      } else if (p.y == y && p.x == x) {
        isEndOfTheGame = true; 
        println("Is End of The Game :"+isEndOfTheGame);
      }      
      
      // Mettre à jour le frame du dernier déplacement
        lastMoveFrame = frameCount;
      }
      
      // Créer un graphe basé sur la grille
      //Graph graph = new Graph(grid, this.col, this.row);

      // Trouver le chemin optimal avec A*
      //ArrayList<Node> path = astar(graph, new Node(x, y), new Node(p.x, p.y));

      // Déplacer l'ennemi le long du chemin trouvé
      /*if (path.size() > 1) {
        Node nextNode = path.get(1);
        x = nextNode.x;
        y = nextNode.y;        
        println("nextNode x et y = " + x +" , "+ y);
      }*/
  }

  void update() {
    // Ajouter un comportement d'ennemi ici si nécessaire
  }

  void display() {
    fill(255, 0, 0);
    rect(x * sz, y * sz, sz, sz);
  }
  
  // Implémentation de l'algorithme A*
  /*
  ArrayList<Node> astar(Graph graph, Node start, Node end) {
    ArrayList<Node> openSet = new ArrayList<Node>();
    ArrayList<Node> closedSet = new ArrayList<Node>();

    openSet.add(start);

    while (!openSet.isEmpty()) {
      int winner = 0;
      for (int i = 0; i < openSet.size(); i++) {
        if (openSet.get(i).f < openSet.get(winner).f) {
          winner = i;
        }
      }

      Node current = openSet.get(winner);

      if (current.equals(end)) {
        // Chemin trouvé
        ArrayList<Node> path = new ArrayList<Node>();
        Node temp = current;
        path.add(temp);
        while (temp.previous != null) {
          path.add(temp.previous);
          temp = temp.previous;
        }
        return path;
      }

      openSet.remove(current);
      closedSet.add(current);

      ArrayList<Node> neighbors = current.neighbors(graph);
      for (Node neighbor : neighbors) {
        if (!closedSet.contains(neighbor)) {
          float tempG = current.g + 1; // Cost of moving to neighbor is always 1
          boolean newPath = false;

          if (openSet.contains(neighbor)) {
            if (tempG < neighbor.g) {
              neighbor.g = tempG;
              newPath = true;
            }
          } else {
            neighbor.g = tempG;
            newPath = true;
            openSet.add(neighbor);
          }

          if (newPath) {
            neighbor.h = heuristic(neighbor, end);
            neighbor.f = neighbor.g + neighbor.h;
            neighbor.previous = current;
          }
        }
      }
    }

    // Aucun chemin trouvé
    return new ArrayList<Node>();
  }
  */

  /*
  float heuristic(Node a, Node b) {
    // Heuristique : distance euclidienne
    return dist(a.x, a.y, b.x, b.y);
  }*/
}
