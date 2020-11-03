#!/bin/bash
#CREATE A NEW JS PROJECT
#let script exit if a command fails
set -o errexit 
#let script exit if an unsed variable is used
set -o nounset
#Project name as a parameter
# cd ~/Documents/Projects
dir=$1
mkdir "$dir" "$dir"/css "$dir"/js "$dir"/img
touch "$dir"/index.html "$dir"/css/style.css "$dir"/js/script.js "$dir"/readme.md 
cd "$dir"
pwd
echo "Welcome to your new JS project"
