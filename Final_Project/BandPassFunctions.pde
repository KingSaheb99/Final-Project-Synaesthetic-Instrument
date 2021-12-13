

void BandPassFunctions()
{
  float passBand = map(group.avgPositionX, 1, 8, 1000, 10000);
  bandPass.setFreq(passBand);
  
  float bandWidth = map(group.avgPositionY, 1, 15, 1000, 10000);
  bandPass.setBandWidth(bandWidth);
}
