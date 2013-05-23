int rectx=0;
float backgroundx=1600;

void battle1(int i) {
  fill(0);
  rect(0, 0, rectx, height);
  if (rectx==0) {
    battle.play();
  }
  if (rectx<width+100) {
    rectx+=9;
  }
  if (rectx>=width+100) {
    trainer1[i].fighting=true;
    trainer1[i].inbattletalking=true;
  }
  if (trainer1[i].fighting==true) {
    if (backgroundx>0) {
      backgroundx-=20;
    }
    image(battlebackground1top, -backgroundx, 0, width, 3*height/8);
    image(battlebackground1bottom, backgroundx, 3*height/8, width, 3*height/8);
    image(trainer1sprite[i], 475-backgroundx, 35, 64*1.6, 92*1.6);
    image(player, 100+backgroundx, 125, 54*2.5, 70*2.5);
    image(battletext, 0, 3*height/4, width, height/4); 
    fill(255);
    textSize(30);
    if (trainer1[i].inbattletalking==true) {
      text(teachermonnames1[i] + " wants to battle!", width/16, 13*height/16, 15*width/16, 3*height/16);
      if(keyPressed && (keyCode==ENTER || keyCode==RETURN)){
        trainer1[i].inbattletalking=false;
        student.whatattack=true;
      }
    }
    if(student.whatattack=true){
      text("ahhhhhhhaiofjaisof",0,0,width,height);
    }
  }
  if(keyPressed && (keyCode == ENTER || keyCode == RETURN)){
    blip.trigger();
    println("Ahh");
  }
  println(student.whatattack);
}

