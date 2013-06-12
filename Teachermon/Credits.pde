void credits() {
  credits.play();
  //play credits song
  background(0);
  textAlign(CENTER);
  imageMode(CENTER);
  //text centered;image centered
  fill(255);
  textFont(Pokemonfont, 20);
  //get pokemonfont and specify font size
  text(s, width-width, i, width, 5000);
  tint(255, opac); 
  image(BAJA, width/2, height/2, BAJA.width/2+pixel, BAJA.height/2+pixel*0.30288461538461538461538461538462);
  i-=1.5;
  
  //I is moving to see the string more
  if (i <= -4000 && credit==true) {
    pixel+=1;
    opac+=.7;
  }
  //Changing opacity
  if (opac>=255 && credit == true ) {
    opac=255;
  }
  if (pixel>=279) {
    pixel=279;
  }
  if (i<=-4900 ) {
    opac-=1.5;
    credit = false;
  }
  if (opac<=0) {
    opac=0;
  }
  //Display thank you at the end
  if (i<=-5200) {
    thankyou++;
    fill(255, 255, 255, thankyou);
    textFont(Pokemonfont, 40);
    text(x, width/2-170, height/2-23, width/2, height/2);
  }
  if (thankyou>=255) {
    thankyou=255;
  }
}

