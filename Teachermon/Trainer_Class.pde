class overworld1trainer {
  boolean fought=false;
  boolean spotted=false;
  boolean fighting=false;
  boolean finishedtalking=false;
  int x;
  float y=25;
  int i;
  int rx=0;

  overworld1trainer(int _i) {
    i=_i;
    x=(i+1)*width/4;
  }

  void move() {
    noStroke();
    fill(0);
    image(overworld1trainer[i], x, y, 25, 25);
    if (x==student.x && fought==false) {
      spotted=true;
    }
    if (spotted==true) {
      if (y<student.y-25) {
        y++;
      }
      if (y==student.y-25){
        fill(255);
        rect(0,height/2,width,height/2);
        stroke(1);
        textSize(40);
        fill(0);
        text(fightmessage1[i], 0,height/2,width,height/2);
      }
      if (y==student.y-25 && (keyCode == ENTER || keyCode == RETURN)){
        finishedtalking=true;
      }
      if (y==student.y-25 && rx==width){
          fighting=true;
          overworld1=false;
      }
    }
  }
}

