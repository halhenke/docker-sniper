#!/bin/bash

if [ $# -ne 2 ];
    then echo "illegal number of parameters"
fi

fileid=$1
filename=$2

curl -c ./cookie -s -L "https://drive.google.com/uc?export=download&id=${fileid}" > /dev/null
curl -Lb ./cookie "https://drive.google.com/uc?export=download&confirm=`awk '/download/ {print $NF}' ./cookie`&id=${fileid}" -o ${filename}
