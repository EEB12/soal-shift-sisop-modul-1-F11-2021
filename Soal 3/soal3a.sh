#!/bin/bash

hitung=1
for((i=1; i<=23; i++))
do
	wget -o a.log https://loremflickr.com/320/240/kitten
	if [[ $hitung -gt 1 ]]
	then
		location=`awk '/Location/{print $2}' a.log`
		compare=`awk -v "loc=$location" '$0 ~ loc {print 1}' Foto.log`
		if [[ ${#compare} -gt 1 ]]
		then
			rm kitten
			let hitung=$hitung-1
		else
			mv kitten Koleksi_$hitung.jpg
			cat a.log >> Foto.log
		fi
		rm a.log
	else
		mv kitten Koleksi_$hitung.jpg
		mv a.log Foto.log
	fi
	let hitung=$hitung+1

done

for((i=1; i<=9; i++))
do
	if [ -f Koleksi_$i.jpg ]
	then
		mv Koleksi_$i.jpg Koleksi_0$i.jpg
	fi
done

