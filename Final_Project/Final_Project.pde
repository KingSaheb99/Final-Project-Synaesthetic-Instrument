Group group;

void setup() 
{
  size(1280, 800, P2D);
  
  group = new Group();
  
  for (int i = 0; i < 500; i++) 
  {
    group.addCreature(new Creature(width/2,height/2));
  }
}

void draw() 
{
  background(50);
  
  group.run();
  
  surface.setTitle("" + frameRate);
}

void mousePressed() 
{
  group.addCreature(new Creature(mouseX,mouseY));
}
