void setup() {
   size(1000,1000);
   background(0);
   stroke(color(255,255,255));
   noLoop();
}

float xOrig = 10;
float yOrig = 500;
void draw(){
  drawKoch(8,800.0, 0);
  save("ex4_3_1");
}
void drawKoch(int n, float leng, float angle) {        
   float x, y, angleR;
   if (n <= 0) { 
       angleR = 3.141592/ 180 * angle;
       x = leng*cos(angleR) + xOrig;
       y = leng*sin(angleR) + yOrig;
       line(xOrig, yOrig, x, y);
            xOrig = x;
            yOrig = y;
            return;
        }

        drawKoch(n - 1, leng/3, angle);
        drawKoch(n - 1, leng/3, angle + 60);
        drawKoch(n - 1, leng/3, angle - 60);
        drawKoch(n - 1, leng/3, angle);
}