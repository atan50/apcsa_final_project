public class Garden{
  
  //Flower[][] garden;
  int[][] coord = new int[28][2];
  Flower[] garden = new Flower[28];
  int gLength;
  
  void Garden(){
    gLength = 0;
    /*
    garden = new Flower[4][7];
    for(int r = 0; r < 4; r++){
      for(int c = 0; c < 7; c++){
        garden[r][c] = null;
      }
    }
    garden[1][4] = new Daisy();
    */
  }
  
  void screen(){  //draw screen
    image(myGarden,0,0);
    
    for(int i = 0; i < gLength; i++){
      if(garden[i].isAlive == false){
        image(deadflower, 115 + 96 * coord[i][0], 106 + 96 * coord[i][1]);
      }
      else if(garden[i].age < 2){
        image(sapling, 115 + 96 * coord[i][0], 106 + 96 * coord[i][1]);
      }
      else{
        image(garden[i].image, 115 + 96 * coord[i][0], 82 + 96 * coord[i][1]);
      }
    }
    
    /*
    Flower tempF;
        
    for(int r = 0; r < 4; r++){
      for(int c = 0; c < 7; c++){
        try{
        //if(garden[r][c] != null){
          tempF = garden[r][c];
          image(tempF.image, 120 + 96 * r, 130 + 96 * c);
        }catch(NullPointerException e){}
      }
    }
    */
  }
  
  void addFlower(int x, int y, int id){
    int[] arr = new int[2];
    arr[0] = x;
    arr[1] = y;
    coord[gLength] = arr;
    
    if(id == 0){
      garden[gLength] = new Daisy();
    }
    if(id == 1){
      garden[gLength] = new Hyrdrangea();
    }
    if(id == 2){
      garden[gLength] = new Lily();
    }
    if(id == 3){
      garden[gLength] = new Orchid();
    }
    if(id == 4){
      garden[gLength] = new Rose();
    }
    if(id == 5){
      garden[gLength] = new Sunflower();
    }
    if(id == 6){
      garden[gLength] = new Tulip();
    }
    if(id == 7){
      garden[gLength] = new Violet();
    }
    gLength++;
  }
  
}
