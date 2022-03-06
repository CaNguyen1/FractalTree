private double fractionLength = .8; 
private int smallestBranch = 10; 
private float branchAngle = .3;  
private int initialLength = 50;
private boolean rotation = false;
float hh = 100;
float ll = hh*1.618033;
public void setup() 
{   
  size(1000, 1000);
} 
public void draw() 
{   
  background(255);     
  stroke(102, 51, 0);
  strokeWeight(10);
  line(500, 600, 500, 500-initialLength);   
  drawThing3(500, 600-initialLength, initialLength, 3*PI/2, 8);
  if (rotation == false) {
    branchAngle += 0.005;
  }
  fractalSquareRect(ll, hh);
} 

public void drawThing3(int x, int y, double branchLength, float angle, float strokee) 
{   
  strokeWeight(strokee);
  float angle1 = angle + branchAngle;
  float middleAngle = angle;
  float angle2 = angle - branchAngle;
  int x1 = x+(int)(cos(angle1)*branchLength);
  int y1 = y+(int)(sin(angle1)*branchLength);
  int xMiddle = x+(int)(cos(middleAngle)*(branchLength+6));
  int yMiddle = y+(int)(sin(middleAngle)*(branchLength+6));
  int x2 = x+(int)(cos(angle2)*branchLength);
  int y2 = y+(int)(sin(angle2)*branchLength);
  stroke(102, 51, 0);
  line(x, y, x1, y1);
  line(x, y, xMiddle, yMiddle);
  line(x, y, x2, y2);
  if (strokee > 3)
  {
    drawThing3(x1, y1, branchLength*fractionLength, angle1, strokee/1.3);
    drawThing3(xMiddle, yMiddle, branchLength*fractionLength, middleAngle, strokee/1.3);
    drawThing3(x2, y2, branchLength*fractionLength, angle2, strokee/1.3);
  }
} 
void fractalSquareRect(float l, float h)
{ 
  if (h > 0)
    fractalSquareRect(h, l-h);
}
