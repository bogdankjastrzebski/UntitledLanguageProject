#!/bin/bash 
cat "daisy3.txt" | while IFS= read -r line; do
       echo -e "$line"
done
