class FireBall{
  
  int ornt;
  int xPos;
  int yPos;
  int speed;
  int startMapX;
  int startMapY;
  
  FireBall(int orientation, int xP, int yP, int ballSpeed){
    ornt = orientation;
    xPos = xP;
    yPos = yP;
    speed = ballSpeed;
    startMapX = mapX;
    startMapY = mapY;
  }
  
  //draws the fire ball on the screen and moves it in a direction based on the orientation
  //also is destroyed if it makes contact with a sword
  void drawBall(){
    if(mapX == startMapX && mapY == startMapY){
      fill(255,0,0);
      ellipse(xPos, yPos, 30, 30);
      if(ornt == 1){
        yPos -= speed;
      }
      if(ornt == 2){
        xPos += speed;
      }
      if(ornt == 3){
        yPos += speed;
      }
      if(ornt == 4){
        xPos -= speed;
      }
    }
    else{
      xPos = -100;
      yPos = -100;
    }
    
    if(playerX > xPos - 35 && playerX < xPos + 15 && playerY > yPos - 35 && playerY < yPos + 15){
      playerHealth--;
      xPos = -100;
      yPos = -100;
    }
    
    for(int i = 0; i < swordArray.size(); i++){
      if(swordArray.get(i).getOrnt() == 1 || swordArray.get(i).getOrnt() == 3){
        if(swordArray.get(i).getXPos() < xPos + 15 && swordArray.get(i).getXPos() > xPos - 45 && swordArray.get(i).getYPos() > yPos - 63 && swordArray.get(i).getYPos() < yPos + 15){
          swordArray.get(i).deleteSword();
          xPos = -100;
          yPos = -100;
          swordArray.remove(i);
          break;
        }
      }
      if(swordArray.get(i).getOrnt() == 2 || swordArray.get(i).getOrnt() == 4){
        if(swordArray.get(i).getXPos() < xPos + 15 && swordArray.get(i).getXPos() > xPos - 63 && swordArray.get(i).getYPos() > yPos - 45 && swordArray.get(i).getYPos() < yPos + 15){
          swordArray.get(i).deleteSword();
          xPos = -100;
          yPos = -100;
          swordArray.remove(i);
          break;
        }
      }
    }
  }
}