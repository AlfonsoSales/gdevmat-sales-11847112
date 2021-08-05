Walker walker = new Walker();
Walker objects[] = new Walker[10];
PVector wind = new PVector(0.15, 0);
PVector gravity = new PVector(0,-0.4);


void setup()
{
  size(1280, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  
  //objects = new Walker[10];
  
  int l = 0;
  for (int i = 0; i < 10; i++)
  {
    objects[i] = new Walker();
    objects[i].position.x = -500;
    objects[i].position.y = 200;
    objects[i].mass = l;
    objects[i].scale = objects[i].mass * 15;
    objects[i].setColor();
    l = i + 1;
  }
  //walker.position.x = -500;
  //walker.position.y = 200;
  //walker.mass = 2;
  //walker.scale = walker.mass * 15;
 
}



void draw()
{
  background(80);
  for (int j = 0; j<10; j++)
  {
    
    objects[j].render();
    objects[j].update();
    objects[j].applyForce(wind);
    objects[j].applyForce(gravity);
    if ((objects[j].position.y <= Window.bottom) || (objects[j].position.y >= Window.top))
  {
    objects[j].velocity.y *= -1; //newtons third law of motion
  }
  if ((objects[j].position.x <= Window.left) || (objects[j].position.x >= Window.right))
  {
    objects[j].velocity.x *= -1;
  }
  }
  //walker.render();
  //walker.update();
  //walker.applyForce(wind);
  //walker.applyForce(gravity);
  
  //if ((walker.position.y <= Window.bottom) || (walker.position.y >= Window.top))
  //{
  //  walker.velocity.y *= -1; //newtons third law of motion
  //}
  //if ((walker.position.x <= Window.left) || (walker.position.x >= Window.right))
  //{
  //  walker.velocity.x *= -1;
  //}
  
  
}
