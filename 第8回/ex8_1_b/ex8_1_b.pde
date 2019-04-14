PImage img_in;

void setup()
{
 size(400, 400);
  surface.setResizable(true);
  img_in = loadImage("sample5.png"); 
  surface.setSize(img_in.width*2, img_in.height);
  colorMode(RGB,255,255,255);
  noLoop();
}

void draw()
{
 int x,y;
  image(img_in,0,0);
  img_in.loadPixels();

  y=0;
  while(  y<img_in.height  ){
    x=0;
    while(x<img_in.width){
      while((x<img_in.width)&&(Is_White(x,y)==1)){x++;};
      while((x<img_in.width)&&(Is_White(x,y)==0)){x++;};
      while((x<img_in.width)&&(Is_White(x,y)==1))
            {Set_Black(x,y); x++;};
      while((x<img_in.width)&&(Is_White(x,y)==0)){x++;};
    };


  y++; };
  img_in.updatePixels();
  image(img_in,img_in.width, 0);
  img_in.save("out5.jpg");
}


void  Set_Black(int x, int y){
     int pos = x + img_in.width*y;
     img_in.pixels[pos]=color(0,0,0);
 
}

int Is_White(int x, int y){
  if(gray(x,y)>128) { return(1);}
  return(0);
}

float  gray(int x, int y){
     int pos = x + img_in.width*y;
     color c = img_in.pixels[pos];
     float r = red( c );
     float g = green( c );
     float b = blue( c );
     return( 0.3 * r + 0.59 * g + 0.11 * b);
   }