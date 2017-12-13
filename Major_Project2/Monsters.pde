class Monsters{
  
  //data
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
 if (x >= 700){
    x = 700;
  }
  x = x + 5;
  
  ellipse(x, y, 100, 100);
}
   
   
 
 
  
  
}