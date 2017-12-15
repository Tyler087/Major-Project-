ArrayList<Monsters> theMonsters = new ArrayList<Monsters>();
Timer theTimer;


Monsters monster1;


void setup() {
  size(1200, 800);
  theTimer = new Timer(1000);
  monster1 = new Monsters(0, 500);
  //for ( int i  = 0; i <10; i ++) {

      //theMonsters.add(monster1);
    }
//}
  
void draw() {
  background(255);
  if (theTimer.isFinished() ){
  theMonsters.add(monster1);
  theTimer.begin();
  }

  for (Monsters thisMonster : theMonsters) {
    thisMonster.movingMonsters();
  
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