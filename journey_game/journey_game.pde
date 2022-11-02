public int playerX = 390;
public int playerY = 500;
public int playerHealth = 5;
public boolean up = false;
public boolean down = false;
public boolean left = false;
public boolean right = false;
public boolean swordCollected = false;
public boolean buttonHeld = false;
public boolean help = false;
public int mapX = 0;
public int mapY = 0;
public int[] inventory = new int[9];
public PImage swordUp;
public PImage swordLeft;
public PImage swordDown;
public PImage swordRight;
public PImage healthPot;
public PImage helpMenu;
public ArrayList<Sword> swordArray = new ArrayList<Sword>();
public ArrayList<FireBall> ballArray = new ArrayList<FireBall>();
Player one = new Player();

//Gates
Gate purpleG = new Gate(300,210,260,30,208,93,255,1);
Gate blueG = new Gate(620,240,30,240,0,0,255,2);
Gate greenG = new Gate(300,350,260,30,0,255,0,3);
Gate pinkG = new Gate(570,400,30,200,255,85,179,4);
Gate redG = new Gate(400,300,30,100,255,0,0,5);

//Keys
Key purpleK = new Key(500,600,1,208,93,255);
Key blueK = new Key(430,530,2,0,0,255);
Key greenK = new Key(0,0,3,0,255,0);
Key redK = new Key(500,325,5,255,0,0);

//Sword
Sword swordToCollect = new Sword();

//Fire Traps
FireTrap trap1 = new FireTrap(80,50);
FireTrap trap2 = new FireTrap(50,0);
FireTrap trap2a = new FireTrap(50,0);
FireTrap trap2b = new FireTrap(50,0);
FireTrap trap2c = new FireTrap(50,0);

//Bats
Bat bat1 = new Bat(400,500,80,7,20,200,150,50);
Bat bat2 = new Bat(700,50,50,2,255,0,30,15);

//Bushes
Bush main1 = new Bush();
Bush main2 = new Bush();
Bush main3 = new Bush();
Bush main4 = new Bush();
Bush main5 = new Bush();
Bush main6 = new Bush();

//Boss
Gridley gridleyTest = new Gridley(15,4,7,600,400,255,234,0);
Gridley miniGridley = new Gridley(5,3,4,375,375,255,85,179);

//Health Potions
HealthPotion hpB1 = new HealthPotion();
HealthPotion hpB2 = new HealthPotion();
HealthPotion hp1 = new HealthPotion();
HealthPotion hpM = new HealthPotion();

//Shield
Shield shield1 = new Shield(10,30,100);

//Barrier
Barrier b = new Barrier();

PFont title;
PFont squareFont;

void setup(){
  size(800,800);
  title = createFont("RUBBBB__.TTF", 60);
  squareFont = createFont("Square.ttf", 20);
  swordUp = loadImage("pixil-frame-0 (1).png");
  swordLeft = loadImage("pixil-frame-0 (3).png");
  swordDown = loadImage("pixil-frame-0 (4).png");
  swordRight = loadImage("pixil-frame-0 (5).png");
  healthPot = loadImage("health-potion.png");
  helpMenu = loadImage("pixil-frame-0 (9).png");
}

