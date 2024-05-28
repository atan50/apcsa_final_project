public class Garden{
  
  static Flower[][] garden;
  
  void screen(){  //draw screen
    for(Flower f : garden){
      image(f.image);
    }
  }
  
}
