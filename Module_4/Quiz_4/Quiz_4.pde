void setup()
{
  size(1280, 720, P3D);
  background(255);
  camera(0,0,-(height/2.0)/tan(PI*30.0/180.0),0,0,0,0,-1,0);
}

Walker perlinWalker = new Walker();

void draw()
{
  if(frameCount <= 300)
  {
  perlinWalker.render();
  perlinWalker.randomColor();
  perlinWalker.perlinWalk();
  println(frameCount);
  }
  else if(frameCount > 300)
  {
    background(255);
    frameCount = 0;
  }
  
 
}
