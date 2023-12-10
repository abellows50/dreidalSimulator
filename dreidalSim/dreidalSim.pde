Dreidal d;
Player[] players;
int pot;
int n = 3;
int startingGelt = 10;
boolean playing;
void setup(){
  d = new Dreidal();
  playing = true;
  pot = 0;
  players = new Player[n];
  for(int i = 0; i<players.length; i++){
    players[i] = new Player(startingGelt);
    pot = players[i].ante(pot);
  }
}

void draw(){
 // println(frameCount + ": " + pot);
    for (Player p: players){
      if (playing){
        playing = turn(p);
      }
    }
    
}

boolean turn(Player p){
  int r = d.spin();
  println(p + " rolled " + r + " has " + p.gelt + " pot: " + pot);
  pot = p.turn(r,pot);
  if(r==Dreidal.GIMMEL){
    for(Player player: players){
      pot = player.ante(pot);
    }
  }
  return p.checkPlaying();
}
