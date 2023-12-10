Dreidal d;
Player[] players;
int[] wins;
int pot;
int n = 4;
int startingGelt = 25;
boolean playing;
void setup(){
  frameRate(1000);
  size(400,400);
  d = new Dreidal();
  playing = true;
  pot = 0;
  players = new Player[n];
  setUp();
  wins = new int[n];
}

void draw(){
  background(0);
  for (Player p: players){
    if (playing){
      playing = turn(p);
    }
  }
  if(!playing){
    wins[winner(players)]++;
    setUp();
    playing=true;
  }
  drawBars(wins, width/n, height, 3);
}
void setUp(){
  for(int i = 0; i<players.length; i++){
    players[i] = new Player(startingGelt);
    pot = players[i].ante(pot);
  }
}
boolean turn(Player p){
  int r = d.spin();
 // println(p + " rolled " + r + " has " + p.gelt + " pot: " + pot);
  pot = p.turn(r,pot);
  if(r==Dreidal.GIMMEL){
    for(Player player: players){
      pot = player.ante(pot);
    }
  }
  return p.checkPlaying();
}

void drawBars(int[] data, int barWidth, int yBaseline, int scaler) {
  int x = 0;
  for(int i=0; i<data.length; i++) {
    rect(x, yBaseline, barWidth, -data[i]*scaler);
    textAlign(CENTER);
    textSize(10);
    fill(0,0,0);
    text(i,x+barWidth/2,yBaseline);
    fill(255);
    x+= barWidth;
  }//loop through array
}//drawValues

int winner(Player[] players){
  int max = players[0].gelt;
  int maxIndex = 0;
  for(int i = 1; i<players.length; i++){
     if (players[i].gelt > max){
       max = players[i].gelt;
       maxIndex = i;
     }
  }
  return maxIndex;
}
