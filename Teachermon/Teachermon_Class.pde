class Enemy {
  int level;
  int totalhealth;
  float health;
  int healthchange;
  float losthealth;
  int baseattack;
  int attack;
  int attackmod; //Value from -6 to 6 to determine final attack
  int basedefense;
  int defense;
  int defensemod;
  int basespeed;
  int speed;
  int speedmod;

  float movecounter;
  boolean usemove=false;
  boolean losinghealth=false;
  boolean defeated=false;

  Enemy(int _level, int _totalhealth, int _baseattack, int _basedefense, int _basespeed) {
    level = _level;
    totalhealth = _totalhealth;
    health = _totalhealth;
    baseattack = _baseattack;
    basedefense = _basedefense;
    basespeed = _basespeed;
    attackmod=0;
    defensemod=0;
    speedmod=0;
  }
}

void pokemonsetup() {

  pokemon[0][0] = new Enemy(20, 70, 82, 59, 51);
  pokemon[0][1] = new Enemy(20, 75, 90, 70, 120);
  pokemon[0][2] = new Enemy(20, 110, 95, 78, 80);
  
  pokemon[1][0] = new Enemy(20, 125, 125, 130, 75);
  pokemon[1][1] = new Enemy(20, 105, 130, 95, 103);
  pokemon[1][2] = new Enemy(20, 90, 178, 63, 124);
  
  for (int i=2; i<4; i++) {
    for (int j=0; j<3; j++) {
      pokemon[i][j] = new Enemy(0, 0, 0, 0, 0);
    }
  }

  for (int i=2; i<4; i++) {
    for (int j=0; j<3; j++) {
      pokemon[i][j].totalhealth=100;
      pokemon[i][j].health=100;
      pokemon[i][j].baseattack=5;
      pokemon[i][j].attackmod=0;
      pokemon[i][j].basespeed=10;
      pokemon[i][j].speedmod=0;
      pokemon[i][j].basedefense=50;
      pokemon[i][j].defensemod=0;
      pokemon[i][j].level=100;
    }
  }
}

