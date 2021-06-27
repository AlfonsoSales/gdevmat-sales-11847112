void setup()
{
  size(1280, 720, P3D);
  camera(0, 0, Window.eyeZ, 0,0,0,0,-1,0);
}

Walker myWalker = new Walker();
Walker randWalker = new Walker();
PVector position = new PVector();
PVector speed = new PVector(5,8);



void draw()
{
  background(255);
  
  
  
  myWalker.moveAndBounce();
  myWalker.perlinWalk();
  myWalker.randomColor();
  myWalker.render();
  
  randWalker.moveAndBounce();
  randWalker.randomWalk();
  randWalker.randomColor();
  randWalker.render();

}
