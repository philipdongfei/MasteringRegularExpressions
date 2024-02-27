#!/bin/bash
for loop in {1..10}
do
    var=$(printf "%02d" "$loop")
    mkdir chapt$var
    touch ./chapt$var/NOTE$var.md
done

