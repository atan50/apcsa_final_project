int days, totalDays, level;
//Garden garden;
//Objective objectives;
//Objective currObj;
String activeScreen;
int waterPoints, points, targetPoints;

void setup(){
  waterPoints = 3;
  targetPoints = 50;
  activeScreen = "Start";
}

void draw(){
  if(activeScreen.equals("Start")){
    // start button
  }
  if(activeScreen.equals("Garden")){
    
    
    if(){ //nextDay button pressed
      Flower.update(Garden.garden);
    }
  }
}

void newPoints(){
  for(Flower f : currObj.clientGarden){
    if(f.isAlive){
      points += f.value;
    }
  }
  waterPoints += level * 2 / 3 + 2;
}