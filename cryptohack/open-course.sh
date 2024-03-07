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

find "$folder_path" -type f -name '*.py.gpg' -print0 | sed 's/.py.gpg//g' | xargs -0 -P0 -I{} gpg --decrypt --batch --yes --passphrase="$password" --output={}.py {}.py.gpg 
find "$folder_path" -type f -name '*.sage.gpg' -print0 | sed 's/.sage.gpg//g' | xargs -0 -P0 -I{} gpg --decrypt --batch --yes --passphrase="$password" --output={}.sage {}.sage.gpg 
