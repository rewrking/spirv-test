#!/usr/bin/env bash

src_dir=src
build_dir=build
output_ext=spv
header_ext=h

glsl_vert_frag() {
	shader_file=$1
	target_env=$2
	shader_input_files="$src_dir/$shader_file.vert.glsl $src_dir/$shader_file.frag.glsl"
	output_dir=$build_dir/$target_env
	header_shader_name=${shader_file}_shader_bin

	mkdir -p $output_dir
	glslang --target-env $target_env -o $output_dir/$shader_file.$output_ext $shader_input_files
	glslang --target-env $target_env --vn $header_shader_name -o $output_dir/$shader_file.$header_ext $shader_input_files
}

compile_supported_vert_frag() {
	source_file_group=$1

	glsl_vert_frag $source_file_group opengl
	glsl_vert_frag $source_file_group vulkan1.3
}

compile_supported_vert_frag generic