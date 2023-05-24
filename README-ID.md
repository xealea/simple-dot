## Pameran
berikut adalah beberapa tangkapan layar yang menampilkan pameran dari dotfiles:

 |  Pameran 1 |  Pameran 2 |  Pameran 3 |
 |--|--|--|
 |![img](https://iili.io/HgKeUmX.md.png)|![img](https://iili.io/HgKQ3oQ.md.png)|![img](https://iili.io/HgKL1nV.md.png)

 ### Panduan Instalasi Dotfiles
 Panduan ini akan memandu Anda melalui proses instalasi untuk file dot yang disediakan di repositori [xealea/simple-dot](https://github.com/xealea/simple-dot).

 ### Persyaratan 
 Sebelum melanjutkan penginstalan, pastikan Anda memiliki persyaratan berikut:
 - Bash (Bourne Again SHell)
 - Git
 - Curl atau Wget (untuk mengunduh skrip instalasi)

 ### Langkah Instalasi
 1. Buka terminal Anda.

 2. Unduh skrip `dotfiles_install.sh` dari repositori menggunakan `wget` atau `curl`. Pilih salah satu metode berikut:

    - Menggunakan `wget`:
      ```basb
      wget https://github.com/xealea/simple-dot/raw/master/dotfiles_install.sh
      ```

    - Menggunakan `curl`:
      ```bash
      curl -O https://github.com/xealea/simple-dot/raw/master/dotfiles_install.sh
      ```

 3. Jadikan skrip yang diunduh dapat dieksekusi:
    ```bash
    chmod +x dotfiles_install.sh
    ```

 4. Jalankan skrip untuk memulai proses instalasi:
 
    ```bash
    ./dotfiles_install.sh
    ```

 5. Ikuti petunjuk selama proses instalasi untuk memilih folder yang ingin Anda salin. Anda dapat memilih untuk menyalin semua folder (tidak termasuk folder .git).

 6. Setelah instalasi selesai, file dot akan disalin ke direktori home Anda. Nikmati pengaturan dotfile baru Anda!

 ### Kustomisasi Wallpaper
 Anda dapat menyesuaikan wallpaper dengan menggunakan keybind **`Mod (Window) + Shift + B`**. Ini akan memunculkan antarmuka Rofi, di mana Anda dapat memilih opsi untuk mengubah **wallpaper secara permanen menggunakan `feh`**, atau menggunakan `hsetroot`, `swww`, atau `swaybg` jika Anda tidak ingin mengubah kertas dinding secara permanen.

 ### Menambahkan Wallpaper
 Untuk menambahkan wallpaper, letakkan file PNG atau JPG di folder `$HOME/.wall`. Pastikan gambar wallpaper dalam format PNG atau JPG dan terletak di dalam folder `$HOME/.wall`, jika sudah, sekarang buka saja dengan keybind **`Mod (Window) + Shift+ B`** dan Anda akan terlihat nama wallpaper yang anda tambahkan tadi

 ### Dukungan
 Jika Anda mengalami masalah atau memiliki pertanyaan terkait proses instalasi, silakan buka masalah di repositori atau hubungi penulis, Lea, melalui email di xealea@proton.me.

 ### Catatan
 Konfigurasi dotfiles ini masih dalam pengembangan dan mungkin tidak menyertakan semua fitur yang Anda perlukan atau memiliki bug.
