#!/usr/bin/env bash
# Convert flac to mp3

for file in *.flac; do
  $(flac -cd "$file" | lame -h - "${file%.flac}.mp3");
done

(( $? == 0 )) && rm *.flac

