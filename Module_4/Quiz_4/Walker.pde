public class Walker
{
  public float x;
  public float y;
  public float tx = 0, ty = 10000;
  public float t = 0;
  public float s;
  public float r;
  public float g;
  public float b;
  public float a;
  public float tr = 100;
  public float tg = 2000;
  public float tb = 10000;
  
  void render()
  {
    noStroke();
    float s = map(noise(t), 0, 1, 5, 150);
    circle(x, y, s);
    t += 0.01f;
  }
  
  void perlinWalk()
  {
    x = map(noise(tx),0, 1,-640, 640);
    y = map(noise(ty), 0, 1, -360, 360);
   
    tx += 0.01f;
    ty += 0.01f;
    
    
  }
  
   void randomColor()
    {
      int r = int(map(noise(tr), 0, 1, 0, 255));
      int g = int(map(noise(tg), 0, 1, 0, 255));
      int b = int(map(noise(tb), 0, 1, 0, 255));
      int a = int(random(10, 100));
      
      tr += 1f;
      tg+= 5f;
      tb += 10f;
    
      fill(r, g, b, a);
      
    }
    
}
