int middle = floor(width * 4.8);
Node[] _nodeArr = {};

void setup() {
   size(945, 708);
   int no_nodes = int(random(0, 5));
   for(int i = 0; i <= no_nodes; i++) {
       int xCoord = int(random(0, 945)); 
       int yCoord = int(random(0,708));
       
       Node n = new Node(xCoord, yCoord);
       _nodeArr = (Node[])append(_nodeArr, n);       
   }
   
   int rVal = int(random(0, 255));
   int bVal = int(random(0,255));
   int gVal = int(random(0,255));
   background(rVal, bVal, gVal);
   //smooth();
   //strokeWeight(1);
   //fill(150, 50);
   frameRate(1000);
}

void draw() {
  int gamespeed = 100;
  for(int i = 0; i < gamespeed; i++) { 
      for(int j = 0; j < _nodeArr.length; j++) {
          _nodeArr[j].updateMe();  
      }
  }
  
//  print("um");
  //Circle[] sd = m1.monolith_circleArr;
//  print(_circleArr.length);
  // saveFrame();
}

class Node {
  float x, y;
  
  Walker[] _walkerArr = {};
  
  Node(float posX, float posY) {
      x = posX;
      y = posY;
      
      int no_of_walkers = int(random(1, 5));
      
      
      for(int i = 0; i < no_of_walkers; i++) {
          int stroke = int(random(0, 255));
          Walker w = new Walker(x, y, stroke);
          _walkerArr = (Walker[])append(_walkerArr, w);
         
      }
  }
  
  void drawMe() {
    for(int i = 0; i < _walkerArr.length; i++) {
        _walkerArr[i].updateMe();      
    }
  }
  
  void updateMe() {
      drawMe();  
  }
}

class Walker {
  float x, y;
  int stroke;
  
  Walker(float posX, float posY, int s) {
      x = posX;
      y = posY;
      stroke = s;
      this.drawMe();
  }
 
  void drawMe() {
    stroke(stroke);
    int bridgey = height - int(y);
    int bridgex = width - int(x);
    point(x, y);
    point(bridgex, bridgey);
  }
  
 void updateMe() {
  //randomly move
  x += random(-1, 1);
  y += random(-1, 1);
  
  //prevent going off left or right
  if(x < 0){
    x = width;
  }
  if(x > width){
    x = 0;
  }

  //prevent going off top or bottom
  if(y < 0){
    y = height;
  }
  if(y > height){
    y = 0;
  }
 
    
  drawMe();
 }
}
