#version 460 core

layout (location = 0) in FragInput {
	vec3 FragPosition;
	vec4 Color;
	vec2 TexCoord;
} Input;

layout (binding = 0) uniform sampler2D diffuse;
layout(std140, binding = 1) uniform FragmentState {
	int ColorFunction;
} State;

layout (location = 0) out vec4 OutColor;

vec4 useUntextured()
{
	return Input.Color;
}

vec4 useTexture1()
{
	return texture(diffuse, Input.TexCoord) * Input.Color;
}

void main()
{
	switch (State.ColorFunction) {
	case 0:
		OutColor = useUntextured();
		break;
	case 1:
		OutColor = useTexture1();
		break;
	}
}
