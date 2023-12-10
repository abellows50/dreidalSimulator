class Player{
  int gelt;
  boolean playing;
  Player(int _gelt){
    gelt = _gelt;
    playing = true;
  }
  
  int turn(int r, int pot){
    if(r==Dreidal.SHIN){//shin
      pot++;
      gelt--;
    }
    if(r==Dreidal.HAY){
      int half = pot / 2;
      gelt += half;
      pot -= half;
    }
    if (r==Dreidal.GIMMEL){
      gelt += pot;
      pot = 0;
    }
    return pot;
  }
  
  int ante(int pot){
    gelt --;
    pot++;
    return pot;
  }
    
  boolean checkPlaying(){
    playing = gelt >= 0;
    return playing;
  }
}
