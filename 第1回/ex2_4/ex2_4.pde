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
  for ( int y = 0; y < img_in.height; y++)
  {
    for ( int x = 0; x < img_in.width; x++)
    {
       float gw=gray(x,y);
       gw=255-gw;
       int pos1 = x + y*img_in.width;
       int pos2=(img_in.width-x-1)+y*img_in.width;
      img_out.pixels[pos2] = img_in.pixels[pos1];
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