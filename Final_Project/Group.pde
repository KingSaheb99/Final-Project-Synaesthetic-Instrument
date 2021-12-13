//Flocking Example

class Group 
{
  ArrayList<Creature> creatures; 
  
  int counter = 0;
  float avgPositionX = 0;

  Group() 
  {
    creatures = new ArrayList<Creature>();
  }

  void run() 
  {
    for (Creature creature : creatures) 
    {
      creature.run(creatures);
      
      if(creature.affect == 1)
      {
        avgPositionX = avgPositionX + creature.position.x;
      }
    }
  }

  void addCreature(Creature creature) 
  {
    creatures.add(creature);
  }
}
