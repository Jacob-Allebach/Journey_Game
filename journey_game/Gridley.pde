class Gridley{
  
  int health;
  int speed;
  int keyNumber;
  int xPos;
  int yPos;
  int moveCounter = 0;
  int fireCounter = 0;
  int chosenDirection;
  int invulTimer = 0;
  Shield s1;
  Shield s2;
  Shield s3;
  Shield s4;
  Key k;
  
  Gridley(int hp, int sp, int kn, int xP, int yP,int r,int g,int b){
    health = hp;
    speed = sp;
    keyNumber = kn;
    xPos = xP;
    yPos = yP;
    s1 = new Shield(health*2,50,20);
    s2 = new Shield(health*2,20,50);
    s3 = new Shield(health*2,50,20);
    s4 = new Shield(health*2,20,50);
    k = new Key(xPos,yPos,keyNumber,r,g,b);
  }
  
  //Draws Gridley and the shields that come with it
  //Fires balls at a regular interval and moves toward the player
  void drawGridley(){
    if(health > 0){
      fill(120,120,120);
      rect(xPos,yPos,50,50);
      fill(255,255,255);
      text(health,xPos + 10,yPos + 30);
      s1.drawShield(xPos,yPos - 20);
      s2.drawShield(xPos + 50,yPos);
      s3.drawShield(xPos,yPos + 50);
      s4.drawShield(xPos - 20,yPos);
      if(collision()){
        health--;
      }
      if(playerHit()){
        if(invulTimer == 0){
          playerHealth--;
          invulTimer++;
        }
      }
      if(invulTimer != 0){
        invulTimer++;
      }
      if(invulTimer == 90){
        invulTimer = 0;
      }
      move();
      if(moveCounter >= 50){
        fireCounter++;
        if(fireCounter == 5 || fireCounter == 20 || fireCounter == 35){
          fireBalls();
        }
        if(fireCounter >= 40){
          fireCounter = 0;
          moveCounter = 0;
        }
      }
    }
    if(health <= 0){
      k.drawKey();
    }
  }
  
  //Shoots out one ball on each side of Gridley
  void fireBalls(){
    FireBall up = new FireBall(1,xPos + 25,yPos + 25,6);
    FireBall right = new FireBall(2,xPos + 25,yPos + 25,6);
    FireBall down = new FireBall(3,xPos + 25,yPos + 25,6);
    FireBall left = new FireBall(4,xPos + 25,yPos + 25,6);
    
    ballArray.add(up);
    ballArray.add(right);
    ballArray.add(down);
    ballArray.add(left);
  }
  
  //Moves the player in a direction based on the player's location
  void move(){
    if(moveCounter == 0){
      chosenDirection = determineRoute();
      moveCounter++;
    }
    if(moveCounter > 0 && moveCounter <= 50){
      if(chosenDirection == 1){
        yPos-= 2;
        moveCounter++;
      }
      if(chosenDirection == 2){
        xPos+= 2;
        moveCounter++;
      }
      if(chosenDirection == 3){
        yPos+= 2;
        moveCounter++;
      }
      if(chosenDirection == 4){
        xPos-= 2;
        moveCounter++;
      }
    }
  }
  
  //Determines which direction to use based on the position of the player compared to Gridley
  int determineRoute(){
    int direction = 1;
    int xDiff = xPos - playerX;
    int yDiff = yPos - playerY;
    
    if(xDiff > yDiff && xDiff > 0){
      if(abs(xDiff) > abs(yDiff)){
        direction = 4;
        return direction;
      }
      if(abs(yDiff) > abs(xDiff)){
        direction = 3;
        return direction;
      }
    }
    if(xDiff < yDiff && yDiff > 0){
      if(abs(yDiff) > abs(xDiff)){
        direction = 1;
        return direction;
      }
      if(abs(xDiff) > abs(yDiff)){
        direction = 2;
        return direction;
      }
    }
    if(xDiff > yDiff && xDiff < 0){
      if(abs(xDiff) > abs(yDiff)){
        direction = 2;
        return direction;
      }
      if(abs(yDiff) > abs(xDiff)){
        direction = 3;
        return direction;
      }
    }
    if(xDiff < yDiff && yDiff < 0){
      direction = 2;
      return direction;
    }
    if(xDiff == 0){
      if(yDiff > 0){
        direction = 1;
        return direction;
      }
      if(yDiff < 0){
        direction = 3;
        return direction;
      }
    }
    if(yDiff == 0){
      if(xDiff > 0){
        direction = 4;
        return direction;
      }
      if(xDiff < 0){
        direction = 2;
        return direction;
      }
    }
    return direction;
  }
  
  //Detects if the main body has been hit by a sword
  boolean collision(){
    for(int i = 0; i < swordArray.size(); i++){
      if(swordArray.get(i).getOrnt() == 1 || swordArray.get(i).getOrnt() == 3){
        if(swordArray.get(i).getXPos() < xPos + 50 && swordArray.get(i).getXPos() > xPos - 30 && swordArray.get(i).getYPos() > yPos - 48 && swordArray.get(i).getYPos() < yPos + 50){
          swordArray.get(i).deleteSword();
          swordArray.remove(i);
          return true;
        }
      }
      if(swordArray.get(i).getOrnt() == 2 || swordArray.get(i).getOrnt() == 4){
        if(swordArray.get(i).getXPos() < xPos + 50 && swordArray.get(i).getXPos() > xPos - 48 && swordArray.get(i).getYPos() > yPos - 30 && swordArray.get(i).getYPos() < yPos + 50){
          swordArray.get(i).deleteSword();
          swordArray.remove(i);
          return true;
        }
      }
    }
    return false;
  }
  
  //Detects if the main body makes contact with the player
  boolean playerHit(){
    if(playerX > xPos - 20 && playerX < xPos + 50 && playerY > yPos - 20 && playerY < yPos + 50){
      return true;
    }
    return false;
  }
}