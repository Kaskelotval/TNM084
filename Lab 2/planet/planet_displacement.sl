displacement planet_displacement(output varying float elevation = 0.0;) {

  // Specify a coordinate space for the 3D texture coordinates
  point Ptex = transform("shader", P);
  
  // Largest features are "continental scale"
  elevation = noise(Ptex*2.0)-0.5;
  // Make the continents and seas have flat peaks
  elevation = smoothstep(-0.3 , 0.3, elevation)-0.5;

  // Add a fractal sum of Pelin noise to create a rough surface
  float freq;
  for (freq=1; freq<156.0; freq*=2.0) {
    elevation += 0.5/freq*(noise(Ptex*10.0*freq)-0.5);
  }
  P = P + N * 0.2 * elevation;
  N = calculatenormal(P);
}
