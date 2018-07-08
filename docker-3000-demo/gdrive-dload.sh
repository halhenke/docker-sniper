#!/bin/bash
# fileid="1hEG-GmMrvp--hWRU41RMBLB3gL-IdXs9"
# filename="ILSVRC2014_devkit.tar"

if [ $# -ne 2 ];
    then echo "illegal number of parameters"
fi

fileid=$1
filename=$2

# echo "arg 1 is $fileid"
# echo "arg 2 is $filename"

curl -c ./cookie -s -L "https://drive.google.com/uc?export=download&id=${fileid}" > /dev/null
curl -Lb ./cookie "https://drive.google.com/uc?export=download&confirm=`awk '/download/ {print $NF}' ./cookie`&id=${fileid}" -o ${filename}