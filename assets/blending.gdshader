shader_type canvas_item;
uniform sampler2D screen_texture: hint_screen_texture;
uniform vec3 a = vec3(3,1,0.8);
void fragment() {
	COLOR.rgb = a * texture(screen_texture, SCREEN_UV).rgb;
}
