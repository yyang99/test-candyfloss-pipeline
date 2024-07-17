#!/bin/bash

if [ $# -eq 0 ]; then
  echo "Error: Please provide a source application config file name."
  exit 1
fi

file_name="$1"

output="  pipeline = {
"
for file in $(ls pipeline); do
  filename=$(basename "$file" .json)
  output="$output    $filename {
      output.topic.name = device-$filename-proc-json
      file = pipeline/$file
    },"
  output="$output
"
done
  output="$output  }
}"

sed -i -e '/pipeline = {/,$d' $file_name
echo "$output" >> $file_name

