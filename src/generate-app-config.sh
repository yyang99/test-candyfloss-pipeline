#!/bin/bash

if [ $# -ne 2 ]; then
  echo "Error: Please provide pipeline folder path and application config file name."
  exit 1
fi

pipeline_folder="$1"
app_file_name="$2"
output="  pipeline = {
"
for file in $(ls $pipeline_folder); do
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

sed -i -e '/^\s*pipeline = {/,$d' $app_file_name
echo "$output" >> $app_file_name

