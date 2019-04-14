PImage img_in, img_out;
String Res="";
String[] QT;
int Pos;
int width, height;

void setup()
{
  size(400, 400);
  surface.setResizable(true);
  img_in = loadImage("tokyou.jpg");
  img_out = createImage( img_in.width, img_in.height, RGB ); 
  surface.setSize(img_in.width*2, img_in.height);
  colorMode(RGB, 255, 255, 255);
  noLoop();

  /* */  // 以下は、画像を文字列に変換する部分
  image(img_in, 0, 0);
  img_in.loadPixels();
  makeQtree(5, 0, 0, img_in.width);
  /* */

  // 文字列を直接指定する。

  //Res="(bb(bwbw)(bb(bbww)w)";
}

void draw()
{
  print(Res);
  QT=split(Res, ' ');
  saveStrings("a-qt.txt", QT);
  Pos=0;
  drawQtree(0, 0, img_in.width);
  img_out.updatePixels();
  image(img_out, img_in.width, 0);
  img_out.save("a-out.jpg");
}


void drawQtree(int x, int y, int size)
{
  if ( (Res.charAt(Pos)=='b')||(Res.charAt(Pos)=='w')) 
  { 
    fill(x, y, size, Res.charAt(Pos));
    Pos++;
    return;
  };
  Pos++;
  drawQtree(x, y, size/2);

  // 以下に適切な３行を追加する
  drawQtree(x+size/2, y, size/2);
  drawQtree(x, y+size/2, size/2);
  drawQtree(x+size/2, y+size/2, size/2);

  Pos++;
  return;
}

void fill(int x, int y, int size, char col)
{
  int pp;
  for (int xw=0; xw<size; xw++) {
    for (int yw=0; yw<size; yw++) { 
      pp=(x+xw)+(y+yw)*img_in.width;
      if ( col == 'b') {
        img_out.pixels[pp]=color(0, 0, 0);
      } else { 
        img_out.pixels[pp]=color(255, 255, 255);
      }
    };
  };
  /* */  // 以下は，分割線を描く部分　// 
  for (int xw=0; xw<size; xw++) {
    pp=(x+xw)+y*img_in.width;
    img_out.pixels[pp]=color(255, 0, 0);
    pp=(x+xw)+(y+size-1)*img_in.width;
    img_out.pixels[pp]=color(255, 0, 0);
  }
  for (int yw=0; yw<size; yw++) { 
    pp=x+(y+yw)*img_in.width;
    img_out.pixels[pp]=color(255, 0, 0);
    pp=(x+size-1)+(y+yw)*img_in.width;
    img_out.pixels[pp]=color(255, 0, 0);
  }
  /* */
}

void makeQtree(int lev, int x, int y, int size)
{
  int b=0;
  for (int xw=0; xw<size; xw++) {
    for (int yw=0; yw<size; yw++) { 
      b+=Is_White(x+xw, y+yw);
    }
  };
  if ( lev==0 ) {
    if ( b>size*size/2 ) { 
      Res=Res+"w";
    } else { 
      Res=Res+"b";
    };
    return;
  };
  if ( b>int(pow(size, 2)*0.97)) { 
    Res=Res+"w"; 
    return;
  };
  if ( b<int(pow(size, 2)*0.03)) { 
    Res=Res+"b"; 
    return;
  };
  Res=Res+"(";
  makeQtree(lev-1, x, y, size/2);
  // 以下に適切な３行を追加する
  makeQtree(lev-1,x+size/2,y,size/2);
  makeQtree(lev-1,x,y+size/2,size/2);
  makeQtree(lev-1,x+size/2,y+size/2,size/2);


  Res=Res+")";
  return;
}

int Is_White(int x, int y) {
  if (gray(x, y)>128) { 
    return(1);
  }
  return(0);
}

float  gray(int x, int y) {
  int pos = x + img_in.width*y;
  color c = img_in.pixels[pos];
  float r = red( c );
  float g = green( c );
  float b = blue( c );
  return( 0.3 * r + 0.59 * g + 0.11 * b);
}