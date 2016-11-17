// simple displacement shader to render clouds
displacement clouds_displacement() {
  float elevation = 1;
  elevation += 0.4 * (noise(4 * P) - 0.5);
  elevation += 0.2 * (noise(8 * P) - 0.5);
  elevation += 0.1 * (noise(16 * P) - 0.5);
  elevation += 0.05 * (noise(32 * P) - 0.5);

  float displayClouds = step(1, elevation);

  P = P + N * 0.2 * elevation;

  P *= displayClouds;
  N = calculatenormal(P);
}
