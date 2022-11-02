class Gate{
  
  boolean closed = true;
  int xPos;
  int yPos;
  int xSize;
  int ySize;
  int red;
  int green;
  int blue;
  int lockNumber;
  
  Gate(int xP, int yP, int xS, int yS, int r, int g, int b, int lock){
    xPos = xP;
    yPos = yP;
    xSize = xS;
    ySize = yS;
    red = r;
    green = g;
    blue = b;
    lockNumber = lock;
  }
  
  //Draws the gate and prevents the player from passing through it unless the player has the corresponding key and then it is destroyed
  void drawGate(){
    if(closed == true){
      fill(red, green, blue);
      noStroke();
      rect(xPos, yPos, xSize, ySize);
      if(playerX > xPos - 24 && playerY < yPos + ySize && playerY > yPos - 20 && playerX < xPos + xSize && right == true){
        right = false;
        for(int i = 0; i < inventory.length; i++){
          if(lockNumber == inventory[i]){
            breakGate();
          }
        }
      }
      if(playerX > xPos - 20 && playerY < yPos + ySize && playerY > yPos - 20 && playerX < xPos + xSize + 4 && left == true){
        left = false;
        for(int i = 0; i < inventory.length; i++){
          if(lockNumber == inventory[i]){
            breakGate();
          }
        }
      }
      if(playerX > xPos - 20 && playerY < yPos + ySize + 4 && playerY > yPos - 20 && playerX < xPos + xSize && up == true){
        up = false;
        for(int i = 0; i < inventory.length; i++){
          if(lockNumber == inventory[i]){
            breakGate();
          }
        }
      }
      if(playerX > xPos - 20 && playerY < yPos + ySize && playerY > yPos - 24 && playerX < xPos + xSize && down == true){
        down = false;
        for(int i = 0; i < inventory.length; i++){
          if(lockNumber == inventory[i]){
            breakGate();
          }
        }
      }
    }
  }
  
  void breakGate(){
    closed = false;
  }
}