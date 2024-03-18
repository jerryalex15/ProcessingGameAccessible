class Level0{

  ArrayList<JSONObject> edges;
  JSONObject json;
  String[] textMaps;
  int rows;
  int cols;
  int[][] grid;
  int currentGame = -1;
  
  Level0(String[] textMaps) {
    this.textMaps = textMaps;
  }
  
  void setup(){
    fontAnta = createFont("Anta-Regular.ttf", 75);
    textFont(fontAnta);
  }
  
  void display() {
    int sz = 7;
    edges = new ArrayList<JSONObject>();
    
    // Configuration de l'alignement du texte au centre
    textAlign(CENTER, CENTER);
    fill(0);
    textSize(75);
    text("Bienvenue", width/2,250);
    
    for(int k = 0; k < textMaps.length ; k++) {
      String[] loadedText = loadStrings(textMaps[k]);
      this.cols = loadedText[1].length();
      this.rows = loadedText.length;
      this.grid = new int[cols][rows];
      
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
      
      int x = 0;
      int y = 0;
      int p00 = (k*600)+ 200; //point initiale pour x dans le traçage du map
      for (int i = 0; i < rows; i++) {
        for (int j = 0; j < cols; j++) {
          if (grid[j][i] == '1') {
            stroke(0);
            fill(132, 46, 27);
          } else {
            fill(255);
            stroke(255);
          }
          x = (j * sz)+ p00;
          y = (i * sz) + 500;
          rect(x, y, sz, sz);
        }
      }
      textAlign(CENTER, CENTER);
      textSize(45);
      fill(100);
      int p01 = x + sz;
      text("Niveau "+ (k+1), ((p01-p00)/2) + p00, y+50);
      
      json = new JSONObject();
  
      json.setInt("px0", p00); //coordonée de la version miniature des niveaux pour faciliter son emplacement lors du click
      json.setInt("px1", p01);
      json.setInt("py0", 500);
      json.setInt("py1", y+sz);
  
      edges.add(json);
    }
  }
  
  int getCurrentGame() {
    return this.currentGame;
  }
  
  void mousePressed(){
  for(int i = 0; i < edges.size() ; i++){
    if (mouseX > edges.get(i).getInt("px0") && mouseX < edges.get(i).getInt("px1") &&
        mouseY > edges.get(i).getInt("py0") && mouseY < edges.get(i).getInt("py1")) {
      //println("true : " + i);
      this.currentGame = i;
    }
  }
}
}
