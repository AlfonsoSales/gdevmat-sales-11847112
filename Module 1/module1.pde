int xspacing = 16;   
int w;              

float theta = 0.0;  
float amplitude = 75.0; 
float period = 500.0; 
float dx;  
float[] yvalues;  

void setup()
{
  size (1280, 720, P3D);
  camera(0, 0, -(height/2.0) / tan(PI*30.0 / 180.0), 0, 0, 0, 0, -1, 0);
  w = width+16;
  dx = (TWO_PI / period) * xspacing;
  yvalues = new float[w/xspacing];
}

void draw()
{
  background(0);
  
  drawCartesianPlane();
  
  drawLinearFunction();
  
  drawQuadraticFunction();
  
  drawCircle();
  
  calcWave();
  renderWave();
}

void drawCartesianPlane()
{
  strokeWeight(1);
  color white = color (255, 255, 255);
  fill(white);
  stroke(white);
  
  
  line (-300, 0, 300, 0);
  line (0, 300, 0, -300);
  
  for (int i = -300; i <= 300; i += 10)
  {
    line(i, -2, i, 2);
    line(-2, i, 2, i);
  }
}

void drawLinearFunction()
{
  color red = color (255, 0, 0);
  fill(red);
  noStroke();
  
  for (int x = -200; x <= 200; x++)
  {
    circle(x, x + 2, 5);
  }
}

void drawQuadraticFunction()
{
  color green = color (0, 255, 0);
  fill(green);
  noStroke();
  
  for (float x = -300; x <= 300; x+=0.1f)
  {
    circle(x, ((float)Math.pow(x, 2) + (x * 2) - 5), 5);
  }
}

void drawCircle()
{
  color blue = color (0,0, 255);
  fill(blue);
  stroke(blue);
  float radius = 50;
  
  for (int x = 0; x <= 360;  x++)
  {
    circle((float)Math.cos(x) * radius, (float)Math.sin(x) * radius, 5);
  }
}

void calcWave() {
  
  theta += 0.02;

  
  float x = theta;
  for (int i = 0; i < yvalues.length; i++) {
    yvalues[i] = sin(x)*amplitude - 360;
    x+=dx;
  }
}

void renderWave() {
   color magenta = color(255,128,213);
  fill(magenta);
  stroke(magenta);
 
  for (int x = 0; x < yvalues.length; x++) {
    ellipse(x*xspacing, height/2+yvalues[x], 20, 20);
  }
}
