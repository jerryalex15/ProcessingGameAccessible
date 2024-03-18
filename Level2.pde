class Level2 extends Level{
  
  Level2(String textMap, SoundFile alertSound) {
    super(textMap, alertSound);
  }
  
  void update() {
    grid[25][1] = '2'; 
    grid[25][25] = '2'; 
    
    //   !!!Générer quelques ennemis mais if faut placer independament selon le niveau
    enemies.add(new Enemy(grid,cols, rows, 3, 25, sz));
    enemies.add(new Enemy(grid,cols, rows, 20, 10, sz));
  }
  
  void setup(){
    super.setup();
    print("Setup dans Lev2");
    //   !!!Générer quelques ennemis mais if faut placer independament selon le niveau
    enemies.add(new Enemy1(grid,cols, rows, 3, 20, sz));
    enemies.add(new Enemy(grid,cols, rows, 20, 20, sz));
  }
  
  void display() {
    background(0);
    
    if (! paused) {
      // Dessiner l'éclairage autour du personnage
      for (int i = player.x - lightRadius; i <= player.x + lightRadius; i++) {
        for (int j = player.y - lightRadius; j <= player.y + lightRadius; j++) {
          //if (i >= 0 && i < cols && j >= 0 && j < rows && dist(player.x, player.y, i, j) <= (lightRadius) && grid[i][j] != '1') {
          if (i >= 0 && i < cols && j >= 0 && j < rows && dist(player.x, player.y, i, j) <= (lightRadius)) {
            if (grid[i][j] == '2' ){
              noStroke();
              fill(255,255,0, 100);  // Couleur de l'objet
              rect(i * sz, j * sz, sz, sz);
            }else if (grid[i][j] != '1') {
              noStroke();
              fill(255,255,225);  // Couleur de l'environnement non éclairé
              rect(i * sz, j * sz, sz, sz);
              
              for (Enemy enemy : enemies) {
                // Vérifier si un ennemi est dans le rayon de lumière
                if (dist(i, j, enemy.x, enemy.y) <= lightRadius -4) {
                  //enemy.update();
                  enemy.display();
                  enemy.follow(player);
                  enemy.playSound(player, alertSound, lightRadius);
                }
              }
            }else{
              stroke(0);
              fill(132, 46, 27);  // Couleur de l'éclairage
              rect(i * sz, j * sz, sz, sz);
            }
          } 
        }
      }
    
      // Dessiner le personnage
      player.display();
    }
  }
}
