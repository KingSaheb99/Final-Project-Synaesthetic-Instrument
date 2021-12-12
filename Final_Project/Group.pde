
class Group 
{
  ArrayList<Creature> creatures; // An ArrayList for all the boids

  Group() 
  {
    creatures = new ArrayList<Creature>(); // Initialize the ArrayList
  }

  void run() 
  {
    for (Creature c : creatures) 
    {
      c.run(creatures);  // Passing the entire list of boids to each boid individually
    }
  }

  void addCreature(Creature c) 
  {
    creatures.add(c);
  }
}
