#!/bin/bash
LC_ALL=C awk '
BEGIN {FS="\t"}
#soal A
{if (profit<=$21/($18-$21)*100){
	atas=$21
	bawah=$18-$21
	tes=$18
	profit=atas/bawah*100
	
	
	ID=$1
	
	
}
}

#soal B

{if($3 ~ /17/ && $10=="Albuquerque"){
	nama[$7]++

	
}
}
#soal c
{if($8=="Consumer"){
	Consumer++;
	
}
else if($8=="Home Office"){
	home++;
	
}
else if($8=="Corporate"){
	Corporate++;
	
}
}
#soal D
{if($13=="West"){
	
	barat+=$21
}
else if($13=="South"){
	selatan+=$21
	
}
else if($13=="Central"){
	tengah+=$21
	
}else if($13=="East"){
	utara+=$21
	
}

}

END{

#jawaban a
printf "Transaksi terakhir dengan profit percentage terbesar yaitu %d dengan persentase %.1f%%  \n",ID,profit


#jawaban b
printf "\nDaftar nama customer di Albuquerque pada tahun 2017 antara lain:\n"

for (orang in nama){
	
	printf "%s \n",orang
}


#jawaban c
if (Consumer<home && Consumer<Corporate){

	simpul="Consumer"
	
	printf "\n Tipe segmen customer yang penjualannya paling sedikit adalah %s dengan %d transaksi.\n",simpul,Consumer
	
}else if(home<Consumer && home<Corporate){
	simpul="Home Office"
	
	printf "\nTipe segmen customer yang penjualannya paling sedikit adalah %s dengan %d transaksi.\n",simpul,home
	
}else if(Coporate<Consumer && Corporate<home){
	simpul="Corporate"
	
	
	printf "\nTipe segmen customer yang penjualannya paling sedikit 	adalah %s dengan %d transaksi.\n",simpul,Corporate
	
}

#jawaban D

if (utara<barat && utara<selatan && utara<tengah){

	simpul="North"
	
	printf "\nWilayah bagian (region) yang memiliki total keuntungan (profit) yang paling sedikit adalah %s dengan total keuntungan %d ",simpul,utara
	
}else if (barat<utara && barat<selatan && barat<tengah){

	simpul="West"
	
	printf "\nWilayah bagian (region) yang memiliki total keuntungan (profit) yang paling sedikit adalah %s dengan total keuntungan %d ",simpul,barat
	


}else if (selatan<utara && selatan<barat && selatan<tengah){

	simpul="South"
	
	printf "\nWilayah bagian (region) yang memiliki total keuntungan (profit) yang paling sedikit adalah %s dengan total keuntungan %d ",simpul,selatan
	


}else if (tengah<utara && tengah<barat && tengah<selatan){

	simpul="Central"
	
	printf "\nWilayah bagian (region) yang memiliki total keuntungan (profit) yang paling sedikit adalah %s dengan total keuntungan %d ",simpul,tengah
	


}


}

' /home/rayhan/Downloads/Laporan-TokoShiSop.tsv > hasil.txt

