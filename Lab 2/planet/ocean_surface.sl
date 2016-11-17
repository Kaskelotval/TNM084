// simple surface shader to add specular light to ocean
surface ocean_surface() {
	//Ocean color
  color ocean = color(0.1, 0.2, 0.4);
  // light params
  float shinyness = 0.01;
  //normalize normal
  normal Nn = normalize(N);
  vector lightDirection = normalize(-I);
  // diffuse + specular light on ocean
  Ci = ocean * diffuse(N) + specular(Nn, lightDirection, shinyness);
  // semi transparent water
  Oi = 0.8;
}
