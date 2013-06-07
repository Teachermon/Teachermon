boolean[][] trainerfight = new boolean[4][3];
overworldtrainer[][] trainer = new overworldtrainer[4][3];

PImage[][] overworldtrainer = new PImage[4][3];
PImage[][] overworldtrainerfoot1 = new PImage[4][3];
PImage[][] overworldtrainerfoot2 = new PImage[4][3];

PImage[][] trainersprite = new PImage[4][3];

PImage[] ground = new PImage[4];
PImage[] walll = new PImage[4];
PImage[] wallr = new PImage[4];
PImage[] wallu = new PImage[4];
PImage[] walld = new PImage[4];
PImage[] walltopleft = new PImage[4];
PImage[] walltopright = new PImage[4];
PImage[] battlebackgroundtop = new PImage[4];
PImage[] battlebackgroundbottom = new PImage[4];
PImage[] entrance = new PImage[3];
PImage[] exit = new PImage[4];
PImage exit0left;
PImage exit0right;

//FOR OVERWORLD 1
PImage grasscavebottom;
PImage grasscavebottomright;

//FOR OVERWORLD 2
PImage sandbottomleft;
PImage sandbottomright;

int overworldopacity = 255;

String[][] fightmessage = new String[4][3];
String[][] teachermonnames = new String [4][3];

AudioPlayer[] overworldbgm = new AudioPlayer[4];
boolean[] bgm = new boolean[4];
boolean[] newexit = new boolean[4];



void overworld(int a) {
  if (bgm[a]==false) {
    bgm[a]=true;
    overworldbgm[a].play();
  }
  if (newexit[a]==false && pokemon[a][0].defeated && pokemon[a][1].defeated && pokemon[a][2].defeated) {
    exitappear.trigger();
    newexit[a]=true;
  }

  fill(255, 0, 0);

  //*********WALLS***********
  for (int j=1; j<width/25-1; j++) {
    for (int k=1; k<height/25-1; k++) {
      image(ground[a], j*25, k*25, 25, 25);
    }
  }
  for (int j=1; j<height/25-1; j++) {
    image(walll[a], 0, j*25, 25, 25);
    image(wallr[a], width-25, j*25, 25, 25);
  }
  for (int j=1; j<width/25-1; j++) {
    image(wallu[a], j*25, 0, 25, 25);
  }
  for (int j=0; j<width/25; j++) {
    image(walld[a], j*25, height-25, 25, 25);
  }
  image(walltopleft[a], 0, 0, 25, 25);
  image(walltopright[a], width-25, 0, 25, 25); 

  fill(255);

  if (a==0 && pokemon[a][0].defeated==true && pokemon[a][1].defeated==true && pokemon[a][2].defeated==true) {
    image(exit[a], width-75, height-25, 25, 25);
    image(exit0left, width-100, height-25, 25, 25);
    image(exit0right, width-50, height-25, 25, 25);
  }

  if (a==1) {
    image(grasscavebottom, 0, 0, 25, 25);
    image(entrance[0], 25, 0, 25, 25);
    image(grasscavebottomright, 50, 0, 25, 25);
    if (pokemon[a][0].defeated==true && pokemon[a][1].defeated==true && pokemon[a][2].defeated==true) {
      image(ground[a], width-75, height-25, 25, 25);
    }
  }

  if (a==2) {
    image(entrance[1], 25, 0, 25, 25);
    image(sandbottomleft, 0, height-25, 25, 25);
    image(sandbottomright, width-25, height-25, 25, 25);
  }

  student.display();
  student.stats(a);

  if (trainer[a][0].spotted == false && trainer[a][1].spotted == false && trainer[a][2].spotted == false) {
    student.move(a);
  }

  for (int j=0; j<3; j++) {
    trainer[a][j].move();
  }

  fill(0, overworldopacity);
  rect(0, 0, width, height);
  if ((student.y>=351 && student.moved) || (student.y<=24 && student.moveu)) {
    overworldopacity+=17;
    if (overworldopacity==255) {
      bgm[a]=false;
      overworldbgm[a].close();
      overworldbgm[a] = minim.loadFile("overworldbgm"+a+".mp3");
      overworld[a]=false;
      if (student.y>351) {
        overworld[a+1]=true;
        student.x=25;
        student.y=0;
        student.moved=true;
        student.moving=true;
        student.movetimer=0;
      }
      if (student.y<25 && a>=1) {
        overworld[a-1]=true;
        student.x=width-75;
        student.y=height-25;
        student.moveu=true;
        student.moving=true;
        student.movetimer=0;
      }
    }
    if (student.y==352 || student.y==23) {
      exitsound.trigger();
    }
  }
  else if (overworldopacity>0) {
    overworldopacity-=17;
  }
}