void draw(){
  background(255,255,255);
  
  if(mapX == 0 && mapY == 0){
    textFont(title);
    fill(0,0,0);
    text("JOURNEY",250,230);
    textFont(squareFont);
    text("For help, hold 'H'",350,300);
    b.barrier(0,0,210,240);
    b.barrier(0,0,800,170);
    b.barrier(590,0,210,240);
    b.barrier(0,480,210,320);
    b.barrier(590,480,210,320);
    main1.drawBush(170,240);
    main2.drawBush(170,280);
    main3.drawBush(170,320);
    main4.drawBush(170,360);
    main5.drawBush(170,400);
    main6.drawBush(170,440);
    hpB1.drawHealthPotion(720,300);
    hpB2.drawHealthPotion(720,390);
    blueG.drawGate();
  }
  if(mapX == -1 && mapY == 0){
    b.barrier(0,0,300,410);
    b.barrier(560,0,240,240);
    b.barrier(0,690,800,110);
    b.barrier(560,480,240,320);
    purpleG.drawGate();
    bat1.drawBat();
  }
  else{
    bat1.resetPosition();
  }
  if(mapX == -2 && mapY == 0){
    b.barrier(0,0,800,410);
    b.barrier(250,690,550,110);
  }
  if(mapX == -3 && mapY == 0){
    b.barrier(0,0,800,410);
    b.barrier(0,0,250,800);
  }
  if(mapX == -3 && mapY == 1){
    b.barrier(0,0,250,640);
  }
  if(mapX == -2 && mapY == 1){
    b.barrier(250,0,550,800);
  }
  if(mapX == -2 && mapY == 2){
    b.barrier(250,0,550,800);
    b.barrier(0,250,800,550);
  }
  if(mapX == -3 && mapY == 2){
    b.barrier(0,250,800,550);
  }
  if(mapX == -4 && mapY == 2){
    b.barrier(0,0,200,800);
    b.barrier(0,250,800,550);
  }
  if(mapX == -4 && mapY == 1){
    b.barrier(0,0,800,640);
    b.barrier(0,740,200,60);
  }
  if(mapX == -5 && mapY == 1){
    b.barrier(0,0,70,800);
    b.barrier(0,590,500,210);
    b.barrier(170,0,160,490);
    b.barrier(170,0,630,390);
    trap1.drawFireTrap(3,350,340,5);
    b.barrier(430,490,130,310);
    b.barrier(510,740,290,60);
    trap2.drawFireTrap(1,570,750,5);
    b.barrier(660,310,140,330);
  }
  if(mapX == -5 && mapY == 0){
    b.barrier(0,0,800,500);
    b.barrier(0,700,70,100);
    b.barrier(170,500,630,300);
  }
  if(mapX == -6 && mapY == 0){
    b.barrier(0,0,800,500);
    b.barrier(0,0,400,800);
    b.barrier(0,700,800,100);
    purpleK.drawKey();
  }
  if(mapX == 1 && mapY == 0){
    b.barrier(750,0,50,800);
    b.barrier(0,0,800,50);
    b.barrier(0,0,50,240);
    b.barrier(0,480,50,360);
    b.barrier(0,750,800,50);
    gridleyTest.drawGridley();
  }
  if(mapX == 0 && mapY == 1){
    b.barrier(0,0,210,800);
    b.barrier(590,0,210,800);
    trap1.drawFireTrap(4,700,300,6);
    trap2.drawFireTrap(2,100,600,3);
  }
  if(mapX == 0 && mapY == 2){
    b.barrier(0,0,210,200);
    b.barrier(0,0,110,800);
    b.barrier(590,0,210,200);
    b.barrier(690,0,110,800);
    b.barrier(0,600,210,200);
    b.barrier(590,600,210,200);
    b.barrier(220,270,80,260);
    b.barrier(500,270,80,260);
    trap2.drawFireTrap(1,120,620,4);
    trap2a.drawFireTrap(1,180,620,4);
    trap2b.drawFireTrap(1,150,620,4);
    hp1.drawHealthPotion(150,400);
  }
  if(mapX == 0 && mapY == 3){
    swordToCollect.drawSword(385,376);
    b.barrier(0,0,210,800);
    b.barrier(590,0,210,800);
    b.barrier(0,550,800,250);
  }
  if(mapX == -1 && mapY == -1){
    b.barrier(0,600,300,200);
    b.barrier(560,600,240,200);
    b.barrier(0,0,800,400);
    pinkG.drawGate();
  }
  if(mapX == -2 && mapY == -1){
    b.barrier(700,0,100,400);
    b.barrier(200,0,600,100);
    b.barrier(0,0,100,800);
    b.barrier(0,700,800,100);
    b.barrier(700,600,100,200);
    b.barrier(200,200,400,400);
    trap2.drawFireTrap(4,660,110,7);
    trap2a.drawFireTrap(4,660,150,7);
    trap2b.drawFireTrap(2,110,660,7);
    trap2c.drawFireTrap(2,110,620,7);
  }
  if(mapX == -2 && mapY == -2){
    b.barrier(0,700,100,100);
    b.barrier(0,0,800,600);
    b.barrier(200,0,600,800);
    bat2.drawBat();
  }
  else{
    bat2.resetPosition();
  }
  if(mapX == -3 && mapY == -2){
    b.barrier(600,700,200,100);
    b.barrier(500,400,100,400);
    b.barrier(300,400,200,200);
    b.barrier(700,0,100,600);
    b.barrier(0,0,800,300);
    b.barrier(0,0,200,800);
    b.barrier(0,700,400,100);
    redG.drawGate();
    shield1.drawShield(500,300);
    if(shield1.getHealth() <= 0){
      redK.drawKey();
    }
    trap1.drawFireTrap(2,150,335,8);
    hpM.drawHealthPotion(430,700);
  }
  if(mapX == -3 && mapY == -1){
    b.barrier(0,0,400,100);
    b.barrier(500,0,300,100);
    b.barrier(0,0,100,800);
    b.barrier(0,700,800,100);
    b.barrier(700,0,100,800);
    miniGridley.drawGridley();
  }
  if(mapX == 0 && mapY == -1){
    b.barrier(0,0,200,400);
    b.barrier(0,600,400,200);
    b.barrier(0,0,800,300);
    b.barrier(300,400,100,400);
    b.barrier(300,400,300,100);
    b.barrier(700,0,100,800);
    b.barrier(500,400,100,200);
    b.barrier(400,700,400,100);
    blueK.drawKey();
  }
  
  if(mapX == 20 && mapY == 20){
    b.barrier(0,0,800,100);
    b.barrier(0,0,100,800);
    b.barrier(700,0,100,800);
    b.barrier(0,700,800,100);
    textFont(title);
    fill(0,0,0);
    text("You Win", 200,300);
  }
  if(mapX == -20 && mapY == -20){
    b.barrier(0,0,800,100);
    b.barrier(0,0,100,800);
    b.barrier(700,0,100,800);
    b.barrier(0,700,800,100);
    textFont(title);
    fill(0,0,0);
    text("You Lose", 200,300);
    playerX = 400;
    playerY = 500;
  }
  
  if(playerHealth <= 0){
    mapX = -20;
    mapY = -20;
  }
  
  for(int i = 0; i < inventory.length; i++){
    if(inventory[i] == 7){
      mapX = 20;
      mapY = 20;
    }
  }
  
  for(int i = 0; i < swordArray.size(); i++){
    swordArray.get(i).swingSword();
  }
  for(int i = 0; i < ballArray.size(); i++){
    ballArray.get(i).drawBall();
  }
  
  one.drawPlayer();
  
  if(help == true){
    image(helpMenu,0,0);
  }
}

