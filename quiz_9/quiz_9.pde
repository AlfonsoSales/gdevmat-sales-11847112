Walker walker = new Walker();
Walker objects[] = new Walker[10];
PVector wind = new PVector(0.15, 0);
//PVector gravity = new PVector(0,-0.4);
int value = 1;


void setup()
{
  size(1280, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  
  //objects = new Walker[10];
  
  

  

  //walker.position.x = -500;
  //walker.position.y = 200;
  //walker.mass = 2;
  //walker.scale = walker.mass * 15;
 
}

void resetEverything()
{
int posY = 0;
int l = 0;
for (int i = 0; i < 10; i++)
  {
    posY = 2*(Window.windowHeight / 10) * (i-5);
    objects[i] = new Walker();
    objects[i].position = new PVector(-500, posY);
    objects[i].mass = l;
    objects[i].scale = objects[i].mass * 15;
    objects[i].setColor();
    l = i + 1;
    value = 0;
  } 
}


void draw()
{
  if (value == 1)
  {
    resetEverything();
  }
  background(255);
  for (Walker w : objects)
  {
    
    //Friction = -1 * mew * N * v
    float mew = 0.01f; //coefficient of friction
    float normal = 1;
    float frictionMagnitude = mew * normal;
    PVector friction = w.velocity.copy(); //copy copies current velocity of walker
    friction.mult(-1);
    friction.normalize();
    friction.mult(frictionMagnitude);
    PVector acceleration = new PVector(0.2 / w.mass, 0);
    w.applyForce(friction);
    w.applyForce(acceleration);
    
    //PVector gravity = new PVector(0,-0.15 * w.mass);
    w.render();
    w.update();
    //w.applyForce(wind);
    //w.applyForce(gravity);
    if ((w.position.x >= -0.5f) || (w.position.x <= 0.5f))
    {
      mew = 0.4f;
      w.applyForce(friction);
    }
    if (w.position.x >= Window.right)
    {
      w.position.x = Window.right;
      w.velocity.x *= -1;
    }
    
    if (w.position.y <= Window.bottom)
    {
      w.position.y = Window.bottom;
      w.velocity.y *= -1;
    }
  }
  
  //mouseClicked();


}

void mousePressed()
{if(mouseButton == LEFT)
{
  value = 1;
}
  
}
