class Flower {
  String name;
  PImage image;
  boolean isAlive;
  int age;
  int waterNeed;
  int lastWatered;
  
  public Flower(String n, PImage img, boolean alive, int a, int water, int last) {
    name = n;
    image = img;
    isAlive = alive;
    age = a;
    waterNeed = water;
    lastWatered = last;
  }
  
  public boolean checkLife() {
    return isAlive;
  }
