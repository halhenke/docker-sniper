#!/bin/bash
# fileid="### file id ###"
fileid="1hEG-GmMrvp--hWRU41RMBLB3gL-IdXs9"
filename="ILSVRC2014_devkit.tar"
curl -c ./cookie -s -L "https://drive.google.com/uc?export=download&id=${fileid}" > /dev/null
curl -Lb ./cookie "https://drive.google.com/uc?export=download&confirm=`awk '/download/ {print $NF}' ./cookie`&id=${fileid}" -o ${filename}