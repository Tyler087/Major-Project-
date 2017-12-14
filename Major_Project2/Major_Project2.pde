ArrayList<Monsters> theMonsters = new ArrayList<Monsters>();

int t = millis();



void setup() {
  size(1200, 800);

  //for ( int i  = 0; i <10; i ++) {
  //  Monsters monster1;
  //  monster1 = new Monsters(int(random(width)), 500);
  //  //if (t %  10000 == 0){
  //    theMonsters.add(monster1);
      
  //  //}
  }


void draw() {
  background(255);
  if (t %  10000 == 0){
    for ( int i  = 0; i <10; i ++) {
    Monsters monster1;
    monster1 = new Monsters(int(random(width)), 500);
    
      theMonsters.add(monster1);
      
    }
  for (Monsters thisMonster : theMonsters) {
    thisMonster.movingMonsters();
  }
}
}

//void killMonster() {
//  for (int i=theMonsters.size()-1; i >= 0; i--) { 
//     Monsters thisMonster = theMonsters.get(i);

//    if (thisMonster.isClicked(mouseX, 700)) {
//      theMonsters.remove(i);
//    }
//  }
//}
//}