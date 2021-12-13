//Flocking Example
//Minim getSetBalance Example

class Group 
{
  ArrayList<Creature> creatures; 
  
  float avgPositionX_bandPass = 0;
  float avgPositionY_bandPass = 0;
  
  float avgPositionX_balance = 0;
  float avgPositionY_balance = 0;

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
        avgPositionX_bandPass = (avgPositionX_bandPass + creature.position.x)/counter_bandPass;
        avgPositionX_bandPass = constrain(avgPositionX_bandPass, 1, 3);
        
        avgPositionY_bandPass = (avgPositionY_bandPass + creature.position.y)/counter_bandPass;
        avgPositionY_bandPass = constrain(avgPositionY_bandPass, 1, 3);
      }
      else if(creature.affect == 2)
      {
        avgPositionX_balance = (avgPositionX_balance + creature.position.x)/counter_balance;
        avgPositionX_balance = constrain(avgPositionX_balance, 0, 5);
      }
    }
    println(avgPositionX_balance);
  }

  void addCreature(Creature creature) 
  {
    creatures.add(creature);
  }
}
