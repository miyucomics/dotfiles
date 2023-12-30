precision mediump float;
varying vec2 v_texcoord;
uniform sampler2D tex;

void main() {
  vec4 pixColor = texture2D(tex, v_texcoord);
  float lum = dot(pixColor.rgb, vec3(0.299, 0.587, 0.114));
  if (lum > 0.5) { lum = 1.0;
  } else { lum = 0.0; }
  vec4 outCol = vec4(vec3(lum), pixColor.a);
  gl_FragColor = outCol;
}
