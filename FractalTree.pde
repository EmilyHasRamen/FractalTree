private double fractionLength = .8; 
private int smallestBranch = 10; 
private double branchAngle = .3;  
private int startLength = 150;
public void setup() 
{   
	size(1000,1000);    
	noLoop(); 
} 
public void draw() 
{   
	background(0);   
	stroke(110,70, 25);  
	strokeWeight((int)(startLength/10)); 
	line(500,1000,500,1000-startLength);   
	drawBranches(500,1000-startLength,startLength,3*Math.PI/2);  //will add later 
} 
public void drawBranches(int x,int y, double branchLength, double angle) 
{   
	//your code here    
	double angle1=angle + branchAngle;
	double angle2=angle - branchAngle;
	double lengthOne = branchLength*fractionLength;
	int endX1 = (int)(branchLength*Math.cos(angle1) + x);
	int endY1 = (int)(branchLength*Math.sin(angle1) + y);	
	int endX2 = (int)(branchLength*Math.cos(angle2) + x);
	int endY2 = (int)(branchLength*Math.sin(angle2) + y);
	int r = (int)(110*(branchLength/startLength));
	int g = 70 + (int)(185*(1-(branchLength/startLength)));
	int	b = (int)(25*(branchLength/startLength));
	stroke(r,g,b);
	strokeWeight((int)(branchLength/10));
	line(x, y, endX1, endY1); 
	line(x, y, endX2, endY2); 
	if(branchLength>smallestBranch)
	{
		drawBranches(endX1, endY1, lengthOne, angle1); 
		drawBranches(endX2, endY2, lengthOne, angle2); 
	}

}
