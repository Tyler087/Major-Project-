class Health {

  //data
  int life = 500;
  PImage zombie;
  PImage zombie2;
  PImage zombie3;


  //constructor
  Health() {
    life = 500;
    zombie = loadImage("0000.png");
    zombie2 = loadImage("1000.png");
    zombie3 = loadImage("2000.png");
  }


  //Behaviour

  void character() {
    //Changes zombie image based on health
    if (life >250) {
      image(zombie, 1100, 500, zombie.width*1.5, zombie.height*1.7);
    }

    if (life <= 250 && life > 50) {
      image(zombie2, 1100, 500, zombie2.width*1.5, zombie2.height*1.7);
    }
    if (life <50) {
      image(zombie3, 1100, 500, zombie3.width*1.5, zombie3.height*1.7);
    }
  }

  void displayLifeBar() {
    //Displays Life Bar On Screen 
    fill(0);
    textAlign(CENTER);
    text(life, width/2, 70);
    fill(255, 0, 0);
    rectMode(CENTER);
    rect(width/2, 100, life, 40);

    if (life <= 0) {// changes to end screen in life is less than or equal to 0
      state = 3;
    }
  }

  void takeDownLife() {
    //Takes down life when monsters x coordinate is 1000 or over, called in main class
    if (frameCount % 5 == 0) {
      life = life - 4;
    }
  }

  void regenerateLife() {
    //Regenerates life every 5 kills, called in main class
    life += 25;
  }
}