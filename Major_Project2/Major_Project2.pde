Monsters monster1;


void setup(){
 size(800,800);
 monster1 = new Monsters(0,500);

}

void draw(){
   background(255);
   monster1.movingMonsters();
  
}