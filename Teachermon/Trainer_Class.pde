class overworldtrainer {
  boolean fought=false;
  boolean spotted=false;
  boolean fighting=false;
  boolean premoving=false;
  
  int exclamationtimer=0;
  
  boolean moving=false;
  boolean battlestart=false;
  
  int x;
  float y=25;
  int i;
  int j;
  float foot=0;
  
  boolean inbattletalking=false;
  
  overworldtrainer(int _i, int _j){
    i=_i;
    j=_j;
    x=(j+1)*width/4;
  }

  void move() {
    noStroke();
    fill(0);
    if (moving==false) {
      image(overworldtrainer[i][j], x, y, 25, 25);
    }
    if (x==student.x && fought==false && y<=student.y) {
      spotted=true;
    }
    if (spotted==true) {
      if (exclamationtimer<45) {
        image(seeplayer, x, y-25, 25, 25);
        premoving=true;
        exclamationtimer++;
      }
      if(exclamationtimer==1){
        overworldbgm[i].close();
        overworldbgm[i] = minim.loadFile("overworldbgm"+i+".mp3");
        seen.play();
      }
      if (exclamationtimer>=45) {
        premoving=false;
        moving=true;
      }
      if (y<student.y-25 && moving==true) {
        y++;
        foot++;
        if (foot==50) {
          foot=0;
        }
        if (foot<25) {
          image(overworldtrainerfoot1[i][j], x, y, 25, 25);
        }
        if (25<=foot && foot <50) {
          image(overworldtrainerfoot2[i][j], x, y, 25, 25);
        }
      }
      if (y==student.y-25 && exclamationtimer>=45) {
        moving=false;
        image(battletext, 0, 3*height/4, width, height/4);
        fill(255);
        textSize(30);
        text(fightmessage[i][j], width/16, 13*height/16, 15*width/16, 3*height/16);
      }
      if (y==student.y-25 && keyPressed && button && (key == ENTER || key == RETURN) && exclamationtimer>=45) {
        exclamationtimer=0;
        battlestart=true;
        overworld[i]=false;
        seen.close();
        seen = minim.loadFile("rocket.mp3");
        bgm[i]=false;
      }
    }
  }
}

  
  
