import processing.video.*;

Movie theMov; 

import ddf.minim.*;

Minim minim;
AudioPlayer titlescreenplayer;

boolean clickhere;
float titleopacity=0;
int waveformcounter=0;

//This is playing the video

void titlescreen() {
  waveformcounter++;
  image(theMov, 0, 0, width, height);
  titlescreenplayer.play();
  if (waveformcounter>=525) {
    for (int i = 0; i < titlescreenplayer.bufferSize() - 1; i++)
    {
      float x1 = map( i, 0, titlescreenplayer.bufferSize(), 0, width );
      float x2 = map( i+1, 0, titlescreenplayer.bufferSize(), 0, width );
      line( x1, 50 + titlescreenplayer.left.get(i)*50, x2, 50 + titlescreenplayer.left.get(i+1)*50 );
      line( x1, height-50 + titlescreenplayer.right.get(i)*50, x2, height-50 + titlescreenplayer.right.get(i+1)*50 );
    }
    if (keyPressed && (key == ENTER || key == RETURN)) {
      clickhere=true;
    }
    if (clickhere) {
      fill(0, titleopacity);
      rect(0, 0, width, height);
      titleopacity+=5;
    } 
    if (titleopacity>=255&&titlescreenplayer.isPlaying()&&clickhere) {
      //After the "press enter prompt" comes up and enter is pressed, titlescreen ends and the first level begins
      titleopacity=255;
      titlescreenplayer.close();
      clickhere=false;
      titlescreen=false;
      overworld[0]=true;
    }
  }
}
void movieEvent(Movie m) { 
  m.read();
} 

