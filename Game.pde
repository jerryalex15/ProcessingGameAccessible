Level level;
int currentgame = 0; //for now, we change manually
Player player;

String[] textMaps = {"ground.txt","ground2.txt"};

void setup() {
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
