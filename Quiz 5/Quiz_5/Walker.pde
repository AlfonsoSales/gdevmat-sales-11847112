public class Walker
{
  PVector position = new PVector();
  PVector speed = new PVector(5,8);

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
    //fill(182, 52, 100);
    circle(position.x, position.y, s);
    t += 0.01f;
  }
  
  void perlinWalk()
  {
    position.x = map(noise(tx),0, 1,-640, 640);
    position.y = map(noise(ty), 0, 1, -360, 360);
   
    tx += 0.01f;
    ty += 0.01f;
    
    
  }
  
  void randomWalk()
  {
    int rng = int(random(8));
    
    if (rng == 0)
    {
      position.y+=10;
    }
    else if (rng == 1)
    {
      position.y-=10;
    }
    else if (rng == 2)
    {
      position.x+=10;
    }
    else if (rng == 3)
    {
      position.x-=10;
    }
    else if (rng == 4)
    {
      position.y+=10;
      position.x-=10;
    }
    else if (rng == 5)
    {
      position.y+=10;
      position.x+=10;
    }
    else if (rng == 6)
    {
      position.y-=10;
      position.x+=10;
    }
    else if (rng == 7)
    {
      position.y-=10;
      position.x-=10;
    }
    
  }
  
   void randomColor()
    {
      int r = int(map(noise(tr), 0, 1, 0, 255));
      int g = int(map(noise(tg), 0, 1, 0, 255));
      int b = int(map(noise(tb), 0, 1, 0, 255));
      int a = int(255);
      
      tr += 1f;
      tg+= 5f;
      tb += 10f;
    
      fill(r, g, b, a);
      
    }
    
    void moveAndBounce()
    {
          position.add(speed);
  
      if ((position.x>Window.right) || (position.x<Window.left))
      {
        speed.x *= -1;
      }
  
      if ((position.y>Window.top) || (position.y<Window.bottom))
      {
        speed.y *= -1;
      }
    }
    
}
