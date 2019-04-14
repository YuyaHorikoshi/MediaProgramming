void setup() {
  size(2000, 2000);
  background(255);
  stroke(0);
}

void draw() {
  Circle(1, 1000.0, 1000, 1000);
  save("ex4_5.jpg");
}

void Circle(int n, float r, float x, float y)
{
  if (n<100) {
    noFill();
    ellipse(x, y, r, r);
    Circle(n+1, r/1.05, x-sin(n*3.141592/180)*300, y-sin(n*3.141592/180)*300);
  }
}