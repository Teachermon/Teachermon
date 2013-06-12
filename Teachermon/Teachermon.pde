//Teachermon
//Code Monkey - Brandon Ho
//Graphic Designer - Justin Sitler
//User Interface Designer & Quality Assurance Tester - Austin Mathew
//Project Manager - Andrew Jordan


//Various Images and declaring your player
Player student;
PImage battletext;
PImage seeplayer;
PImage player;
PImage playerhealth;
PImage enemyhealth;
PImage battlearrow;
PImage moveprompt;

//Pokemon Font
PFont Pokemonfont;

//Different Sound Bytes
AudioSample bump;
AudioSample blip;
AudioSample hurt;
AudioSample heal;
AudioSample exitappear;
AudioSample exitsound;

//Booleans for the "phases" of the game
boolean titlescreen=true;
boolean[] overworld = new boolean[4];
boolean startcredits;

//Different Music
AudioPlayer seen;
AudioPlayer seen2;
AudioPlayer battle;
AudioPlayer battle2;
AudioPlayer victory;
AudioPlayer credits;

//Makes it so that pressing enter doesn't record it 1 time per frame
int buttontimer=0;
boolean button=true;
int movechoicetimer=0;
boolean movechoice=true;

//Different moves
Moves[] move = new Moves[52];

//Enemies, [overworld#][trainer#] and their defeat messages
Enemy[][] pokemon = new Enemy[4][3];
String[][] defeatmessage = new String[4][3];

//Student moves
int[] studentmoveref = new int[4];

//Teacher moves
//pokemonmoves[overworld#][teachermon#][move#]
int[][][] pokemonmoveref = new int[4][3][4];

//Credits

String s = "Credits\n\n\n\n\n\n\n\n\n\n\n\nTEACHERMON\n\n\n\n\n\n\nProject Manager\nAndrew Jordon\n\n\n\n\n\n\n\n\n\nCode Monkey\nBrandon Ho\n\n\n\n\n\n\n\n\n\nQuality Assurance Tester\nAustin Mathew\n\n\n\n\n\n\n\n\n\nGraphic Designer\nJustin Sitler\n\n\n\n\n\n\n\n\n\nUser Interface Designer\nAustin Mathew\n\n\n\n\n\n\n\n\n\n\n\n\n\nTeachers\n\n\n\n\n\n\n\n\n\n\n\nMr. Moskowitz\n\n\n\n\n\n\n\nMr. Smolenski\n\n\n\n\n\n\n\nMrs. Lord\n\n\n\n\n\n\n\nMrs. Monroy\n\n\n\n\n\n\n\nMr. Pantaleo\n\n\n\n\n\n\n\nMrs. Kipp\n\n\n\n\n\n\n\nMr. Sanservino\n\n\n\n\n\n\n\nMr. Liu\n\n\n\n\n\n\n\nDr. Buchanan\n\n\n\n\n\n\n\nSenor Valverde\n\n\n\n\n\n\n\nDr. Jidarian\n\n\n\n\n\n\n\nDr. Fang";
//Teachers credit string
String x = "Thanks for playing!";
float i=500;
float thankyou=0;
float opac=0;
int pixel=0;
PImage BAJA;
boolean credit=true;


