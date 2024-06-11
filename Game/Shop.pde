public class Shop{
  
  int tempX;
  int tempY;
  int itemX;
  int itemY;
  
  Flower tempDaisy = new Daisy();
  Flower tempHydrangea = new Hydrangea();
  Flower tempLily = new Lily();
  Flower tempOrchid = new Orchid();
  Flower tempRose = new Rose();
  Flower tempSunflower = new Sunflower();
  Flower tempTulip = new Tulip();
  Flower tempViolet = new Violet();
  
  Flower[] temps = {tempDaisy, tempHydrangea, tempLily, tempOrchid, tempRose, tempSunflower, tempTulip, tempViolet};
  
   void Shop(){};
   
   void screen(){
     image(shopScreen, -16.5, 0);
     fill(#fcba03);
     if(overExit()){
       fill(#fcca3f);
     }
     stroke(#ad8207);
     strokeWeight(5);
     rect(825, 25, 50, 50, 25);
     fill(#ad8207);
     textSize(40);
     text("X", 839, 64);
     text("X", 841, 64);
     fill(#ffffff);
     textSize(15);
     text("Type the corresponding Shop Key to Purchase", 330, 585);
     
     for(int r = 0; r < 2; r++){
       //tempY = 220 + 163 * r;
       itemY = 255 + 163 * r;
       for(int c = 0; c < 4; c++){
         //tempX = 170 + 144 * c;
         //rect(tempX, tempY, 128, 140, 20);
         itemX = 188 + 144 * c;
         image(flower, itemX, itemY);
       }
     }
     
   }
   
   boolean overExit(){
     if(mouseX >= 825 && mouseX <= 875 && mouseY >= 25 && mouseY <= 75){
       return true;
     }
     return false;
   }
   
   boolean exitShop(){
     if(mousePressed && overExit()){
       return true;
     }
     return false;
   }
   
   int itemPurchased(){
     if(activeGarden.equals("Personal")){
       for(int r = 0; r < 2; r++){
         if(mouseY >= 220 + 163 * r && mouseY <= 360 + 163 * r){
           for(int c = 0; c < 4; c++){
             if(mouseX >= 170 + 144 * c && mouseX <= 298 + 144 * c){
               int tempKey = (r * 4) + (c + 1);
               if(level >= temps[tempKey].minLevel && points0 >= temps[tempKey].cost){
                 return tempKey;
               }
             }
           }
         }
       }
       /*
       if(key == 1){
         if(level >= tempDaisy.minLevel && points0 >= tempDaisy.cost){
           return key;
         }
       }
       if(key == 2){
         if(level >= tempHydrangea.minLevel && points0 >= tempHydrangea.cost){
           return key;
         }
       }
       if(key == 3){
         if(level >= tempLily.minLevel && points0 >= tempLily.cost){
           return key;
         }
       }
       if(key == 4){
         if(level >= tempOrchid.minLevel && points0 >= tempOrchid.cost){
           return key;
         }
       }
       if(key == 5){
         if(level >= tempRose.minLevel && points0 >= tempRose.cost){
           return key;
         }
       }
       if(key == 6){
         if(level >= tempSunflower.minLevel && points0 >= tempSunflower.cost){
           return key;
         }
       }
       if(key == 7){
         if(level >= tempTulip.minLevel && points0 >= tempTulip.cost){
           return key;
         }
       }
       if(key == 8){
         if(level >= tempViolet.minLevel && points0 >= tempViolet.cost){
           return key;
         }
       }
       */
     return -1;
   }
  
}
