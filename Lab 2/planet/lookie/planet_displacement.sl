// A simple SL displacement shader to render a planet-like sphere
displacement planet_displacement(output varying float elevation = 0.0;) {
  elevation = 0.1 * (noise(P + 7) - 0.5);
  elevation += 1.2 * (noise(4 * P) - 0.5);
  elevation += 0.25 * (noise(8 * P) - 0.5);
  elevation += 0.125 * (noise(16 * P) - 0.5);
  elevation += 0.0625 * (noise(32 * P) - 0.5);
  elevation += 0.03125 * (noise(64 * P) - 0.5);
  elevation += 0.0156 * (noise(128 * P) - 0.5);

  P = P + N * 0.2 * elevation;
  N = calculatenormal(P);
}
