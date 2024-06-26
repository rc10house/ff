#!/bin/bash 

# path=$(find -s ~/Desktop/ | fzf)
path=$(rg --files ~/Desktop/ ~/Downloads/ | fzf --scheme=path --keep-right --border=none --prompt='')
while true; do
  echo ". -> $path" 
  echo "-- v j f r x z l--"
  read -n 1 input
  echo ""

  # path=$(echo $path | sed "s/\'/\\\'/g")
  path=$(echo $path | sed "s/' '/\\ /g")

  if [[ $input == 'v' ]]; then 
    parent_dir=$(dirname $path | awk '{ print $1 }')
    cd $parent_dir
    vim $path
    break
  elif [[ $input == 'j' ]]; then 
    parent_dir=$(dirname $path | awk '{ print $1 }')
    cd $parent_dir && ls -l 
    break
  elif [[ $input == 'f' ]]; then 
    cd $path
    path=$(rg --files ./ | fzf)
    continue
  elif [[ $input == 'r' ]]; then 
    cd $path
    path=$(rg . | fzf | awk -F : '{ print $1 }')
  elif [[ $input == 'x' ]]; then 
    eval $path
    break
  elif [[ $input == 'z' ]]; then 
    parent_dir=$(dirname $path | awk '{ print $1 }')
    echo -n "zip file name: "
    read zip_name
    tar -czvf "$zip_name.tar.gz" $parent_dir
    break
  elif [[ $input == 'l' ]]; then
    less $path
    break
  elif [[ $input == 'h' ]]; then 
    echo "Usage:"
    echo "v - open in vim"
    echo "j - jump to directory"
    echo "f - search within directory"
    echo "r - grep file lines within directory"
    echo "x - execute file"
    echo "z - create gzip tarball of directory"
    echo "l - open file with less"
    break
  elif [[ $input == q ]]; then
    break
  fi
done
  
