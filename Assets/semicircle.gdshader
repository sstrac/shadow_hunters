shader_type canvas_item;
render_mode unshaded;

//void fragment() {
	////if (UV.x > 0.5)
	//ALBEDO.a = 0.0;
//}
const float RADIUS = 0.5;
const vec2 CENTER = vec2(0.5, 0.5);

void fragment() {
	float distance = sqrt(pow(CENTER.x - UV.x, 2) + pow(CENTER.y - UV.y, 2));
	if(distance > RADIUS && UV.x < 0.5) {
		COLOR.a = 0.0;
	}
	else if(UV.x > 0.5) {
		COLOR.a = 0.0;
	}
}