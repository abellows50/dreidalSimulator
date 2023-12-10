class Dreidal{
  public static final int GIMMEL = 3;
  public static final int HAY = 2;
  public static final int NUN = 1;
  public static final int SHIN = 0;
  Dreidal(){}
  int spin(){
    return (int) random(4);
    //0 is Shin
    //1 is nun
    //2 is hay
    //3 is gimmel
  }
}
