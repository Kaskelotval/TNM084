// simple displacement shader to render waves
displacement ocean_displacement() {
  point Pn = 0.009 * noise(128 * P);
  P = P + N * 0.2 * Pn;
  N = calculatenormal(P);
}
