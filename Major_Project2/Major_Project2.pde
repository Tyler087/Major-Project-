ArrayList<Monsters> theMonsters = new ArrayList<Monsters>();

Timer theTimer;
Monsters monster1;
Health health1;

int counter =0;


void setup() {
  size(1200, 800);
  theTimer = new Timer(1000);
  monster1 = new Monsters();
  health1 = new Health();
}

void draw() {
  background(255);
  fill(0);
  textSize(28);
  text( "Score: " + counter, 25, 40);
  if (theTimer.isFinished() ) {
    theMonsters.add(new Monsters());
    theTimer.begin();
  }

  for (Monsters thisMonster : theMonsters) {
    thisMonster.movingMonsters();
  }
   health1.displayLifeBar();
   health1.character();
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

void mousePressed() {
  killMonster();
}