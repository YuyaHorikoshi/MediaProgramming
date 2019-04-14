import ddf.minim.*;
import ddf.minim.signals.*;

Minim minim;
AudioOutput out;
SineWave sine;

char ontei[]={'S','A','B','C','D','E','F','G',
              'c','d','q','T'};
int Freq[]=  {2*174,2*220,2*246,2*130,2*146,2*164,2*174,2*195,
              2*261,2*293,2*233,2*174};

char tone[]={'S','E','F','G','F','G','A',
              'q','B','c','A','G','F', 
              'F','d','c','F',
              'D','q','A','G',
              'F','T'} ;
int  note[]={ 2,  2,  2,  4,  2,  2,  4,
              2,  2,  4,  2,  2 , 2,
              4,  4,  4,  4,
              4,  4,  4,  4,
              4};

int speed;

void setup()
{
  minim = new Minim(this);
  out = minim.getLineOut(Minim.STEREO);
  noLoop();
  speed=(55000/70)/6;
}

void draw()
{ 
int k;
  k=0;
  while( tone[k]!='T' )
 {
   if( tone[k]=='P'){
     delaymsec(note[k]*speed);
   }else{
     int i=0;
     while(tone[k]!=ontei[i]){i++;};
     sine=new SineWave(Freq[i],0.5,out.sampleRate());
     out.addSignal(sine);
     delaymsec(note[k]*speed);
     out.removeSignal(sine);
     
   }
   k++;
  };
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