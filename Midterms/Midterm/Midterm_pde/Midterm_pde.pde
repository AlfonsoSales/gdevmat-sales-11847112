void setup()
{
  size(1280, 720, P3D);
  camera(0, 0, Window.eyeZ, 0,0,0,0,-1,0);
}

Walker myWalker = new Walker();
Particle smallWalker = new Particle();
UpdateMovement update = new UpdateMovement();
MoveToHole hole = new MoveToHole();
int cnt = 0;


void draw()
{
  if(frameCount <= 1)
  {
    background(255);
  }
  
  if(frameCount <= 1)
  {
    update.center = new PVector((int)myWalker.position.x, (int)myWalker.position.y);
  }
  //set center
  if(frameCount <=  300)
  {
    myWalker.perlinWalk();
    
    fill(0, 0 ,0 );
    circle(update.center.x, update.center.y, 100);
    println("center:" + update.center.x + " " + update.center.y);
  }
  
  //set circles
  if(frameCount <= 100 && frameCount > 0)
  {
    smallWalker.randomColor(); //set color
    smallWalker.perlinWalk(); //set position
    update.circles[cnt] = new PVector((int)smallWalker.position.x, (int)smallWalker.position.y); //save circle position
    update.col[cnt] = smallWalker.colr; //save circle color
    println("circle #" + cnt + ":" + update.circles[cnt].x + " " + update.circles[cnt].y);
    println("color:" + update.col[cnt][0] + " " + update.col[cnt][1] + " " + update.col[cnt][2] + " " + update.col[cnt][3]);
    fill(update.col[cnt][0], update.col[cnt][1], update.col[cnt][2]);
    circle(update.circles[cnt].x, update.circles[cnt].y, 50);
    cnt++;
    
  } 
  
  if(frameCount > 300 && frameCount <= 300)
  {
      hole.render();
  }
  
  if (frameCount == 300)
  {
    cnt = 0;
    
  }
 



   if (frameCount > 300 && centeredCircles() ==0) //make this trigger below 300 instead of greater than (errors in centeredCircles as well as UpdateMovement if you try to do that just by changing the sign)
  {
    update.render();
    cnt++;
    if (centeredCircles() >= 1)
    {
      frameCount = 0;
      cnt = 0;
    }
  }
  
  
  
 
  }
  
  
 
   
  int centeredCircles()
  {
    println("check:");
    println("center: " + update.center.x + " " + update.center.y);
    println("second circle: " + cnt + " " + update.circles[cnt].x + " " + update.circles[cnt].y);
    
    int centered = 0;
    if (update.center.x == update.circles[cnt].x && update.center.y == update.circles[cnt].y)
    {
      centered = 1;
    }
    println ("the check is: " + centered);
    
    return centered;
  }
