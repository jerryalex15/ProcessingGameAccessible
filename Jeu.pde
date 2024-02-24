/*int rows = 0;
int cols = 0;
int[][] grid;

int lightRadius;  //ajouter aussi le son en fonction de lightRadius
float sz = 20;  // Taille du personnage

Player player;
ArrayList<Enemy> enemies = new ArrayList<Enemy>();

void setup() {
  size(840, 760);
  String[] loadedText = loadStrings("ground.txt");
  cols = loadedText[1].length();
  rows = loadedText.length;
  grid = new int[cols][rows];
  lightRadius = 5;

  for (int i = 0; i < rows; i++) {
    if (loadedText[i].length() == 0) {
      println("empty line in text file " + i);
      exit();
      return;
    }
    for (int j = 0; j < cols; j++) {
      grid[j][i] = loadedText[i].charAt(j);
    }
  }

  player = new Player(sz, lightRadius, grid, cols, rows);
  // Générer quelques ennemis
  for (int i = 1; i < 2; i++) {
    enemies.add(new Enemy(grid,cols, rows, 3, 20, sz));
  }
}

void draw() {
  background(255);

  // Dessiner le terrain
  for (int i = 0; i < rows; i++) {
    for (int j = 0; j < cols; j++) {
      if (grid[j][i] == '1') {
        stroke(0);
        fill(132, 46, 27);
      } else {
        fill(255);
        stroke(255);
      }
      rect(j * sz, i * sz, sz, sz);
    }
  }

  // Dessiner l'éclairage autour du personnage
  noStroke();
  int lightRadius = 5;
  for (int i = player.x - lightRadius; i <= player.x + lightRadius; i++) {
    for (int j = player.y - lightRadius; j <= player.y + lightRadius; j++) {
      if (i >= 0 && i < cols && j >= 0 && j < rows && dist(player.x, player.y, i, j) <= (lightRadius) && grid[i][j] != '1') {
        fill(255, 0, 255, 100);  // Couleur et transparence de l'éclairage
        rect(i * sz, j * sz, sz, sz);
        
        // Vérifier si un ennemi est dans le rayon de lumière
        //A vérifier pour que si un ennemi est éclairé => déplacement 
        for (Enemy enemy : enemies) {
          if (dist(i, j, enemy.x, enemy.y) <= lightRadius -4 ) {
            enemy.follow(player);
          }
        }
      }
    }
  }

  // Dessiner le personnage
  player.display();

  // Dessiner les ennemis
  for (Enemy enemy : enemies) {
    enemy.update();
    enemy.display();
  }
}

void keyPressed() {
  // Déplacement du personnage avec les touches fléchées
  player.move(keyCode);
}
*/
