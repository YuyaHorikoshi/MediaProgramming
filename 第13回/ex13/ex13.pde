float rx = 0.0;  // x軸まわりの回転角度
float ry = 0.0;  // y軸まわりの回転角度
float rz = 0.0;  // z軸まわりの回転角度

void setup() {
  size(800, 800, P3D);  // 3Dモード
  noFill();
  strokeWeight(0.01); 
  stroke(255);
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
  // 環境光の設定

  // 立方体を描画
  drawToruswf(0.2, 1, 10,40);
}





void drawToruswf(float r, float R, int n, int m) {
float[] P1,P2,P3,P4;
float dn,dm;
P1=new float[3];
P2=new float[3];
P3=new float[3];
P4=new float[3];
dn=360/n;
dm=360/m;
for(float t=0;t<360;t+=dm){
  for(float p=0;p<360;p+=dn){
    cal_p(r,R,t,p,P1);
    cal_p(r,R,t+dm,p,P2);
    cal_p(r,R,t+dm,p+dn,P3);
    cal_p(r,R,t,p+dn,P4);
    beginShape(QUADS);
    vertex(P1[0],P1[1],P1[2]);
    vertex(P2[0],P2[1],P2[2]);
    vertex(P3[0],P3[1],P3[2]);
    vertex(P4[0],P4[1],P4[2]);
    endShape();
  }
}
}

void cal_p(float r, float R,float t, float p, float[] pn)
{
     float td=t*3.141592/180; float pd=p*3.141592/180;
 pn[0]=(R+r*cos(pd))*cos(td);
 pn[1]=(R+r*cos(pd))*sin(td);
 pn[2]=r*sin(pd);

}

void keyPressed() {
  if (keyCode == UP)          { rx = rx - 0.1; }
  else if (keyCode == DOWN)   { rx = rx + 0.1; }
  else if (keyCode == LEFT)   { rz = rz - 0.1; }
  else if (keyCode == RIGHT)  { rz = rz + 0.1; }
  else if( key== 's' ) { saveFrame("save-50.jpg");}  // Save File Name
}