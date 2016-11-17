surface simple_surface() {
	color Cd = noise(1*P);
  	Ci = Cd * diffuse(N);
}