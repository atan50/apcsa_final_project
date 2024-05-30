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
  }/*
  if(activeScreen.equals("Garden")){
    
    
    if(){ //nextDay button pressed
      Flower.update(Garden.garden);
    }
  }
  if(activeScreen.equals("Objective")){
    
    
    if(){ //nextDay button pressed
      Flower.update(currObj.garden);
    }
  }
  */
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
  stroke(#d19c08);
  strokeWeight(5);
  rect(x-250,y-50,500,100,25);
  fill(#4a3807);
  textSize(60);
  text("Start", width/2-60, height/2+20);
}