void keyPressed(){
  if(key == 'w'){
    up = true;
  }
  if(key == 's'){
    down = true;
  }
  if(key == 'a'){
    left = true;
  }
  if(key == 'd'){
    right = true;
  }
  if(key == 'p'){
    mapX = 0;
    mapY = 0;
    playerX = 375;
    playerY = 375;
  }
  if(key == 'h'){
    help = true;
  }
  if(keyCode == UP && !buttonHeld){
    Sword chopMaster = new Sword();
    chopMaster.swingSwordUp();
    swordArray.add(chopMaster);
    buttonHeld = true;
  }
  if(keyCode == LEFT && !buttonHeld){
    Sword chopMaster = new Sword();
    chopMaster.swingSwordLeft();
    swordArray.add(chopMaster);
    buttonHeld = true;
  }
  if(keyCode == DOWN && !buttonHeld){
    Sword chopMaster = new Sword();
    chopMaster.swingSwordDown();
    swordArray.add(chopMaster);
    buttonHeld = true;
  }
  if(keyCode == RIGHT && !buttonHeld){
    Sword chopMaster = new Sword();
    chopMaster.swingSwordRight();
    swordArray.add(chopMaster);
    buttonHeld = true;
  }
}

void keyReleased(){
  
  if(key == 'w'){
    up = false;
  }
  if(key == 's'){
    down = false;
  }
  if(key == 'a'){
    left = false;
  }
  if(key == 'd'){
    right = false;
  }
  if(key == 'h'){
    help = false;
  }
  
  if(keyCode == UP || keyCode == RIGHT || keyCode == DOWN || keyCode == LEFT){
    buttonHeld = false;
  }
}

void mousePressed(){
  //playerX = mouseX;
  //playerY = mouseY;
}