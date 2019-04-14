float rx = 0.0;  // x軸まわりの回転角度
float ry = 0.0;  // y軸まわりの回転角度
float rz = 0.0;  // z軸まわりの回転角度

void setup() {
  size(800, 800, P3D);  // 3Dモード
  //noFill();
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
//drawConeRend();
drawCylinderRend();
  
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
float br=Bright(P1,P2,P3);
fill(br,0,0);
noStroke();
beginShape(TRIANGLES);
vertex(P1[0],P1[1],P1[2]);
vertex(P2[0],P2[1],P2[2]);
vertex(P3[0],P3[1],P3[2]);
endShape();
br=Bright(P2,P1,P4);
fill(br,0,0);
beginShape(TRIANGLES);
vertex(P2[0],P2[1],P2[2]);
vertex(P1[0],P1[1],P1[2]);
vertex(P4[0],P4[1],P4[2]);
endShape();
 }  
}

void drawCylinderRend() {
  float[] P1,P2,P3,P4,P5,P6;
  int n=48;
  float r,tdi,tdip1,dt;
  stroke(255); 
  P1=new float[3];P2=new float[3];P3=new float[3];
  P4=new float[3];P5=new float[3];P6=new float[3];
  dt=2*3.1415/float(n);
  for(int i=0;i<n;i++){
    tdi=dt*float(i);tdip1=dt*float(i+1);

P1[0]=cos(tdi);
P1[1]=sin(tdi);
P1[2]=0;
P2[0]=cos(tdip1);
P2[1]=sin(tdip1);
P2[2]=0;
P3[0]=0;
P3[1]=0;
P3[2]=0;
P4[0]=0;
P4[1]=0;
P4[2]=1;
P5[0]=cos(tdi);
P5[1]=sin(tdi);
P5[2]=1;
P6[0]=cos(tdip1);
P6[1]=sin(tdip1);
P6[2]=1;
noStroke();
float br=Bright(P1,P2,P3);
fill(br,0,0);
beginShape(TRIANGLES);
vertex(P1[0],P1[1],P1[2]);
vertex(P2[0],P2[1],P2[2]);
vertex(P3[0],P3[1],P3[2]);
endShape();
br=Bright(P4,P5,P6);
fill(br,0,0);
beginShape(TRIANGLES);
vertex(P4[0],P4[1],P4[2]);
vertex(P5[0],P5[1],P5[2]);
vertex(P6[0],P6[1],P6[2]);
endShape();
br=Bright2(P1,P2,P6,P5);
fill(br,0,0);
beginShape(QUAD);
vertex(P1[0],P1[1],P1[2]);
vertex(P2[0],P2[1],P2[2]);
vertex(P6[0],P6[1],P6[2]);
vertex(P5[0],P5[1],P5[2]);
endShape();
 }  
}

float Bright(float P1[], float P2[], float P3[]) {
  float[] D1, D2,N;
  D1=new float[3];
  D2=new float[3];
  N=new float[3];
  float[] Light={0,1,1};
  for(int i=0;i<3;i++){
  D1[i]=P2[i]-P1[i];
  D2[i]=P3[i]-P2[i];
  }
    N[0]=D1[1]*D2[2]-D1[2]*D2[1];
    N[1]=D1[2]*D2[0]-D1[0]*D2[2];
    N[2]=D1[0]*D2[1]-D1[1]*D2[0];
    
    float nN=sqrt(N[0]*N[0]+N[1]*N[1]+N[2]*N[2]);
    
    N[0]=N[0]/nN;
    N[1]=N[1]/nN;
    N[2]=N[2]/nN;
    
    float nL=sqrt(Light[0]*Light[0]+Light[1]*Light[1]+Light[2]*Light[2]);
    
    Light[0]=Light[0]/nL;
    Light[1]=Light[1]/nL;
    Light[2]=Light[2]/nL;

    float br=(Light[0]*N[0]+Light[1]*N[1]+Light[2]*N[2]);
    return(br*255);
}

float Bright2(float P1[], float P2[], float P3[],float P4[]) {
  float[] D1, D2,D3,D4,N;
  D1=new float[3];
  D2=new float[3];
  D3=new float[3];
  D4=new float[3];
  N=new float[6];
  float[] Light={0,1,1};
  for(int i=0;i<3;i++){
  D1[i]=P2[i]-P1[i];
  D2[i]=P3[i]-P2[i];
  D3[i]=P4[i]-P3[i];
  D4[i]=P1[i]-P4[i];
  }
    N[0]=D1[1]*D2[2]-D1[2]*D2[1];
    N[1]=D1[2]*D2[0]-D1[0]*D2[2];
    N[2]=D1[0]*D2[1]-D1[1]*D2[0];
    
    N[3]=D3[1]*D4[2]-D3[2]*D4[1];
    N[4]=D3[2]*D4[0]-D3[0]*D4[2];
    N[5]=D3[0]*D4[1]-D4[1]*D4[0];
    
    float nN1=sqrt(N[0]*N[0]+N[1]*N[1]+N[2]*N[2]);
    float nN2=sqrt(N[3]*N[3]+N[4]*N[4]+N[5]*N[5]);
    
    N[0]=N[0]/nN1;
    N[1]=N[1]/nN1;
    N[2]=N[2]/nN1;
    N[3]=N[3]/nN2;
    N[4]=N[4]/nN2;
    N[5]=N[5]/nN2;
    
    float nL1=sqrt(Light[0]*Light[0]+Light[1]*Light[1]+Light[2]*Light[2]);
    
    
    Light[0]=Light[0]/nL1;
    Light[1]=Light[1]/nL1;
    Light[2]=Light[2]/nL1;

    float br=(Light[0]*N[0]+Light[1]*N[1]+Light[2]*N[2]+Light[0]*N[3]+Light[1]*N[4]+Light[2]*N[5]);
    return(br*255);
}

void keyPressed() {
  if (keyCode == UP)          { rx = rx + 0.1; }
  else if (keyCode == DOWN)   { rx = rx - 0.1; }
  else if (keyCode == LEFT)   { rz = rz - 0.1; }
  else if (keyCode == RIGHT)  { rz = rz + 0.1; }
  else if( key== 's' ) { saveFrame("save-50_2.jpg");}  // Save File
}