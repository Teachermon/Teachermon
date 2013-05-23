class overworld1trainer {
  boolean fought=false;
  boolean spotted=false;
  boolean fighting=false;
  boolean finishedtalking=false;
  boolean premoving=false;
  int exclamationtimer=0;
  boolean moving=false;
  boolean battlestart=false;
  int x;
  float y=25;
  int i;
  float foot=0;

  overworld1trainer(int _i) {
    i=_i;
    x=(i+1)*width/4;
  }

  void move() {
    noStroke();
    fill(0);
    if (moving==false) {
      image(overworld1trainer[i], x, y, 25, 25);
    }
    if (x==student.x && fought==false) {
      spotted=true;
    }
    if (spotted==true) {
      if (exclamationtimer<45) {
        image(seeplayer, x, y-25, 25, 25);
        premoving=true;
        exclamationtimer++;
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
          image(overworld1trainerfoot1[i], x, y, 25, 25);
        }
        if (25<=foot && foot <50) {
          image(overworld1trainerfoot2[i], x, y, 25, 25);
        }
      }
      if (y==student.y-25) {
        moving=false;
        image(battletext, 0, 3*height/4, width, height/4);
        fill(255);
        textSize(30);
        text(fightmessage1[i], width/16, 13*height/16, 15*width/16, 3*height/16);
      }
      if (y==student.y-25 && (keyCode == ENTER || keyCode == RETURN)) {
        finishedtalking=true;
        battlestart=true;
        overworld1=false;
      }
    }
  }
}

