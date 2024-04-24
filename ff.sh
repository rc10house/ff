#!/bin/bash 

path=$(find -s ~/Desktop/ | fzf)
while true; do
  echo ". -> $path" 
  echo "-- v j f r o g --"
  read -n 1 input
  echo $input

  if [[ $input == v ]]; then 
    vim $path
    break
  elif [[ $input == j ]]; then 
    cd $path && ls -l 
    break
  elif [[ $input == f ]]; then 
    cd $path
    path=$(find -s . | fzf)
    continue
  elif [[ $input == r ]]; then 
    cd $path
    path=$(rg . | fzf | awk -F : '{ print $1 }')
  elif [[ $input == o ]]; then 
    open $path
    break
  elif [[ $input == g ]]; then 
    open -R $path
    break
  fi
done
  
