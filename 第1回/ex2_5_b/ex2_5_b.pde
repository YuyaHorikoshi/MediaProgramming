PImage img_in, img_out;

void settings()
{
  img_in = loadImage("sample1-2.jpg");
  img_out = createImage( img_in.width, img_in.height, RGB );
  size(img_in.width*2, img_in.height);
  noLoop();
}

void draw()
{
  image(img_in,0,0);
  img_in.loadPixels();
  int d=16;
  for ( int y = 0; y < img_in.height-d; y+=d)
  {
    for ( int x = 0; x < img_in.width-d; x+=d)
    {
       int pos1 = (x+d/2) + (y+d/2)*img_in.width;
       color c=img_in.pixels[pos1];
       for(int xd=0;xd<d;xd++){
         for(int yd=0;yd<d;yd++){
           int pos2=(x+xd)+(y+yd)*img_in.width;
      img_out.pixels[pos2] =c;
         }
       }
    }
  }
  img_out.updatePixels();
  image(img_out,img_in.width,0);
  img_out.save("result1-2.jpg");
}

float  gray(int x, int y){            
int pos = x + img_in.width*y;  
color c = img_in.pixels[pos];  
float r = red( c ); float g = green( c );  
float b = blue( c );  
return( 0.3 * r + 0.59 * g + 0.11 * b);
}