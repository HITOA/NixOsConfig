#!/bin/bash

hardware-config = $(nixos-generate-config --show-hardware-config)

for dir in ./profiles/
do
    echo $dir
done