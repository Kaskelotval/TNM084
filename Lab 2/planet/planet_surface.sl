// planet_surface.sl
// A very simple planetary surface.
// Surface shader to accompany "planet_displacement.sl"
// (won't work properly with other shaders).

surface planet_surface() {

  // Fetch varying variable "elevation" from displacement shader
  float elevation;
  displacement("elevation", elevation);

  //Colors to be used 
  color sand = color(0.8, 0.8, 0.0);
  color grass = color(0.2, 0.6, 0.2);
  color sea = color(0.0, 0.0, 0.0);
  color darkblue = color(0.1, 0.3, 0.5);
  color white = color (1.0, 1.0, 1.0);
  color gray = color(0.5, 0.5, 0.5);
  
  // Normalize the normal to make sure it's unit length
  vector Nn = normalize(N);

  //Make the deep ocean dark -> Beach colored
  color Cland = mix(sea, sand, smoothstep(-0.3, 0.0, elevation));
  //Beach->Grass
  Cland = mix(Cland, grass, smoothstep(0.0, 0.1, elevation));
  //Grass->mountain
  Cland = mix(Cland, gray, smoothstep(0.1, 0.4, elevation));
  //Mounatin->Mountain Top
  Cland = mix(Cland, white, smoothstep(0.4, 0.3, elevation)); 
  // Compute illumination (land is diffuse only)
  Cland *= diffuse(Nn);

  // Mix final surface color: water where elevation<0, land elsewhere.
  Ci = Cland;

  // Set output opacity same as input opacity (to play nice)
  Oi = Os;
}
