public class Walker
{
  public PVector position = new PVector();
  public PVector velocity = new PVector();
  public PVector acceleration = new PVector();
  
  public PVector mouse = mousePos();
  
  public float velocityLimit = 10;
  public float scale = 15;
  public float r;
  public float g;
  public float b;
  public float a;
  public float mass = 1;
  public float gravitationalConstant = 1;
  
  public PVector mousePos()
{
  float x = mouseX - Window.windowWidth / 2;
  float y = -(mouseY - Window.windowHeight / 2);
  return new PVector(x, y);
}
  public Walker()
  {
    
  }
  //newtons second law of motion
  public void applyForce(PVector force)
  {
    PVector f = PVector.div(force, this.mass);
    this.acceleration.add(f); // force accumulation
  }
  
  public void update()
  {
    //mouse = mousePos();
    //this.acceleration = mouse.normalize().mult(12);
    this.velocity.add(this.acceleration); // veocity accumulation
    this.velocity.limit(velocityLimit);
    this.position.add(this.velocity);
    this.acceleration.mult(0); // acceleration reset every frame
  }
  
  public void render()
  {
    stroke(1);
    fill(r, g, b, a);
    circle(position.x, position.y, scale);
  }
  
  public void nocirclerender()
  {
    noStroke();
    fill(0,0,0,1);
    circle(position.x, position.y, scale);
  }
  
  void randGaus()
  {
    PVector positionSpawn = new PVector(randomGaussian(), randomGaussian());
    position.y = positionSpawn.y * Window.windowWidth;
    position.x = positionSpawn.x * Window.windowHeight;
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
  
  
  public void checkEdges()
  {
    if(this.position.x > Window.right)
    {
      this.position.x = Window.left;
    }
    else if (this.position.x < Window.left)
    {
      this.position.x = Window.right;
    }
    
    if(this.position.y > Window.top)
    {
      this.position.y = Window.bottom;
    }
    else if (this.position.y < Window.bottom)
    {
      this.position.y = Window.top;
    }
  }
  
  void moveAndBounce()
    {
          position.add(this.position);
  
      if ((position.x>Window.right) || (position.x<Window.left))
      {
        this.position.x *= -1;
      }
  
      if ((position.y>Window.top) || (position.y<Window.bottom))
      {
        this.position.y *= -1;
      }
    }
    
    public PVector calculateAttraction(Walker walker)
    {
      PVector force = PVector.sub(this.position, walker.position); //direction
      float distance = force.mag();
      force.normalize();
      
      distance = constrain(distance, 5, 25);
      
      float strength = (this.gravitationalConstant * this.mass * walker.mass) / (distance * distance);
      force.mult(strength);
      return force;
    }
  
   void setColor()
    {
      r = random(255);
      g = random(255);
      b = random(255);
      a = random(150);
    }
  
}
