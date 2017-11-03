#!/usr/bin/env bash

set -e
#set -x

mkdir -p __tmp__

output_dir="__tmp__"
input_file="examples/scatter.json"

if [ $# -ge 1 ]
    then
        input_file=$1
fi

log_symbol=$'\xF0\x9F\x8C\x9F'

input_file_fullname=$(basename "$input_file")
target_name="${input_file_fullname%.*}"

output_spec="$output_dir/$target_name.vl.json"
output_png="$output_dir/$target_name.png"


# body

echo "$log_symbol [OK] Start processing file $input_file..."

draco $input_file --out $output_spec

echo "$log_symbol [OK] Output spec: $output_spec"

npm run vl2png --silent -- $output_spec > $output_png

echo "$log_symbol [OK] Output png: $output_png"

open $output_png
