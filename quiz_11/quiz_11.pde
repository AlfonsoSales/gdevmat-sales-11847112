Walker walker = new Walker();
Walker small = new Walker();
Walker objects[] = new Walker[10];
PVector wind = new PVector(0.15, 0);
//PVector gravity = new PVector(0,-0.4);
int value = 1;


void setup()
{
  size(1280, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  
  //objects = new Walker[10];
  
  walker.position = new PVector(0, 0);
  walker.mass = 20;
  walker.scale = walker.mass * 10;
  
  small.position = new PVector(150, 150);
  small.mass = 10;
  small.scale = small.mass * 10;

  

  //walker.position.x = -500;
  //walker.position.y = 200;
  //walker.mass = 2;
  //walker.scale = walker.mass * 15;
 
}

void resetEverything()
{
//int posY = 0;
int l = 0;
for (int i = 0; i < 10; i++)
  {
    //posY = 2*(Window.windowHeight / 10) * (i-5);
    objects[i] = new Walker();
    objects[i].randomWalk(); //location
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
  
  int j, k;
  
  walker.update();
  walker.nocirclerender();
  
  for (j=0; j<10; j++)
  {
    objects[j].update();
    objects[j].render();
    objects[j].applyForce(walker.calculateAttraction(objects[j]));
  }
  
  
  //int j = 0;
  //int k = 9;
  //for (j = 0; j < 10; j++)
  //{
    
  //  objects[j].update();
  //  objects[j].render();
  
  //  objects[j].applyForce(objects[k].calculateAttraction(objects[j]));
  
  //  for (k = 9; k >= 0; k--)
  //   {
  //      objects[k].update();
  //      objects[k].render();
  //      objects[k].applyForce(objects[j].calculateAttraction(objects[k]));
  //   }
     

  //}
 
  
  
  
   
    //if (w.position.x >= Window.right)
   // {
    //  w.position.x = Window.right;
    //  w.velocity.x *= -1;
    //}
    
    //if (w.position.y <= Window.bottom)
    //{
     // w.position.y = Window.bottom;
     // w.velocity.y *= -1;
    //}
  }
  
  //mouseClicked();




void mousePressed()
{if(mouseButton == LEFT)
{
  value = 1;
}
  
}
