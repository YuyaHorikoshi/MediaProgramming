void setup() {
  noLoop();
}

void draw() {
  print(Fact(10));
  print(Sum(10));
}

int Sum(int n) {
  if (n==0) return n;
  else {
    return n+Sum(n-1);
  }
}

int Fact(int n) {
  if (n==0) return 1;
  else {
    return n*Fact(n-1);
  }
}