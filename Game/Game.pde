PImage startScreen, shopScreen, theirGarden, myGarden;
PImage flower, deadflower, sapling;
int days, level;
Shop shop;
Garden garden;
String activeScreen;
String activeGarden;
int waterPoints0, points0, targetPoints0;
int tempPurchase, spendWater;

void setup(){
  size(900,600);
  level = 1;
  waterPoints0 = 3;
  points0 = 5;
  targetPoints0 = 50;
  activeScreen = "Start";
  activeGarden = "Personal";
  shop = new Shop();
  garden = new Garden();
  tempPurchase = -1;
  spendWater = 0;
  startScreen = loadImage("pixil-frame-0.png");
  myGarden = loadImage("cleangarden.png");
  theirGarden = loadImage("messygarden.png");
  shopScreen = loadImage("shop.jpg");
  flower = loadImage("flower.png");
  deadflower = loadImage("deadflower.png");
  sapling = loadImage("sapling.png");
  
}

void draw(){
  
 
  if(activeScreen.equals("Start")){
    image(startScreen, 0, 0);
    startButton(width/2, height/2);
    if(startPressed()){
      activeScreen = "Personal";
    }
  }
  if(activeScreen.equals("Personal")){
    garden.screen();
    displayCurrency();
    shopButton(width, height);
    nextDayButton();
    waterButton(10, 180, 1);
    waterButton(10, 270, 2);
    waterButton(10, 360, 3);
    endButton(10, 545);

    statusButton();
    
    if(waterPressed1()){
      tempPurchase = -1;
      spendWater = 1;
    }
    if(waterPressed2()){
      tempPurchase = -1;
      spendWater = 2;
    }
    if(waterPressed3()){
      tempPurchase = -1;
      spendWater = 3;
    }
    
    if(mousePressed && spendWater > 0 && spendWater <= waterPoints0){
      waterPlant();
      delay(50);
    }
    
    if(mousePressed && tempPurchase > -1){
      plantFlower();
    }
    
    if(nextDayPressed()){ //nextDay button pressed
      update(garden.garden);
      newPoints(garden.garden);
      delay(50);
    }
    
    if(shopPressed()){
      activeScreen = "Shop";
    }
    if(statusPressed()){
      activeScreen = "Status";
    }
    
    if(endPressed()){
      activeScreen = "Game Over";
    }
    
  }
  
  if(activeScreen.equals("Shop")){
    shop.screen();
    if(shop.exitShop()){
      activeScreen = activeGarden;
    }
    else if(mousePressed){
      tempPurchase = shop.itemPurchased();
      if(tempPurchase != -1){
        activeScreen = activeGarden;
      }
    }
  }
  
  if(activeScreen.equals("Status")){
    statusScreen();
    if(mousePressed){
      activeScreen = "Personal";
    }
  }
  
  if(activeScreen.equals("Game Over")){
    image(startScreen, 0, 0);
    gameOverButton(width/2, height/2);
  }
  
  if(activeScreen.equals("Complete")){
    image(startScreen, 0, 0);
    completeButton(width/2, height/2);
  }
  
}

