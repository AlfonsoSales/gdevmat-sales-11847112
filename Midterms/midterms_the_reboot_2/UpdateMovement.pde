public class UpdateMovement
{
  
  public Walker center = new Walker();
  public Particle[] circles = new Particle[100];
  
  public UpdateMovement()
  {
    for(int a=0; a<100; a++)
    {
      circles[a] = new Particle();
    }
  }
  
  void render()
  {
    for(int a=0; a<100; a++)
    {   
      reduceDistCircles(a);
      updateView();
    }
  }
  
  void reduceDistCircles(int i) //i - which circle to update out of 300
  {
    println("center: ");
    if (center.position.x > circles[i].position.x)
    {
      circles[i].speed.x = 5;
    } else if (center.position.x < circles[i].position.x)
    {
      circles[i].speed.x = -5;
    }
    
    if (center.position.y > circles[i].position.y)
    {
      circles[i].speed.y = 5;
    } else if (center.position.y < circles[i].position.y)
    {
      circles[i].speed.y = -5;
    }
    
    circles[i].position.add(circles[i].speed.x, circles[i].speed.y);
  }
  
  void updateView()
  {
    background(255);
    
    
    
    for(int b=0; b<100; b++)
    {
      fill(circles[b].colr[0], circles[b].colr[1], circles[b].colr[2]);
      circle(circles[b].position.x, circles[b].position.y, circles[b].size);
    }
    fill(0, 0, 0);
    circle(center.position.x, center.position.y, 100);
  }
  
}
