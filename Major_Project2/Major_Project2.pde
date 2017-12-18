ArrayList<Monsters> theMonsters = new ArrayList<Monsters>();
Timer theTimer;


Monsters monster1;
int counter =0;


void setup() {
  size(1200, 800);
  theTimer = new Timer(2000);
  monster1 = new Monsters();
  //for ( int i  = 0; i <10; i ++) {

  //theMonsters.add(monster1);
}
//}

void draw() {
  background(255);
  fill(0);
  textSize(28);
  text( "Score: " + counter, 25,40);
  if (theTimer.isFinished() ) {
    theMonsters.add(new Monsters());
    theTimer.begin();
  }

  for (Monsters thisMonster : theMonsters) {
    thisMonster.movingMonsters();
  }
}


void killMonster() {
  for (int i=theMonsters.size()-1; i >= 0; i--) { 
    Monsters thisMonster = theMonsters.get(i);
    if (thisMonster.isClicked(mouseX, mouseY)) {
      theMonsters.remove(i);
      counter ++;
    }
  }
}

void mousePressed(){
 killMonster(); 
}