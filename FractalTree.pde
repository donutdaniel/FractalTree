private double fractionLength = .8; 
private int smallestBranch = 20; 
public double branchAngle = 0;  
public int poo = 0;
public int i = 0;
public void setup() 
{   
	size(900,800);    
	//noLoop(); 
} 
public void draw() 
{   
	if(i>3){
		i=0;
	}
	background(255);   
	stroke(100,poo,124);  
	strokeWeight(2); 
	line(width/2,height,width/2,height-200);   
	drawBranches(width/2,height-200,100,3*Math.PI/2);
	branchAngle=branchAngle+0.01;
	poo++;
	if(poo>255){
		poo=0;
	}
} 
public void mouseClicked(){
	i++;
	branchAngle=0;
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
		if(i==0){
			drawBranches(endX1, endY1, nbranch, angle1);
			drawBranches(endX2, endY2, nbranch, angle2);
		} else if(i==1){
			drawBranches(endX1, endY1, nbranch, angle1);
			drawBranches(endX2, endY2, nbranch, angle1);
		} else if(i==2){
			drawBranches(endX1, endY1, nbranch, angle2);
			drawBranches(endX2, endY2, nbranch, angle2);
		} else if(i==3){
			drawBranches(endX1, endY1, nbranch, angle2);
			drawBranches(endX2, endY2, nbranch, angle1);
		}
	}


}