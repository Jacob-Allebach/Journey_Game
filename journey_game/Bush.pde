class Bush{
  
  boolean destroyed;
  
  Bush(){
    destroyed = false;
  }
  
  //draws the bush and prevents the player from moving through it
  //also gets destroyed if it is hit by a sword
  void drawBush(int xPos, int yPos){
    if(destroyed == false){
      fill(42,142,0);
      rect(xPos,yPos,40,40);
      fill(58,196,0);
      rect(xPos + 10,yPos + 10,20,20);
      if(playerX > xPos - 24 && playerY < yPos + 40 && playerY > yPos - 20 && playerX < xPos + 40 && right == true){
        right = false;
      }
      if(playerX > xPos - 20 && playerY < yPos + 40 && playerY > yPos - 20 && playerX < xPos + 44 && left == true){
        left = false;
      }
      if(playerX > xPos - 20 && playerY < yPos + 44 && playerY > yPos - 20 && playerX < xPos + 40 && up == true){
        up = false;
      }
      if(playerX > xPos - 20 && playerY < yPos + 40 && playerY > yPos - 24 && playerX < xPos + 40 && down == true){
        down = false;
      }
      
      for(int i = 0; i < swordArray.size(); i++){
        if(swordArray.get(i).getOrnt() == 1 || swordArray.get(i).getOrnt() == 3){
          if(swordArray.get(i).getXPos() < xPos + 40 && swordArray.get(i).getXPos() > xPos - 30 && swordArray.get(i).getYPos() > yPos - 48 && swordArray.get(i).getYPos() < yPos + 40){
            swordArray.get(i).deleteSword();
            destroyed = true;
            swordArray.remove(i);
            break;
          }
        }
        if(swordArray.get(i).getOrnt() == 2 || swordArray.get(i).getOrnt() == 4){
          if(swordArray.get(i).getXPos() < xPos + 40 && swordArray.get(i).getXPos() > xPos - 48 && swordArray.get(i).getYPos() > yPos - 30 && swordArray.get(i).getYPos() < yPos + 40){
            swordArray.get(i).deleteSword();
            destroyed = true;
            swordArray.remove(i);
            break;
          }
        }
      }
    }
  }
}