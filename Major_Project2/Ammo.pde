class Ammo {

  //data
  int clipSize;
  int startTime;
  //int reloadTimer;
  int endTime;
  boolean outOfAmmo;
  Timer reloadTimer;

  //contructor
  Ammo() {
    clipSize = 10;
    reloadTimer = new Timer(1000);
    startTime = millis();
    //reloadTimer = 5000;
    outOfAmmo = false;
  }



  //behaviour

  void display() {
    text(clipSize, width*0.9, 50);

    //check if reloading is ready
    if (outOfAmmo && reloadTimer.isFinished()) {
      clipSize += 10; 
      outOfAmmo = false;
    }
  }

  void shoot() {
    if (clipSize > 0) {
      clipSize -= 1;
    } else {
      outOfAmmo = true;
      reloadTimer.begin();
    }
  }
}