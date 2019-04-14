PImage img_out;
void setup() {
  size(1000, 1000);
  background(255);
  stroke(color(0,0,0));
  noLoop();

}

void draw(){
  drawfig3(5, 200.0, 500.0,500.0);
  save("ex4_2_5.jpg");
}

void drawfig3(int n, float leng,float XO,float YO) {        
   float x, y, ang;  float[] rx,ry;
   rx=new float[5]; ry=new float[5]; 
   for(int k=0;k<5;k++)
     { ang=3.141592/180*k*72;
       rx[k] = leng*sin(ang) + XO;
       ry[k] = leng*cos(ang) + YO;
       fill(0);
       ellipse(XO,YO,leng*2/3,leng*2/3);
      };
  if (n == 0) {return;};
     for(int k=0;k<5;k++)
      {
        drawfig3(n - 1, leng*1.2/3, rx[k], ry[k]);
      }
}