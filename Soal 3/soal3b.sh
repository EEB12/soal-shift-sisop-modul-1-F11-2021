#!/bin/bash

cd /home/nazhwaameera/Desktop/Kuliah/Praktikum
dirName=$(date + "%d-%m-%Y")
mkdir $dirName

bash /home/nazhwaameera/Desktop/Kuliah/Praktikum/soal3a.sh
mv *.jpg $dirName
mv Foto.log $dirName


