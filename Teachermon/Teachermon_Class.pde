class Enemy {
  int level;
  int totalhealth;
  float health;
  int healthchange; //Used in calculating health loss
  float losthealth; //Used in calculating health loss
  int baseattack;
  int attack;
  int attackmod; //Value from -6 to 6 to determine final attack
  int basedefense;
  int defense;
  int defensemod; //Same as attack mod
  int basespeed;
  int speed;
  int speedmod; // Same as attack mod

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
  //Stats of the teachers
  
  pokemon[0][0] = new Enemy(20, 70, 82, 59, 51);
  pokemon[0][1] = new Enemy(20, 75, 90, 70, 120);
  pokemon[0][2] = new Enemy(20, 110, 95, 78, 80);
  
  pokemon[1][0] = new Enemy(20, 125, 125, 130, 75);
  pokemon[1][1] = new Enemy(20, 105, 130, 95, 103);
  pokemon[1][2] = new Enemy(20, 90, 178, 63, 124);
  
  pokemon[2][0] = new Enemy(20, 120, 244, 98, 201);
  pokemon[2][1] = new Enemy(20, 135, 122, 136, 178);
  pokemon[2][2] = new Enemy(20, 155, 165, 169, 135);
  
  pokemon[3][0] = new Enemy(20, 210, 157, 204, 120);
  pokemon[3][1] = new Enemy(20, 163, 204, 170, 168);
  pokemon[3][2] = new Enemy(20, 190, 263, 177, 194);
}

