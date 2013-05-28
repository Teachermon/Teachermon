int rectx=0;
int healthx=300;
float healthy=2;
float healthychange=0;
float backgroundx=1600;
int battlearrowx;
int battlearrowy;
boolean battlearrowpositionx=true;
boolean battlearrowpositiony=true;
int movechosen;
boolean attackphase=true;
boolean statphase=false;
boolean healthphase=false;
boolean changingstats=false;
int turn;
int randommove;
boolean studenthurt=false;
boolean enemyhurt=false;
boolean doneflashing=false;
int flashtimer=0;

void battle(int i, int j) {
  statmodifiers(i, j);

  fill(0);
  rect(0, 0, rectx, height);
  if (rectx==0) {
    battle.play();
  }
  if (rectx<width+100) {
    rectx+=9;
  }
  if (rectx==floor(width/9)*9+99) {
    trainer[i][j].fighting=true;
    trainer[i][j].inbattletalking=true;
    rectx+=9;
  }
  if (trainer[i][j].fighting==true) {
    if (backgroundx>0) {
      backgroundx-=20;
    }
    image(battlebackgroundtop[i], -backgroundx, 0, width, 3*height/8);
    image(battlebackgroundbottom[i], backgroundx, 3*height/8, width, 3*height/8);
    if (enemyhurt==false) {
      image(trainersprite[i][j], 480-backgroundx, 35, 64*1.6, 92*1.6);
    }
    if (studenthurt==false) {
      image(player, 100+backgroundx, 125, 54*2.5, 70*2.5);
    }
    image(battletext, 0, 3*height/4, width, height/4);

    //HEALTH BAR
    fill(100);
    rect(width-playerhealth.width+86+healthx, 3*height/4-playerhealth.height+29+healthy, 96, 6);
    rect(78+15-healthx, 34+15+healthy, 96, 6);

    healthbarfill(student.health, student.totalhealth);
    rect(width-playerhealth.width+86+healthx, 3*height/4-playerhealth.height+29+healthy, 96*student.health/student.totalhealth, 6);

    healthbarfill(pokemon[i][j].health, pokemon[i][j].totalhealth);
    rect(78+15-healthx, 34+15+healthy, 96*pokemon[i][j].health/pokemon[i][j].totalhealth, 6);

    image(playerhealth, width-playerhealth.width-10+healthx, 3*height/4-playerhealth.height-5+healthy, playerhealth.width, playerhealth.height);
    image(enemyhealth, 15-healthx, 15+healthy, enemyhealth.width, enemyhealth.height);
    //Teachermon Name
    fill(0);
    textSize(20);
    text(teachermonnames[i][j], 25-healthx, 25+healthy, enemyhealth.width, enemyhealth.height);

    if (healthx==0 && healthy>=2) {
      healthychange=-.1;
    }
    if (healthx==0 && healthy<=-2) {
      healthychange=.1;
    }
    healthy+=healthychange;

    fill(255);
    textSize(30);
    if (trainer[i][j].inbattletalking==true) {
      text(teachermonnames[i][j] + " wants to battle!", width/16, 13*height/16, 15*width/16, 3*height/16);
      if (keyPressed && button && (key == ENTER || key == RETURN) && backgroundx==0) {
        trainer[i][j].inbattletalking=false;
        blip.trigger();
        student.whatmove=true;
      }
    }
    if (student.whatmove) {
      if (healthx>0) {
        healthx-=15;
      }
      if (healthx==0) {
        image(moveprompt, 0, 3*height/4, width, height/4);
        fill(0);
        text(move[studentmoveref[0]].name, 55, 3*height/4+20, width/2-30, height/4-25);
        text(move[studentmoveref[1]].name, 55, 7*height/8+5, width/2-30, height/8);
        text(move[studentmoveref[2]].name, 3*width/8+25, 3*height/4+20, width/2, height/4-25);
        text(move[studentmoveref[3]].name, 3*width/8+25, 7*height/8+5, width/2, height/8);
        image(battlearrow, battlearrowx, battlearrowy);
        if (move[studentmoveref[movechosen]].power==0) {
          text("POW: --", 3*width/4 + 5, 3*height/4 + 3*moveprompt.height/8-10, width/4-25, moveprompt.height/4);
        } else {
          text("POW: " + move[studentmoveref[movechosen]].power, 3*width/4 + 5, 3*height/4 + 3*moveprompt.height/8-10, width/4-25, moveprompt.height/4);
        }

        if (battlearrowpositionx) {
          battlearrowx=35;
          if (battlearrowpositiony) {
            movechosen=0;
          } else {
            movechosen=1;
          }
        }
        if (battlearrowpositiony) {
          battlearrowy=3*height/4+20;
        }
        if (battlearrowpositiony==false) {
          battlearrowy=7*height/8+5;
        }
        if (battlearrowpositionx==false) {
          battlearrowx=3*width/8+5;
          if (battlearrowpositiony) {
            movechosen=2;
          } else {
            movechosen=3;
          }
        }
        if (keyPressed && (key == 'w' || key == 's') && movechoice) {
          if (battlearrowpositiony) {
            battlearrowpositiony=false;
          } else {
            battlearrowpositiony=true;
          }
          blip.trigger();
        }
        if (keyPressed && (key == 'a' || key == 'd') && movechoice) {
          if (battlearrowpositionx) {
            battlearrowpositionx=false;
          } else {
            battlearrowpositionx=true;
          }
          blip.trigger();
        }
        if (keyPressed && (key == ENTER || key == RETURN)) {
          student.whatmove=false;
          blip.trigger();
          if (student.speed>=pokemon[i][j].speed) {
            student.usemove=true;
          } else {
            pokemon[i][j].usemove=true;
          }
        }
      }
    }


    //BATTLE MATHEMATICS


    if (student.usemove) {
      textSize(35);
      if (keyPressed && button && (key == ENTER || key == RETURN) && move[studentmoveref[movechosen]].power==0) {
        attackphase=false;
        if (move[studentmoveref[movechosen]].statchange==true) {
          statphase=true;
        } else {
          healthphase=true;
        }
      }
      if (attackphase=true) {
        text("Student used " + move[studentmoveref[movechosen]].name, width/16, 13*height/16, 15*width/16, 3*height/16);
        if (doneflashing==false) {
          if (flashtimer<30) {
            flashtimer++;
          }
          if(flashtimer==1){
            hurt.trigger();
          }
          if ((10>flashtimer && flashtimer>5) || (20>flashtimer && flashtimer>15) || (30>flashtimer && flashtimer>25)){
            enemyhurt=true;
          } else {
            enemyhurt=false;
          }
          if (flashtimer==30) {
            doneflashing=true;
            flashtimer=0;
          }
        }
        if (move[studentmoveref[movechosen]].power>0 && pokemon[i][j].losinghealth==false && doneflashing==true) {
          pokemon[i][j].healthchange=round((2*student.level+10)*student.attack*move[studentmoveref[movechosen]].power/(250*pokemon[i][j].defense+2)*random(.9,1));
          pokemon[i][j].losinghealth=true;
        }
        if (pokemon[i][j].losinghealth==true && pokemon[i][j].losthealth<pokemon[i][j].healthchange) {
          pokemon[i][j].health-=.33;
          pokemon[i][j].losthealth+=.33;
          if (pokemon[i][j].health<=0) {
            pokemon[i][j].defeated=true;
            student.usemove=false;
          }
        }
        if (pokemon[i][j].losinghealth==true && pokemon[i][j].losthealth>=pokemon[i][j].healthchange && keyPressed && (key == ENTER || key == RETURN) && button) {
          blip.trigger();
          pokemon[i][j].losinghealth=false;
          pokemon[i][j].losthealth=0;
          pokemon[i][j].healthchange=0;
          doneflashing=false;
          if (move[studentmoveref[movechosen]].statchange==true) {
            statphase=true;
            attackphase=false;
            changingstats=true;
            healthphase=false;
          }
          if (move[studentmoveref[movechosen]].statchange==false && move[studentmoveref[movechosen]].healthchange==true) {
            attackphase=false;
            statphase=false;
            changingstats=false;
            healthphase=true;
          }
          if (move[studentmoveref[movechosen]].statchange==false && move[studentmoveref[movechosen]].healthchange==false) {
            turn++;
            student.usemove=false;
            if (turn==1) {
              pokemon[i][j].usemove=true;
            }
            if (turn==2) {
              turn=0;
              student.whatmove=true;
            }
          }
        }
      }
      if (statphase==true) {
        text(move[studentmoveref[movechosen]].effect, width/16, 13*height/16, 15*width/16, 3*height/16);
        if (changingstats==true) {
          changingstats=false;
          student.attackmod+=move[studentmoveref[movechosen]].selfatkchange;
          student.defensemod+=move[studentmoveref[movechosen]].selfdefchange;
          student.speedmod+=move[studentmoveref[movechosen]].selfspdchange;
          pokemon[i][j].attackmod+=move[studentmoveref[movechosen]].enemyatkchange;
          pokemon[i][j].defensemod+=move[studentmoveref[movechosen]].enemydefchange;
          pokemon[i][j].speedmod+=move[studentmoveref[movechosen]].enemyspdchange;
        }
        if (keyPressed && button && (key == ENTER || key == RETURN)) {
          blip.trigger();
          if (move[studentmoveref[movechosen]].healthchange==true) {
            statphase=false;
            healthphase=true;
          }
          if (move[studentmoveref[movechosen]].healthchange==false) {
            turn++;
            if (turn==1) {
              statphase=false;
              attackphase=true;
              student.usemove=false;
              pokemon[i][j].usemove=true;
            }
            if (turn==2) {
              turn=0;
              statphase=false;
              attackphase=true;
              student.whatmove=true;
            }
          }
        }
      }
      if (healthphase==true) {
        text(move[studentmoveref[movechosen]].effect2, width/16, 13*height/16, 15*width/16, 3*height/16);
        if (student.losinghealth==false) {
          student.healthchange=student.totalhealth/2;
          student.losinghealth=true;
        }
        if (student.losinghealth==true && student.losthealth<student.healthchange && student.health!=student.totalhealth) {
          student.health++;
          student.losthealth++;
        }
        if (student.losthealth==student.healthchange || student.health==student.totalhealth) {
          student.losinghealth=false;
          student.losthealth=0;
          student.healthchange=0;
        }
        if (keyPressed && button && (key == ENTER || key == RETURN) && student.losinghealth==false) {
          blip.trigger();
          println("a");
          turn++;
          if (turn==1) {
            healthphase=false;
            attackphase=true;
            student.usemove=false;
            pokemon[i][j].usemove=true;
          }
          if (turn==2) {
            turn=0;
            healthphase=false;
            attackphase=true;
            student.whatmove=true;
          }
        }
      }
    }




    if (pokemon[i][j].usemove) {
      textSize(35);
      if (randommove==4) {
        randommove=floor(random(0, 3.999999));
      }
      text(teachermonnames[i][j] + " used " + move[pokemonmoveref[i][j][randommove]].name + "!", width/16, 13*height/16, 15*width/16, 3*height/16);
    }
  }
}

