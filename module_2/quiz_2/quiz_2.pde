void setup()
{
 size (1020, 720, P3D);
 camera (0,0, -(height/2.0)/tan(PI*30.0 / 180.0), 0, 0, 0, 0, -1, 0);
}

Walker myWalker = new Walker(); //creates an instance of Walker
Walker walkerB = new Walker();

void draw()
{
  
  myWalker.randomWalk();
  myWalker.randomColor();
  myWalker.render();
  walkerB.randomWalkB();
  walkerB.randomColor();
  walkerB.render();

 
}
