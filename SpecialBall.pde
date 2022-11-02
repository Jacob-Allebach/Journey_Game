class SpecialBall{
  
  int timer = 0;
  
  SpecialBall(){

  }
  
  //Draws the special ball, which fires out regular balls in all four directions every second
  void drawSpecialBall(int xPos, int yPos){
    fill(0,0,255);
    ellipse(xPos,yPos,40,40);
    timer++;
    if(timer == 60){
      FireBall up = new FireBall(1,xPos,yPos,6);
      FireBall right = new FireBall(2,xPos,yPos,6);
      FireBall down = new FireBall(3,xPos,yPos,6);
      FireBall left = new FireBall(4,xPos,yPos,6);
      
      ballArray.add(up);
      ballArray.add(right);
      ballArray.add(down);
      ballArray.add(left);
      
      timer = 0;
    }
  }
}