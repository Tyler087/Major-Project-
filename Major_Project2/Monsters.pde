class Monsters {

  //data
  public int theMonsters =1000;
  int x = 0;
  int y = 500;
  int dx = int(random(2, 7));


  //constructor
  Monsters (int _x, int _y) {
    x = _x;
    y = _y;
  }
  //behaviour

  void movingMonsters() {
    fill(255);

    
    if (x >= 1000) {
      x = 1000;
    }
    x = x + dx;

    ellipse(x, y, 100, 100);
  }

}