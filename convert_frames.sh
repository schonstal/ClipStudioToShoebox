#!/bin/bash

a=1
for i in *.png; do
  old_name=${i//[0-9]/}
  old_name=${old_name//\.png/}

  new=$(printf "%s%09d.png" "$old_name" "$a")

  if [ "$i" = "$new" ]; then
    echo "$i is already named $new"
  else
    echo "renaming $i to $new"
    mv -i -- "$i" "$new"
  fi

  let a=a+1
done
