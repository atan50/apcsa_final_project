public class Shop{
  
  
   void Shop(){};
   
   void screen(){
     image(shopScreen, -16.5, 0);
     for(int r = 0; r < 4; r++){
       for(int c = 0; c < 2; c++){
         //rect(180, 220, 120, 120, 20);
         image(flower, 188, 255);
       }
     }
   }
   
   int itemPurchased(){
     
     return -1;
   }
  
}
