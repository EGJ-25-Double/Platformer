shader_type canvas_item;
uniform sampler2D albedo_texture: source_color; 
uniform vec3 albedo : source_color;
varying vec2 world_position;
void vertex() {
	// Called for every vertex the material is visible on.
	world_position = (MODEL_MATRIX * vec4(VERTEX, 0.0, 1.0)).xy;
}

void fragment() {
	// Called for every pixel the material is visible on.
	float d = 1.0;
	float v = 320.0*.25;
	vec2 uvss = vec2(mod(world_position.x/v, 1), mod(world_position.y/v,1));
	// uvss = vec2(0.5,0);
	COLOR = texture(albedo_texture, uvss);
}

//void light() {
//	// Called for every pixel for every light affecting the CanvasItem.
//	// Uncomment to replace the default light processing function with this one.
//}
