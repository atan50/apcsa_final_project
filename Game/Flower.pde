class Flower {
  //int flowerOrder;
  PImage image;
  boolean isAlive;
  int minLevel, waterNeed, cost, value;
  int age, lastWatered;
  
  // Precondition: isAlive == true
  public boolean checkLife() {
    if(lastWatered > waterNeed){
      isAlive = false;
      return false;
    }
    return true;
  }
  
}
