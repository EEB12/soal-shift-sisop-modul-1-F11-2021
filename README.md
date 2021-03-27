# Soal-Shift-Sisop-Modul-1-F11-2021

## Soal No. 1
Ryujin baru saja diterima sebagai IT support di perusahaan Bukapedia. Dia diberikan tugas untuk membuat laporan harian untuk aplikasi internal perusahaan, ticky. Terdapat 2 laporan yang harus dia buat, yaitu laporan daftar peringkat pesan error terbanyak yang dibuat oleh ticky dan laporan penggunaan user pada aplikasi ticky. Untuk membuat laporan tersebut, Ryujin harus melakukan beberapa hal berikut :
(Tidak Selesai)

### a.
Mengumpulkan informasi dari log aplikasi yang terdapat pada file syslog.log. Informasi yang diperlukan antara lain: jenis log (ERROR/INFO), pesan log, dan username pada setiap baris lognya. Karena Ryujin merasa kesulitan jika harus memeriksa satu per satu baris secara manual, dia menggunakan regex untuk mempermudah pekerjaannya. Bantulah Ryujin membuat regex tersebut.
Penjelasan : Bingung dalam memahami Regex.

### b.
Kemudian, Ryujin harus menampilkan semua pesan error yang muncul beserta jumlah kemunculannya.

### c.
Ryujin juga harus dapat menampilkan jumlah kemunculan log ERROR dan INFO untuk setiap user-nya. Setelah semua informasi yang diperlukan telah disiapkan, kini saatnya Ryujin menuliskan semua informasi tersebut ke dalam laporan dengan format file csv.

### d.
Semua informasi yang didapatkan pada poin b dituliskan ke dalam file error_message.csv dengan header Error,Count yang kemudian diikuti oleh daftar pesan error dan jumlah kemunculannya diurutkan berdasarkan jumlah kemunculan pesan error dari yang terbanyak.

### e.
Semua informasi yang didapatkan pada poin c dituliskan ke dalam file user_statistic.csv dengan header Username,INFO,ERROR diurutkan berdasarkan username secara ascending. Catatan :
	- Setiap baris pada file syslog.log mengikuti pola berikut :
	  <time> <hostname> <app_name>: <log_type> <log_message> (<username>)
	- Tidak boleh menggunakan AWK

## Soal No.2
Steven dan Manis mendirikan sebuah startup bernama “TokoShiSop”. Sedangkan kamu dan Clemong adalah karyawan pertama dari TokoShiSop. Setelah tiga tahun bekerja, Clemong diangkat menjadi manajer penjualan TokoShiSop, sedangkan kamu menjadi kepala gudang yang mengatur keluar masuknya barang.

Tiap tahunnya, TokoShiSop mengadakan Rapat Kerja yang membahas bagaimana hasil penjualan dan strategi kedepannya yang akan diterapkan. Kamu sudah sangat menyiapkan sangat matang untuk raker tahun ini. Tetapi tiba-tiba, Steven, Manis, dan Clemong meminta kamu untuk mencari beberapa kesimpulan dari data penjualan “Laporan-TokoShiSop.tsv”.

### a.
Steven ingin mengapresiasi kinerja karyawannya selama ini dengan mengetahui
**Row ID** dan **profit percentage terbesar** (jika hasil profit percentage terbesar
lebih dari 1, maka ambil Row ID yang paling besar). Karena kamu bingung,
Clemong memberikan definisi dari profit percentage, yaitu:
```
Profit Percentage = (Profit/(Sales-Profit))
```


### Jawaban
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
### b.
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
### c.
TokoShiSop berfokus tiga segment customer, antara lain: Home Office,
Consumer, dan Corporate. Clemong ingin meningkatkan penjualan pada segmen
customer yang paling sedikit. Oleh karena itu, Clemong membutuhkan **segment customer** 
dan **jumlah transaksinya yang paling sedikit**.
### Jawaban
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
### d.
TokoShiSop membagi wilayah bagian (region) penjualan menjadi empat bagian,
antara lain: Central, East, South, dan West. Manis ingin mencari **wilayah bagian(region) yang memiliki total keuntungan (profit) paling sedikit** dan **total keuntungan wilayah tersebut**.

### Jawaban
untuk pertanyaan ini mirip dengan yang c hanya saja yang dicari adalah region dengan keuntungan paling sedikit
```
{if($13=="West"){
	
	barat+=$21
}
else if($13=="South"){
	selatan+=$21
	
}
else if($13=="Central"){
	tengah+=$21
	
}else if($13=="East"){
	timur+=$21
	
}

}

```
mirip dengan yang 2c tetapi perbedaanya adalah ketika persyaratan terpenuhi maka yang ditambahkan bukan totalnya tetapi total profitnya. contoh jika $13(region) adalah west maka variabel barat akan ketambahan dengan profit pada row tersebut. kemudian untuk mencari yang paling terkecil adalah berikut...

