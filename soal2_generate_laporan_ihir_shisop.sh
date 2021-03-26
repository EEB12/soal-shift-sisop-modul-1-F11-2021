#!/bin/bash
LC_ALL=C awk '
BEGIN {FS="\t"}
#soal A
{if (pp<=$21/($18-$21)*100){
	atas=$21
	bawah=$18-$21
	tes=$18
	pp=atas/bawah*100
	
	
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
printf "Transaksi terakhir dengan profit percentage terbesar yaitu %d dengan persentase %f. \n \n",ID,pp


#jawaban b
printf "Daftar nama customer di Albuquerque pada tahun 2017 antara lain:\n"

for (orang in nama){
	
	printf "%s \n",orang
}


#jawaban c
if (Consumer<home && Consumer<Corporate){

	simpul="Consumer"
	
	printf "Tipe segmen customer yang penjualannya paling sedikit 	adalah %s dengan %d transaksi.",simpul,Consumer
	
}else if(home<Consumer && home<Corporate){
	simpul="Home Office"
	
	printf "Tipe segmen customer yang penjualannya paling sedikit adalah %s dengan %d transaksi.",simpul,home
	
}else if(Coporate<Consumer && Corporate<home){
	simpul="Corporate"
	
	
	printf "Tipe segmen customer yang penjualannya paling sedikit 	adalah %s dengan %d transaksi.",simpul,Corporate
	
}

#jawaban D
printf "ini %d \n",barat
if (utara<barat && utara<selatan && utara<tengah){

	simpul="Timrur"
	
	printf "Wilayah bagian (region) yang memiliki total keuntungan (profit) yang paling sedikit adalah %s dengan total keuntungan %d ",simpul,utara
	
}else if (barat<utara && barat<selatan && barat<tengah){

	simpul="barat"
	
	printf "Wilayah bagian (region) yang memiliki total keuntungan (profit) yang paling sedikit adalah %s dengan total keuntungan %d ",simpul,barat
	


}else if (selatan<utara && selatan<barat && selatan<tengah){

	simpul="selatan"
	
	printf "Wilayah bagian (region) yang memiliki total keuntungan (profit) yang paling sedikit adalah %s dengan total keuntungan %d ",simpul,selatan
	


}else if (tengah<utara && tengah<barat && tengah<selatan){

	simpul="tengah"
	
	printf "Wilayah bagian (region) yang memiliki total keuntungan (profit) yang paling sedikit adalah %s dengan total keuntungan %d ",simpul,tengah
	


}


}

' /home/rayhan/Downloads/Laporan-TokoShiSop.tsv > hasil.txt

