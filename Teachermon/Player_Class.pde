class Player {
  PImage movel1;
  PImage mover1;
  PImage moved1;
  PImage moveu1;
  PImage movel2;
  PImage mover2;
  PImage moved2;
  PImage moveu2;
  PImage standl;
  PImage standr;
  PImage standd;
  PImage standu;
  
  float x=width/2+25;
  float y=height/2;
  
  //Moving directions
  boolean moving=false;
  boolean movel=false;
  boolean mover=false;
  boolean moveu=false;
  boolean moved=false;
  
  //Facing directions
  boolean facel=false;
  boolean facer=true;
  boolean faceu=false;
  boolean faced=false;
  
  //Which movnig animation will play
  int foot=1;
  
  //Moving will stop at each grid position
  int movetimer=0;
  
  boolean whatattack=false;
  
  Player(){
    movel1 = loadImage("trainermove1left.png");
    mover1 = loadImage("trainermove1right.png");
    moveu1 = loadImage("trainermove1up.png");
    moved1 = loadImage("trainermove1down.png");
    movel2 = loadImage("trainermove2left.png");
    mover2 = loadImage("trainermove2right.png");
    moveu2 = loadImage("trainermove2up.png");
    moved2 = loadImage("trainermove2down.png");
    standl = loadImage("trainerstillleft.png");
    standr = loadImage("trainerstillright.png");
    standu = loadImage("trainerstillup.png");
    standd = loadImage("trainerstilldown.png");
  }

  void display() {
    fill(255);
    
    //***********SPRITES**************
    if(movel && foot==1){
      image(movel1,x,y,25,25);
    }
    if(movel && foot==2){
      image(movel2,x,y,25,25);
    }
    if(facel){
      image(standl,x,y,25,25);
    }
    
    if(mover && foot==1){
      image(mover1,x,y,25,25);
    }
    if(mover && foot==2){
      image(mover2,x,y,25,25);
    }
    if(facer){
      image(standr,x,y,25,25);
    }
    
    if(moveu && foot==1){
      image(moveu1,x,y,25,25);
    }
    if(moveu && foot==2){
      image(moveu2,x,y,25,25);
    }
    if(faceu){
      image(standu,x,y,25,25);
    }
    
    if(moved && foot==1){
      image(moved1,x,y,25,25);
    }
    if(moved && foot==2){
      image(moved2,x,y,25,25);
    }
    if(faced){
      image(standd,x,y,25,25);
    }
  }
  
  void move1(){
    
    //***********MOVING****************
    if (keyPressed && key=='d' && moving==false) {
      mover=true;
      moving=true;
      facer=false;
      facel=false;
      faced=false;
      faceu=false;
    }
    if (mover==true) {
      movetimer++;
      if (x!=width-50 && (x!=trainer1[0].x-25 || y!=trainer1[0].y) && (x!=trainer1[1].x-25 || y!=trainer1[1].y) && (x!=trainer1[2].x-25 || y!=trainer1[2].y)){
        x++;
      }
      else if(movetimer==1){
        bump.trigger();
      }
      if (movetimer==25) {
        mover=false;
        moving=false;
        movetimer=0;
        facer=true;
        facel=false;
        faced=false;
        faceu=false;
        if (foot==1) {
          foot=2;
        }
        else {
          foot=1;
        }
      }
    }
    if (keyPressed && key=='a' && moving==false) {
      movel=true;
      moving=true;
      facer=false;
      facel=false;
      faced=false;
      faceu=false;
    }
    if (movel==true) {
      movetimer++;
      if(x!=25 && (x!=trainer1[0].x+25 || y!=trainer1[0].y) && (x!=trainer1[1].x+25 || y!=trainer1[1].y) && (x!=trainer1[2].x+25 || y!=trainer1[2].y)){
        x--;
      }
      else if(movetimer==1){
        bump.trigger();
      }
      if (movetimer==25) {
        movel=false;
        moving=false;
        movetimer=0;
        facer=false;
        facel=true;
        faced=false;
        faceu=false;
        if (foot==1) {
          foot=2;
        }
        else {
          foot=1;
        }
      }
    }
    if (keyPressed && key=='w' && moving==false) {
      moveu=true;
      moving=true;
      facer=false;
      facel=false;
      faced=false;
      faceu=false;
    }
    if (moveu==true) {
      movetimer++;
      if(y!=25 && (x!=trainer1[0].x || y!=trainer1[0].y+25) && (x!=trainer1[1].x || y!=trainer1[1].y+25) && (x!=trainer1[2].x || y!=trainer1[2].y+25)){
        y--;
      }
      else if(movetimer==1){
        bump.trigger();
      }
      if (movetimer==25) {
        moveu=false;
        moving=false;
        movetimer=0;
        facer=false;
        facel=false;
        faced=false;
        faceu=true;
        if (foot==1) {
          foot=2;
        }
        else {
          foot=1;
        }
      }
    }
    if (keyPressed && key=='s' && moving==false) {
      moved=true;
      moving=true;
      facer=false;
      facel=false;
      faced=false;
      faceu=false;
    }
    if (moved==true) {
      movetimer++;
      if(y!=height-50 && (x!=trainer1[0].x || y!=trainer1[0].y-25) && (x!=trainer1[1].x || y!=trainer1[1].y-25) && (x!=trainer1[2].x || y!=trainer1[2].y-25)){
        y++;
      }
      else if(movetimer==1){
        bump.trigger();
      }
      if (movetimer==25) {
        moved=false;
        moving=false;
        movetimer=0;
        facer=false;
        facel=false;
        faced=true;
        faceu=false;
        if (foot==1) {
          foot=2;
        }
        else {
          foot=1;
        }
      }
    }
  }
}
