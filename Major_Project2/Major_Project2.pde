ArrayList<Monsters> theMonsters = new ArrayList<Monsters>();

Timer theTimer;
Monsters monster1;
Health health1;
Ammo ammo1;

PImage gun;
PImage background;
PImage gameOver;
PImage titleScreen;

int counter =0;
int state = 1;



void setup() {
  size(1200, 800);
  gun = loadImage("Gun.png");
  gameOver = loadImage("end.png");
  titleScreen = loadImage ("title.jpg");
  //background = loadImage("background.png");
  theTimer = new Timer(1000);
  monster1 = new Monsters();
  health1 = new Health();
  ammo1 = new Ammo();
  if (state == 1){
    imageMode(CENTER);
    image(titleScreen, width/2, height/2, titleScreen.width*0.7, titleScreen.height*0.75);
    textAlign(CENTER);
    textSize(72);
    text("DEFENDER", width/2, height/2+25);
  }
}

void draw() {
  if (state == 1){
    rectMode(CENTER);
    
    fill(50,50,50);
    rect(width/2, height/2+125, 200, 100);
    fill(255);
    text("Play", width/2, height/2 +175);
    if(mouseX > 500 && mouseX < 700 && mouseY > 475 && mouseY < 575){
      text("Play", width/2, height/2 +175);
      fill(255,0,0);
      rect(width/2, height/2 +125, 200,100);
      if(mousePressed){
        state +=1;
      }
    }
  }
    
  if (state == 2) {
    background(255);
    fill(0);
    //image(background , width/2, height/2, background.width*0.4, background.height*0.5);
    cursor(CROSS);
    textSize(28);
    text( "Score: " + counter, 70, 40);
    if (theTimer.isFinished() ) {
      theMonsters.add(new Monsters());
      theTimer.begin();
    }

    for (Monsters thisMonster : theMonsters) {
      thisMonster.movingMonsters();
      if (thisMonster.x > 1000) {
        health1.takeDownLife();
      }
    }
    health1.displayLifeBar();
    health1.character();
    ammo1.display();
    //ammo1.delayReload();

    if (state == 3) {
      image(gameOver, width/2, height/2-60, gameOver.width*0.65, gameOver.height*0.87);
      cursor(HAND);
      textAlign(CENTER);
      textSize(42);
      text("Your score was " + counter, 600, 660); 
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
  ammo1.shoot();
}