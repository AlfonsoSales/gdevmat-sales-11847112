class Walker
{
  float x;
  float y;
  
  void render()
  {
    
    circle(x, y, 30);
  }
  
  void randomWalk()
  {
    int rng = int(random(8));
    
    if (rng == 0)
    {
      y+=10;
    }
    else if (rng == 1)
    {
      y-=10;
    }
    else if (rng == 2)
    {
      x+=10;
    }
    else if (rng == 3)
    {
      x-=10;
    }
    else if (rng == 4)
    {
      y+=10;
      x-=10;
    }
    else if (rng == 5)
    {
      y+=10;
      x+=10;
    }
    else if (rng == 6)
    {
      y-=10;
      x+=10;
    }
    else if (rng == 7)
    {
      y-=10;
      x-=10;
    }
    
  }
  void randomWalkB()
  {
    int rng = int(random(11));
    
    if (rng == 0)
    {
      y+=10;
    }
    else if (rng == 1)
    {
      y-=10;
    }
    else if (rng == 2)
    {
      x+=10;
    }
    else if (rng >= 3 && rng <= 4)
    {
      x-=10;
    }
    else if (rng >= 5 && rng <= 6)
    {
      y+=10;
      x-=10;
    }
    else if (rng == 7)
    {
      y+=10;
      x+=10;
    }
    else if (rng == 8)
    {
      y-=10;
      x+=10;
    }
    else if (rng >= 9 && rng <= 10)
    {
      y-=10;
      x-=10;
    }
    
  }
  void randomColor()
    {
      int r = int(random(256));
      int g = int(random(256));
      int b = int(random(256));
      int a = int(random(50, 100));
    
      fill(r, g, b, a);
      noStroke();
    }
}
