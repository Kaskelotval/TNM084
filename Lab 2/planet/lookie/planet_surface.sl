// A simple SL surface shader to render a planet-like sphere
surface planet_surface() {
  // forest color
  float forest = 0.5 - 0.2 * float noise(P * 128);
  color groundColor = color(0.0, forest, 0.0);
  color sandColor = color(0.75, 0.68, 0.39);
  color rockColor = color(0.3, 0.3, 0.3);
  rockColor -= 0.05 * noise(16 * P);
  color snowColor = color(1.0, 1.0, 1.0);
  snowColor -= 0.05 * noise(16 * P);
  color deepColor = rockColor;

  // get elevation value from planet displacement
  float elev = 0.0;
  displacement("elevation", elev);

  // interpolation distande
  float id = 0.02;
  // the biome's ranges (in elevation)
  float deepR[2] = {-0.6, -0.1};
  float sandR[2] = {-0.1, 0.04};
  float rockR[2] = {0.27, 0.7};
  float snowR[2] = {0.36, 0.7};

  // detect where to apply which biome
  float deep = smoothstep(deepR[0] - 0.1, deepR[0], elev) - smoothstep(deepR[1] - 0.1, deepR[1], elev);
  float sand = smoothstep(sandR[0] - id, sandR[0], elev) - smoothstep(sandR[1] - id, sandR[1], elev);
  float rock = smoothstep(rockR[0] - id, rockR[0], elev) - smoothstep(rockR[1] - id, rockR[1], elev);
  float snow = smoothstep(snowR[0] - id, snowR[0], elev) - smoothstep(snowR[1] - id, snowR[1], elev);

  // apply ALL the colors
  color Cd = mix(groundColor, sandColor, sand);
  Cd = mix(Cd, rockColor, rock);
  Cd = mix(Cd, snowColor, snow);
  //Cd = mix(Cd, shallowColor, shallow);
  Cd = mix(Cd, deepColor, deep);

  // diffuse light, please
  Ci = Cd * diffuse(N);
}
