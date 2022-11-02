class Bat{
  
  int xPos;
  int yPos;
  int size;
  int health;
  int red;
  int green;
  int blue;
  int speed;
  int invulTimer = 0;
  int originalXPos;
  int originalYPos;
  
  Bat(int xP,int yP,int s,int h,int r,int g,int b, int sp){
    xPos = xP;
    yPos = yP;
    size = s;
    health = h;
    red = r;
    green = g;
    blue = b;
    speed = sp;
    originalXPos = xPos;
    originalYPos = yPos;
  }
  
  //Draws the bat on the screen and moves it toward the player
  //also does things if it makes contact with the player or a sword
  void drawBat(){
    if(health > 0){
      fill(red,green,blue);
      stroke(0);
      rect(xPos,yPos,size,size);
      textFont(squareFont);
      fill(255 - red,255 - green,255 - blue);
      text(health,xPos + size / 2 - 8,yPos + size / 2 + 8);
      if(collision()){
        health--;
      }
      if(playerHit()){
        if(invulTimer == 0){
          invulTimer++;
          playerHealth--;
        }
      }
      if(invulTimer != 0){
        invulTimer++;
      }
      if(invulTimer == 90){
        invulTimer = 0;
      }
      moveBat();
    }
  }
  
  //Checks if the bat is hit by a sword
  boolean collision(){
    for(int i = 0; i < swordArray.size(); i++){
      if(swordArray.get(i).getOrnt() == 1 || swordArray.get(i).getOrnt() == 3){
        if(swordArray.get(i).getXPos() < xPos + size && swordArray.get(i).getXPos() > xPos - 30 && swordArray.get(i).getYPos() > yPos - 48 && swordArray.get(i).getYPos() < yPos + size){
          swordArray.get(i).deleteSword();
          swordArray.remove(i);
          return true;
        }
      }
      if(swordArray.get(i).getOrnt() == 2 || swordArray.get(i).getOrnt() == 4){
        if(swordArray.get(i).getXPos() < xPos + size && swordArray.get(i).getXPos() > xPos - 48 && swordArray.get(i).getYPos() > yPos - 30 && swordArray.get(i).getYPos() < yPos + size){
          swordArray.get(i).deleteSword();
          swordArray.remove(i);
          return true;
        }
      }
    }
    return false;
  }
  
  //Checks if the bat makes contact with the player
  boolean playerHit(){
    if(playerX > xPos - 20 && playerX < xPos + size && playerY > yPos - 20 && playerY < yPos + size){
      return true;
    }
    return false;
  }
  
  //moves the bat toward the player exponentially
  void moveBat(){
    int xShift = (xPos - playerX + size/2) / speed;
    int yShift = (yPos - playerY + size/2) / speed;
    xPos -= xShift;
    yPos -= yShift;
  }
  
  //resets the position of the bat
  void resetPosition(){
    xPos = originalXPos;
    yPos = originalYPos;
  }
}