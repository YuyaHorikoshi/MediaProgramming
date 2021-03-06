import ddf.minim.*;
import ddf.minim.signals.*;

Minim minim;
AudioOutput out;
SineWave sine;

char ontei[]={'S','A','B','C','D','E','F','G','a','b',
              'c', 'd', 'e', 'f', 'g'};
int Freq[]=  {392,440,494,523,587,659,699,784,880,988,
              1046,1174,1318,1389,1568};

char tone[]={'S','C','C','C','C','P','D','E','E','E','F','G','G','P','T'} ;
int  note[]={ 4,  4,  3,  1,  4,  2,  2,  3,  1,  2,  2,  4 , 2,  2,  0};

int speed;

void setup()
{
  minim = new Minim(this);
  out = minim.getLineOut(Minim.STEREO);
  noLoop();
  speed=(60000/70)/4;
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
  
   
   

/*  この部分を完成させなさい　*/ 

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