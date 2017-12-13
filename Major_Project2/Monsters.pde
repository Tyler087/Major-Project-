class Monsters{
  
  //data
 public float theMonsters =1000;
 float x = 0;
 float y = 500;
 float dx = random(0,10);
  
 
 //constructor
 Monsters (int _x, int _y){
   x = _x;
   y = _y;
 }
 //behaviour
 
 void movingMonsters(){
 fill(255);
 if (x >= 1000){
    x = 1000;
  }
  x = x + 5;
  
  ellipse(x, y, 100, 100);
}
   
   
 
 
  
  
}