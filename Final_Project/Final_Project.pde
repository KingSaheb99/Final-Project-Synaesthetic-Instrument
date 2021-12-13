//Flocking
//Minim BandPassFilter

import ddf.minim.*;
import ddf.minim.effects.*;
import ddf.minim.ugens.*;
import ddf.minim.*;
import ddf.minim.analysis.*;


Minim minim;
AudioOutput output;
FilePlayer songA1;
FilePlayer songB1;
FilePlayer songC1;
FilePlayer songD1;
FilePlayer currentPlayer;
AudioPlayer songA2, songB2, songC2, songD2;
AudioPlayer currentPlayer2;
BandPass bandPass;
BeatListener beatListener;

int songChoice = 1;

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
  
  songA1 = new FilePlayer(minim.loadFileStream("Le KAISER Has Arrived.mp3"));
  songA2 = minim.loadFile("Le KAISER Has Arrived.mp3", 2048);
  
  //songA1 = new FilePlayer(minim.loadFileStream("K96 - Cyka Kalinka (Russian Hard Bass).mp3"));
  songB2 = minim.loadFile("K96 - Cyka Kalinka (Russian Hard Bass).mp3", 2048);
  
  //songC1 = new FilePlayer(minim.loadFileStream("Vengaboys - Boom Boom Boom Cover PA2x Tyros.mp3"));
  songC2 = minim.loadFile("Vengaboys - Boom Boom Boom Cover PA2x Tyros.mp3", 2048);
  
  //songD1 = new FilePlayer(minim.loadFileStream("Party Factory - Kalinka Club Mix.mp3"));
  songD2 = minim.loadFile("Party Factory - Kalinka Club Mix.mp3", 2048);
  
  currentPlayer = songA1;
  currentPlayer2 = songA2;
  
  bandPass = new BandPass(440, 400, output.sampleRate());
  
  currentPlayer.patch(bandPass).patch(output);
  currentPlayer.loop();
  
  currentPlayer2.loop();
  currentPlayer2.mute();
  
  beatDetector = new BeatDetect();
  
  beatListener = new BeatListener(beatDetector, currentPlayer2);
    
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
