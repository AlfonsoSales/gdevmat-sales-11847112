public class Walker
{
  PVector position = new PVector();
  PVector speed = new PVector(2,2);
  int colr[] = new int[4];

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
    //float s = map(noise(t), 0, 1, 5, 150);
    fill(colr[0], colr[1], colr[2]);
    circle(position.x, position.y, 100);
    //t += 0.01f;
  }
  
  void perlinWalk()
  {
    position.x = map(noise(tx),0, 1,-640, 640);
    position.y = map(noise(ty), 0, 1, -360, 360);
   
    tx += 0.5f;
    ty += 0.5f;
    
    
  }
  
  void randomWalk()
  {
    int rng = int(random(8));
    float range = (random(360));
    
    if (rng == 0)
    {
      position.y+=range;
    }
    else if (rng == 1)
    {
      position.y-=range;
    }
    else if (rng == 2)
    {
      position.x+=range;
    }
    else if (rng == 3)
    {
      position.x-=range;
    }
    else if (rng == 4)
    {
      position.y+=range;
      position.x-=range;
    }
    else if (rng == 5)
    {
      position.y+=range;
      position.x+=range;
    }
    else if (rng == 6)
    {
      position.y-=range;
      position.x+=range;
    }
    else if (rng == 7)
    {
      position.y-=range;
      position.x-=range;
    }
     if (position.y > Window.windowHeight)
    {
      position.sub(0, Window.windowHeight);
    } else if (position.y < (Window.windowHeight)*-1)
    {
      position.add(0, Window.windowHeight);
    }
    
    if (position.x > Window.windowWidth)
    {
      position.sub(Window.windowWidth, 0);
    } else if (position.x < (Window.windowWidth)*-1)
    {
      position.add(Window.windowWidth, 0);
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
      
      colr[0] = r;
      colr[1] = g;
      colr[2] = b;
      colr[3] = a;
    
      fill(r, g, b, a);
      
    }
    
    void colorIn()
    {
      fill(0, 0, 0);
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
