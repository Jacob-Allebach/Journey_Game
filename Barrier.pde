class Barrier{
  
  Barrier(){
    
  }
  
  //Draws the barrier on the screen and prevents the player from moving through it
  void barrier(int xPos, int yPos, int xSize, int ySize){
    fill(0,0,0);
    noStroke();
    rect(xPos, yPos, xSize, ySize);
    if(playerX > xPos - 24 && playerY < yPos + ySize && playerY > yPos - 20 && playerX < xPos + xSize && right == true){
      right = false;
    }
    if(playerX > xPos - 20 && playerY < yPos + ySize && playerY > yPos - 20 && playerX < xPos + xSize + 4 && left == true){
      left = false;
    }
    if(playerX > xPos - 20 && playerY < yPos + ySize + 4 && playerY > yPos - 20 && playerX < xPos + xSize && up == true){
      up = false;
    }
    if(playerX > xPos - 20 && playerY < yPos + ySize && playerY > yPos - 24 && playerX < xPos + xSize && down == true){
      down = false;
    }
  }
}