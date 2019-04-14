void setup() {
  size(500, 500);
  background(255);
  stroke(color(0,0,0));
  noFill();
  noLoop();
}

void draw(){
  Maru(5,250, 250, 200);
  save("ex4_2_4.jpg");
}

void Maru(int n, float x, float y, float r) {
  ellipse(x, y, r*2, r*2);
  if (n>1) {
    Maru(n-1,x+r/2,y,r/2 ); //右側の円
    Maru(n-1,x-((r/2)*cos(3.141592/180*60)),y+((r/2)*sin(3.141592/180*60)),r/2 ); //左側の円
    Maru(n-1,x-((r/2)*cos(3.141592/180*60)),y-((r/2)*sin(3.14592/180*60)),r/2);
  }
}