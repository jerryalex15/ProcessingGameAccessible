import processing.sound.*;

SoundFile alertSound;
Level level;
Level0 level0;
int currentGame = -1; //for now, we change manually // on va stocker dans un fichier json le dernier niveau debloqué pour le charger pendant la prochaine utilisation
Player player;

PFont fontAnta;
String[] textMaps = {"ground.txt","ground2.txt","ground2.txt"};

void setup() {
  size(1920, 1080);
  alertSound = new SoundFile(this,"data/Sound/alertSoundSynth.wav");
  
  fontAnta = createFont("Anta-Regular.ttf", 30);
  textFont(fontAnta);
  loadGame();
}

void draw() {
  background(255);
  updateGame();
  displayGame();
}

void keyPressed() {
  level.keyPressed();
}

void loadGame() {
  switch (currentGame) {
    case -1:
      this.level0 = new Level0(textMaps);
      break;
    case 0:
      this.level = new Level1(textMaps[currentGame], alertSound);
      break;
    case 1:
      this.level = new Level2(textMaps[currentGame], alertSound);
      break;
    case 2:
      this.level = new Level2(textMaps[currentGame], alertSound);
      break;
    default:
      break;
  }
  if (currentGame >= 0) this.level.setup();
  else this.level0.setup();
}

void updateGame() {
  if (currentGame >= 0) this.level.update();
}

void displayGame() {
  if (currentGame >= 0) this.level.display();
  else this.level0.display();
}

void mousePressed(){
  if (currentGame >= 0) {this.level.mousePressed();}
  else {
    this.level0.mousePressed();
    this.currentGame = level0.getCurrentGame();
  }
  loadGame();
}