void setup() {

  for (int i=0; i<4; i++) {
    overworld[i]=false;
  }

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
  heal = minim.loadSample("potion.mp3", 512);
  exitappear = minim.loadSample("exitappear.mp3", 512);
  exitsound = minim.loadSample("exit.mp3", 512);

  seen = minim.loadFile("rocket.mp3");
  seen2 = minim.loadFile("galactic.mp3");
  battle = minim.loadFile("battlemusic.mp3");
  battle2 = minim.loadFile("champion.mp3");
  victory = minim.loadFile("victory.mp3");

  playerhealth = loadImage("GPAhealth.png");
  enemyhealth = loadImage("enemyhealth.png");

  movesetup();
  playermovesetup();

  //*************TITLESCREEN SETUP************

  theMov = new Movie(this, "Teachermon_Intro.mov");

  titlescreenplayer = minim.loadFile("PokemonTheme.mp3");

  theMov.play();

  clickhere=false;

  //************OVERWORLD SETUP***************
  for (int i=0; i<4; i++) {
    overworldbgm[i] = minim.loadFile("overworldbgm"+i+".mp3");
  }

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
    exit[i] = loadImage("exit"+i+".png");
    newexit[i] = false;
  }

  exit0left = loadImage("exit0left.png");
  exit0right = loadImage("exit0right.png");

  for (int i=0; i<3; i++) {
    entrance[i] = loadImage("entrance"+i+".png");
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

  //Names, seen messages, and defeat messages

  teachermonnames[0][0] = "Mr. Moskowitz";
  teachermonnames[0][1] = "Mr. Smolenski";
  teachermonnames[0][2] = "Mrs. Lord";
  teachermonnames[1][0] = "Mrs. Monroy";
  teachermonnames[1][1] = "Mr. Pantaleo";
  teachermonnames[1][2] = "Mrs. Kipp";
  teachermonnames[2][0] = "Mr. Sanservino";
  teachermonnames[2][1] = "Mr. Liu";
  teachermonnames[2][2] = "Dr. B";
  teachermonnames[3][0] = "Senor Valverde";
  teachermonnames[3][1] = "Dr. J";
  teachermonnames[3][2] = "Dr. Fang";

  fightmessage[0][0] = ". . .";
  fightmessage[0][1] = "Do you want to be on the Wall of Fame?";
  fightmessage[0][2] = "Enzymes are the answer to everything!";
  fightmessage[1][0] = "Let me teach you about the education system.";
  fightmessage[1][1] = "I was in the Navy once!";
  fightmessage[1][2] = "I'm a rules girl!";
  fightmessage[2][0] = "Clear your desks and take out a sheet of paper!";
  fightmessage[2][1] = "Hey! You can't divide by zero!";
  fightmessage[2][2] = "C'mon Bill!";
  fightmessage[3][0] = "'Eyyy, chico!";
  fightmessage[3][1] = "You've got to know this, guys!";
  fightmessage[3][2] = "This is so easy!";


  defeatmessage[0][0] = ". . . !";
  defeatmessage[0][1] = "Just like Rome, I fall!";
  defeatmessage[0][2] = "Next time, I will use college level matching!";
  defeatmessage[1][0] = "Where did you get those moves, college?";
  defeatmessage[1][1] = "Wait a minute...this is not physics!";
  defeatmessage[1][2] = "You win a case of satisfaction!";
  defeatmessage[2][0] = "That's the bell, go away!";
  defeatmessage[2][1] = "Victory is like a cup of coffee; once you drink it, it's gone!";
  defeatmessage[2][2] = "OKAYTHANKYOUGOODBYE!";
  defeatmessage[3][0] = "Ju nid tu pley by de roolz!";
  defeatmessage[3][1] = "Calculus is the train to success!";
  defeatmessage[3][2] = "Haha I tricked you!";

  //OVERWORLD 1 SPECIAL PARTS
  grasscavebottom = loadImage("walltop0.png");
  grasscavebottomright = loadImage("grasscavecornerbottomright.png");

  //OVERWORLD 2 SPECIAL PARTS
  sandbottomleft = loadImage("sandbottomleft.png");
  sandbottomright = loadImage("sandbottomright.png");

  //OVERWORLD 3 SPECIAL PARTS
  water = loadImage("waterboundary.png");

  pokemonsetup();

  //CREDITS
  credits = minim.loadFile("credits.mp3");
  BAJA = loadImage("BAJA.png");
}

void draw() {
  //If the boolean for the phase is true, the phase is run

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
  if (startcredits) {
    credits();
  }
  buttontimer();
}

//Timers such that you can hold down a button.

void buttontimer() {
  if (keyPressed && (key == ENTER || key == RETURN)) {
    button=false;
  }
  if (button==false) {
    buttontimer++;
  }
  if (buttontimer==30) {
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