void startButton(int x, int y){
  fill(#fcba03);
  if(overStart()){
    fill(#fcca3f);
  }
  stroke(#d19c08);
  strokeWeight(5);
  rect(x-150,y-30,300,60,25);
  fill(#4a3807);
  textSize(40);
  text("Start", width/2-40, height/2+12);
}

boolean overStart(){
  if(mouseX >= 300 && mouseX <= 600 && mouseY >= 280 && mouseY <= 330){
    return true;
  }
  return false;
}

boolean startPressed(){
  if(mousePressed){
    if(mouseX >= 300 && mouseX <= 600 && mouseY >= 280 && mouseY <= 330){
      return true;
    }
  }
  return false;
}

void displayCurrency(){
  fill(#a3a3a3);
  stroke(#0a0a0a);
  strokeWeight(10);
  rect(-30, -30, 140, 100, 25);
  fill(#0a0a0a);
  textSize(20);
  text("Water: "+waterPoints0, 16, 25);
  text("Coins: "+points0, 16, 50);
  text("Day: "+days, 805, 37.5);
}

void shopButton(int x, int y){
  fill(#fcba03);
  if(overShop(100)){
    fill(#fcca3f);
  }
  stroke(#d19c08);
  strokeWeight(5);
  ellipse(x-80, y-70, 100, 100);
  fill(#4a3807);
  textSize(20);
  text("Shop", width-100, height-64);
}

boolean overShop(int diameter){
  float disX = width-80 - mouseX;
  float disY = height-70 - mouseY;
  if(sqrt(sq(disX) + sq(disY)) < diameter/2 ) {
    return true;
  }else{
    return false;
  }
}

boolean shopPressed(){
  if(mousePressed && overShop(100)){
    return true;
  }
  return false;
}

void update(Flower[] g){
  for(int i = 0; i < garden.gLength; i++){
    days++;
    g[i].age++;
    g[i].waterValue -= g[i].thrist;
    if(g[i].isAlive && !g[i].checkLife()){
      g[i].isAlive = false;
    }
    
    if(days == 3){
      level = 2;
    }
    if(days == 6){
      level = 3;
    }
    if(days == 9){
      level = 4;
    }
    if(days == 15){
      level = 5;
    }
    if(days == 20){
      level = 6;
    }
    if(days == 25){
      level = 7;
    }
    if(days == 30){
      level = 8;
      activeScreen = "Complete";
    }
    
  }
}

void newPoints(Flower[] g){
  for(int i = 0; i < garden.gLength; i++){
    if(g[i].isAlive){
      points0 += g[i].value;
    }
  }
  if(level == 1){
    waterPoints0 += 2;
  }
  if(level == 2){
    waterPoints0 += 3;
  }
  if(level == 3){
    waterPoints0 += 6;
  }
  if(level == 4){
    waterPoints0 += 9;
  }
  if(level >= 5){
    waterPoints0 += 12;
  }
}

void plantFlower(){
  /*
  strokeWeight(0);
  int startX;
  int startY;
  for(int r = 0; r < 4; r++){
    startY = 108 + 96 * r;
    for(int c = 0; c < 7; c++){
      startX = 114 + 96 * c;
      rect(startX, startY, 96, 96);
    }
  }
  */
  for(int r = 0; r < 4; r++){
   if(mouseY >= 108 + 96 * r && mouseY < 204 + 96 * r){
     for(int c = 0; c < 7; c++){
       if(mouseX >= 114 + 96 * c && mouseX < 210 + 96 * c){
         /*
          if(tempPurchase == 0){
            garden.addFlower(r, c, new Daisy());
          }
          if(tempPurchase == 1){
            garden.addFlower(r, c, new Hydrangea());
          }
          if(tempPurchase == 2){
            garden.addFlower(r, c, new Lily());
          }
          if(tempPurchase == 3){
            garden.addFlower(r, c, new Orchid());
          }
          if(tempPurchase == 4){
            garden.addFlower(r, c, new Rose());
          }
          if(tempPurchase == 5){
            garden.addFlower(r, c, new Sunflower());
          }
          if(tempPurchase == 6){
            garden.addFlower(r, c, new Tulip());
          }
          if(tempPurchase == 7){
            garden.addFlower(r, c, new Violet());
          }
          */
          if(tempPurchase >= 0 && tempPurchase < 8){
            garden.addFlower(c, r, tempPurchase);
            points0 -= shop.temps[tempPurchase].cost;
            tempPurchase = -1;
            break;
          }
       }
     }
   }
 }
}


void nextDayButton(){
  fill(#fcba03);
  if(overNextDay()){
    fill(#fcca3f);
  }
  stroke(#d19c08);
  strokeWeight(5);
  rect(width/2-150, height-55,300,45,25);
  fill(#4a3807);
  text("Next Day", width/2-40, height-25);
}

boolean overNextDay(){
  if(mouseX >= 300 && mouseX <= 600 && mouseY >= 545 && mouseY <= 590){
    return true;
  }
  return false;
}

boolean nextDayPressed(){
  if(mousePressed && overNextDay()){
    return true;
  }
  return false;
}

void waterButton(int x, int y, int amt){
  fill(#c5faf0);
  stroke(#3bedcd);
  strokeWeight(5);
  rect(x, y, 75, 75, 25);
  fill(#3bedcd);
  textSize(20);
  String amtStr = "";
  if(amt==1){
    amtStr = "  One";
  }
  if(amt==2){
    amtStr = "  Two";
  }
  if(amt==3){
    amtStr = "Three";
  }
  text("Water\n"+amtStr, x+12, y+34);
}

boolean waterPressed1(){
  if(mousePressed && mouseX >= 10 && mouseX <= 85 && mouseY >= 180 && mouseY <= 255){
    return true;
  }
  return false;
}

boolean waterPressed2(){
  if(mousePressed && mouseX >= 10 && mouseX <= 85 && mouseY >= 270 && mouseY <= 345){
    return true;
  }
  return false;
}

boolean waterPressed3(){
  if(mousePressed && mouseX >= 10 && mouseX <= 85 && mouseY >= 360 && mouseY <= 435){
    return true;
  }
  return false;
}

void waterPlant(){
  for(int r = 0; r < 4; r++){
   if(mouseY >= 108 + 96 * r && mouseY < 204 + 96 * r){
     for(int c = 0; c < 7; c++){
       if(mouseX >= 114 + 96 * c && mouseX < 210 + 96 * c){
         for(int i = 0; i < 28; i++){
           if(garden.coord[i][1] == r && garden.coord[i][0] == c){
             garden.garden[i].waterValue += spendWater;
             waterPoints0 -= spendWater;
             break;
           }
         }
       }
     }
   }
  }
}

void statusButton(){
  fill(#21bf4b);
  if(overStatus()){
    fill(#28de58);
  }
  stroke(#147d30);
  strokeWeight(5);
  rect(width/2-115, 22,230,45,25);
  fill(#147d30);
  text("Check Flower Status", width/2-84, 52);
}

boolean overStatus(){
  if(mouseX >= 335 && mouseX <= 565 && mouseY >= 22 && mouseY <= 67){
    return true;
  }
  return false;
}

boolean statusPressed(){
  if(mousePressed && overStatus()){
    return true;
  }
  return false;
}

void statusScreen(){
  background(#a3a3a3);
  fill(#ffffff);
  textSize(20);
  if(garden.gLength == 0){
    text("No plants yet!\nCome back when you've made progress!!", 20, 40);
  }
  for(int i = 0; i < garden.gLength; i++){
    text("Water Value of Plant in Row "+(garden.coord[i][1]+1)+", Column "+(garden.coord[i][0]+1)+": ", 20, 40 + 20 * i);
    if(garden.garden[i].waterValue <= garden.garden[i].thrist){
      fill(#fc0800);
    }
    text(""+garden.garden[i].waterValue, 370, 40 + 20 * i);
    fill(#ffffff);
  }
}

void endButton(int x, int y){
  fill(#fc0800);
  stroke(#8a0601);
  strokeWeight(5);
  rect(x, y, 85, 45, 25);
  fill(#8a0601);
  textSize(20);
  text("End", x+24, y+28);
}

boolean endPressed(){
  if(mousePressed && mouseX >= 10 && mouseX <= 95 && mouseY >= 545 && mouseY <= 590){
    return true;
  }
  return false;
}

void endGame(){

}

void gameOverButton(int x, int y){
  fill(#fc0800);
  stroke(#8a0601);
  strokeWeight(5);
  rect(x-150,y-30,300,60,25);
  fill(#8a0601);
  textSize(40);
  text("Game Over", width/2-90, height/2+12);
}

void completeButton(int x, int y){
  fill(#fcba03);
  stroke(#d19c08);
  strokeWeight(5);
  rect(x-150,y-30,300,60,25);
  rect(x-150,y+60,160,60,25);
  fill(#4a3807);
  textSize(40);
  text("Congratulations", width/2-136, height/2+12);
  text("Score: "+points0, width/2-136, height/2+102);
}
