PImage img_in;
PImage img_out1,img_out2;
int w,h;
void setup()
{
  size(400, 400);
  surface.setResizable(true);
  img_in = loadImage("sample4-1.bmp");
  w=img_in.width; h=img_in.height; 
  img_out1 = createImage( w, h, RGB ); 
  img_out2 = createImage( w, h, RGB ); 
  colorMode(RGB,255,255,255);
  surface.setSize(w*2,h);
  noLoop();
}

void draw()
{
  img_in.loadPixels();
  for ( int y = 1; y < h-1; y+=1)
  {
    for ( int x = 1; x < w-1; x+=1)
    {
        int Pos = x + y*w;
  float gry=gray(x,y);
        img_out1.pixels[Pos]=color(gry,gry,gry);         

        /* 処理の部分　*/ 
float gw=(-gray(x,y+1)+gray(x,y-1))/2+128;
img_out2.pixels[Pos]=color(gw,gw,gw);
       }
  }
  img_out1.updatePixels();
  img_out2.updatePixels();
  image(img_out1, 0, 0); image(img_out2, img_in.width, 0);
  img_out2.save("out.bmp");
}

float  gray(int x, int y){
  int pos = x + w*y;
  color c = img_in.pixels[pos];
  float r = red( c );
  float g = green( c );
  float b = blue( c );
  return( 0.3 * r + 0.59 * g + 0.11 * b);
}