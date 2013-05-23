int rectx;
int backgroundx=1000;

void battle1(int i) {
  fill(0);
  rect(0, 0, rectx, height);
  if (rectx<width+100) {
    rectx+=10;
  }
  if (rectx>=width+100) {
    trainer1[i].fighting=true;
  }
  if (trainer1[i].fighting==true) {
    if (backgroundx>0) {
      backgroundx-=25;
    }
    image(battlebackground1top, -backgroundx, 0, width, 3*height/8);
    image(battlebackground1bottom, backgroundx, 3*height/8, width, 3*height/8);
    image(trainer1sprite[i], 475-backgroundx, 35, 64*1.6, 92*1.6);
    image(player, 80+backgroundx, 73);
    image(battletext, 0, 3*height/4, width, height/4); 
    fill(255);
    textSize(30);
    text(teachermonnames1[i] + " wants to battle!", width/16, 13*height/16, 15*width/16, 3*height/16);
  }
}

