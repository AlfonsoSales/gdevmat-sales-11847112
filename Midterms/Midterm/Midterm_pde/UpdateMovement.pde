public class UpdateMovement
{
  Walker myWalker = new Walker();
  PVector hole = myWalker.position;
  PVector center; //center
  PVector circles[] = new PVector[100]; //other circles
  int[][] col = new int[300][4]; //colors for other circles, 300 with rgb each
  
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
    
    if (circles[i].x  > center.x) //circles[].velocity >circles.velocity
    {
      println("greater than x");
     circles[i].x--; //hole.sub(circles[].velocity?)
    }
    if (circles[i].x < center.x)
    {
      println("less than x");
      circles[i].x++;//hole.add(circles[].velocity?)
    }
    
    if (circles[i].y > center.y)
    {
      println("greater than y");
      circles[i].y--;//hole.sub(circles[].velocity?)
    }
    if (circles[i].y < center.y)
    {
      println("less than y");
      circles[i].y++;//hole.add(circles[].velocity?)
    }
  }
  
  void updateView()
  {
    background(255);
    
    fill(0, 0, 0);
    circle(center.x, center.y, 100);
    
    for(int b=0; b<100; b++)
    {
      fill(col[b][0], col[b][1], col[b][2]);
      circle(circles[b].x, circles[b].y, 50);
    }
    
  }
  
}
