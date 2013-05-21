Player student;
PImage ground;
PImage walll;
PImage wallr;
PImage wallu;
PImage walld;
PImage walltopleft;
PImage walltopright;

boolean titlescreen=false;
boolean overworld1=true;

void setup() {

  //**********BASIC SETUP************
  size(700, 400);
  student = new Player();
  ground = loadImage("floor.png");
  walll = loadImage("wallleft.png");
  wallr = loadImage("wallright.png");
  wallu = loadImage("walltop.png");
  walld = loadImage("wallbottom.png");
  walltopleft = loadImage("cornertopleft.png");
  walltopright = loadImage("cornertopright.png");

  //*************TITLESCREEN SETUP************

  theMov = new Movie(this, "Teachermon_Intro.mov");

  minim = new Minim(this);
  titlescreenplayer = minim.loadFile("PokemonTheme.mp3");

  theMov.play();

  clickhere=false;

  //************OVERWORLD 1 SETUP***************
  for (int i=0; i<trainerfight1.length; i++) {
    trainerfight1[i]=false;
  }
  for (int i=0; i<overworld1trainer.length; i++) {
    overworld1trainer[i] = loadImage("overworld1trainer"+(i+1)+".png");
    overworld1trainerfoot1[i] = loadImage("overworld1trainer"+(i+1)+"down1.png");
    overworld1trainerfoot2[i] = loadImage("overworld1trainer"+(i+1)+"down2.png");
  }
  for (int i=0; i<trainer1.length; i++) {
    trainer1[i] = new overworld1trainer(i);
  }
  fightmessage1[0] = "Prepare for battle!";
  fightmessage1[1] = "AHHH";
  fightmessage1[2] = "APOFIJASDof";
}

void draw() {
  if (titlescreen) {
    titlescreen();
  }
  if (overworld1) {
    overworld1();
  }
}

