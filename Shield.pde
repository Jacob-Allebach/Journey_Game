class Shield{
  
  int health;
  int xSize;
  int ySize;
  SpecialBall ball = new SpecialBall();
  
  Shield(int hp, int xS, int yS){
    health = hp;
    xSize = xS;
    ySize = yS;
  }
  
  //Draws the shield used by Gridley
  //If it is destroyed, it draws a special ball instead
  void drawShield(int xPos,int yPos){
    if(health > 0){
      fill(0,0,0);
      rect(xPos,yPos,xSize,ySize);
      fill(255,255,255);
      text(health,xPos + xSize / 2 - 18,yPos + ySize / 2 + 10);
      if(shieldCollision(xPos,yPos)){
        health--;
      }
    }
    else if(health <= 0){
      ball.drawSpecialBall(xPos,yPos);
    }
  }
  
  //Checks if it has been hit by a sword
  boolean shieldCollision(int xPos,int yPos){
    for(int i = 0; i < swordArray.size(); i++){
      if(swordArray.get(i).getOrnt() == 1 || swordArray.get(i).getOrnt() == 3){
        if(swordArray.get(i).getXPos() < xPos + xSize && swordArray.get(i).getXPos() > xPos - 30 && swordArray.get(i).getYPos() > yPos - 48 && swordArray.get(i).getYPos() < yPos + ySize){
          swordArray.get(i).deleteSword();
          swordArray.remove(i);
          return true;
        }
      }
      if(swordArray.get(i).getOrnt() == 2 || swordArray.get(i).getOrnt() == 4){
        if(swordArray.get(i).getXPos() < xPos + xSize && swordArray.get(i).getXPos() > xPos - 48 && swordArray.get(i).getYPos() > yPos - 30 && swordArray.get(i).getYPos() < yPos + ySize){
          swordArray.get(i).deleteSword();
          swordArray.remove(i);
          return true;
        }
      }
    }
    return false;
  }
  
  //Returns the health of the shield
  int getHealth(){
    return health;
  }
}