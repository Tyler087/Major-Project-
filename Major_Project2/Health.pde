class Health{

  //data
  int life = 500;
  
   
  //constructor
  Health(){
   life = 500; 
   
  }
  
  
  //Behaviour
  
  void character(){
    fill(255, 0, 0);
   ellipse(1100, 500, 50, 150); 
  }
  
  void displayLifeBar(){
    fill(255, 0, 0);
    rectMode(CENTER);
    rect(width/2, 100, life, 40);
    
    if (frameCount % 5 == 0){
     //if(theMonsters >= 1000){
      life = life - 5; 
     //}
    }
    
  }
  
  
  
}