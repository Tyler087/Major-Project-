class Ammo{
 
  //data
  int clipSize;
  int startTime;
  //int reloadTimer;
  int endTime;
  Timer reloadTimer;
  
  //contructor
  Ammo(){
   clipSize = 10;
   reloadTimer = new Timer(5000);
   startTime = millis();
   //reloadTimer = 5000; 
   
  }
  
  
  
  //behaviour
  
  void display(){
   text(clipSize, width*0.9, 50); 
  }
  
  void shoot(){
    if(clipSize >0){
       clipSize -= 1; 
    }
  }
   
   //void delayReload(){
   //if (clipSize <= 0){
   //  endTime = startTime + 2000;
   //  if (millis() >= endTime){
   //   clipSize += 10; 
   //   reloadTimer.begin();
   //  }
     
   //}
    
  //}
  
  
  
  
  
}