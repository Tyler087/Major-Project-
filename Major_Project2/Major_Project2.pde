ArrayList<Monsters> theMonsters = new ArrayList<Monsters>();

Timer theTimer;
Monsters monster1;
Health health1;

PImage gun;
PImage background;
PImage gameOver;

int counter =0;
int state = 1;



void setup() {
  size(1200, 800);
  gun = loadImage("Gun.png");
  gameOver = loadImage("Gameover1.png");
  //background = loadImage("background.png");
  theTimer = new Timer(1000);
  monster1 = new Monsters();
  health1 = new Health();
}

void draw() {
  if (state == 1) {
    background(255);
    fill(0);
    //image(background , width/2, height/2, background.width*0.4, background.height*0.5);
    cursor(CROSS);
    textSize(28);
    text( "Score: " + counter, 25, 40);
    if (theTimer.isFinished() ) {
      theMonsters.add(new Monsters());
      theTimer.begin();
    }

    for (Monsters thisMonster : theMonsters) {
      thisMonster.movingMonsters();
      if (thisMonster.x > 1000) {
        
      }
    }
    health1.displayLifeBar();
    health1.character();

    if (state == 2) {
      image(gameOver, width/2, height/2, gameOver.width*4, gameOver.height*4);
    }
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

void mousePressed() {
  killMonster();
}