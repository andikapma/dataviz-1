Pendahuluan
================
Muhammad Aswan Syahputra
4/24/2019

## R Markdown

Ini merupakan dokumen R Markdown yang dapat digunakan untuk membuat
dokumen HTML, PDF, dan bahkan dokumen berekstensi docx atau odt. Anda
dapat membuat dokumen tulisan, salindia presentasi, dan laman web statis
maupun interaktif dengan melalui R Markdown. Penggunaan R Markdown dalam
proyek analisis data akan membuat alur kerja menjadi lebih mudah dan
*reproducible*. Informasi lebih lanjut mengenai R Markdown dapat dilihat
pada pranala [ini](http://rmarkdown.rstudio.com).

Kode R dapat dimasukan ke dalam dokumen R Markdown dengan menggunakan
*chunck* yang dimulai dengan penanda tiga *backticks* ‘\`\`\`’ (dibuat
dengan klik tombol Insert - R). Contoh cara untuk penulisan kode R
kedalam dokumen R Markdown adalah sebagai
berikut:

``` r
head(mtcars) # melihat 6 baris pertama dari data mtcars, mtcars adalah data bawaan yang tersedia di R
```

    ##                    mpg cyl disp  hp drat    wt  qsec vs am gear carb
    ## Mazda RX4         21.0   6  160 110 3.90 2.620 16.46  0  1    4    4
    ## Mazda RX4 Wag     21.0   6  160 110 3.90 2.875 17.02  0  1    4    4
    ## Datsun 710        22.8   4  108  93 3.85 2.320 18.61  1  1    4    1
    ## Hornet 4 Drive    21.4   6  258 110 3.08 3.215 19.44  1  0    3    1
    ## Hornet Sportabout 18.7   8  360 175 3.15 3.440 17.02  0  0    3    2
    ## Valiant           18.1   6  225 105 2.76 3.460 20.22  1  0    3    1

Jika ingin menjalankan kode R dalam *chunck* tersebut, Anda dapat
menggunakan pemintas Ctrl + Enter (menjalankan satu baris kode) atau
Ctrl + Shift + Enter (menjalankan semua kode dalam *chunck*). Sekarang
buatlah *chunck* baru yang isinya adalah baris kode R berikut:
(Petunjuk: Gunakan Ctrl + Alt + I)

``` r
filled.contour(volcano,
               color.palette = terrain.colors, 
               plot.title = title("Topografi Gunung Maunga Whau"), 
               key.title = title("Tinggi\n(meter)"))
```

![](001_pendahuluan_files/figure-gfm/unnamed-chunk-2-1.png)<!-- -->

Setelah selesai membuat dokumen R Markdown yang berisikan konten tulisan
beserta kode R, Anda dapat klik tombol **Knit** untuk menghasilkan
dokumen baru sesuai dengan format dokumen yang diinginkan. Dalam contoh
ini format dokumen keluaran R Markdown setelah menjalankan **Knit**
adalah dokumen markdown yang akan diolah oleh GitHub menjadi laman web
HTML. Anda dapat mengatur format dokumen keluaran dengan cara mengubah
baris *output* pada YAML metadata (lihat baris paling atas dokumen ini)
seperti contoh berikut:

    ---
    title: "Pendahuluan"
    author: "Muhammad Aswan Syahputra"
    date: "4/24/2019"
    output: word_document
    ---
