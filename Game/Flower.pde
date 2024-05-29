class Flower {
  String name;
  int flowerOrder;
  PImage[] aliveImgs;
  PImage[] deadImgs;
  PImage image;
  boolean isAlive;
  int age;
  int waterNeed;
  int lastWatered;
  int value;
  
  public Flower(String n, PImage img, boolean alive, int a, int water, int last, int v) {
    name = n;
    image = img;
    isAlive = alive;
    age = a;
    waterNeed = water;
    lastWatered = last;
    value = v;
  }
  
  // Precondition: isAlive == true
  public boolean checkLife() {
    if(lastWatered > waterNeed){
      isAlive = false;
      return false;
    }
    return true;
  }
  
  public static void update(Flower[][] garden){
    for(Flower f : garden){
      if(f.isAlive && !f.checkLife()){
        f.isAlive = false;
        f.image = deadImgs[flowerOrder];
      }
    }
  }
  
}
