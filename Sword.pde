class Sword{
  
  int playerPositionX;
  int playerPositionY;
  int swordPositionX;
  int swordPositionY;
  int counter = 0;
  boolean isSwingingUp = false;
  boolean isSwingingDown = false;
  boolean isSwingingLeft = false;
  boolean isSwingingRight = false;
  int swordMapX;
  int swordMapY;
  int ornt;
  
  Sword(){
    playerPositionX = playerX-6;
    playerPositionY = playerY-6;
    swordPositionX = playerX;
    swordPositionY = playerY;
    swordMapX = mapX;
    swordMapY = mapY;
  }
  
  //Draws the physical sword that the player has to collect
  void drawSword(int xPos, int yPos){
    if(swordCollected == false){
      image(swordUp, xPos, yPos);
      if(playerX > xPos - 20 && playerX < xPos + 30 && playerY > yPos - 20 && playerY < yPos + 48){
        swordCollected = true;
      }
    }
  }
  
  //Moves the sword forward in the direction it is moving
  void swingSword() {
    if(isSwingingUp){
      image(swordUp,playerPositionX,swordPositionY-40);
      counter++;
      swordPositionY-=8;
      ornt = 1;
    }
    
    if(isSwingingDown){
      image(swordDown,playerPositionX,swordPositionY+20);
      counter++;
      swordPositionY+=8;
      ornt = 3;
    }
    
    if(isSwingingLeft){
      image(swordLeft,swordPositionX-40,playerPositionY);
      counter++;
      swordPositionX-=8;
      ornt = 4;
    }
    
    if(isSwingingRight){
      image(swordRight,swordPositionX+20,playerPositionY);
      counter++;
      swordPositionX+=8;
      ornt = 2;
    }
    
    if(counter == 40 || mapX != swordMapX || mapY != swordMapY) {
      isSwingingUp = isSwingingLeft = isSwingingRight = isSwingingDown = false;
      counter = 0;
      swordPositionX = -100;
      swordPositionY = -100;
    }
  }
  
  //Sets the direction to up
  void swingSwordUp(){
    if(swordCollected == true && counter == 0){
      isSwingingUp = true;
    }
  }
  
  //Sets the direction to down
  void swingSwordDown(){
    if(swordCollected == true && counter == 0){
      isSwingingDown = true;
    }
  }
  
  //Sets the direction to left
  void swingSwordLeft(){
    if(swordCollected == true && counter == 0){
      isSwingingLeft = true;
    }
  }
  
  //Sets the direction to right
  void swingSwordRight(){
    if(swordCollected == true && counter == 0){
      isSwingingRight = true;
    }
  }
  
  //Returns the x position
  int getXPos(){
    return swordPositionX;
  }
  
  //Returns the y position
  int getYPos(){
    return swordPositionY;
  }
  
  //Returns the orientation
  int getOrnt(){
    return ornt;
  }
  
  //Sends the sword way off the screen to get rid of it
  void deleteSword(){
    isSwingingUp = isSwingingLeft = isSwingingRight = isSwingingDown = false;
    counter = 0;
    swordPositionX = -100;
    swordPositionY = -100;
  }
}