Walker myWalker;
Particle[] smallWalker = new Particle[100];
UpdateMovement moveCircles;
int cnt = 0;

void setup()
{
  size(1280, 720, P3D);
  camera(0, 0, Window.eyeZ, 0,0,0,0,-1,0);
  
  for (int a=0; a<100; a++)
  {
    smallWalker[a] = new Particle();
  }
  
  myWalker = new Walker();
  moveCircles = new UpdateMovement();
}

void draw()
{
  //set center
  if(frameCount == 1)
  {
    background(255);
    myWalker.randomWalk();
    myWalker.position.x = (int)myWalker.position.x;
    myWalker.position.y = (int)myWalker.position.y;
    println("center:" + myWalker.position.x + " " + myWalker.position.y);
    myWalker.render();
    //fill(0, 0, 0);
    //circle(myWalker.position.x, myWalker.position.y, 50);
    //update.center = new PVector((int)myWalker.position.x, (int)myWalker.position.y);
  }
  //set center
  //if(frameCount <=  300)
  //{
  //  myWalker.perlinWalk();
    
  //  fill(0, 0, 0);
  //  //circle(update.center.x, update.center.y, 100);
  //  //println("center:" + update.center.x + " " + update.center.y);
  //}
  
  //set circles
  if(frameCount < 100 && frameCount > 0)
  {
    smallWalker[cnt].randomColor(); //set color
    smallWalker[cnt].randomWalk(); //set position
    smallWalker[cnt].position.x = (int)smallWalker[cnt].position.x;
    smallWalker[cnt].position.y = (int)smallWalker[cnt].position.y;
    smallWalker[cnt].myWalker.position = new PVector((int)myWalker.position.x, (int)myWalker.position.y); //set center 
    println("center:" + smallWalker[cnt].myWalker.position.x + " " + smallWalker[cnt].myWalker.position.y);
    println("circle #" + cnt + ": " + smallWalker[cnt].position.x + " " + smallWalker[cnt].position.y);
    smallWalker[cnt].render();
    myWalker.render();
    
    //fill(smallWalker[cnt].colr[0], smallWalker[cnt].colr[1], smallWalker[cnt].colr[2]);
    //circle(smallWalker[cnt].position.x, smallWalker[cnt].position.y, smallWalker[cnt].size);
    //fill(0, 0, 0);
    //circle(smallWalker[cnt].myWalker.position.x, smallWalker[cnt].myWalker.position.y, 50);
    //update.circles[cnt] = new PVector((int)smallWalker.position.x, (int)smallWalker.position.y); //save circle position
    //update.col[cnt] = smallWalker.colr; //save circle color
    //println("circle #" + cnt + ":" + update.circles[cnt].x + " " + update.circles[cnt].y);
    //println("color:" + update.col[cnt][0] + " " + update.col[cnt][1] + " " + update.col[cnt][2] + " " + update.col[cnt][3]);
    //fill(update.col[cnt][0], update.col[cnt][1], update.col[cnt][2]);
    //circle(update.circles[cnt].x, update.circles[cnt].y, 50);
    cnt++;
    
  } 
  
  if (frameCount == 100)
  {
    cnt = 0;
    moveCircles.center.position = new PVector(myWalker.position.x, myWalker.position.y);
    for (int a=0; a<100; a++)
    {
      println("a:" + a);
      moveCircles.circles[a].position = new PVector(smallWalker[a].position.x, smallWalker[a].position.y);
      moveCircles.circles[a].colr = smallWalker[a].colr;
    }
    //moveCircles.render();
  }
  
  if(frameCount > 100 && frameCount <= 300)
  {
    moveCircles.render();
    //for (int a=0; a<100; a++)
    //{
      
    //}
      //hole.render();
  }
  
  if (frameCount == 300)
  {
    cnt = 0;
    frameCount = 0;
  }
  //  if (frameCount > 300 && centeredCircles() ==0) //make this trigger below 300 instead of greater than (errors in centeredCircles as well as UpdateMovement if you try to do that just by changing the sign)
  //{
  //  update.render();
  //  cnt++;
   
    
   
  //  if (centeredCircles() >= 1)
  //  {
  //    frameCount = 0;
  //    cnt = 0;
  //  }
  // }
}
