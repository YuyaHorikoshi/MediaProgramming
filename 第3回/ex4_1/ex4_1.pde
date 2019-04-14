PImage img_in, img_out;
float th=30;

void setup()
{
  size(400, 400);
  surface.setResizable(true);
  img_in = loadImage("sample1-2.jpg");
  img_out = createImage( img_in.width, img_in.height, RGB );
  surface.setSize(img_in.width*2, img_in.height);
  noLoop();
}

void draw()
{
  float c=cos(th*3.141592/180);
  float s=sin(th*3.141592/180);
  image(img_in,0,0);
  int w=img_in.width; int h=img_in.height;
  img_in.loadPixels();
  for ( int y = 0; y < h; y+=1)
  {
    for ( int x = 0; x < w; x+=1)   /* パラメタは(u,v)と暫定設定 */
    {
 int X=int((x-w/2)*c-(y-h/2)*s+w/2);
 int Y=int((x-w/2)*s+(y-h/2)*c+h/2);
 
 if((X>=0)&&(X<w)&&(Y>=0)&&(Y<h)){
   int OldPos=x+y*w;
   int NewPos=X+Y*w;
   img_out.pixels[NewPos]=img_in.pixels[OldPos];
 }
    }
  }
  img_out.updatePixels();
  image(img_out, w, 0);
  img_out.save("out.jpg");
}