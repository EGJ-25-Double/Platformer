shader_type canvas_item;

uniform float time = 0.0;
uniform vec4  ring_color = vec4(1.0);
uniform float start_radius = 0.0;
uniform float end_radius   = 2;
uniform float thickness    = 0.05;
uniform float fade_out     = 0.5;
uniform float max_dist = 0.5; // max distance where alpha fades to zero


void fragment()
{
    // Shift UV so epicenter is top center (0.5, 0.0)
    vec2 center = vec2(0.5, 1.0);
    vec2 p = UV - center;
    p.x *= 1.8;  // stretch horizontally if needed
    p.y *= 0.9;  // squash vertically for side-on effect
    float r = length(p);

    float radius = mix(start_radius, end_radius, clamp(time, 0.0, 1.0));
    float edge = abs(r - radius);

    float alpha = smoothstep(thickness, thickness + 0.02, edge);
    alpha = (1.0 - alpha) * mix(1.0, fade_out, time);

        // Fade alpha far from center
	float dist_fade = clamp(1.0 - r / max_dist, 0.0, 1.0);
	alpha = alpha * dist_fade;
	
    COLOR = vec4(ring_color.rgb, ring_color.a * alpha);
}
