public class MoveToHole
{
  Walker myWalker = new Walker();
  PVector hole = myWalker.position;
  
  
  void render()
  {
    println(hole);
  }
}
