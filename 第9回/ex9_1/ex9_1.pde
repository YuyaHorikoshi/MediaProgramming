PImage img_in;
int[] Stack_x, Stack_y;
int StackPointer;

int x, y;

void setup()
{
  size(400, 400);
  surface.setResizable(true);
  img_in = loadImage("sample4-2.png"); 
  surface.setSize(img_in.width*2, img_in.height);
  colorMode(RGB, 255, 255, 255);
  noLoop();
  ClearStack();
}


void draw()
{
  image(img_in, 0, 0);
  img_in.loadPixels();
  PushStack(img_in.width/2, img_in.height/2);
  
  while (StackPointer>0) {
    PopStack();
    if (Is_White(x, y)==1) {
      Set_Black(x, y);

      if (Is_White(x+1, y)==1) {
        PushStack(x+1, y);
      }
      if (Is_White(x, y+1)==1) {
        PushStack(x, y+1);
      }
      if (Is_White(x, y-1)==1) {
        PushStack(x, y-1);
      }
      if (Is_White(x-1, y)==1) {
        PushStack(x-1, y);
      }
    }
  }


  img_in.updatePixels();
  image(img_in, img_in.width, 0);
  save("ex9_2.png");
}

void  Set_Black(int x, int y) {
  int pos = x + img_in.width*y;
  img_in.pixels[pos]=color(0, 0, 0);
}

int Is_White(int x, int y) {
  if (gray(x, y)>128) { 
    return(1);
  }
  return(0);
}

void ClearStack() {
  Stack_x = new int[50000]; 
  Stack_y = new int[50000];
  StackPointer=0;
}

void PushStack(int x, int y) {
  StackPointer++;
  Stack_x[StackPointer]=x;
  Stack_y[StackPointer]=y;
}

void PopStack() {
  x=Stack_x[StackPointer];
  y=Stack_y[StackPointer];
  StackPointer--;
}

float  gray(int x, int y) {
  int pos = (x) + img_in.width*(y);
  println(x, y);
  color c = img_in.pixels[pos];
  float r = red( c );
  float g = green( c );
  float b = blue( c );
  return( 0.3 * r + 0.59 * g + 0.11 * b);
}