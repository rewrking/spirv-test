#version 460 core

layout (location = 0) in vec3 a_Position;
layout (location = 1) in vec4 a_Color;
layout (location = 2) in vec2 a_TexCoords;

layout(std140, binding = 0) uniform VertexState {
	mat4 Model;
	mat4 Projection;
} State;

layout (location = 0) out VertexOutput {
	vec3 FragPosition;
	vec4 Color;
	vec2 TexCoord;
} Output;

void main()
{
	Output.FragPosition = a_Position;
	Output.Color = a_Color;
	Output.TexCoord = a_TexCoords;

	gl_Position = State.Projection * State.Model * vec4(Output.FragPosition, 1.0);
}