```
if (timur<barat && timur<selatan && timur<tengah){

	simpul="North"
	
	printf "\nWilayah bagian (region) yang memiliki total keuntungan (profit) yang paling sedikit adalah %s dengan total keuntungan %d ",simpul,utara
	
}else if (barat<utara && barat<selatan && barat<tengah){

	simpul="West"
	
	printf "\nWilayah bagian (region) yang memiliki total keuntungan (profit) yang paling sedikit adalah %s dengan total keuntungan %d ",simpul,barat
	


}else if (selatan<timur && selatan<barat && selatan<tengah){

	simpul="South"
	
	printf "\nWilayah bagian (region) yang memiliki total keuntungan (profit) yang paling sedikit adalah %s dengan total keuntungan %d ",simpul,selatan
	


}else if (tengah<timur&& tengah<barat && tengah<selatan){

	simpul="Central"
	
	printf "\nWilayah bagian (region) yang memiliki total keuntungan (profit) yang paling sedikit adalah %s dengan total keuntungan %d ",simpul,tengah
	


}

```

### e.
diharapkan bisa membuat sebuah script yang akan menghasilkan file “hasil.txt” 

### Jawaban

```
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

if (timur<barat && timur<selatan && timur<tengah){

	simpul="North"
	
	printf "\nWilayah bagian (region) yang memiliki total keuntungan (profit) yang paling sedikit adalah %s dengan total keuntungan %d ",simpul,utara
	
}else if (barat<utara && barat<selatan && barat<tengah){

	simpul="West"
	
	printf "\nWilayah bagian (region) yang memiliki total keuntungan (profit) yang paling sedikit adalah %s dengan total keuntungan %d ",simpul,barat
	


}else if (selatan<timur && selatan<barat && selatan<tengah){

	simpul="South"
	
	printf "\nWilayah bagian (region) yang memiliki total keuntungan (profit) yang paling sedikit adalah %s dengan total keuntungan %d ",simpul,selatan
	


}else if (tengah<timur&& tengah<barat && tengah<selatan){

	simpul="Central"
	
	printf "\nWilayah bagian (region) yang memiliki total keuntungan (profit) yang paling sedikit adalah %s dengan total keuntungan %d ",simpul,tengah
	


}


}

' /home/rayhan/Downloads/Laporan-TokoShiSop.tsv > hasil.txt
```

diatas adalah output dari nomer 2a,2b,2c dan 2d. digunakan END yang isinya akan dilaksakanan terakhir. kemudian `/home/rayhan/Downloads/Laporan-TokoShiSop.tsv > hasil.txt` berguna untuk mengambil dokumen TokoShiSop.tsv dan output akan ditaruh di hasil.txt

## Soal No.3
Kuuhaku adalah orang yang sangat suka mengoleksi foto-foto digital, namun Kuuhaku juga merupakan seorang yang pemalas sehingga ia tidak ingin repot-repot mencari foto, selain itu ia juga seorang pemalu, sehingga ia tidak ingin ada orang yang melihat koleksinya tersebut, sayangnya ia memiliki teman bernama Steven yang memiliki rasa kepo yang luar biasa. Kuuhaku pun memiliki ide agar Steven tidak bisa melihat koleksinya, serta untuk mempermudah hidupnya, yaitu dengan meminta bantuan kalian. Idenya adalah :

### a.
Membuat script untuk mengunduh 23 gambar dari "https://loremflickr.com/320/240/kitten" serta menyimpan log-nya ke file "Foto.log". Karena gambar yang diunduh acak, ada kemungkinan gambar yang sama terunduh lebih dari sekali, oleh karena itu kalian harus menghapus gambar yang sama (tidak perlu mengunduh gambar lagi untuk menggantinya). Kemudian menyimpan gambar-gambar tersebut dengan nama "Koleksi_XX" dengan nomor yang berurutan tanpa ada nomor yang hilang (contoh : Koleksi_01, Koleksi_02, ...)

### Jawaban
```
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
```
Untuk soal a, kita diminta untuk mengunduh 23 gambar dari link yang diberikan dan menghapus gambar yang sama tanpa perlu mengunduhnya lagi. Lalu foto-foto yang telah disimpan tersebut disimpan dengan nama "Koleksi_XX
Pertama kita mengunduh gambar menggunakan link sebanyak 23 kali. Lalu kita menggunakan fungsi comm untuk menemukan gambar yang terduplikasi. Setelah proses download selesai, kita mengecek apakah ada nomor urutan yang terlewat dan merename file terakhir dengan nomor file yang hilang tersebut. Agar nomer pada nama file menjadi double digit, dilakukan iterasi 9 kali untuk merename file dengan nomor single digit

