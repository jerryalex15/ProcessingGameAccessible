class Level2 extends Level{
  
  Level2(String textMap) {
    super(textMap);
  }
  
  void update() {
  }
  
  void display() {
    background(0);
  
    // Dessiner l'éclairage autour du personnage
    int lightRadius = 5;
    for (int i = player.x - lightRadius; i <= player.x + lightRadius; i++) {
      for (int j = player.y - lightRadius; j <= player.y + lightRadius; j++) {
        //if (i >= 0 && i < cols && j >= 0 && j < rows && dist(player.x, player.y, i, j) <= (lightRadius) && grid[i][j] != '1') {
        if (i >= 0 && i < cols && j >= 0 && j < rows && dist(player.x, player.y, i, j) <= (lightRadius)) {
          if (grid[i][j] != '1') {
            noStroke();
            fill(255,255,225, 100);  // Couleur et transparence de l'éclairage
            rect(i * sz, j * sz, sz, sz);
            
            // Vérifier si un ennemi est dans le rayon de lumière
            //A vérifier pour que si un ennemi est éclairé => déplacement 
            for (Enemy enemy : enemies) {
              if (dist(i, j, enemy.x, enemy.y) <= lightRadius -4) {
                //enemy.update();
                enemy.display();
                enemy.follow(player);
              }
            }
          }else {
            stroke(0);
            fill(132, 46, 27);  // Couleur et transparence de l'éclairage
            rect(i * sz, j * sz, sz, sz);
          }
        } 
      }
    }
  
    // Dessiner le personnage
    player.display();
  }
}
