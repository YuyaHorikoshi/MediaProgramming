int[] D={3,4,7,5,1,2,9};
void setup(){
  noLoop();}
  
  void draw(){
    printlist(7);println();
    print("Max Value is");
    print(D[FindMax(6)]);
    println();
    save("ex4_3_0");
  }
  
  int FindMax(int n){
    if(n==0)return(0);
    int m=FindMax(n-1);
    if(D[n]<D[m]){return(m);}
    else{return(n);}
  }
  
  void printlist(int n){
    for(int k=0;k<n;k++){
      print(D[k]);print("");}
  }