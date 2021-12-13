//Minim BandPassFilter Example
//Minim getSetBalance Example
//Minim getSetGain Example

void minimFunctions()
{
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
