void  drawNoiseExample(int seed)
{
    noiseSeed(seed);
    
    //float xnoise = 0.0;
    //float ynoise = 0.0;
    //float inc = 0.03;
    //for (int y = 0; y < height; y++) {
    //  for (int x = 0; x < width; x++) {
    //   // float gray = noise(xnoise, ynoise) * 255;
    //   // stroke(gray);
    //   stroke(noise(xnoise, ynoise) * 255,0,noise(xnoise, ynoise) * 255);
    //    point(x, y);
    //    xnoise = xnoise + inc;
    //  }
    //  xnoise = 0;
    //  ynoise = ynoise + inc;
    //}
    
    
  float power = 07; // turbulence power
  float d = 9; // turbulence density
  noStroke();
  
  for (int y = 0; y < height; y++) {
    for (int x = 0; x < width; x++) {
        
        float total = 0.0;
        for (float i = d; i >= 1; i = i/2.0) {
          total += noise(x/d, y/d) * d;
        }
        float turbulence = 128.0 * total / d;
        float base = (x * 0.2) + (y * 0.12);
        float offset = base + (power * turbulence / 256.0);
        float gray = abs(sin(offset)) * 256.0;
        stroke(gray);
        point(x, y);
      }
  }

}
