#! /bin/bash

script_path=$(dirname -- "$(realpath "$0")")
folder_path=$(realpath --relative-to="$script_path" "$1")
password="$2"

if [[ $# != 2 ]]
then
    echo "Usage: $# <course folder> <password>"
    exit 1
fi

if [[ $folder_path == ..* ]]
then
    echo "not in path"
    exit 1
fi

find "$folder_path" -type f -name '*.py' | xargs -P0 -I{} gpg --symmetric --batch --yes --passphrase="$password" {}
