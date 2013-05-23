Player student;
PImage battletext;
PImage seeplayer;
PImage player;

PFont Pokemonfont;

boolean titlescreen=false;
boolean overworld1=true;

void setup() {

  //**********BASIC SETUP************
  size(700, 400);
  student = new Player();
  battletext = loadImage("battlescreen.png");
  seeplayer = loadImage("exclamationpoint.png");
  player = loadImage("trainerbacksprite.png");
  Pokemonfont = loadFont ("Power_Green-48.vlw");
  textFont(Pokemonfont);

  //*************TITLESCREEN SETUP************

  theMov = new Movie(this, "Teachermon_Intro.mov");

  minim = new Minim(this);
  titlescreenplayer = minim.loadFile("PokemonTheme.mp3");

  theMov.play();

  clickhere=false;

  //************OVERWORLD 1 SETUP***************
  ground = loadImage("floor.png");
  walll = loadImage("wallleft.png");
  wallr = loadImage("wallright.png");
  wallu = loadImage("walltop.png");
  walld = loadImage("wallbottom.png");
  walltopleft = loadImage("cornertopleft.png");
  walltopright = loadImage("cornertopright.png");
  battlebackground1top = loadImage("cavebattlebackgroundtop.png");
  battlebackground1bottom = loadImage("cavebattlebackgroundbottom.png");
  
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
  for (int i=0; i<trainer1sprite.length; i++){
    trainer1sprite[i] = loadImage("trainer1sprite"+(i+1)+".png");
  }
  
  fightmessage1[0] = ". . .";
  fightmessage1[1] = "Do you want to be on the Wall of Fame?";
  fightmessage1[2] = "You'll be dazzled by my glorious biceps!";
  teachermonnames1[0] = "Mr. Moskowitz";
  teachermonnames1[1] = "Mr. Smolenski";
  teachermonnames1[2] = "Mrs. Lord";
}

void draw() {
  if (titlescreen) {
    titlescreen();
  }
  if (overworld1) {
    overworld1();
  }
  for(int i=0; i<trainer1.length; i++){
    if(trainer1[i].battlestart==true){
      battle1(i);
    }
  }
}

