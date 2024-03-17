#!/usr/bin/env bash

src_dir=src
build_dir=build
output_ext=spv
header_ext=h
header_shader_name=main_shader

glsl_vert_frag() {
	target_env=$1
	shader_file=$2
	shader_input_files="$src_dir/$shader_file.vert.glsl $src_dir/$shader_file.frag.glsl"
	output_dir=$build_dir/$target_env

	mkdir -p $output_dir
	glslang --target-env $target_env -o $output_dir/$shader_file.$output_ext $shader_input_files
	glslang --target-env $target_env --vn $header_shader_name -o $output_dir/$shader_file.$header_ext $shader_input_files
}

glsl_vert_frag opengl generic
glsl_vert_frag vulkan1.3 generic