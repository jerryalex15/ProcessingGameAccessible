class Level {
  int rows;
  int cols;
  int[][] grid;
  SoundFile alertSound;
  boolean paused;
  
  int lightRadius;  //ajouter aussi le son en fonction de lightRadius
  float sz = 25;  // Taille du personnage
  
  ArrayList<Enemy> enemies = new ArrayList<Enemy>();
  
  String textMap;
  
  Player player;
  
  Level(String textMap, SoundFile alertSound) {
    this.textMap = textMap;
    this.alertSound = alertSound;
  }
  
  void setup() {
    paused = false;
    
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
    
    player = new Player(sz, lightRadius, grid, cols, rows, alertSound);
  }
  
  void drawMap(float sz){
    for (int i = 0 ; i < rows; i++) {
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
  }
  
  void update(){
  }
  
  void display(){
  }
  
  void mousePressed() {
  }  
  
  void keyPressed() {
    //Déplacement du personnage avec les touches fléchées
    this.player.move(keyCode);
    if (keyPressed && key == 'p') { // clavier p ou une partie dans l'écran
      paused = !paused;
    }
  }
}
