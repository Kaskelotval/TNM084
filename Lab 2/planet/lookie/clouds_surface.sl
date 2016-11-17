surface clouds_surface() {
  color clouds = color(1.0, 1.0, 1.0);

  // diffuse light, please
  Ci = clouds * diffuse(N);
  Oi = 0.8;
}
