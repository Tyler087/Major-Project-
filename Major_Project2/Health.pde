class Health {

  //data
  int life = 500;


  //constructor
  Health() {
    life = 500;
  }


  //Behaviour

  void character() {
    fill(255, 0, 0);
    ellipse(1100, 500, 50, 150);
  }

  void displayLifeBar() {
    fill(0);
    textAlign(CENTER);
    text(life, width/2, 70);
    fill(255, 0, 0);
    rectMode(CENTER);
    rect(width/2, 100, life, 40);



    if (life <= 0) {
      state = 3;
    }
  }
  void takeDownLife() {
    if (frameCount % 5 == 0) {
      life = life - 3;
    }
  }

  void regenerateLife() {
    if (score > 0 && score % 5 == 0) {
      life += 10;
    }
  }
}