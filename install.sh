#!/bin/bash 

os=$1 

if [[ $os == "linux" ]]; then 
  curr=$(pwd)
  echo "alias f=. $pwd/fflin.sh" >> ~/.bash_profile
elif [[ $os == "mac" ]]; then 
  curr=$(pwd)
  echo "alias f=. $pwd/ff.sh" >> ~/.bash_profile
else 
  echo "usage: ./install.sh mac or ./installsh linux"
  exit
fi
echo "please source shell now"
