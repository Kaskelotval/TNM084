// A very simple RSL displacement shader
displacement simple_displacement() {
  point Ptex = P + noise(P*2);
  P = P + N * 0.1 * float noise(20*Ptex);
  N = calculatenormal(P);  
}