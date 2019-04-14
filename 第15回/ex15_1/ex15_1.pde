float rx = 0.0;  // x軸まわりの回転角度
float ry = 0.0;  // y軸まわりの回転角度
float rz = 0.0;  // z軸まわりの回転角度

void setup() {
  size(800, 800, P3D);  // 3Dモード
  noStroke();           // 枠線は描画しない
  noFill();
  //stroke(255); 
  strokeWeight(0.01);
}


void draw() {
  // 画面をリフレッシュ
  background(64);
  ortho(-width/2, width/2, -height/2, height/2);  // 並行投影 

  // 画面の中心に原点を移動
  translate(width/2, height/2, -50);
  rotateX(rx);  // x軸まわりの回転
  rotateY(ry);  // y軸まわりの回転
  rotateZ(rz);  // z軸まわりの回転
  scale(250);    // 250倍に拡大
  translate(0, 0, 0); // 曲面の中心に移動


  // 球を描画
  drawSpherewf();
}


void drawSpherewf() {
  float[] P1, P2, P3, P4;
  float d=10;
  float r=1.0;
  P1=new float[3];
  P2=new float[3];
  P3=new float[3];
  P4=new float[3];
  for (float u=0; u<360.0; u+=d) {
    for (float v=-90; v<90; v+=d)
    {
      /* この部分を完成させなさい　*/
cal_c_point(r,u,v,P1);
cal_c_point(r,u+d,v,P2);
cal_c_point(r,u+d,v+d,P3);
cal_c_point(r,u,v+d,P4);
float br=Bright(P1,P2,P3);
fill(br,0,0);
      beginShape(QUADS);
      vertex(P1[0], P1[1], P1[2]);
      vertex(P2[0], P2[1], P2[2]);
      vertex(P3[0], P3[1], P3[2]);
      vertex(P4[0], P4[1], P4[2]);
      endShape();
    }
  }
}

 




void cal_c_point(float r, float u, float v, float[] pn)
{
  float td=u*3.141592/180; 
  float pd=v*3.141592/180;
  /* この部分を完成させなさい　*/
  pn[0]=r*cos(pd)*cos(td);
  pn[1]=r*cos(pd)*sin(td);
  pn[2]=r*sin(pd);;
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

void keyPressed() {
  if (keyCode == UP) { 
    rx = rx - 0.1;
  } else if (keyCode == DOWN) { 
    rx = rx + 0.1;
  } else if (keyCode == LEFT) { 
    rz = rz - 0.1;
  } else if (keyCode == RIGHT) { 
    rz = rz + 0.1;
  } else if ( key== 's' ) { 
    saveFrame("spherewf.jpg");
  }  // Save File Name
}