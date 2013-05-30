class Moves {
  int power;
  String name;
  String effect;
  String effect1;
  String effect2;
  int selfatkchange;
  int selfdefchange;
  int selfspdchange;
  int enemyatkchange;
  int enemydefchange;
  int enemyspdchange;
  boolean healthchange;
  boolean statchange;

  Moves(int _power, String _name, int _selfatkchange, int _selfdefchange, int _selfspdchange, int _enemyatkchange, int _enemydefchange, int _enemyspdchange, boolean _healthchange) {
    power=_power;
    name=_name;
    selfatkchange = _selfatkchange;
    selfdefchange = _selfdefchange;
    selfspdchange = _selfspdchange;
    enemyatkchange = _enemyatkchange;
    enemydefchange = _enemydefchange;
    enemyspdchange = _enemyspdchange;
    healthchange = _healthchange;
    if (selfatkchange==0 && selfdefchange==0 && selfspdchange==0 && enemyatkchange==0 && enemydefchange==0 && enemyspdchange==0) {
      statchange=false;
    }
    else {
      statchange=true;
    }
    if (healthchange) {
      effect2 = "Some HP was recovered!";
    }
    else {
      effect2 = "";
    }
  }
}

void movesetup() {
  for (int i=0; i<move.length; i++) {
    move[i]=new Moves(250*i, "move"+i, 0, 0, 0, 0, 0, 0, false);
  }
  move[0].healthchange=true;
  move[0].effect2="Some HP was recovered!";
}

void playermovesetup() {
  for (int i=0; i<4; i++) {
    studentmoveref[i]=i;
  }
  for (int i=0; i<4; i++) {
    for (int j=0; j<3; j++) {
      for ( int k=0; k<4; k++) {
        pokemonmoveref[i][j][k]=(12*i+4*j+k+4);
      }
    }
  }
}

