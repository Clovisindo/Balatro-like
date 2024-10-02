shader_type spatial;
render_mode blend_mix,depth_draw_opaque,cull_back,diffuse_burley,specular_schlick_ggx;
uniform sampler2D texture_albedo : source_color;
uniform float threshold = 0.1;
uniform float effect_alpha_mult : hint_range(0,1) = 1.0;
uniform float direction : hint_range(0,1) = 0.5;
uniform float specular = 1.0;
uniform float metallic : hint_range(0,1) = 0.75 ;
uniform float roughness: hint_range(0,1) = 0.75;
uniform float emission_energy: hint_range(0,1) = 0.2;
uniform sampler2D gradient: source_color;
uniform sampler2D noise: source_color;

void vertex() {

}

void fragment() {
	vec2 base_uv = UV;
	vec4 albedo_tex = texture(texture_albedo,UV);
	vec4 noise_tex = texture(noise,base_uv);
	vec4 gradient_tex = texture(gradient, vec2((0.25+(NORMAL.y*direction*2.0-NORMAL.x*(1.0-direction)*2.0)/2.0+(UV.y*direction+UV.x*(1.0-direction))/2.0), 0.0));
	ALBEDO = albedo_tex.rgb;
	ALPHA = albedo_tex.a;
	if(albedo_tex.r < threshold && albedo_tex.g < threshold && albedo_tex.b < threshold && albedo_tex.a > 0.3)
	{
		METALLIC = metallic;
		ROUGHNESS = roughness;
		SPECULAR = specular;
		ALBEDO = mix(ALBEDO, gradient_tex.rgb*(noise_tex.rgb*2.0), (effect_alpha_mult-length(ALBEDO))*gradient_tex.a*effect_alpha_mult);
		EMISSION =  ALBEDO*emission_energy;
	}
}
