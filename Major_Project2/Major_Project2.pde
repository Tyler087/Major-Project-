ArrayList<Monsters> theMonsters = new ArrayList<Monsters>();

//Tyler Smith

//Shooter Game
//Click mouse to fire
//Do not click while relaoding
//Press any key to activate instaKill

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
AudioPlayer bomb;


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
int instaKill = 0;




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
  bomb = minim.loadFile("Bomb.mp3");


  if (state == 1) { //Start Screen
    imageMode(CENTER);
    image(titleScreen, width/2, height/2, titleScreen.width*0.7, titleScreen.height*0.75);
    textAlign(CENTER);
    textSize(72);
    text("DEFENDER", width/2, height/2+25);
  }
}

void draw() {
  if (state == 1) { // Start Screen
    menu.play();
    rectMode(CENTER);

    //Play Button
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

  if (state == 2) { // Game Screen
    menu.pause();
    background(255);
    fill(0);
    image(background, width/2, height/2);
    cursor(CROSS);
    textSize(28);
    text( "Score: " + score, 85, 40);
    fill(255, 0, 0);
    text("InstaKill : " + instaKill, 100, 100);
    if (theTimer.isFinished() ) {
      theMonsters.add(new Monsters());
      theTimer.begin();
    }

    for (Monsters thisMonster : theMonsters) {
      thisMonster.movingMonsters();
      if (thisMonster.x > 1000) {
        health1.takeDownLife();
        //gunFiring.play();
      }
      if ( mousePressed && ammo1.clipSize >=1) {
        fired.play(); 
        fired.rewind();
      }
    }

    instaKill();
    health1.displayLifeBar();
    health1.character();
    ammo1.display();

    if ( ammo1.outOfAmmo == true ) {
      textSize(72);
      text("Reloading...", width/2, height/2);
    }




    if (state == 3) { // End Screen
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



void killMonster() { // Kills monster when clicked
  for (int i=theMonsters.size()-1; i >= 0; i--) { 
    Monsters thisMonster = theMonsters.get(i);
    if (thisMonster.isClicked(mouseX, mouseY) && ammo1.clipSize > 0) {
      theMonsters.remove(i);
      score ++;
      if (score % 5 ==0) {
        health1.regenerateLife();
      }
      if (score % 10 == 0) {
        instaKill +=1;
      }
      break; // Breaks the loop so it only kills the top character
    }
  }
}
void instaKill() {
  if (keyPressed == true) {
    if (instaKill > 0) {
      for (int i=theMonsters.size()-1; i >= 0; i--) { 
        theMonsters.remove(i);
        bomb.play();
        bomb.rewind();
        if (instaKill >0) {
          instaKill -= 1;
        }
      }
    }
  }
}


void mousePressed() {
  killMonster();
  ammo1.shoot();
}