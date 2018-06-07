#version 450 
#extension GL_ARB_shader_storage_buffer_object : require
layout(local_size_x = 1, local_size_y = 1) in;	
//local group of shaders
layout (std430, binding=0) volatile buffer shader_data
{ 
  vec4 star_position[1024];
  vec4 star_speed[1024];
  vec4 star_color[1024];
  vec4 star_mass[1024];
};
void main() 
	{
	uint index = gl_GlobalInvocationID.x;	
	vec3 pos = star_position[index].xyz;
	pos += star_speed[index].xyz;
	star_position[index] = vec4(pos,0);		
	}