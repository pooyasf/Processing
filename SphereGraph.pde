float x = 0;
float[] RX,RY,RZ;
int density = 1000;
int R;

void setup() {
  size(1000, 1000, P3D);
  background(0);
  noLoop();
  frameRate(30);
  R = 100;
  RX = new float[density];
  RY = new float[density];
  RZ = new float[density];
  for(int i = 0; i < density ; i++){
      RX[i] = random(-R,+R);
      RY[i] = random(-sqrt(pow(R,2)-pow(RX[i],2)),+sqrt(pow(R,2)-pow(RX[i],2)));
      if(random(0,1) < 0.5) {
        RZ[i] = +sqrt( pow(R,2) - pow(RX[i],2) - pow(RY[i],2) );  
      } else {
        RZ[i] = -sqrt( pow(R,2) - pow(RX[i],2) - pow(RY[i],2) );
      }
    }  
    
}

void draw() {
     
  
     background(0);
     lights();
     camera(0, 0, 600-x*60, 0, 0, -x*60, 0, 1, 0);
     
     
     stroke(150);
     strokeWeight(2);
     x += 0.009;
     pushMatrix();
     rotateZ(x/2);
     rotateX(x/2);
     for(int i = 0; i < density-1 ; i++){
        
        
        stroke(150);
        strokeWeight(2);
        point(RX[i],RY[i],RZ[i]);
        stroke(40);
        strokeWeight(0.4);
        line(RX[i],RY[i],RZ[i],RX[i+1],RY[i+1],RZ[i+1]);
        
     }   
     popMatrix();
     
   
   
    
  
 

   //saveFrame("cplx-######.png");
}


void mousePressed() {
  loop();
}
