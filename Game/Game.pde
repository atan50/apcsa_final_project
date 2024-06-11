PImage startScreen, shopScreen, theirGarden, myGarden;
PImage flower, deadflower, sapling;
int days, totalDays, level;
Shop shop;
Garden garden;
//Objective objectives;
//Objective currObj;
String activeScreen;
String activeGarden;
int waterPoints0, points0, targetPoints0;
int tempPurchase;

void setup(){
  size(900,600);
  level = 1;
  waterPoints0 = 3;
  points0 = 3;
  targetPoints0 = 50;
  activeScreen = "Start";
  activeGarden = "Personal";
  shop = new Shop();
  garden = new Garden();
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
    if(shopPressed()){
      activeScreen = "Shop";
    }
    /*
    if(){ //nextDay button pressed
      Flower.update(Garden.garden);
    }
  }
  if(activeScreen.equals("Objective")){
    
    
    if(){ //nextDay button pressed
      Flower.update(currObj.garden);
    }*/
  } 
  if(activeScreen.equals("Shop")){
    shop.screen();
    if(shop.exitShop()){
      activeScreen = activeGarden;
    }
    if(mousePressed){
      tempPurchase = shop.itemPurchased();
      if(tempPurchase == -1){
        tempPurchase = 0;
      }
      else{
        activeScreen = activeGarden;
      }
    }
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
  fill(#c5faf0);
  stroke(#3bedcd);
  strokeWeight(10);
  rect(-30, -30, 180, 150, 25);
  fill(#0a0a0a);
  textSize(20);
  text("Water: "+waterPoints0, 30, 40);
  text("Coins: "+points0, 30, 80);
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

void update(Flower[][] g){
  for(Flower f : g){
    if(f.isAlive && !f.checkLife()){
      f.isAlive = false;
    }
  }
}

void newPoints(Flower[][] g){
  for(Flower f : g){
    if(f.isAlive){
      points0 += f.value;
    }
  }
  waterPoints0 += level * 2 / 3 + 2;
}
