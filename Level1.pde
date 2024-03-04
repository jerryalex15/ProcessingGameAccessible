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
  
  Level1(String textMap) {
    super(textMap);
    widthText = width - 50;
    heighText = height - 50;
    xText = 1200; 
    yText = 75;
    positionX = xText + 50;
    
  }
  
  void update() {
    font = createFont("Courier New", 28);
    pardefaut = createFont("Consolas", 28);
  }
  
  boolean displayed = false;
  void affiche(float variable) {
    if (!displayed) {
      println(variable);
      this.displayed = true;
    }  
  }
  
  void display() {
    background(0);
    ///////////////
    
    fill(255);
    rect(0,0,width,height);
    
    textSize(32);
    fill(0, 0, 0);
    textFont(pardefaut);
    text("Pour valider,Tester l'instruction suivant: ", 1200, 50, widthText, heighText); 
    instruction = "\n\nboolean move = false;\nif (keycode == DOWN) {\n    move = true; \n    println(\"Move = \"+ move );\n}\n";
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
            if (dist(i, j, enemy.x, enemy.y) <= lightRadius - 5) {
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
