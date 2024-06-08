#!/bin/bash

hardware_config=$(nixos-generate-config --show-hardware-config)

for dir in ./profiles/*
do
    echo "$hardware_config" >> "$dir/hardware-configuration.nix"
done