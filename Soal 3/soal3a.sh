#!/bin/bash

for((i=1; i<=23; i++))
do
	wget -O "Koleksi_$i.jpg" -a Foto.log https://loremflickr.com/320/240/kitten
done

for((i=1; i<=23; i++))
do
	for((j=1; j<i; j++))
	do
		if comm Koleksi_$j.jpg Koleksi_$i.jpg &> /dev/null
		then
			rm Koleksi_$i.jpg
			break
		fi
	done
done

for((i=1; i<=23; i++))
do
	if [ ! -f Koleksi_$i.jpg ] 
	then
		for((j=23; j>i; j--))
		do
			if [ -f Koleksi_$j.jpg ];
			then
				mv Koleksi_$j.jpg Koleksi_$i.jpg
				break
			fi
		done
	fi
done

for((i=1; i<=9; i++))
do
	if [ -f Koleksi_$i.jpg ]
	then
		mv Koleksi_$i.jpg Koleksi_0$i.jpg
	fi
done

