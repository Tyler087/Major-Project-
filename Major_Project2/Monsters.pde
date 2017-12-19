class Monsters {

  //data
  PImage[] shooter = new PImage [10];
  PImage[] shooting = new PImage[2];
  public int theMonsters =1000;
  int x = 0;
  int y = 500;
  int dx = int(random(2, 7));
  float starTime = millis();
  float timeToWait = random(100, 2000);
  float size = 75;
  int shooterCounter = 0;
  int shootingCounter = 0;



  //constructor
  Monsters () {
    x = 0;
    y = 500;
    shooterCounter = 0;

    //Loops through bird images to make it animated
    for (int i =0; i <shooter.length; i++) {
      shooter[i] = loadImage ( i + ".png");
    }
  }
  //behaviour

  void movingMonsters() {
    fill(255);


    if (x >= 1000) {
      x = 1000;
    }
    x = x + dx;

    ellipse(x, y, size, size);

    imageMode(CENTER);
    image(shooter[shooterCounter], x, y);
    if (frameCount % 5 == 0) {
      shooterCounter ++;
      shooterCounter = shooterCounter % shooter.length;
    }
    
    if ( x >= 999) {
      for (int i =0; i <shooting.length; i++) {
        shooting[i] = loadImage ( i + "00.png");
      }
      
     imageMode(CENTER);
    image(shooting[shootingCounter], x, y);
    if (frameCount % 5 == 0) {
      shootingCounter ++;
      shootingCounter = shootingCounter % shooting.length;
      
    }
    }
  }

  boolean isClicked(float _x, float _y) {
    float distanceFromCenter = dist(x, y, _x, _y);
    if (distanceFromCenter <size/2) {
      return true;
    } else {
      return false;
    }
  }
}