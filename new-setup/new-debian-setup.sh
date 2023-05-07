#!/bin/bash

sudo apt-get update
wait

sudo apt-get upgrade -y
wait

sudo apt-get autoremove -y
wait

sudo apt-get install nala -y
wait

sudo nala install ansible -y
wait

sudo nala install flatpak -y
wait

source new-setup-all-systems.sh
