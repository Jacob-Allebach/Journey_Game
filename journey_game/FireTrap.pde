class FireTrap{
  
  int delay;
  int timer;
  
  FireTrap(int delayTime, int startingTime){
    delay = delayTime;
    timer = startingTime;
    if(timer > delay || timer < 0){
      timer = 0;
    }
  }
  
  //Draws a fire trap on the screen and fires a fire ball at a regular interval
  void drawFireTrap(int ornt, int xPos, int yPos, int speed){
    if(timer == delay){
      FireBall fireBall = new FireBall(ornt,xPos + 15,yPos + 15,speed);
      ballArray.add(fireBall);
      timer = 0;
    }
    
    timer++;
    stroke(255,255,255);
    fill(150,150,150);
    rect(xPos,yPos,30,30);
    fill(0,0,0);
    if(ornt > 4 || ornt < 1){
      ornt = 4;
    }
    if(ornt == 1){
      rect(xPos,yPos - 10,30,10);
    }
    if(ornt == 2){
      rect(xPos + 30,yPos,10,30);
    }
    if(ornt == 3){
      rect(xPos,yPos + 30,30,10);
    }
    if(ornt == 4){
      rect(xPos - 10,yPos,10,30);
    }
  }
}