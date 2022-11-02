class Player{
  
  Player(){
    
  }
  
  //Draws the player and their health
  void drawPlayer(){
    
    stroke(255);
    fill(0);
    rect(playerX,playerY,20,20);
    if(up){
      playerY-= 4;
    }
    if(down){
      playerY+= 4;
    }
    if(left){
      playerX-= 4;
    }
    if(right){
      playerX+= 4;
    }
    
    if(playerX > 780){
      playerX = 0;
      mapX++;
    }
    if(playerY > 780){
      playerY = 0;
      mapY++;
    }
    if(playerX < 0){
      playerX = 780;
      mapX--;
    }
    if(playerY < 0){
      playerY = 780;
      mapY--;
    }
    
    textFont(squareFont);
    fill(255,255,255);
    text("Health: " + playerHealth,10,20);
  }
  
}