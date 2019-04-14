float rx = 0.0;  // x軸まわりの回転角度
float ry = 0.0;  // y軸まわりの回転角度
float rz = 0.0;  // z軸まわりの回転角度

void setup() {
  size(800, 800, P3D);  // 3Dモード
  noFill();
  strokeWeight(0.01); 
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
drawConewf();
//drawCylinderwf();
  
}

void drawConewf() {
  float[] P1,P2,P3,P4;
  int n=48;
  float r,tdi,tdip1,dt;
  stroke(255); 
  P1=new float[3];P2=new float[3];P3=new float[3];P4=new float[3];
  dt=2*3.1415/float(n);
  for(int i=0;i<n;i++){
     tdi=dt*float(i);tdip1=dt*float(i+1);

P1[0]=sin(tdi);
P1[1]=cos(tdi);
P1[2]=0;
P2[0]=sin(tdip1);
P2[1]=cos(tdip1);
P2[2]=0;
P3[0]=0;
P3[1]=0;
P3[2]=1;
P4[0]=0;
P4[1]=0;
P4[2]=0;

beginShape(TRIANGLES);
vertex(P1[0],P1[1],P1[2]);
vertex(P2[0],P2[1],P2[2]);
vertex(P3[0],P3[1],P3[2]);
endShape();
beginShape(TRIANGLES);
vertex(P2[0],P2[1],P2[2]);
vertex(P1[0],P1[1],P1[2]);
vertex(P4[0],P4[1],P4[2]);
endShape();
 }  
}

void drawCylinderwf() {
  float[] P1,P2,P3,P4,P5,P6;
  int n=48;
  float r,tdi,tdip1,dt;
  stroke(255); 
  P1=new float[3];P2=new float[3];P3=new float[3];
  P4=new float[3];P5=new float[3];P6=new float[3];
  dt=2*3.1415/float(n);
  for(int i=0;i<n;i++){
    tdi=dt*float(i);tdip1=dt*float(i+1);

P1[0]=sin(tdi);
P1[1]=cos(tdi);
P1[2]=0;
P2[0]=sin(tdip1);
P2[1]=cos(tdip1);
P2[2]=0;
P3[0]=0;
P3[1]=0;
P3[2]=0;
P4[0]=0;
P4[1]=0;
P4[2]=1;
P5[0]=sin(tdi);
P5[1]=cos(tdi);
P5[2]=1;
P6[0]=sin(tdip1);
P6[1]=cos(tdip1);
P6[2]=1;
beginShape(TRIANGLES);
vertex(P1[0],P1[1],P1[2]);
vertex(P2[0],P2[1],P2[2]);
vertex(P3[0],P3[1],P3[2]);
endShape();
beginShape(TRIANGLES);
vertex(P4[0],P4[1],P4[2]);
vertex(P5[0],P5[1],P5[2]);
vertex(P6[0],P6[1],P6[2]);
endShape();
beginShape(QUAD);
vertex(P1[0],P1[1],P1[2]);
vertex(P2[0],P2[1],P2[2]);
vertex(P6[0],P6[1],P6[2]);
vertex(P5[0],P5[1],P5[2]);
endShape();
 }  
}

void keyPressed() {
  if (keyCode == UP)          { rx = rx + 0.1; }
  else if (keyCode == DOWN)   { rx = rx - 0.1; }
  else if (keyCode == LEFT)   { rz = rz - 0.1; }
  else if (keyCode == RIGHT)  { rz = rz + 0.1; }
  else if( key== 's' ) { saveFrame("save12_15_2.jpg");}  // Save File
}