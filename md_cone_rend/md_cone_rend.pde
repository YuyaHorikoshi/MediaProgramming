float rx = 0.0;  // x軸まわりの回転角度
float ry = 0.0;  // y軸まわりの回転角度
float rz = 0.0;  // z軸まわりの回転角度

void setup() {
  size(800, 800, P3D);  // 3Dモード
  strokeWeight(0.0075); 
}

void draw() {
  // 画面をリフレッシュ
  background(64);
  ortho(-width/2, width/2, -height/2, height/2);  // 並行投影 

  // 画面の中心に原点を移動
  translate(width/2, height/2, 0);
  rotateX(rx);  // x軸まわりの回転
  rotateY(ry);  // y軸まわりの回転
  rotateZ(rz);  // z軸まわりの回転
  scale(250);    // 250倍に拡大

// 立方体を描画(演習６－１および６－２)
 drawConeRend();
// drawCylinderwf();
  
}

void drawConeRend() {
  float[] P1,P2,P3,P4;
  int n=36;
  float r,tdi,tdip1,dt;
  stroke(255); 
  P1=new float[3];P2=new float[3];P3=new float[3];P4=new float[3];
  dt=2*3.1415/float(n);
  for(int i=0;i<n;i++){
     tdi=dt*float(i);tdip1=dt*float(i+1);     
      //演習６－１
      //①から④の座標の計算
      //側面(①②③)と底面(①②④)の三角形の描画 
P1[0]=cos(tdi);
P1[1]=sin(tdi);
P1[2]=0;
P2[0]=cos(tdip1);
P2[1]=sin(tdip1);
P2[2]=0;
P3[0]=0;
P3[1]=0;
P3[2]=1;
P4[0]=0;
P4[1]=0;
P4[2]=0;

float br1=Bright(P1,P2,P3);
fill(br1,0,0);

beginShape(TRIANGLES);
vertex(P1[0],P1[1],P1[2]);
vertex(P2[0],P2[1],P2[2]);
vertex(P3[0],P3[1],P3[2]);
endShape();

float br2=Bright(P2,P1,P4);
fill(br2,0,0);

beginShape(TRIANGLES);
vertex(P2[0],P2[1],P2[2]);
vertex(P1[0],P1[1],P1[2]);
vertex(P4[0],P4[1],P4[2]);
endShape();
 }  
}

void drawCylinderwf() {
  float[] P1,P2,P3,P4,P5,P6;
  int n=36;
  float r,tdi,tdip1,dt;
  stroke(255); 
  P1=new float[3];P2=new float[3];P3=new float[3];
  P4=new float[3];P5=new float[3];P6=new float[3];
  dt=2*3.1415/float(n);
  for(int i=0;i<n;i++){
    tdi=dt*float(i);tdip1=dt*float(i+1);
     
      //演習６－２
      //必要な座標の計算
      //側面(四辺形)と底面(二つの三辺形)の描画 

 }  
}

float Bright(float P1[],float P2[],float P3[]){
  float[] D1,D2;
  D1=new float[3];D2=new float[3];
  float[] N=new float[3];
  float[] L={0,1,1,};
  for(int i=0;i<3;i++){
  D1[i]=P2[i]-P1[i];
  D2[i]=P3[i]-P2[i];
  }
  N[0]=D1[1]*D2[2]-D1[2]*D2[1];
  N[1]=D1[2]*D2[0]-D1[0]*D2[2];
  N[2]=D1[0]*D2[1]-D1[1]*D2[0];
  
  float magN=sqrt(N[0]*N[0]+N[1]*N[1]+N[2]*N[2]);
  
  N[0]=N[0]/magN;
  N[1]=N[1]/magN;
  N[2]=N[2]/magN;
  
  float magL=sqrt(L[0]*L[0]+L[1]*L[1]+L[2]*L[2]);
  
  float br;
  L[0]=L[0]/magL;
  L[1]=L[1]/magL;
  L[2]=L[2]/magL;
  br=(N[0]*L[0]+N[1]*L[1]+N[2]*L[2]);
  return(br*255);
}


void keyPressed() {
  if (keyCode == UP)          { rx = rx + 0.1; }
  else if (keyCode == DOWN)   { rx = rx - 0.1; }
  else if (keyCode == LEFT)   { rz = rz - 0.1; }
  else if (keyCode == RIGHT)  { rz = rz + 0.1; }
  else if( key== 's' ) { saveFrame("save-50.jpg");}  // Save File
}