class Enemy1 extends Enemy {
  Enemy1(int[][] gridE, int col, int row, int posX, int posY, float size) {
    super(gridE, col, row, posX, posY, size);
  }
  
  void follow(Player p) {
    // Déplacer l'ennemi vers le joueur (avec une vitesse réduite)
    if (frameCount - lastMoveFrame >= moveInterval) {
      //déplacement vers le haut puis vers la droite puis vers la gauche et en fin vers le bas
      if (p.y < y && grid[x][y - 1] != '1') {
        y--;
      } else if (p.x > x  && grid[x + 1][y] != '1') {
        x++;
      } else if (p.x < x && grid[x - 1][y] != '1') {
        x--;
      } else if (p.y > y && grid[x][y + 1] != '1') {
        y++;
      } else if (p.y == y && p.x == x) {
        isEndOfTheGame = true; 
        println("Is End of The Game :"+isEndOfTheGame);
      }      
      
      // Mettre à jour le frame du dernier déplacement
      lastMoveFrame = frameCount;
    }
  }
  
  void display() {
    fill(255, 150, 0);
    rect(x * sz, y * sz, sz, sz);
  }
}
