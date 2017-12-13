ArrayList<Monsters> theMonsters = new ArrayList<Monsters>();



void setup() {
  size(1200, 800);

  for ( int i  = 0; i <10; i ++) {
    Monsters monster1;
    monster1 = new Monsters(0, 500);
    theMonsters.add(monster1);
  }
}

void draw() {
  background(255);
  for (Monsters thisMonster : theMonsters){
  thisMonster.movingMonsters();
  
  }
}