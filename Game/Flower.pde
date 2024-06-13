class Flower {
  //int flowerOrder;
  PImage image;
  boolean isAlive;
  int minLevel, thrist, cost, value;
  int age, waterValue;
  
  public Flower(){
    isAlive = true;
    waterValue = 5;
  }
  
  // Precondition: isAlive == true
  public boolean checkLife() {
    if(waterValue <= 0 || waterValue >= 10){
      isAlive = false;
      return false;
    }
    return true;
  }
  
}
