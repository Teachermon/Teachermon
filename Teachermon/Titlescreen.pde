import processing.video.*;

Movie theMov; 

import ddf.minim.*;

Minim minim;
AudioPlayer titlescreenplayer;

boolean clickhere;
float titleopacity=0;
int waveformcounter=0;

void titlescreen() {
  waveformcounter++;
  image(theMov, 0, 0, width, height);
  titlescreenplayer.play();
  //  Uncomment this to display waveforms of the music playing after 11.2 seconds
  if (waveformcounter>=525) {
    for (int i = 0; i < titlescreenplayer.bufferSize() - 1; i++)
    {
      float x1 = map( i, 0, titlescreenplayer.bufferSize(), 0, width );
      float x2 = map( i+1, 0, titlescreenplayer.bufferSize(), 0, width );
      line( x1, 50 + titlescreenplayer.left.get(i)*50, x2, 50 + titlescreenplayer.left.get(i+1)*50 );
      line( x1, height-50 + titlescreenplayer.right.get(i)*50, x2, height-50 + titlescreenplayer.right.get(i+1)*50 );
    }
    //  Use either the mousePressed function or void mousePressed() function, depending on need.
    if ((mousePressed)&&(mouseY>3*height/8)&&(mouseY<5*height/8)&&(millis()>=12000)) {
      clickhere=true;
    }
    if (clickhere) {
      fill(0, titleopacity);
      rect(0, 0, width, height);
      titleopacity+=5;
    } 

    //void mousePressed(){
    //  if((mouseY>300)&&(mouseY<500)&&(millis()>=12000)){
    //    background(255,100);
    //    clickhere=true;
    //  }
    //}
    if (titleopacity>=255&&titlescreenplayer.isPlaying()&&clickhere) {
      titleopacity=255;
      titlescreenplayer.close();
      clickhere=false;
      titlescreen=false;
      overworld1=true;
    }
  }
}
void movieEvent(Movie m) { 
  m.read();
} 

