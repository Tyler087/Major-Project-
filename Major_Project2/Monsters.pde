public class Monsters {

  //data
  PImage[] shooter = new PImage [10];
  PImage[] shooting = new PImage[2];
  public int theMonsters =1000;
  int x = 0;
  int y = 500; 
  int speed = 6;
  int wait = 1100;
  int dx = int(random(speed, speed+5));
  float starTime = millis();
  float timeToWait = random(0, wait);
  float size = 75;
  int shooterCounter = 0;
  int shootingCounter = 0;
  public int life;



  //constructor
  Monsters () {
    x = 0;
    y = 500;
    shooterCounter = 0;
    life = 2;

    if (millis() > 5000 ) {
      speed = speed + 3;
    }
    if (millis() > 10000) {
      speed = speed + 5;
    }
    if (millis() > 15000) {
      speed = speed + 6;
    }

    dx = int(random(speed, speed+5));

    //Loops through images to make it animated
    for (int i =0; i <shooter.length; i++) {
      shooter[i] = loadImage ( i + ".png");
    }
  }
  //behaviour

  void movingMonsters() {
    fill(255, 255, 255, 0);

    if (millis() > 5000 ) {
      speed = speed + 1;
    }

    if (x >= 1000) {
      x = 1000;
    }
    x = x + dx;

    noStroke();
    ellipse(x, y, 30, size);

    if ( x <1000) {
      imageMode(CENTER);
      image(shooter[shooterCounter], x, y);
      if (frameCount % 5 == 0) {
        shooterCounter ++;
        shooterCounter = shooterCounter % shooter.length;
      }
    }

    if ( x >= 1000) {
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
      //monsterLife -= 1;
      return true;
    } else {
      return false;
    }
  }
  
  
  
}