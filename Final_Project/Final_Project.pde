//Flocking Example
//Minim BandPassFilter Example

import ddf.minim.*;
import ddf.minim.effects.*;
import ddf.minim.ugens.*;

Minim minim;
AudioOutput output;
FilePlayer player;
BandPass bandPass;

Group group;

PVector mousePos;

void setup() 
{
  size(1280, 800, P2D);
  
  minim = new Minim(this);
  output = minim.getLineOut();
  
  player = new FilePlayer(minim.loadFileStream("Le KAISER Has Arrived.mp3"));
  
  bandPass = new BandPass(440, 400, output.sampleRate());
  
  player.patch(bandPass).patch(output);
  player.loop();
  
  group = new Group();
  
  for (int i = 0; i < 500; i++) 
  {
    group.addCreature(new Creature(random(0 + width/4, width - width/4), random(0 + height/4, height - height/4), int(random(1, 4))));
  }
}

void draw() 
{
  background(50);
  
  for (int i = 0; i < output.bufferSize()-1; i++)
  {
    float x1 = map(i, 0, output.bufferSize(), 0, width);
    float x2 = map(i+1, 0, output.bufferSize(), 0, width);
    line(x1, height/4 - output.left.get(i)*50, x2, height/4 - output.left.get(i+1)*50);
    line(x1, 3*height/4 - output.right.get(i)*50, x2, 3*height/4 - output.right.get(i+1)*50);
  }
    
  group.run();
  
  mousePos = new PVector(mouseX, mouseY);
  
  surface.setTitle("" + frameRate);
}

void mousePressed() 
{
 // group.addCreature(new Creature(mouseX,mouseY));
}
