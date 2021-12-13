//Flocking
//Minim BandPassFilter

import ddf.minim.*;
import ddf.minim.effects.*;
import ddf.minim.ugens.*;
import ddf.minim.*;
import ddf.minim.analysis.*;


Minim minim;
AudioOutput output;
FilePlayer player;
AudioPlayer player2;
BandPass bandPass;
BeatListener beatListener;

Group group;

PVector mousePos;

int counter_bandPass = 0;
int counter_balance = 0;
int counter_gain = 0;

int bgColor = 0;

void setup() 
{
  size(1280, 800, P2D);
  
  minim = new Minim(this);
  output = minim.getLineOut(Minim.STEREO, 1024);
  
  player = new FilePlayer(minim.loadFileStream("Le KAISER Has Arrived.mp3"));
  player2 = minim.loadFile("Le KAISER Has Arrived.mp3", 2048);
  
  bandPass = new BandPass(440, 400, output.sampleRate());
  
  player.patch(bandPass).patch(output);
  player.loop();
  
  player2.loop();
  player2.mute();
  
  beatDetector = new BeatDetect();
  
  beatListener = new BeatListener(beatDetector, player2);
    
  group = new Group();
  
  for (int i = 0; i < 500; i++) 
  {
    group.addCreature(new Creature(random(0 + width/4, width - width/4), random(0 + height/4, height - height/4), int(random(1, 4))));
  }
  
  textFont(createFont("Arial", 12));
  
}

void draw() 
{
  background(bgColor);
  
  group.run();
  minimFunctions();
    
  mousePos = new PVector(mouseX, mouseY);
  
  surface.setTitle("" + frameRate);
}
