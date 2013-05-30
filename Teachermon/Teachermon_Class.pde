class Enemy {
  int level;
  int totalhealth=100;
  float health=100;
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

  Enemy() {
  }
}

void pokemonsetup() {
  for (int i=0; i<4; i++) {
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

