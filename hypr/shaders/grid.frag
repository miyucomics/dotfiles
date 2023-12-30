precision mediump float;
varying vec2 v_texcoord;
uniform sampler2D tex;

void main() {
	vec4 pixColor = texture2D(tex, v_texcoord);
	
	if (int(mod(gl_FragCoord.y, 10.0)) == 0) {
			pixColor[0] *= 0.95;
			pixColor[1] *= 0.95;
			pixColor[2] *= 0.95;
    }
	gl_FragColor = pixColor;
}
