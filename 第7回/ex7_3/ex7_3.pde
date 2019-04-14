import ddf.minim.*;
import ddf.minim.signals.*;

Minim minim;
AudioOutput out;
SineWave sine1,sine2;
;

void setup()
{
  size(512, 200, P2D);
  minim = new Minim(this);
  out = minim.getLineOut(Minim.STEREO);
  sine1 = new SineWave(440, 0.5, out.sampleRate());
  //sine2=new SineWave(mouseX*100,0.5,out.sampleRate());
  out.addSignal(sine1);
  //out.addSignal(sine2);
}

void draw()
{
  background(0);
  stroke(255);
  for(int i = 0; i < out.bufferSize() - 1; i++)
  {
    float x1 = map(i, 0, out.bufferSize(), 0, width);
    float x2 = map(i+1, 0, out.bufferSize(), 0, width);
    line(x1, 50 + out.left.get(i)*50, x2, 50 + out.left.get(i+1)*50);
    line(x1, 150 + out.right.get(i)*50, x2, 150 + out.right.get(i+1)*50);
  }
}

void mouseMoved()
{
  float freq = map(mouseY, 0, height, 1500, 60);
  sine1.setFreq(freq);
  //sine2.setFreq(freq);
  float pan = map(mouseX, 0, width, -1, 1);
  sine1.setPan(pan);
  //sine2.setPan(pan);
}

void stop()
{
  out.close();
  minim.stop();
  super.stop();
}