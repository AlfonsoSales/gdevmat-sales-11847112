Walker myWalker = new Walker();
Walker[] others = new Walker[100];
Walker blackHole = new Walker();
int frame = 0;
float velocityLimit = 10;

void setup()
{
  size(1080, 720, P3D);
  camera (0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  
  myWalker.acceleration = PVector.random2D();
  myWalker.mass = random(1, 20);
  
  resetEverything();
  blackHole.mass = 10;
}

void resetEverything()
{
  others = new Walker[100];

  for (int i = 0; i < 100; i++)
  {
   
    others[i] = new Walker();
    others[i].randGaus();
     others[i].update();
    others[i].mass = random(10, 20);
    others[i].setColor(random(1, 255), random(1, 255), random(1, 255), random(50, 150));
    others[i].checkEdges();
  }

  blackHole.position = new PVector(random(Window.left, Window.right), random(Window.bottom, Window.top));
  blackHole.setColor(1, 1, 1, 1);
}



void draw()
{
background(80);
  
  
//myWalker.update();
 // myWalker.render();
  //myWalker.checkEdges();
  noStroke();
  for (Walker w : others)
  {
  w.update();
     w.render(); 
     
     PVector direction = w.mouse.normalize().mult(0.2);
     blackHole.position = blackHole.mousePos();
     blackHole.checkEdges();
     blackHole.render();
     //w.acceleration = mouse.normalize().mult(0.2);
     if (w.position.x < w.mouse.x || w.position.y < w.mouse.y)
     {
       w.position.add(direction.mult(10));
     }
     else if (w.position.x > w.mouse.x || w.position.y > w.mouse.y)
     {
       w.position.sub(direction.mult(10));
     }
     w.checkEdges();
  }

  //ackHole.render();

  //frame ++;

  // (frame >= 150)
  ///  // frame = 0;
  // resetEverything();
  //
}
