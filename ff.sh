#!/bin/bash 

while true; do
  path=$(find ~/Desktop/ | fzf)
  echo ". -> $path" 
  echo "-- v j f r--"
  read -n 1 input
  echo $input

  if [[ $input == v ]]; then 
    cd $path
    vim $path
    break
  elif [[ $input == j ]]; then 
    cd $path && ls -l 
    break
  elif [[ $input == f ]]; then 
    cd $path
    read $1
    continue
  elif [[ $input == r ]]; then 
    break 
  fi
done
  
