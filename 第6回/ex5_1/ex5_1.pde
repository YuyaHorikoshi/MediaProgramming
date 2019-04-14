import ddf.minim.*;
import ddf.minim.signals.*;

Minim minim;
AudioOutput out;
SineWave sine;

void setup()
{
  size(100, 100, P2D);
  minim = new Minim(this);
  out = minim.getLineOut(Minim.STEREO);
}

void draw()
{
  background(0);
}

void keyPressed() {
  if (key == 'z'){ sine = new SineWave(523,  0.3, out.sampleRate());}
  else if (key == 'x'){ sine = new SineWave(587,  0.3, out.sampleRate());}
  else if (key == 'c'){ sine = new SineWave(659,  0.3, out.sampleRate());}
  else if (key == 'v'){ sine = new SineWave(699,  0.3, out.sampleRate());}
  else if (key == 'b'){ sine = new SineWave(784,  0.3, out.sampleRate());}
  else if (key == 'n'){ sine = new SineWave(880,  0.3, out.sampleRate());}
  else if (key == 'm'){ sine = new SineWave(988,  0.3, out.sampleRate());}
  else if (key == ','){ sine = new SineWave(1046,  0.3, out.sampleRate());}
 out.addSignal(sine);delaymsec(500);out.removeSignal(sine);
}

void delaymsec(int m){
   int ms=millis();
   while( millis()<(ms+m) ) {};
}


void stop()
{
  out.close();
  minim.stop();
  super.stop();
}