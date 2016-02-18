private double fractionLength = .8; 
private int smallestBranch = 10; 
public double branchAngle = .002;  
public void setup() 
{   
	size(900,800);    
	//noLoop(); 
} 
public void draw() 
{   
	background(255);   
	stroke(100,214,124);   
	line(width/2,height,width/2,height-200);   
	drawBranches(width/2,height-200,100,3*Math.PI/2);
	branchAngle=branchAngle+0.01;
} 
public void drawBranches(int x,int y, double branchLength, double angle) 
{   
	double angle1 = angle + branchAngle;
	double angle2 = angle - branchAngle;
	double nbranch = branchLength*fractionLength;
	int endX1 = (int)(branchLength*Math.cos(angle1) + x);
	int endY1 = (int)(branchLength*Math.sin(angle1) + y);
	int endX2 = (int)(branchLength*Math.cos(angle2) + x);
	int endY2 = (int)(branchLength*Math.sin(angle2) + y);
		line(x, y, endX1, endY1);
		line(x, y, endX2, endY2);
	if(branchLength>smallestBranch){
		drawBranches(endX1, endY1, nbranch, angle1);
		drawBranches(endX2, endY2, nbranch, angle2);
	}


}