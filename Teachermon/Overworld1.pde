boolean[] trainerfight1 = new boolean[3];

overworld1trainer[] trainer1 = new overworld1trainer[3];

PImage[] overworld1trainer = new PImage[3];
PImage[] overworld1trainerfoot1 = new PImage[3];
PImage[] overworld1trainerfoot2 = new PImage[3];

PImage[] trainer1sprite = new PImage[3];

PImage ground;
PImage walll;
PImage wallr;
PImage wallu;
PImage walld;
PImage walltopleft;
PImage walltopright;
PImage battlebackground1top;
PImage battlebackground1bottom;

int overworldopacity=255;

String[] fightmessage1 = new String[3];
String[] teachermonnames1 = new String[3];

AudioPlayer overworld1bgm;

boolean bgm1=false;

void overworld1() {
  if(bgm1==false){
    bgm1=true;
    overworld1bgm.play();
  }
  fill(255, 0, 0);
  //*******WALLS********
  for (int i=1; i<width/25-1; i++) {
    for (int j=1; j<height/25-1; j++) {
      image(ground, i*25, j*25, 25, 25);
    }
  }
  for (int i=1; i<height/25-1; i++) {
    image(walll, 0, i*25, 25, 25);
    image(wallr, width-25, i*25, 25, 25);
  }
  for (int i=1; i<width/25-1; i++) {
    image(wallu, i*25, 0, 25, 25);
  }
  for (int i=0; i<width/25; i++) {
    image(walld, i*25, height-25, 25, 25);
  }
  image(walltopleft, 0, 0, 25, 25);
  image(walltopright, width-25, 0, 25, 25);  

  fill(255);

  student.display();
  if (trainer1[0].spotted==false && trainer1[1].spotted==false && trainer1[2].spotted==false) {
    student.move1();
  }

  for (int i=0; i<trainer1.length; i++) {
    trainer1[i].move();
  }

  fill(0, overworldopacity);
  rect(0, 0, width, height);
  if (overworldopacity>0) {
    overworldopacity-=5;
  }
}

