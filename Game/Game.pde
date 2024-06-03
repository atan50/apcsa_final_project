int days, totalDays, level;
//Garden garden;
//Objective objectives;
//Objective currObj;
String activeScreen;
int waterPoints, points, targetPoints;

void setup(){
  size(1000,600);
  waterPoints = 3;
  targetPoints = 50;
  activeScreen = "Start";
}

void draw(){
  
 
  if(activeScreen.equals("Start")){
    startButton(width/2, height/2);
    if(startPressed()){
      activeScreen = "Garden";
    }
  }
  if(activeScreen.equals("Garden")){
    Garden garden = new Garden();
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
    background(#59f0c7);
  }
  
}

/*
void newPoints(){
  for(Flower f : currObj.clientGarden){
    if(f.isAlive){
      points += f.value;
    }
  }
  waterPoints += level * 2 / 3 + 2;
}
*/

void startButton(int x, int y){
  fill(#fcba03);
  if(overStart()){
    fill(#fcca3f);
  }
  stroke(#d19c08);
  strokeWeight(5);
  rect(x-250,y-50,500,100,25);
  fill(#4a3807);
  textSize(60);
  text("Start", width/2-60, height/2+20);
}

boolean overStart(){
  if(mouseX >= 250 && mouseX <= 750 && mouseY >= 250 && mouseY <= 350){
    return true;
  }
  return false;
}

boolean startPressed(){
  if(mousePressed){
    if(mouseX >= 250 && mouseX <= 750 && mouseY >= 250 && mouseY <= 350){
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
  text("Water: "+waterPoints, 30, 40);
  text("Coins: "+points, 30, 80);
}

void shopButton(int x, int y){
  fill(#fcba03);
  if(overShop(100)){
    fill(#fcca3f);
  }
  stroke(#d19c08);
  strokeWeight(5);
  ellipse(x-100, y-90, 100, 100);
  fill(#4a3807);
  textSize(20);
  text("Shop", width-120, height-84);
}

boolean overShop(int diameter){
  float disX = width-100 - mouseX;
  float disY = height-90 - mouseY;
  if(sqrt(sq(disX) + sq(disY)) < diameter/2 ) {
    return true;
  }else{
    return false;
  }
}

boolean shopPressed(){
  if(keyPressed && overShop(100)){
    return true;
  }
  return false;
}
