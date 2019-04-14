void setup() {
  size(500, 500);
  background(255);
  stroke(color(0,0,0));
  noFill();
  noLoop();
}

void draw(){
  drawfig3(4,100.0,250.0,250.0);
  save("ex4_2_2.jpg");
}

void drawfig3(int n, float leng,float XO,float YO) {        
   float x, y, ang;  float[] rx,ry;
   rx=new float[3]; ry=new float[3]; 
   for(int k=0;k<3;k++)
     { ang=3.141592/180*k*120;
       rx[k] = leng*sin(ang) + XO;
       ry[k] = leng*cos(ang) + YO;
       line(XO,YO,rx[k],ry[k]);
      };
  if (n == 0) {return ;};
      drawfig3(n - 1, leng, rx[0], ry[0]);
      drawfig3(n - 1, leng, rx[1], ry[1]);
      drawfig3(n - 1, leng, rx[2], ry[2]);
}