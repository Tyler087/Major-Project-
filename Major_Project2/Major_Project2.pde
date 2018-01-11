ArrayList<Monsters> theMonsters = new ArrayList<Monsters>();

import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;

Minim minim;
AudioPlayer fired;
AudioPlayer menu;
AudioPlayer died;
AudioPlayer gunFiring;


Timer theTimer;
Monsters monster1;
Health health1;
Ammo ammo1;

PImage gun;
PImage background;
PImage gameOver;
PImage titleScreen;

int score =0;
int state = 1;




void setup() {
  size(1200, 800);
  gun = loadImage("Gun.png");
  gameOver = loadImage("end.png");
  titleScreen = loadImage ("title.jpg");
  background = loadImage("mapr.jpg");
  theTimer = new Timer(1000);
  monster1 = new Monsters();
  health1 = new Health();
  ammo1 = new Ammo();

  minim = new Minim(this);
  fired = minim.loadFile("gunfire.mp3");
  menu = minim.loadFile("menumusic.mp3");
  died = minim.loadFile("death.mp3");
  gunFiring = minim.loadFile("machinegun.mp3");


  if (state == 1) {
    imageMode(CENTER);
    image(titleScreen, width/2, height/2, titleScreen.width*0.7, titleScreen.height*0.75);
    textAlign(CENTER);
    textSize(72);
    text("DEFENDER", width/2, height/2+25);
  }
}

void draw() {
  if (state == 1) {
    menu.play();
    rectMode(CENTER);

    fill(15, 0, 6);
    rect(width/2, height/2+125, 200, 100);
    fill(255);
    text("Play", width/2, height/2 +150);
    if (mouseX > 500 && mouseX < 700 && mouseY > 475 && mouseY < 575) {
      fill(40, 0, 30);
      rect(width/2, height/2 +125, 200, 100);
      fill(255);
      text("Play", width/2, height/2 +150);
      if (mousePressed) {
        state +=1;
      }
    }
  }

  if (state == 2) {
    menu.pause();
    background(255);
    fill(0);
    image(background, width/2, height/2);
    cursor(CROSS);
    textSize(28);
    text( "Score: " + score, 75, 40);
    if (theTimer.isFinished() ) {
      theMonsters.add(new Monsters());
      theTimer.begin();
    }

    for (Monsters thisMonster : theMonsters) {
      thisMonster.movingMonsters();
      if (thisMonster.x > 1000) {
        health1.takeDownLife();
        gunFiring.play();
        //gunFiring.loop();
      }
      if ( mousePressed && ammo1.clipSize >=1) {
        fired.play(); 
        fired.rewind();
      }
    }
    

    health1.displayLifeBar();
    health1.character();
    ammo1.display();
    monster1.increaseSpeed();
    if ( ammo1.outOfAmmo == true ) {
    textSize(72);
    text("Reloading...", width/2, height/2);
  }


    if (state == 3) {
      died.play();
      image(gameOver, width/2, height/2-60, gameOver.width*0.65, gameOver.height*0.87);
      cursor(HAND);
      textAlign(CENTER);
      textSize(42);
      fill(255, 0, 0);
      text("Your score was " + score, 600, 660);
    }
  }
}



void killMonster() {
  for (int i=theMonsters.size()-1; i >= 0; i--) { 
    Monsters thisMonster = theMonsters.get(i);
    if (thisMonster.isClicked(mouseX, mouseY) && ammo1.clipSize > 0) {
      theMonsters.remove(i);
      score ++;
      if (score % 5 ==0) {
        health1.regenerateLife();
        monster1.dx +=10;
      }
      if (score % 10 == 0) {
        ammo1.clipSize += score % 5;
      }
      
      break;
    }
  }
}


void mousePressed() {
  killMonster();
  ammo1.shoot();
  

  
}