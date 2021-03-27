#!/bin/bash

directory=$(date +"%d-%m-%Y")

mkdir Kucing_$directory
mkdir Kelinci_$directory

hitung=1
for((i=1; i<=31; i++))
do
	if [ $((i%2)) -eq 0 ]
	then
		wget -O "Kucing_$hitung.jpg" -a Foto.log https://loremflickr.com/320/240/kitten
	elif [ $((i%2)) -eq 1 ]
	then
		wget -O "Kelinci_$hitung.jpg" -a Foto.log https://loremflickr.com/320/240/bunny
	fi
	let hitung=$hitung+1
done

for((i=1; i<=31; i++))
do
	if [ $((i%2)) -eq 0 ]
	then
		mv Kucing_$i.jpg Kucing_$directory
	elif [ $((i%2)) -eq 1 ]
	then
		mv Kelinci_$i.jpg Kelinci_$directory
	fi
done
