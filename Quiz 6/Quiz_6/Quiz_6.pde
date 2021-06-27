void setup()
{
  size(1080,720, P3D);
  camera(0,0,Window.eyeZ, 0, 0, 0, 0, -1, 0);
}

PVector mousePos()
{
  float x = mouseX - Window.windowWidth / 2;
  float y = -(mouseY - Window.windowHeight / 2);
  return new PVector(x, y);
}
void draw()
{
  //println(mousePos().x + " " + mousePos().y);
  background(130);
  
 
  
  PVector mouse = mousePos();
   
   strokeWeight(10);
  
  stroke(255, 0, 0);
  //mouse.mult(0.5);
  mouse.normalize();
 
  line(-mouse.x * Window.windowHeight/2, -mouse.y * Window.windowHeight/2, mouse.x * Window.windowHeight/2, mouse.y * Window.windowHeight/2);
  
  strokeWeight(5);
  stroke(255, 140, 140);
  
  line(-mouse.x * Window.windowHeight/2, -mouse.y * Window.windowHeight/2, mouse.x * Window.windowHeight/2, mouse.y * Window.windowHeight/2);
  
  strokeWeight(11.5);
  stroke(0, 0, 0);
  
  mouse.mult(0.2);
  line(-mouse.x * Window.windowHeight/2, -mouse.y * Window.windowHeight/2, mouse.x * Window.windowHeight/2, mouse.y * Window.windowHeight/2);
  
  println(mouse.mag());
}