void healthbarfill(float i, int j) {
  if (100*i/j>50) {
    fill(0, 255, 0);
  } else if (100*i/j>25) {
    fill(240, 240, 0);
  } else {
    fill(240, 0, 0);
  }
}

void statmodifiers(int i, int j) {
  if (student.attackmod<0) {
    student.attack=student.baseattack*2/(student.attackmod*-1+2);
  }
  if (student.attackmod>0) {
    student.attack=student.baseattack*(student.attackmod+2)/2;
  }
  if (student.attackmod==0) {
    student.attack=student.baseattack;
  }
  if (student.attackmod<0) {
    student.defense=student.basedefense*2/(student.defensemod*-1+2);
  }
  if (student.defensemod>0) {
    student.defense=student.basedefense*(student.defensemod+2)/2;
  }
  if (student.defensemod==0) {
    student.defense=student.basedefense;
  }
  if (student.speedmod<0) {
    student.speed=student.basespeed*2/(student.speedmod*-1+2);
  }
  if (student.speedmod>0) {
    student.speed=student.basespeed*(student.speedmod+2)/2;
  }
  if (student.speedmod==0) {
    student.speed=student.basespeed;
  }

  if (pokemon[i][j].attackmod<0) {
    pokemon[i][j].attack=pokemon[i][j].baseattack*2/(pokemon[i][j].attackmod*-1+2);
  }
  if (pokemon[i][j].attackmod>0) {
    pokemon[i][j].attack=pokemon[i][j].baseattack*(pokemon[i][j].attackmod+2)/2;
  }
  if (pokemon[i][j].attackmod==0) {
    pokemon[i][j].attack=pokemon[i][j].baseattack;
  }
  if (pokemon[i][j].attackmod<0) {
    pokemon[i][j].defense=pokemon[i][j].basedefense*2/(pokemon[i][j].defensemod*-1+2);
  }
  if (pokemon[i][j].defensemod>0) {
    pokemon[i][j].defense=pokemon[i][j].basedefense*(pokemon[i][j].defensemod+2)/2;
  }
  if (pokemon[i][j].defensemod==0) {
    pokemon[i][j].defense=pokemon[i][j].basedefense;
  }
  if (pokemon[i][j].speedmod<0) {
    pokemon[i][j].speed=pokemon[i][j].basespeed*2/(pokemon[i][j].speedmod*-1+2);
  }
  if (pokemon[i][j].speedmod>0) {
    pokemon[i][j].speed=pokemon[i][j].basespeed*(pokemon[i][j].speedmod+2)/2;
  }
  if (pokemon[i][j].speedmod==0) {
    pokemon[i][j].speed=pokemon[i][j].basespeed;
  }
}

