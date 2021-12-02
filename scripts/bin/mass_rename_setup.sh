#! /usr/bin/env bash

for filename in *
do echo mv \"$filename\" \"${filename//$1/$2}\"
done > rename.txt
vim rename.txt