### b.
Karena Kuuhaku malas untuk menjalankan script tersebut secara manual, ia juga meminta kalian untuk menjalankan script tersebut sehari sekali pada jam 8 malam untuk tanggal-tanggal tertentu setiap bulan, yaitu dari tanggal 1 tujuh hari sekali (1,8,...), serta dari tanggal 2 empat hari sekali(2,6,...). Supaya lebih rapi, gambar yang telah diunduh beserta log-nya, dipindahkan ke folder dengan nama tanggal unduhnya dengan format "DD-MM-YYYY" (contoh : "13-03-2023").

### Jawaban
```
cd /home/nazhwaameera/Desktop/Kuliah/Praktikum
dirName=$(date + "%d-%m-%Y")
mkdir $dirName

bash /home/nazhwaameera/Desktop/Kuliah/Praktikum/soal3a.sh
mv *.jpg $dirName
mv Foto.log $dirName

```
Untuk soal b, kita diminta untuk menjalankan script yang sudah kita buat sebelumnya tiap sehari sekali pada jam 8 malam untuk tanggal 1 tujuh hari sekali dan tanggal 2 empat hari sekali. Kita juga diminta untuk menyimpan gambar dan lognya ke folder dengan format nama tanggal unduhnya ("DD-MM-YYYY")

### c.
Agar kuuhaku tidak bosan dengan gambar anak kucing, ia juga memintamu untuk mengunduh gambar kelinci dari "https://loremflickr.com/320/240/bunny". Kuuhaku memintamu mengunduh gambar kucing dan kelinci secara bergantian (yang pertama bebas. contoh : tanggal 30 kucing > tanggal 31 kelinci > tanggal 1 kucing > ... ). Untuk membedakan folder yang berisi gambar kucing dan gambar kelinci, nama folder diberi awalan "Kucing_" atau "Kelinci_" (contoh : "Kucing_13-03-2023").

### Jawaban

```
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
```
Untuk soal c, kita diminta untuk mendownload gambar kelinci dan kucing secara berselang-seling. Unduhan kemudian disimpan sesuai dalam folder jenis foto (kelinci atau kucing) dengan format nama "Kucing_" atau "Kelinci_" beserta tanggal unduh di belakangnya.
Pertama kita buat direktori tempat di mana foto-foto kucing dan kelinci akan disimpan. Kemudian, kita melakukan iterasi sebanyak 31 hari (hitungan hari terbanyak dalam satu bulan) lalu untuk hari-hari genap kita akan mendownload gambar kucing, sedang untuk hari-hari ganjil kita akan medownload gambar kelinci. Setelah iterasi selesai, kita memindahkan file-file yang telah didownload ke dalam direktori yang sudah dibuat.

### d.
Untuk mengamankan koleksi Foto dari Steven, Kuuhaku memintamu untuk membuat script yang akan memindahkan seluruh folder ke zip yang diberi nama “Koleksi.zip” dan mengunci zip tersebut dengan password berupa tanggal saat ini dengan format "MMDDYYYY" (contoh : “03032003”).

### Jawaban

```
#!/bin/bash

cd /home/nazhwaameera/Desktop/Kuliah/Praktikum

tanggal=$(date +"%m%d%Y")

for dirName in K*_*
do
	zip --password $tanggal -r Koleksi $dirName
done
```
Untuk soal d, kita diminta untuk memindahkan seluruh folder ke zip lalu memberi password zip tersebut dengan tanggal berformat "MMDDYYYY"
Pertama kita berpindah ke direktori tempat file berada. Lalu kita mengeset sebuah variabel untuk menyimpan tanggal -variabel ini kemudian akan digunakan sebagai password zip file. Lalu, kita mencari direktori yang berawalan K (Kelinci dan Kucing) untuk dimasukkan ke dalam folder yang sama dan di zip. Kita menjalankan command -r agar semua file di dalam folder masuk ke dalam file zip yang akan dibuat.

### e.
Karena kuuhaku hanya bertemu Steven pada saat kuliah saja, yaitu setiap hari kecuali sabtu dan minggu, dari jam 7 pagi sampai 6 sore, ia memintamu untuk membuat koleksinya ter-zip saat kuliah saja, selain dari waktu yang disebutkan, ia ingin koleksinya ter-unzip dan tidak ada file zip sama sekali.

### Jawaban
Untuk soal e, kita diminta untuk mengekstrak file zip yang sudah dibuat dan kembali membuat zip file pada jam-jam dan hari-hari tertentu. 
Untuk menyelesaikan soal e, kita hanya perlu menuliskan perintah di crontab agar pada jam-jam yang diminta perintah yang sesuai dieksekusi.


