class HealthPotion{
  
  boolean collected = false;
  
  HealthPotion(){
  }
  
  //Draws the health potion if it hasn't been collected
  void drawHealthPotion(int xPos, int yPos){
    if(collected == false){
      image(healthPot,xPos,yPos,width/15,height/15);
      if(playerX < xPos + 45 && playerX > xPos - 20 && playerY < yPos + 45 && playerY > yPos - 20){
        collectHealthPotion();
      }
    }
  }
  
  //Gives the player health and deletes the potion
  void collectHealthPotion(){
    collected = true;
    playerHealth+=5;
  }
}