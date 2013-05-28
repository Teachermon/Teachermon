Player student;
PImage battletext;
PImage seeplayer;
PImage player;
PImage playerhealth;
PImage enemyhealth;
PImage battlearrow;
PImage moveprompt;

PFont Pokemonfont;

AudioSample bump;
AudioSample blip;
AudioSample hurt;

boolean titlescreen=true;
boolean[] overworld = new boolean[4];

AudioPlayer seen;
AudioPlayer battle;

int buttontimer=0;
boolean button=true;
int movechoicetimer=0;
boolean movechoice=true;

Moves[] move = new Moves[52];

Enemy[][] pokemon = new Enemy[4][3];

//Student moves
int[] studentmoveref = new int[4];

//Teacher moves
//pokemonmoves[overworld#][teachermon#][move#]
int[][][] pokemonmoveref = new int[4][3][4];

void setup() {

  //**********BASIC SETUP************

  size(700, 400);
  student = new Player();

  battletext = loadImage("battlescreen.png");
  seeplayer = loadImage("exclamationpoint.png");
  player = loadImage("trainerbacksprite.png");
  battlearrow = loadImage("battlearrow.png");
  moveprompt = loadImage("moveprompt.png");

  Pokemonfont = loadFont ("Power_Green-48.vlw");
  textFont(Pokemonfont);

  minim = new Minim(this);

  bump = minim.loadSample("bump.mp3", 512);
  blip = minim.loadSample("blip.mp3", 512);
  hurt = minim.loadSample("hitsound.mp3", 512);

  seen = minim.loadFile("rocket.mp3");
  battle = minim.loadFile("battlemusic.mp3");

  playerhealth = loadImage("GPAhealth2.png");
  enemyhealth = loadImage("enemyhealth.png");

  movesetup();
  playermovesetup();

  for (int i=0; i<4; i++) {
    overworld[i]=false;
  }

  //*************TITLESCREEN SETUP************

  theMov = new Movie(this, "Teachermon_Intro.mov");

  titlescreenplayer = minim.loadFile("PokemonTheme.mp3");

  theMov.play();

  clickhere=false;

  //************OVERWORLD SETUP***************
  overworldbgm[0] = minim.loadFile("cave.mp3");

  for (int i=0; i<4; i++) {
    ground[i] = loadImage("floor"+i+".png");
    walll[i] = loadImage("wallleft"+i+".png");
    wallr[i] = loadImage("wallright"+i+".png");
    wallu[i] = loadImage("walltop"+i+".png");
    walld[i] = loadImage("wallbottom"+i+".png");
    walltopleft[i] = loadImage("cornertopleft"+i+".png");
    walltopright[i] = loadImage("cornertopright"+i+".png");
    battlebackgroundtop[i] = loadImage("battlebackgroundtop"+i+".png");
    battlebackgroundbottom[i] = loadImage("battlebackgroundbottom"+i+".png");
  }

  for (int i=0; i<4; i++) {
    for (int j=0; j<3; j++) {
      trainerfight[i][j]=false;
    }
  }
  for (int i=0; i<4; i++) {
    for (int j=0; j<3; j++) {
      overworldtrainer[i][j] = loadImage("overworldtrainer"+i+""+j+".png");
      overworldtrainerfoot1[i][j] = loadImage("overworldtrainer"+i+""+j+"down1.png");
      overworldtrainerfoot2[i][j] = loadImage("overworldtrainer"+i+""+j+"down2.png");
    }
  }
  for (int i=0; i<4; i++) {
    for (int j=0; j<3; j++) {
      trainer[i][j] = new overworldtrainer(i, j);
    }
  }
  for (int i=0; i<4; i++) {
    for (int j=0; j<3; j++) {
      trainersprite[i][j] = loadImage("trainersprite"+i+""+j+".png");
    }
  }

  fightmessage[0][0] = ". . .";
  fightmessage[0][1] = "Do you want to be on the Wall of Fame?";
  fightmessage[0][2] = "You'll be dazzled by my glorious biceps!";
  teachermonnames[0][0] = "Mr. Moskowitz";
  teachermonnames[0][1] = "Mr. Smolenski";
  teachermonnames[0][2] = "Mrs. Lord";

  for (int i=0; i<4; i++) {
    for (int j=0; j<3; j++) {
      pokemon[i][j] = new Enemy();
    }
  }
  pokemonsetup();
}

void draw() {
  if (titlescreen) {
    titlescreen();
  }
  for (int s=0; s<4; s++) {
    if (overworld[s]) {
      overworld(s);
    }
  }
  for (int i=0; i<4; i++) {
    for (int j=0; j<3; j++) {
      if (trainer[i][j].battlestart==true) {
        battle(i, j);
        movechoicetimer();
      }
    }
  }
  buttontimer();
}

void buttontimer() {
  if (keyPressed && (key == ENTER || key == RETURN)) {
    button=false;
  }
  if (button==false) {
    buttontimer++;
  }
  if (buttontimer==120) {
    button=true;
    buttontimer=0;
  }
}

void movechoicetimer() {
  if (keyPressed && (key == 'w' || key == 'a' || key == 's' || key == 'd')) {
    movechoice=false;
  }
  if (movechoice==false) {
    movechoicetimer++;
  }
  if (movechoicetimer==10) {
    movechoice=true;
    movechoicetimer=0;
  }
}

