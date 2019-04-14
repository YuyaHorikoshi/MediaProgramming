void setup() {
   size(1000,1000);
   background(0);
   stroke(color(255,255,255));
   noLoop();
}
void draw(){
  drawTree(6,800.0, 0,10,500);
  save("ex4_3_2");
}
void drawTree(int n, float leng, float angle,float x0, float y0) {        
   float x, y, angleR;
   angleR = 3.141592/ 180 * angle;
   if (n <= 0) { 
       x = leng*cos(angleR) + x0;
       y = leng*sin(angleR) + y0;
       line(x0, y0, x, y);
        }
     else{
       x = leng/3*cos(angleR) + x0;
       y = leng/3*sin(angleR) + y0;
       line(x0, y0, x, y);
        drawTree(n - 1, leng*2/3,angle,x, y);
        drawTree(n - 1, leng/3, angle + 30,x,y);
        drawTree(n - 1, leng/3, angle - 30,x,y);
     }
}