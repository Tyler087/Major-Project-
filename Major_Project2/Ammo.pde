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
    clipSize = 7;
    reloadTimer = new Timer(1000);
    startTime = millis();
    outOfAmmo = false;
  }



  //behaviour

  void display() {
    fill(0, 250, 10);
    text("Ammo : ", width*0.84, 50);
    text(clipSize, width*0.9, 50);

    //check if reloading is ready
    if (outOfAmmo && reloadTimer.isFinished()) {
      clipSize += 7; 
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