PImage img_in, img_out;
float th=45;

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
  float c=cos(-th*3.141592/180);
  float s=sin(-th*3.141592/180);
  image(img_in, 0, 0);
  int w=img_in.width; 
  int h=img_in.height;
  img_in.loadPixels();
  for ( int v= 0; v < h; v+=1)
  {
    for ( int u = 0; u < w; u+=1)  
    {

      int x=int((u-(w/2))*c-(v-h/2)*s)+(w/2);
      int y=int((u-(w/2))*s+(v-h/2)*c)+(h/2);
      

      if ((x>=0)&&(x<w)&&(y>=0)&&(y<h)) {
        int OldPos=u+v*w;
        int NewPos=x+y*w;
        img_out.pixels[OldPos]=img_in.pixels[NewPos];
      }
    }
  }
  img_out.updatePixels();
  image(img_out, w, 0);
  img_out.save("out.jpg");
}