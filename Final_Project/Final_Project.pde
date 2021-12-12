//Flocking Example

Group group;

PVector mousePos;

void setup() 
{
  size(1280, 800, P2D);
  
  group = new Group();
  
  for (int i = 0; i < 500; i++) 
  {
    group.addCreature(new Creature(random(0 + width/4, width - width/4), random(0 + height/4, height - height/4)));
  }
}

void draw() 
{
  background(50);
    
  group.run();
  
  mousePos = new PVector(mouseX, mouseY);
  
  surface.setTitle("" + frameRate);
  
  println(mousePos);
  
}

void mousePressed() 
{
 // group.addCreature(new Creature(mouseX,mouseY));
}
