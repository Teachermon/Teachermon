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
int turn=0;
int randommove=4;
boolean studenthurt=false;
boolean enemyhurt=false;
boolean doneflashing=false;
boolean healingfinished=false;
float playerhurtmovex=0;
float playerhurtmovey=0;
float enemyhurtmovex=0;
float enemyhurtmovey=0;
int hurtmovetimer=0;
boolean donemoving=false;
int flashtimer=0;
int kippkash;
int defeatprogression=0;
int entertimer=0;
int opacity=0;
String studenthealth;

void battle(int i, int j) {
  statmodifiers(i, j);
  studenthealth = ""+round(student.health)+"/"+round(student.totalhealth)+"";

  fill(0);
  rect(0, 0, rectx, height);
  //Plays music while creating the battle background
  if (rectx==0) {
    if (i==3 && j==2) {
      battle2.play();
    }
    else {
      battle.play();
    }
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
    if (backgroundx>0 && pokemon[i][j].defeated==false) {
      backgroundx-=20;
    }
    image(battlebackgroundtop[i], -backgroundx, 0, width, 3*height/8);
    image(battlebackgroundbottom[i], backgroundx, 3*height/8, width, 3*height/8);
    if (enemyhurt==false) {
      image(trainersprite[i][j], 480-backgroundx+enemyhurtmovex, 35+enemyhurtmovey, 64*1.6, 92*1.6);
    }
    if (studenthurt==false) {
      image(player, 100+backgroundx+playerhurtmovex, 135-healthy+playerhurtmovey, 54*2.5, 70*2.5);
    }
    image(battletext, 0, 3*height/4, width, height/4);

    //HEALTH BAR
    fill(100);
    rect(width-playerhealth.width+86+healthx, 3*height/4-playerhealth.height+29+healthy, 96, 6);
    rect(78+15-healthx, 49, 96, 6);

    healthbarfill(student.health, student.totalhealth);
    rect(width-playerhealth.width+86+healthx, 3*height/4-playerhealth.height+29+healthy, 96*student.health/student.totalhealth, 6);

    healthbarfill(pokemon[i][j].health, pokemon[i][j].totalhealth);
    rect(78+15-healthx, 49, 96*pokemon[i][j].health/pokemon[i][j].totalhealth, 6);

    image(playerhealth, width-playerhealth.width-10+healthx, 3*height/4-playerhealth.height-5+healthy, playerhealth.width, playerhealth.height);
    image(enemyhealth, 15-healthx, 15, enemyhealth.width, enemyhealth.height);
    //Teachermon Name
    fill(0);
    textSize(20);
    text(teachermonnames[i][j], 25-healthx, 25, enemyhealth.width, enemyhealth.height);
    textAlign(RIGHT);
    text(studenthealth, width-playerhealth.width+healthx, 3*height/4-playerhealth.height+40+healthy, playerhealth.width-25, playerhealth.height-40);
    textAlign(LEFT);

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
      //Bobbing up and down healthbar/character
      if (healthx==0 && healthy>=2) {
        healthychange=-.1;
      }
      if (healthx==0 && healthy<=-2) {
        healthychange=.1;
      }
      healthy+=healthychange;


      if (healthx>0) {
        healthx-=15;
      }
      if (healthx==0) {
        //Text for chosing a move
        image(moveprompt, 0, 3*height/4, width, height/4);
        fill(0);
        text(move[studentmoveref[0]].name, 55, 3*height/4+20, width/2-30, height/4-25);
        text(move[studentmoveref[1]].name, 55, 7*height/8+5, width/2-30, height/8);
        text(move[studentmoveref[2]].name, 3*width/8+25, 3*height/4+20, width/2, height/4-25);
        text(move[studentmoveref[3]].name, 3*width/8+25, 7*height/8+5, width/2, height/8);
        image(battlearrow, battlearrowx, battlearrowy);
        if (move[studentmoveref[movechosen]].power==0) {
          text("POW: --", 3*width/4 + 5, 3*height/4 + 3*moveprompt.height/8-10, width/4-25, moveprompt.height/4);
        } 
        else {
          text("POW: " + move[studentmoveref[movechosen]].power, 3*width/4 + 5, 3*height/4 + 3*moveprompt.height/8-10, width/4-25, moveprompt.height/4);
        }
        
        //Pressing buttons changes your movechosen number which and the arow position
        
        if (battlearrowpositionx) {
          battlearrowx=35;
          if (battlearrowpositiony) {
            movechosen=0;
          } 
          else {
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
          } 
          else {
            movechosen=3;
          }
        }
        if (keyPressed && (key == 'w' || key == 's') && movechoice) {
          if (battlearrowpositiony) {
            battlearrowpositiony=false;
          } 
          else {
            battlearrowpositiony=true;
          }
          blip.trigger();
        }
        if (keyPressed && (key == 'a' || key == 'd') && movechoice) {
          if (battlearrowpositionx) {
            battlearrowpositionx=false;
          } 
          else {
            battlearrowpositionx=true;
          }
          blip.trigger();
        }
        if (keyPressed && (key == ENTER || key == RETURN) && button) {
          student.whatmove=false;
          blip.trigger();
          healthy=0;
          battlearrowpositionx=true;
          battlearrowpositiony=true;
          if (student.speed>=pokemon[i][j].speed) {
            student.usemove=true;
          } 
          else {
            pokemon[i][j].usemove=true;
          }
        }
      }
    }


    //BATTLE MATHEMATICS


    if (student.usemove) {
      entertimer++;
      textSize(30);
      if (keyPressed && button && (key == ENTER || key == RETURN) && move[studentmoveref[movechosen]].power==0 && entertimer>20 && attackphase==true) {
        attackphase=false;
        entertimer=0;
        if (move[studentmoveref[movechosen]].statchange==true) {
          statphase=true;
          changingstats=true;
        } 
        else {
          healthphase=true;
        }
      }
      if (attackphase==true) {
        text("Student used " + move[studentmoveref[movechosen]].name + "!", width/16, 13*height/16, 15*width/16, 3*height/16);
        if (doneflashing==false && move[studentmoveref[movechosen]].power>0) {
          //Flashing and moving back and forth animation
          if (donemoving==false) {
            hurtmovetimer++;
            if (hurtmovetimer<=10) {
              playerhurtmovex+=2;
              playerhurtmovey-=1;
            }
            if (hurtmovetimer>10 && hurtmovetimer<=20) {
              playerhurtmovex-=2;
              playerhurtmovey+=1;
              enemyhurtmovex+=2;
              enemyhurtmovey-=1;
            }
            if (hurtmovetimer>20 && hurtmovetimer<=30) {
              enemyhurtmovex-=2;
              enemyhurtmovey+=1;
            }
            if (hurtmovetimer==30) {
              donemoving=true;
              hurtmovetimer=0;
            }
          }

          if (flashtimer<30 && donemoving==true) {
            flashtimer++;
          }
          if (flashtimer==1) {
            hurt.trigger();
          }
          if ((10>flashtimer && flashtimer>5) || (20>flashtimer && flashtimer>15) || (30>flashtimer && flashtimer>25)) {
            enemyhurt=true;
          } 
          else {
            enemyhurt=false;
          }
          if (flashtimer==30) {
            doneflashing=true;
            donemoving=false;
            flashtimer=0;
          }
        }
        //Calculating how much health should be lost and if one side should lose
        if (move[studentmoveref[movechosen]].power>0 && pokemon[i][j].losinghealth==false && doneflashing==true) {
          pokemon[i][j].healthchange=round((2*student.level+10)*student.attack*move[studentmoveref[movechosen]].power/(250*pokemon[i][j].defense+2)*random(.9, 1));
          pokemon[i][j].losinghealth=true;
        }
        if (pokemon[i][j].losinghealth==true && pokemon[i][j].losthealth<pokemon[i][j].healthchange) {
          pokemon[i][j].health-=.5;
          pokemon[i][j].losthealth+=.5;
          if (pokemon[i][j].health<=0) {
            pokemon[i][j].defeated=true;
            entertimer=0;
            student.usemove=false;
            if (i==3 && j==2) {
              battle2.close();
              battle2 = minim.loadFile("champion.mp3");
            }
            else {
              battle.close();
              battle = minim.loadFile("battlemusic.mp3");
            }
            victory.play();
          }
        }
        if (pokemon[i][j].losinghealth==true && pokemon[i][j].losthealth>=pokemon[i][j].healthchange && keyPressed && (key == ENTER || key == RETURN) && button) {
          blip.trigger();
          entertimer=0;
          pokemon[i][j].losinghealth=false;
          pokemon[i][j].losthealth=0;
          pokemon[i][j].healthchange=0;
          doneflashing=false;
          //Only enters "phases" that are applicable to the chosen move
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
        //Changes stats for pokemon if needed
        entertimer++;
        text(move[studentmoveref[movechosen]].effect, width/16, 13*height/16, 14*width/16, 2*height/16);
        if (changingstats==true) {
          changingstats=false;
          student.attackmod+=move[studentmoveref[movechosen]].selfatkchange;
          student.defensemod+=move[studentmoveref[movechosen]].selfdefchange;
          student.speedmod+=move[studentmoveref[movechosen]].selfspdchange;
          pokemon[i][j].attackmod+=move[studentmoveref[movechosen]].enemyatkchange;
          pokemon[i][j].defensemod+=move[studentmoveref[movechosen]].enemydefchange;
          pokemon[i][j].speedmod+=move[studentmoveref[movechosen]].enemyspdchange;
        }
        if (keyPressed && button && (key == ENTER || key == RETURN) && entertimer>20) {
          blip.trigger();
          entertimer=0;
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
              student.usemove=false;
            }
          }
        }
      }

      if (healthphase==true) {
        //Adds health if needed
        entertimer++;
        text(move[studentmoveref[movechosen]].effect2, width/16, 13*height/16, 15*width/16, 3*height/16);
        if (student.losinghealth==false && healingfinished==false) {
          student.healthchange=round(move[studentmoveref[movechosen]].healthregen*student.totalhealth/100);
          student.losinghealth=true;
          if (student.health!=student.totalhealth) {
            heal.trigger();
          }
        }
        if (student.losinghealth==true && student.losthealth<student.healthchange && student.health!=student.totalhealth) {
          student.health+=.5;
          student.losthealth+=.5;
        }
        if (student.losthealth>=student.healthchange || student.health>=student.totalhealth) {
          student.losinghealth=false;
          healingfinished=true;
          student.losthealth=0;
          student.healthchange=0;
        }
        if (keyPressed && button && (key == ENTER || key == RETURN) && student.losinghealth==false && healingfinished==true) {
          entertimer=0;
          blip.trigger();
          turn++;
          healingfinished=false;
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
            student.usemove=false;
          }
        }
      }
    }



    //See comments for the student.usemove section
    if (pokemon[i][j].usemove) {
      textSize(30);  
      entertimer++;
      if (randommove==4 && attackphase==true) {
        //Teacher uses a random move
        randommove=floor(random(0, 3.999999));
      }
      if (keyPressed && button && (key == ENTER || key == RETURN) && move[pokemonmoveref[i][j][randommove]].power==0 && entertimer>20 && attackphase==true) {
        attackphase=false;
        entertimer=0;
        if (move[pokemonmoveref[i][j][randommove]].statchange==true) {
          statphase=true;
          changingstats=true;
        } 
        else {
          healthphase=true;
        }
      }
      if (attackphase==true) {
        text(teachermonnames[i][j] + " used " + move[pokemonmoveref[i][j][randommove]].name + "!", width/16, 13*height/16, 15*width/16, 3*height/16);
        if (doneflashing==false && move[pokemonmoveref[i][j][randommove]].power>0) {
          if (donemoving==false) {
            hurtmovetimer++;
            if (hurtmovetimer<=10) {
              enemyhurtmovex-=2;
              enemyhurtmovey+=1;
            }
            if (hurtmovetimer>10 && hurtmovetimer<=20) {
              playerhurtmovex-=2;
              playerhurtmovey+=1;
              enemyhurtmovex+=2;
              enemyhurtmovey-=1;
            }
            if (hurtmovetimer>20 && hurtmovetimer<=30) {
              playerhurtmovex+=2;
              playerhurtmovey-=1;
            }
            if (hurtmovetimer==30) {
              donemoving=true;
              hurtmovetimer=0;
            }
          }

          if (flashtimer<30 && donemoving==true) {
            flashtimer++;
          }
          if (flashtimer==1) {
            hurt.trigger();
          }
          if ((10>flashtimer && flashtimer>5) || (20>flashtimer && flashtimer>15) || (30>flashtimer && flashtimer>25)) {
            studenthurt=true;
          } 
          else {
            studenthurt=false;
          }
          if (flashtimer==30) {
            doneflashing=true;
            donemoving=false;
            flashtimer=0;
          }
        }
        if (move[pokemonmoveref[i][j][randommove]].power>0 && student.losinghealth==false && doneflashing==true) {
          student.healthchange=round((2*pokemon[i][j].level+10)*pokemon[i][j].attack*move[pokemonmoveref[i][j][randommove]].power/(250*student.defense+2)*random(.9, 1));
          student.losinghealth=true;
        }
        if (student.losinghealth==true && student.losthealth<student.healthchange) {
          student.health-=.5;
          student.losthealth+=.5;
          if (student.health==0) {
            turn=0;
            entertimer=0;
            randommove=4;
            student.losthealth=0;
            student.defeated=true;
            student.healthchange=0;
            pokemon[i][j].usemove=false;
            student.whatmove=false;
            student.usemove=false;
            attackphase=true;
            statphase=false;
            healthphase=false;
          }
        }
        if (student.losinghealth==true && student.losthealth>=student.healthchange && keyPressed && (key == ENTER || key == RETURN) && button && entertimer>20) {
          blip.trigger();
          entertimer=0;
          student.losinghealth=false;
          student.losthealth=0;
          student.healthchange=0;
          doneflashing=false;
          if (move[pokemonmoveref[i][j][randommove]].statchange==true) {
            statphase=true;
            attackphase=false;
            changingstats=true;
            healthphase=false;
          }
          if (move[pokemonmoveref[i][j][randommove]].statchange==false && move[pokemonmoveref[i][j][randommove]].healthchange==true) {
            attackphase=false;
            statphase=false;
            changingstats=false;
            healthphase=true;
          }
          if (move[pokemonmoveref[i][j][randommove]].statchange==false && move[pokemonmoveref[i][j][randommove]].healthchange==false) {
            turn++;
            randommove=4;
            pokemon[i][j].usemove=false;
            if (turn==1) {
              student.usemove=true;
            }
            if (turn==2) {
              turn=0;
              student.whatmove=true;
            }
          }
        }
      }

      if (statphase==true) {
        entertimer++;
        text(move[pokemonmoveref[i][j][randommove]].effect, width/16, 13*height/16, 14*width/16, 2*height/16);
        if (changingstats==true) {
          changingstats=false;
          pokemon[i][j].attackmod+=move[pokemonmoveref[i][j][randommove]].selfatkchange;
          pokemon[i][j].defensemod+=move[pokemonmoveref[i][j][randommove]].selfdefchange;
          pokemon[i][j].speedmod+=move[pokemonmoveref[i][j][randommove]].selfspdchange;
          student.attackmod+=move[pokemonmoveref[i][j][randommove]].enemyatkchange;
          student.defensemod+=move[pokemonmoveref[i][j][randommove]].enemydefchange;
          student.speedmod+=move[pokemonmoveref[i][j][randommove]].enemyspdchange;
        }
        if (keyPressed && button && (key == ENTER || key == RETURN) && entertimer>20) {
          blip.trigger();
          entertimer=0;
          if (move[pokemonmoveref[i][j][randommove]].healthchange==true) {
            statphase=false;
            healthphase=true;
          }
          if (move[pokemonmoveref[i][j][randommove]].healthchange==false) {
            turn++;
            randommove=4;
            if (turn==1) {
              statphase=false;
              attackphase=true;
              pokemon[i][j].usemove=false;
              student.usemove=true;
            }
            if (turn==2) {
              turn=0;
              statphase=false;
              attackphase=true;
              pokemon[i][j].usemove=false;
              student.whatmove=true;
            }
          }
        }
      }

      if (healthphase==true) {
        entertimer++;
        text(move[pokemonmoveref[i][j][randommove]].effect2, width/16, 13*height/16, 15*width/16, 3*height/16);
        if (pokemon[i][j].losinghealth==false && healingfinished==false) {
          pokemon[i][j].healthchange=round(pokemon[i][j].totalhealth*move[pokemonmoveref[i][j][randommove]].healthregen/100);
          pokemon[i][j].losinghealth=true;
          if (pokemon[i][j].health!=pokemon[i][j].totalhealth) {
            heal.trigger();
          }
        }
        if (pokemon[i][j].losinghealth==true && pokemon[i][j].losthealth<pokemon[i][j].healthchange && pokemon[i][j].health<pokemon[i][j].totalhealth) {
          pokemon[i][j].health+=.5;
          pokemon[i][j].losthealth+=.5;
        }
        if (pokemon[i][j].losthealth>=pokemon[i][j].healthchange || pokemon[i][j].health>=pokemon[i][j].totalhealth) {
          pokemon[i][j].losinghealth=false;
          pokemon[i][j].losthealth=0;
          pokemon[i][j].healthchange=0;
          healingfinished=true;
        }
        if (keyPressed && button && (key == ENTER || key == RETURN) && pokemon[i][j].losinghealth==false && healingfinished==true) {
          randommove=4;
          entertimer=0;
          blip.trigger();
          turn++;
          healingfinished=false;
          if (turn==1) {
            healthphase=false;
            attackphase=true;
            pokemon[i][j].usemove=false;
            student.usemove=true;
          }
          if (turn==2) {
            turn=0;
            healthphase=false;
            attackphase=true;
            student.whatmove=true;
            pokemon[i][j].usemove=false;
          }
        }
      }
    }
  }


  //When defeated, all values are reset. 
  if (pokemon[i][j].defeated==true) {
    if (defeatprogression==0) {
      text(teachermonnames[i][j] + " was defeated!", width/16, 13*height/16, 15*width/16, 3*height/16);
      if (keyPressed && button && (key == ENTER || key == RETURN)) {
        defeatprogression=1;
        blip.trigger();
      }
    }
    if (defeatprogression==1) {
      entertimer++;
      text(defeatmessage[i][j], width/16, 13*height/16, 15*width/16, 3*height/16);
      if (keyPressed && (key == ENTER || key == RETURN) && entertimer>15) {
        blip.trigger();
        defeatprogression=2;
        kippkash=round(random(1, 300));
        entertimer=0;
      }
    }
    if (defeatprogression==2) {
      entertimer++;
      text("You received " + kippkash + " KippKash for winning!", width/16, 13*height/16, 15*width/16, 3*height/16);
      if (keyPressed && (key == ENTER || key == RETURN) && entertimer>15) {
        blip.trigger();
        defeatprogression=3;
        entertimer=0;
      }
    }
    if (defeatprogression==3) {
      text("You received " + kippkash + " KippKash for winning!", width/16, 13*height/16, 15*width/16, 3*height/16);
      fill(0, opacity);
      if (opacity<255) {
        opacity+=5;
      }
      rect(0, 0, width, height);
      if (opacity==255) {
        rectx=0;
        healthx=300;
        healthy=2;
        healthychange=0;
        backgroundx=1600;
        battlearrowpositionx=true;
        battlearrowpositiony=true;
        attackphase=true;
        statphase=false;
        healthphase=false;
        changingstats=false;
        turn=0;
        studenthurt=false;
        enemyhurt=false;
        doneflashing=false;
        randommove=4;
        playerhurtmovex=0;
        playerhurtmovey=0;
        enemyhurtmovex=0;
        enemyhurtmovey=0;
        hurtmovetimer=0;
        donemoving=false;
        flashtimer=0;
        defeatprogression=0;
        opacity=0;
        trainer[i][j].fighting=false;
        trainer[i][j].battlestart=false;
        trainer[i][j].fought=true;
        overworld[i]=true;
        trainer[i][j].spotted=false;
        victory.close();
        victory = minim.loadFile("victory.mp3");
        student.health=student.totalhealth;
        student.attackmod=0;
        student.defensemod=0;
        student.speedmod=0;
        overworldopacity=255;
      }
    }
  }
  if (student.defeated==true) {
    if (defeatprogression==0) {
      text("Student was defeated!", width/16, 13*height/16, 15*width/16, 3*height/16);
      if (keyPressed && button && (key == ENTER || key == RETURN)) {
        defeatprogression=1;
        blip.trigger();
      }
    }
    if (defeatprogression==1) {
      entertimer++;
      text("Student was disowned by his parents!", width/16, 13*height/16, 15*width/16, 3*height/16);
      if (keyPressed && button && (key == ENTER || key == RETURN) && entertimer>15) {
        entertimer=0;
        blip.trigger();
        defeatprogression=2;
      }
    }
    if (defeatprogression==2) {
      text("Student blacked out!", width/16, 13*height/16, 15*width/16, 3*height/16);
      fill(0, opacity);
      if (opacity<255) {
        opacity+=5;
      }
      rect(0, 0, width, height);
      if (opacity==255) {
        rectx=0;
        healthx=300;
        healthy=2;
        healthychange=0;
        backgroundx=1600;
        battlearrowpositionx=true;
        battlearrowpositiony=true;
        attackphase=true;
        statphase=false;
        healthphase=false;
        changingstats=false;
        turn=0;
        studenthurt=false;
        enemyhurt=false;
        doneflashing=false;
        randommove=4;
        playerhurtmovex=0;
        playerhurtmovey=0;
        enemyhurtmovex=0;
        enemyhurtmovey=0;
        hurtmovetimer=0;
        donemoving=false;
        flashtimer=0;
        defeatprogression=0;
        opacity=0;
        trainer[i][j].fighting=false;
        trainer[i][j].battlestart=false;
        trainer[i][j].spotted=false;
        if (i==3 && j==2) {
          battle2.close();
          battle2 = minim.loadFile("champion.mp3");
        }
        else {
          battle.close();
          battle = minim.loadFile("battlemusic.mp3");
        }
        student.health=student.totalhealth;
        student.attackmod=0;
        student.defensemod=0;
        student.speedmod=0;
        overworldopacity=255;
        student.losinghealth=false;

        if (i==0) {
          student.x=25;
          student.y=height/2;
        }
        else {
          student.x=25;
          student.y=0;
          student.moved=true;
          student.moving=true;
          student.movetimer=0;
        }

        overworld[i]=true;
        student.defeated=false;
        pokemon[i][j].health=pokemon[i][j].totalhealth;
        pokemon[i][j].attackmod=0;
        pokemon[i][j].defensemod=0;
        pokemon[i][j].speedmod=0;
      }
    }
  }
}

//Determines health bar color based on % health left

void healthbarfill(float i, int j) {
  if (100*i/j>50) {
    fill(0, 255, 0);
  } 
  else if (100*i/j>25) {
    fill(240, 240, 0);
  } 
  else {
    fill(255, 40, 0);
  }
}

//Determining stats based on the stat modification

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
  if (student.defensemod<0) {
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
  if (pokemon[i][j].defensemod<0) {
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

