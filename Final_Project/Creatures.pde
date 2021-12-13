//Flocking Example

class Creature 
{
  
  PVector position;
  PVector velocity;
  PVector acceleration;
  PVector desired;
  PVector seperation;
  PVector alignment;
  PVector cohesion;
  PVector target;
  float size = 10.0;
  float maxForce = 0.03;    
  float maxSpeed = 3; 
  boolean normalMovement = true;

  Creature(float x, float y) 
  {
    position = new PVector(x, y);
    
    acceleration = new PVector(0, 0);

    float angle = random(TWO_PI);
    
    velocity = new PVector(cos(angle), sin(angle));
  }

  void run(ArrayList<Creature> creatures) 
  {
    group(creatures);
    update(creatures);
    screenEdge();
    draw();
  }

  void applyForce(PVector force) 
  {
    acceleration.add(force);
  }

  void group(ArrayList<Creature> creatures) 
  {
    alignment = align(creatures);      
    cohesion = cohesion(creatures);
    seperation = separate(creatures);   
        
    seperation.mult(1.5); //Arbitrary values 
    alignment.mult(1.0);
    cohesion.mult(1.0);

    applyForce(seperation);
    applyForce(alignment);
    applyForce(cohesion);
  }

  void update(ArrayList<Creature> creatures) 
  {
    velocity.add(acceleration);
    
    velocity.limit(maxSpeed); //Speed limit
    
    position.add(velocity);

    acceleration.mult(0); //Resets acceleration 
    
    if(mousePressed == true)
    {
      normalMovement = false;
    }
    else
    {
      normalMovement = true;
    }
    
    if(normalMovement == false)
    {
      target = mousePos;
    }
  }

  void draw() 
  {
    float theta = velocity.heading() + radians(90);
    
    fill(200, 100);
    stroke(255);
    
    pushMatrix();
    
    translate(position.x, position.y);
    rotate(theta);
    beginShape(TRIANGLES);
    vertex(0, -size * 2);
    vertex(-size, size * 2);
    vertex(size, size * 2);
    endShape();
    
    popMatrix();
  }

  void screenEdge() //Move across edges
  {
    if (position.x < -size) 
    {
      position.x = width + size;
    }
    if (position.y < -size) 
    {
      position.y = height + size;
    }
    if (position.x > width + size) 
    {
      position.x = -size;
    }
    if (position.y > height + size) 
    {
      position.y = -size;
    }
  }
  
    PVector move(PVector target) 
    {
      if(normalMovement == true)
      {
        desired = PVector.sub(target, position);
        maxForce = 0.03;
      }
      else
      {
        target = mousePos;
        desired = PVector.sub(target, position);
        maxForce = 0.10;
      }
        
      desired.normalize();
      desired.mult(maxSpeed);
        
    
      PVector steer = PVector.sub(desired, velocity);
        
      steer.limit(maxForce);  
        
      return steer;
    }
  
    PVector separate (ArrayList<Creature> creatures) 
    {
      float desiredSeparation = 25.0;
      PVector steer = new PVector(0, 0, 0);
      int count = 0;
      
      //if(normalMovement == true)
      //{
        for (Creature nearbyCreature : creatures) 
        {
          float currentSeperation = PVector.dist(position, nearbyCreature.position);
    
          if (currentSeperation > 0 && currentSeperation < desiredSeparation) 
          {
            PVector seperationDifference = PVector.sub(position, nearbyCreature.position);
            
            seperationDifference.normalize();
            seperationDifference.div(currentSeperation);        
            
            steer.add(seperationDifference);
            
            count++;
          }
        }
    
        if (count > 0) 
        {
          steer.div((float)count); //If near more than one other creature
        }
    
        if (steer.mag() > 0) 
        {
          steer.setMag(maxSpeed);
          steer.sub(velocity);
          steer.limit(maxForce);
        }
      //}
      return steer;
    }
  
    PVector align (ArrayList<Creature> creatures) 
    {
      float neighborDist = 50;
      PVector sum = new PVector(0, 0);
      int count = 0;
      
      //if(normalMovement == true)
      //{
        for (Creature nearbyCreature : creatures) 
        {
          float currentSeperation = PVector.dist(position, nearbyCreature.position);
          
          if (currentSeperation > 0 && currentSeperation < neighborDist) 
          {
            sum.add(nearbyCreature.velocity);
            
            count++;
          }
        }
      //}
      
      if (count > 0) 
      {
        sum.div((float)count); //If near more than one other creature
        
        sum.setMag(maxSpeed);
        
        PVector steer = PVector.sub(sum, velocity);
        
        steer.limit(maxForce);
        
        return steer;
      } 
      else 
      {
        return new PVector(0, 0);
      }
    }
  
    PVector cohesion (ArrayList<Creature> creatures) 
    {
      float neighborDist = 50;
      PVector sum = new PVector(0, 0);
      int count = 0;
      
      //if(normalMovement == true)
      //{
        for (Creature nearbyCreature : creatures) 
        {
          float currentSeperation = PVector.dist(position, nearbyCreature.position);
          
          if (currentSeperation > 0 && currentSeperation < neighborDist) 
          {
            sum.add(nearbyCreature.position); 
            
            count++;
          }
        }
      //}
      
      if (count > 0) 
      {
        sum.div(count); //If near more than one other creature
        
        return move(sum);  
      } 
      else 
      {
        return new PVector(0, 0);
      }
    }
  }
