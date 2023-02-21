Walker[] snow;
float snowY = 460;
private double fractionLength = .8; 
private int smallestBranch = 10; 
private double branchAngle = 0.6;  
public void setup(){   
  size(640,480);    
  //noLoop(); 
  snow = new Walker[200];
  for (int i = 0; i<snow.length; i++) {
    snow[i] = new Walker();
  }
} 
class Walker {
  int myX, myY;
  int myColor;
  Walker() {
    myX = (int)(Math.random()*640);
    myY = 0;
    myColor = color(255);
  }
  void walk() {
    myX = myX + (int)(Math.random()*5)-2;
    myY = myY + (int)(Math.random()*5)+1;
    if (myY > snowY) {
      snowY-=0.1;
      fill(255);
      myY = 0;
    }
  }
  void show() {
    ellipse(myX, myY, 15, 15);
  }
}
public void draw(){   
  background(0);   
  fill(255);
  stroke(2);
  rect(-10, snowY, 650, 20+(height-snowY));
  for (int i = 0; i<snow.length; i++) {
    snow[i].show();
    snow[i].walk();
  }
  stroke(255,255,255);   
  line(320,480,320,380);   
  drawBranches(320,380,100,3*Math.PI/2);
} 
public void drawBranches(int x,int y, double branchLength, double angle){   
  double angle1 = angle+branchAngle;
  double angle2 = angle-branchAngle;
  branchLength*=fractionLength;
  int endX1 = (int)(branchLength*Math.cos(angle1)+x);
  int endY1 = (int)(branchLength*Math.sin(angle1)+y);
  int endX2 = (int)(branchLength*Math.cos(angle2)+x);
  int endY2 = (int)(branchLength*Math.sin(angle2)+y);
  line(x,y,endX1,endY1);
  line(x,y,endX2,endY2);
  if(branchLength>smallestBranch){
    drawBranches(endX1,endY1,branchLength, angle1);
    drawBranches(endX2,endY2,branchLength, angle2);
  }
} 
