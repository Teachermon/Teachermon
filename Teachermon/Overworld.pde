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

int overworldopacity = 255;

String[][] fightmessage = new String[4][3];
String[][] teachermonnames = new String [4][3];

AudioPlayer[] overworldbgm = new AudioPlayer[4];
boolean[] bgm = new boolean[4];



void overworld(int a) {
  if (bgm[a]==false) {
    bgm[a]=true;
    overworldbgm[a].play();
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

  student.display();
  if (trainer[a][0].spotted == false && trainer[a][1].spotted == false && trainer[a][2].spotted == false) {
    student.move(a);
  }

  for (int j=0; j<3; j++) {
    trainer[a][j].move();
  }

  fill(0, overworldopacity);
  rect(0, 0, width, height);
  if (overworldopacity>0) {
    overworldopacity-=5;
  }
}

