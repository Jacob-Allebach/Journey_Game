class Key{
  
  boolean collected = false;
  int xPos;
  int yPos;
  int lockNumber;
  int red;
  int green;
  int blue;
  
  Key(int xP, int yP, int lock, int r, int g, int b){
    xPos = xP;
    yPos = yP;
    lockNumber = lock;
    red = r;
    green = g;
    blue = b;
  }
  
  //Draws the key if it hasn't been collected yet
  void drawKey(){
    if(collected == false){
      fill(red, green, blue);
      noStroke();
      rect(xPos, yPos, 30, 30);
      rect(xPos + 30, yPos + 10, 30, 10);
      rect(xPos + 50, yPos + 10, 10, 20);
      rect(xPos + 35, yPos + 10, 10, 20);
      fill(255,255,255);
      rect(xPos + 10, yPos + 10, 10, 10);
      
      if(playerX < xPos + 60 && playerX > xPos - 20 && playerY < yPos + 30 && playerY > yPos - 20){
        collectKey();
      }
    }
  }
  
  //Adds the key to the inventory and destroys the key
  void collectKey(){
    collected = true;
    for(int i = 0; i < inventory.length; i++){
      if(inventory[i] == 0){
        inventory[i] = lockNumber;
        break;
      }
    }
  }
}