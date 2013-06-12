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
  float healthregen;

  Moves(int _power, String _name, int _selfatkchange, int _selfdefchange, int _selfspdchange, int _enemyatkchange, int _enemydefchange, int _enemyspdchange, float _healthregen) {
    power=_power;
    name=_name;
    selfatkchange = _selfatkchange;
    selfdefchange = _selfdefchange;
    selfspdchange = _selfspdchange;
    enemyatkchange = _enemyatkchange;
    enemydefchange = _enemydefchange;
    enemyspdchange = _enemyspdchange;
    healthregen = _healthregen;
    
    if (selfatkchange==0 && selfdefchange==0 && selfspdchange==0 && enemyatkchange==0 && enemydefchange==0 && enemyspdchange==0) {
      statchange=false;
    }
    else {
      statchange=true;
    }
    if(healthregen==0){
      healthchange=false;
    }
    else{
      healthchange=true;
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
  //Declaring moves for trainer and teacher. Everybody has 4 moves
  
  move[0] = new Moves(0, "Naptime", 0, -1, 0, 0, 0, 0, 75);
  move[0].effect = "Student's defense fell!";
  move[1] = new Moves(0, "Study", 2, 0, 0, 0, 0, 0, 0);
  move[1].effect = "Student's attack sharply rose!";
  move[2] = new Moves(80, "Cheat", 0, -1, 0, 0, 0, 0, 0);
  move[2].effect = "Student's defense fell!";
  move[3] = new Moves(55, "Do Homework", 0, 0, 0, 0, 0, 0, 0);

  move[4] = new Moves(0, "Extra Credit", 0, 0, 0, 1, -2, 0, 0);
  move[4].effect = "Student's defense sharply fell and attack rose!";
  move[5] = new Moves(60, "Lab", 0, 0, 1, 0, 0, 0, 0);
  move[5].effect = "Mr. Moskowitz's speed rose!";
  move[6] = new Moves(30, "Rock Identification", 0, 1, 0, 0, 0, 0, 0);
  move[6].effect = "Mr. Moskowitz's defense rose!";
  move[7] = new Moves(70, "Meteorology", 0, 0, 0, 0, 0, 0, 0);
  
  move[8] = new Moves(75, "IDs", 0, 0, 0, 0, 0, 0, 0);
  move[9] = new Moves(10, "Wall Grab", 1, 0, 0, 0, 0, 0, 0);
  move[9].effect = "Mr. Smolenski's attack rose!";
  move[10] = new Moves(0, "Chug Water", 0, 1, 0, 0, 0, 0, 25);
  move[10].effect = "Mr. Smolenski's defense rose!";
  move[11] = new Moves(90, "Admin Promotion", 0, 0, -1, 0, 0, 0, 0);
  move[11].effect = "Mr. Smolenski's speed fell!";
  
  move[12] = new Moves(40, "Shark Dissection", 0, 0, 0, 0, -1, 0, 0);
  move[12].effect = "Student's defense fell!";
  move[13] = new Moves(70, "Enzyme Smash", 0, 0, 0, 0, 0, 0, 0);
  move[14] = new Moves(0, "College-Level Coloring", 1, 0, 1, 0, 0, 0, 0);
  move[14].effect = "Mrs. Lord's attack and speed rose!";
  move[15] = new Moves(20, "Cell Model", 0, 0, 0, 0, 0, -1, 0);
  move[15].effect = "Student's speed fell!";
  
  move[16] = new Moves(0, "Big Gulp", 0, 0, 0, 0, 0, 0, 50);
  move[17] = new Moves(35, "Food Lab", 0, 0, 0, 0, -1, 0, 0);
  move[17].effect = "Student's defense fell!";
  move[18] = new Moves(60, "Lewis Structures Test", 0, 0, 0, 0, 0, 0, 0);
  move[19] = new Moves(75, "Beaker Bash", 0, -1, 0, 0, 0, 0, 0);
  move[19].effect = "Mrs. Monroy's defense fell!";
  
  move[20] = new Moves(45, "Car Project", 0, 0, 0, 0, 0, -1, 0);
  move[20].effect = "Student's speed fell!";
  move[21] = new Moves(75, "Multiple Choice Test", 0, 0, 0, 0, 0, 0, 0);
  move[22] = new Moves(90, "Capacitor Crush", 0, 0, -1, 0, 0, 0, 0);
  move[22].effect = "Mr. Pantaleo's speed fell!";
  move[23] = new Moves(0, "Dimensional Analysis", 1, 1, 0, 0, 0, 0, 0);
  move[23].effect = "Mr. Pantaleo's attack and defense rose!";
  
  move[24] = new Moves(60, "ADDA Quiz", 0, 0, 1, 0, 0, 0, 0);
  move[24].effect = "Mrs. Kipp's speed rose!";
  move[25] = new Moves(120, "Chair project", -1, -1, 0, 0, 0, 0, 0);
  move[25].effect = "Mrs. Kipp's attack and defense fell!";
  move[26] = new Moves(0, "Read Packets", -1, 0, 0, 0, 0, 0, 25);
  move[26].effect = "Mrs. Kipp's attack fell!";
  move[27] = new Moves(85, "AutoCAD Video", 0, 0, 0, 0, 0, 0, 0);
  
  move[28] = new Moves(105, "Pop Quiz", 0, 0, 0, 0, 0, 0, 0);
  move[29] = new Moves(130, "Impossible Test", 0, -1, 0, 0, 0, 0, 0);
  move[29].effect = "Mr. Sanservino's defense fell!";
  move[30] = new Moves(60, "Timeline", 0, 0, 0, 0, 0, -1, 0);
  move[30].effect = "Student's speed fell!";
  move[31] = new Moves(0, "Current Events", 0, 0, 0, 0, 0, 0, 25);
  
  move[32] = new Moves(0, "Curve", -1, 0, 0, 0, 0, 0, 50);
  move[32].effect = "Mr. Liu's attack fell!";
  move[33] = new Moves(55, "Anecdote", 1, 0, 0, 0, 0, 0, 0);
  move[33].effect = "Mr. Liu's attack rose!";
  move[34] = new Moves(85, "Discovery Quiz", 0, 0, 0, 0, 0, 0, 0);
  move[35] = new Moves(100, "Derivatives Test", 0, -1, 0, 0, 0, 0, 0);
  move[35].effect = "Mr. Liu's defense fell!";
  
  move[36] = new Moves(85, "Titration", 0, 0, 0, 0, 0, 0, 0);
  move[37] = new Moves(130, "Reactions Test", -1, 0, 0, 0, 0, 0, 0);
  move[37].effect = "Dr. B's attack fell!";
  move[38] = new Moves(65, "Marker Throw", 0, 0, 1, 0, 0, 0, 0);
  move[38].effect = "Dr. B's speed rose!";
  move[39] = new Moves(0, "Powerpoint", 0, 0, 0, 0, -1, -1, 0);
  move[39].effect = "Student's defense and speed fell!";
  
  move[40] = new Moves(60, "Spanish Video", 0, 0, 0, 0, 1, 0, 0);
  move[40].effect = "Student's defense rose!";
  move[41] = new Moves(45, "Vocabulary", 0, 0, 0, 0, 0, 0, 0);
  move[42] = new Moves(100, "Subjunctive Test", -1, 0, 0, 0, 0, 0, 0);
  move[42].effect = "Senor Valverde's attack fell!";
  move[43] = new Moves(80, "Accents Quiz", 0, 0, 0, 0, 0, 0, 0);
  
  move[44] = new Moves(65, "Integration By Parts", 0, 0, 0, 0, 0, 0, 0);
  move[45] = new Moves(30, "Tent Project", 1, 0, 0, 0, 0, 0, 0);
  move[45].effect = "Dr. J's attack rose!";
  move[46] = new Moves(95, "Riemann Sums", 0, -1, 0, 0, 0, 0, 0);
  move[46].effect = "Dr. J's defense fell!";
  move[47] = new Moves(75, "Shell Method", -1, 1, 0, 0, 0, 0, 0);
  move[47].effect = "Dr. J's attack fell and defense rose!";
  
  move[48] = new Moves(0, "Distractor", 1, 0, 0, 0, 0, 0, 10);
  move[48].effect = "Dr. Fang's attack rose!";
  move[49] = new Moves(55, "Lab Report", 0, 0, 0, -1, 0, 0, 0);
  move[49].effect = "Student's attack fell!";
  move[50] = new Moves(45, "Quick Quiz", 0, 0, 1, 0, 0, 0, 0);
  move[50].effect = "Dr. Fang's speed rose!";
  move[51] = new Moves(80, "Simple Harmonic Motion", 0, 0, 0, 0, 0, 0, 0);
}

void playermovesetup() {
  //Students/teachers have a "moveref" # to be used in the battle phase
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

