class Level {
  int rows = 0;
  int cols = 0;
  int[][] grid;
  
  int lightRadius;  //ajouter aussi le son en fonction de lightRadius
  float sz = 20;  // Taille du personnage
  
  ArrayList<Enemy> enemies = new ArrayList<Enemy>();
  String textMap;
  
  Player player;
  
  Level(String textMap) {
    this.textMap = textMap;
  }
  
  void setup() {
    //size(840, 760);
    String[] loadedText = loadStrings(textMap);
    this.cols = loadedText[1].length();
    this.rows = loadedText.length;
    this.grid = new int[cols][rows];
    lightRadius = 5;
  
    for (int i = 0; i < rows; i++) {
      if (loadedText[i].length() == 0) {
        println("empty line in text file " + i);
        exit();
        return;
      }
      for (int j = 0; j < cols; j++) {
        this.grid[j][i] = loadedText[i].charAt(j);
      }
    }
    
    player = new Player(sz, lightRadius, grid, cols, rows);
    // Générer quelques ennemis
    for (int i = 1; i < 2; i++) {
      enemies.add(new Enemy(grid,cols, rows, 3, 20, sz));
    }
  }
  
  void update(){
  }
  
  void display(){
  }
  
  void keyPressed() {
    //Déplacement du personnage avec les touches fléchées
    this.player.move(keyCode);
  }
}
