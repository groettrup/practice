#! /bin/bash

script_path=$(dirname -- "$(realpath "$0")")
folder_path=$(realpath --relative-to="$script_path" "$1")

if [[ $# != 1 ]]
then
    echo "Usage: $# <course folder>"
    exit 1
fi

if [[ $folder_path == ..* ]]
then
    echo "not in path"
    exit 1
fi

find "$folder_path" -type f -name '*.py' -delete

