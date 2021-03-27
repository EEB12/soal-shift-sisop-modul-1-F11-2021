# soal-shift-sisop-modul-1-F11-2021



## Soal No.2
Steven dan Manis mendirikan sebuah startup bernama “TokoShiSop”. Sedangkan kamu dan Clemong adalah karyawan pertama dari TokoShiSop. Setelah tiga tahun bekerja, Clemong diangkat menjadi manajer penjualan TokoShiSop, sedangkan kamu menjadi kepala gudang yang mengatur keluar masuknya barang.

Tiap tahunnya, TokoShiSop mengadakan Rapat Kerja yang membahas bagaimana hasil penjualan dan strategi kedepannya yang akan diterapkan. Kamu sudah sangat menyiapkan sangat matang untuk raker tahun ini. Tetapi tiba-tiba, Steven, Manis, dan Clemong meminta kamu untuk mencari beberapa kesimpulan dari data penjualan “Laporan-TokoShiSop.tsv”.

### 2.a
Steven ingin mengapresiasi kinerja karyawannya selama ini dengan mengetahui
**Row ID** dan **profit percentage terbesar** (jika hasil profit percentage terbesar
lebih dari 1, maka ambil Row ID yang paling besar). Karena kamu bingung,
Clemong memberikan definisi dari profit percentage, yaitu:
```
Profit Percentage = (Profit/(Sales-Profit))
```


### jawaban
```
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
```
Penjelasan :
	diawal awal digunakan LC_ALL agar dari linux bisa dapat membedakan antara titik dan koma. kemudian BEGIN {FS="\t"} digunakan sebagai separator untuk tab karena file dokumen yang akan digunakan berformat .tsv. Untuk mencari persentase profit terbesar digunakan `if (profit<=$21/($18-$21)*100)` yang berfungsi untuk membandingkan persentase profit data sebelum dengan sesudah, lalu jika lebih kecil maka variabel profit yang berfungsi untuk menyimpan persentasenya dan id akan diupdate
### 2.b
Clemong memiliki rencana promosi di Albuquerque menggunakan metode MLM.
Oleh karena itu, Clemong membutuhkan daftar **nama customer pada transaksi tahun 2017 di Albuquerque**.
### Jawaban
pada no 2b yang dicari adalah daftar nama customer pada tranksaksi tahun 2017 dan di Albuquerque
```
{if($3 ~ /17/ && $10=="Albuquerque"){
	nama[$7]++

	
}
}
```
Penjelasan :
jadi sesuai apa yang diminta dengan soal 2b untuk bisa mencari daftar nama customer pada tranksaksi tahun 2017 dan di Albuquerque maka digunakan `if($3 ~ /17/ && $10=="Albuquerque"` lalu jika persyaratan terpenuhi maka array nama akan tertambahi dengan $7 dimana $7 adalah nama customer
### 2.c
TokoShiSop berfokus tiga segment customer, antara lain: Home Office,
Consumer, dan Corporate. Clemong ingin meningkatkan penjualan pada segmen
customer yang paling sedikit. Oleh karena itu, Clemong membutuhkan **segment customer** 
dan **jumlah transaksinya yang paling sedikit**.
### jawaban
```
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
```
jadi pada no 2c terdapat 3 segment cutomer yaitu consumer, home office dan corporate dan pada $8 yang berisi segment akan dicek, apabila semisalnya segmentnya consumer maka value dari Consumer akan bertambah dst.
```
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
```
diatas adalah untuk mencari segment terkecil dengan total tranksasinya
### 2.d
TokoShiSop membagi wilayah bagian (region) penjualan menjadi empat bagian,
antara lain: Central, East, South, dan West. Manis ingin mencari **wilayah bagian(region) yang memiliki total keuntungan (profit) paling sedikit** dan **total keuntungan wilayah tersebut**.

### 2.e


