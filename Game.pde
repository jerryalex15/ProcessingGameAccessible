int rows = 0;
int cols = 0;
int[][] grid;

int lightRadius;  //ajouter aussi le son en fonction de lightRadius
float sz = 20;  // Taille du personnage

ArrayList<Enemy> enemies = new ArrayList<Enemy>();

Level level;
int currentgame = 0;
Player player;

String[] textMaps = {"ground.txt","ground2.txt"};

void setup() {
  size(840, 760);
  switch (currentgame) {
    case 0:
      this.level = new Level1(textMaps[currentgame]);
      break;
    case 1:
      this.level = new Level2(textMaps[currentgame]);
      break;
    default:
      break;
  }
  loadGame();
}

void draw() {
  background(255);
  updateGame();
  displayGame();
}

void keyPressed() {
  level.keyPressed();
  /*
  if (currentgame < 2 && key == '+') {
    currentgame++;
    loadGame(currentgame);
  }
  if (currentgame > 1 && key == '-') {
    currentgame--;
    loadGame(currentgame);
  }*/
}

void loadGame() {
  this.level.setup();
}

void updateGame() {
  this.level.update();
}

void displayGame() {
  this.level.display();
}
