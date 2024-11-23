shader_type canvas_item;

void fragment() {
    vec2 uv = UV;

    // Base color
    vec4 base_color = vec4(0.031, 0.173, 0.314, 1.0); // #082c50

    // Moving gradient
    float gradient = sin(uv.y * 10.0 + TIME * 0.5) * 0.5 + 0.5;

    // Light color
    vec4 light_color = vec4(0.1, 0.3, 0.5, 0.4) * gradient;

    // Combine base color and gradient
    COLOR = base_color + light_color;
}
