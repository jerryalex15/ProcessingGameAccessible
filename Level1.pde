class Level1 extends Level{
  
  String vrai;
  String instruction;
  String consoleResult;
  float widthText;
  float heighText;
  float xText;
  float yText;
  float positionX;
  PFont font, pardefaut;
  
  Level1(String textMap, SoundFile alertSound) {
    super(textMap, alertSound);
    widthText = width - 50;
    heighText = height - 50;
    xText = 1100; 
    yText = 75;
    positionX = xText + 50;
  }
  
  void setup(){
    super.setup();
    font = createFont("Courier New", 28);
    pardefaut = createFont("Consolas", 28);
    print("Setup dans Lev1");
    //   !!!Générer quelques ennemis mais if faut placer independament selon le niveau
    enemies.add(new Enemy(grid,cols, rows, 3, 25, sz));
    enemies.add(new Enemy1(grid,cols, rows, 20, 10, sz));
  }
  
  void update() {
  }
  
  /*boolean displayed = false;
  void affiche(float variable) {
    if (!displayed) {
      println(variable);
      this.displayed = true;
    }  
  }*/
  
  void display() {
    background(0);
    ///////////////
    
    fill(255);
    rect(0,0,width,height);
    
    if ( !paused) {
      textSize(32);
      fill(0, 0, 0);
      textFont(pardefaut);
      textAlign(BASELINE);
      text("Pour valider, tester l'instruction suivant: ", xText, 50, widthText, heighText); 
      instruction = "\n\nboolean move = false;\nif (keycode == DOWN || keycode == UP \n|| keycode == RIGHT || keycode == LEFT ) {\n    move = true; \n    println(\"Move = \"+ move );\n}\n";
      consoleResult = "\nAffichage sur la console: \nMove = "+ vrai;
      text(instruction, xText, yText, widthText, heighText);
      if(player.isMoved == true) {
        vrai = "true";
        textFont(font);
        text(consoleResult, positionX , yText + (75 * 4), widthText, heighText);
        if (positionX > xText) {
          positionX = positionX - 1;
        }
      }
      
      ///////////////
      // Dessiner le terrain
      drawMap(sz);
    
      // Dessiner l'éclairage autour du personnage
      noStroke();
      for (int i = player.x - lightRadius; i <= player.x + lightRadius; i++) {
        for (int j = player.y - lightRadius; j <= player.y + lightRadius; j++) {
          if (i >= 0 && i < cols && j >= 0 && j < rows && dist(player.x, player.y, i, j) <= (lightRadius) && grid[i][j] != '1') {
            fill(255, 0, 255, 100);  // Couleur et transparence de l'éclairage
            rect(i * sz, j * sz, sz, sz);
            
            // Vérifier si un ennemi est dans le rayon de lumière
            //A vérifier pour que si un ennemi est éclairé => déplacement 
            for (Enemy enemy : enemies) {
              //enemy.update();
              enemy.display();
              if (dist(i, j, enemy.x, enemy.y) <= lightRadius - 5) {
                enemy.follow(player);
                enemy.playSound(player, alertSound, lightRadius);
              }
            }
          }
        }
      }
    
      // Dessiner le personnage
      this.player.display();
    }
  }
}
