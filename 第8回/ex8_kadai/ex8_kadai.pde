import ddf.minim.*;
import ddf.minim.signals.*;

Minim minim;
AudioOutput out;
SineWave sine;
boolean isPushed=false;
boolean pound=false;
int a=0;
int dy=-100;
int dx=80;

void setup()
{
  background(200, 230, 200);
  size(1050, 500);
  minim = new Minim(this);
  out = minim.getLineOut(Minim.STEREO);
}

void draw()
{
  drawKeyboard();
  score(dx, dy);

  if (dx>900) {
    dx=120;
    background(200, 230, 200);
    score(dx, dy);
    drawKeyboard();
  }
  if(keyPressed && key=='s'){
  save("score");
  }
}

void mousePressed() {
  if (!isPushed) {
    for (int i=0; i<3; i++) {
      int l=350*i;
      if (i==2) {
        a=1;
      }
      int c=(1+i+a);
      int t=70*i; 

      if (mousePressed && ((mouseX>=0+l && mouseX<50+l && mouseY>=400 && mouseY<500) || (mouseX>=0+l && mouseX<35+l && mouseY>=300 && mouseY<400)) ) {
        sine = new SineWave(131*c, 0.3, out.sampleRate());
        dx+=40;
        dy=200-t;
        pound=false;
      } else if (mousePressed && (mouseX>=35+l && mouseX<65+l && mouseY>=300 && mouseY<400)) {
        sine=new SineWave(139*c, 0.3, out.sampleRate());
        dx+=40;
        dy=200-t;
        pound=true;
      } else if (mousePressed && ((mouseX>=50+l && mouseX<100+l && mouseY>=400 && mouseY<500) || (mouseX>=65+l && mouseX<85+l && mouseY>=300 && mouseY<400))) { 
        sine = new SineWave(147*c, 0.3, out.sampleRate());
        dx+=40;
        dy=190-t;
        pound=false;
      } else if (mousePressed && (mouseX>=85+l && mouseX<115+l && mouseY>=300 && mouseY<400)) {
        sine=new SineWave(156*c, 0.3, out.sampleRate());
        dx+=40;
        dy=190-t;
        pound=true;
      } else if (mousePressed && ((mouseX>=100+l && mouseX<150+l && mouseY>=400 && mouseY<500) || (mouseX>=115+l && mouseX<150+l && mouseY>300 && mouseY<400)) ) { 
        sine = new SineWave(165*c, 0.3, out.sampleRate());
        dx+=40;
        dy=180-t;
        pound=false;
      } else if (mousePressed && ((mouseX>=150+l && mouseX<200+l && mouseY>=400 && mouseY<500) || (mouseX>=150+l && mouseX<185+l && mouseY>=300 && mouseY<400)) ) { 
        sine = new SineWave(175*c, 0.3, out.sampleRate());
        dx+=40;
        dy=170-t;
        pound=false;
      } else if (mousePressed && ((mouseX>=185+l && mouseX<215+l && mouseY>=300 && mouseY<400)) ) { 
        sine = new SineWave(185*c, 0.3, out.sampleRate());
        dx+=40;
        dy=170-t;
        pound=true;
      } else if (mousePressed && ((mouseX>=200+l && mouseX<250+l && mouseY>=400 && mouseY<500) || (mouseX>=215+l && mouseX<235+l && mouseY>=300 && mouseY<400))) { 
        sine = new SineWave(196*c, 0.3, out.sampleRate());
        dx+=40;
        dy=160-t;
        pound=false;
      } else if (mousePressed && ((mouseX>=235+l && mouseX<265+l && mouseY>=300 && mouseY<400))) { 
        sine = new SineWave(208*c, 0.3, out.sampleRate());
        dx+=40;
        dy=160-t;
        pound=true;
      } else if (mousePressed && ((mouseX>=250+l && mouseX<300+l && mouseY>=400 && mouseY<500) || (mouseX>=265+l && mouseX<285+l && mouseY>=300 && mouseY<400))) { 
        sine = new SineWave(220*c, 0.3, out.sampleRate());
        dx+=40;
        dy=150-t;
        pound=false;
      } else if (mousePressed && ((mouseX>=285+l && mouseX<315+l && mouseY>=300 && mouseY<400))) { 
        sine = new SineWave(233*c, 0.3, out.sampleRate());
        dx+=40;
        dy=150-t;
        pound=true;
      } else if (mousePressed && ((mouseX>=300+l && mouseX<350+l && mouseY>=400 && mouseY<500) || (mouseX>=315+l && mouseX<350+l && mouseY>300 && mouseY<400)) ) { 
        sine = new SineWave(247*c, 0.3, out.sampleRate());
        dx+=40;
        dy=140-t;
        pound=false;
      } else if (mouseX>=0 && mouseY<300) {
        sine = new SineWave(0, 0, out.sampleRate());
      }
      a=0;
    }
    out.addSignal(sine);
    delaymsec(-500);
    isPushed=true;
  }
}


void mouseReleased() { 
  if (isPushed==true) {
    out.removeSignal(sine);
    isPushed=false;
  }
}

void delaymsec(int m) {
  int ms=millis();
  while ( millis()<=(ms+m) ) {
  };
}

void stop()
{
  out.close();
  minim.stop();
  super.stop();
}

void drawKeyboard() {
  for (int i=0; i<21; i++) {
    rect(0+50*i, 300, 50, 200);
  }
  for (int j=0; j<3; j++) {
    fill(0);
    rect(350*j+35, 300, 30, 100);
    rect(350*j+85, 300, 30, 100);
    rect(350*j+185, 300, 30, 100);
    rect(350*j+235, 300, 30, 100);
    rect(350*j+285, 300, 30, 100);
    fill(255);
  }
}

void score(int ax, int ay) {
  for (int i=0; i<5; i++) {
    int l=350*i;
    line(100, 100+20*i, 900, 100+20*i);
    if (ax>=0) {
      fill(0);
      ellipse(ax, ay, 20, 20);
      if (mousePressed && ((mouseX>=35+l && mouseX<65+l && mouseY>=300 && mouseY<400) || 
        (mouseX>=85+l && mouseX<115+l && mouseY>=300 && mouseY<400) || 
        (mouseX>=185+l && mouseX<215+l && mouseY>=300 && mouseY<400) ||
        (mouseX>=235+l && mouseX<265+l && mouseY>=300 && mouseY<400) ||
        (mouseX>=285+l && mouseX<315+l && mouseY>=300 && mouseY<400))) {
        textSize(25);
        text("#", ax+10, ay+10);
      }
      fill(255);
    }
  }
  noStroke();
  fill(200, 230, 200);
  rect(5, 180, 50, 50);
  fill(0);
  textSize(20);
  text((1000-dx-120)/40, 10, 200);
  stroke(0);
  fill(255);
}