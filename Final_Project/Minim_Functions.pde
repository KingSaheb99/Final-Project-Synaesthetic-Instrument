//Minim BandPassFilter
//Minim getSetBalance
//Minim getSetGain
//Minim FrequencyEnergyBeatDetection
//Minim SoundEnergyBeatDetection

BeatDetect beatDetector;

void minimFunctions()
{
  beatDetector.detect(currentPlayer2.mix);
  if(beatDetector.isOnset())
  {
    ellipse(width/2, height/2, width/2, height/2);
    
    fill(0, 100);
    stroke(0);
    bgColor = 255;
  }
  else
  {
    fill(200, 100);
    stroke(255);
    bgColor = 0;
  }
  
  float passBand = map(group.avgPositionX_bandPass, 1, 8, 1000, 10000);
  bandPass.setFreq(passBand);
  text("BandPass: " + passBand, 5, 15);
  
  float bandWidth = map(group.avgPositionY_bandPass, 1, 15, 1000, 10000);
  bandPass.setBandWidth(bandWidth);
  text("BandWidth: " + bandWidth, 5, 30);
  
  for (int i = 0; i < output.bufferSize()-1; i++)
  {
    float x1 = map(i, 0, output.bufferSize(), 0, width);
    float x2 = map(i + 1, 0, output.bufferSize(), 0, width);
    line(x1, height/4 - output.left.get(i) * 50, x2, height/4 - output.left.get(i + 1) * 50);
    line(x1, height/4 * 3 - output.right.get(i) * 50, x2, height/4 * 3 - output.right.get(i + 1) * 50);
  }
  
  if(output.hasControl(Controller.BALANCE))
  {
    float balance = map(group.avgPositionX_balance, 0, 5, -1, 1);
    output.setBalance(balance);
    text("Balance: " + output.getBalance(), 5, 45);
  }
  
  if(output.hasControl(Controller.GAIN))
  {
    float gain = map(group.avgPositionY_gain, -3, 5, 6, 0);
    output.setGain(gain);
    text("Gain: " + output.getGain(), 5, 60);
  }
}

class BeatListener implements AudioListener
{
  private BeatDetect beatDetector;
  private AudioPlayer source;
  
  BeatListener(BeatDetect beatDetector, AudioPlayer source)
  {
    this.source = source;
    this.source.addListener(this);
    this.beatDetector = beatDetector;
  }
  
  void samples(float[] samps)
  {
    beatDetector.detect(source.mix);
  }
  
  void samples(float[] sampsL, float[] sampsR)
  {
    beatDetector.detect(source.mix);
  }
}
