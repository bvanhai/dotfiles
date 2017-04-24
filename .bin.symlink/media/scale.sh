#!/bin/bash
if [[ "$1" == "-h" || "$1" == "--help" ]]; then
    echo "Scale image sizes using Imagemagick's convert command."
    echo "Usage: $0 <PERCENTAGE>% <FILE[S]>"
    exit 0
fi

for f in "$@"; do
    if [[ "$f" != *% ]]; then
        echo $f
        convert $f -resize $1 scaled-$f
    fi
done
