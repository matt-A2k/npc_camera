shader_type canvas_item;
uniform float angle = 45.0;
uniform vec4 near_color:source_color = vec4(0.5);
uniform vec4 far_color:source_color = vec4(0.25);

vec3 rotated(float a){
	return vec3(cos(radians(a)), -sin(radians(a)), 0.0);
}

float dist(float x, float y){
	return sqrt( pow(x, 2.0) + pow(y, 2.0) );
}

void fragment() {
	vec3 left_bound = rotated(angle);
	vec3 right_bound = rotated(-angle);
	float r = dist(UV.x/2.0, UV.y-0.5);

	COLOR = (near_color*(0.5-r)) + (far_color*(r));
	if(r>0.5
		|| cross(left_bound, vec3(UV.x/2.0, UV.y-0.5, 0.0)).z < 0.0
		|| cross(vec3(UV.x/2.0, UV.y-0.5, 0.0), right_bound).z < 0.0){
		COLOR.a = 0.0;
	}
}