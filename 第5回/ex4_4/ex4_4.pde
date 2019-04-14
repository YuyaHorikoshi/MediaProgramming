float sth,cth; 

void setup() {
   size(1000,1000);
   background(0);
   float th=30*3.141592/180.0;
   sth=sin(th); cth=cos(th); 
   stroke(color(255,255,255));
}

void draw(){
  triangle(6,700.0, 500,10);
  save("ex4_4.jpg");
  }

void triangle(int lev,float r, float x,float y)
{
  if( lev==0){
    triangle(x,y,x-r*sth,y+r*cth,x+r*sth,y+r*cth);                    //＜＝　頂点(x,y) 一辺がｒの正三角形を描く
  }
 else
 { 
   triangle(lev-1,r/2.0,x,y);// 　＜＝①の呼び出し
   triangle(lev-1,r/2.0,x-r/2*sth,y+r/2*cth); 
   triangle(lev-1,r/2.0,x+r/2*sth,y+r/2*cth);//＜＝　②，③の呼び出し
 }
}