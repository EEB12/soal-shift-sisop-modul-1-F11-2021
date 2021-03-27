#!/bin/bash

cd /home/nazhwaameera/Desktop/Kuliah/Praktikum

tanggal=$(date +"%m%d%Y")

for dirName in K*_*
do
	zip --password $tanggal -r Koleksi $dirName
done
