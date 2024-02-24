class Level1 extends Level{
  
  Level1(String textMap) {
    super(textMap);
  }
  
  void update() {
    
  }
  
  void display() {
    background(0);
    
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
            if (dist(i, j, enemy.x, enemy.y) <= lightRadius -4) {
              enemy.follow(player);
            }
          }
        }
      }
    }
  
    // Dessiner le personnage
    this.player.display();
  
    // Dessiner les ennemis
    for (Enemy enemy : enemies) {
      enemy.update();
      enemy.display();
    }
  }
}
