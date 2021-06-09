# convertSYNCTOFEEDER_2_WSSTMIK_app2.1_db3.35_WSDL
MS Access converter from IAIN Surakarta siakad SyncTo to WSSTMIK

**TUTORIAL**
# **MAPPING SIAKAD TO WSDL FEEDER (APP : 2.1 DB : 3.35)**
1. # **Penjelasan Umum**
1. **Sampai update versi APP 2.1 DB 3.35, ada 11 Data yang diisi :**


|**No**|**Nama Data**|**Keterangan**|
| :- | :- | :- |
|**1**|**Bobot Nilai**|**[MASTER] DIIMPORT 1 kali**|
|**2**|**Mahasiswa Baru**|**[MASTER] DIIMPORT 1 kali**|
|**3**|**Mahasiswa Lulus/Keluar/DO**|**[MASTER] DIIMPORT 1 kali**|
|**4**|**Nilai Transfer**|**[MASTER] DIIMPORT 1 kali**|
|**5**|**Mata Kuliah**|**[TRANSAKSIONAL] DIIMPORT TIAP AWAL SEMESTER**|
|**6**|**Kelas Kuliah**|**[TRANSAKSIONAL] DIIMPORT TIAP AWAL SEMESTER**|
|**7**|**Ajar Dosen**|**[TRANSAKSIONAL] DIIMPORT TIAP AWAL SEMESTER**|
|**8**|**KRS**|**[TRANSAKSIONAL] DIIMPORT TIAP AWAL SEMESTER**|
|**9**|**Nilai**|**[TRANSAKSIONAL] DIIMPORT TIAP AKHIR SEMESTER**|
|**10**|**AKM**|**[TRANSAKSIONAL] DIIMPORT TIAP AKHIR SEMESTER**|
|**11**|**Daya Tampung**|**[TRANSAKSIONAL] DIIMPORT TIAP AKHIR SEMESTER**|

1. **asdasd.**
1. # **Mapping**
1. **BOBOT NILAI :** 

**Pastikan kolom ini tidak kosong :** 


|**No**|**Feeder**|**SIAKAD**|**Isi**|**wajib**|
| :- | :- | :- | :- | :- |
|**1**|**kode\_prodi**|**-**|**Kode prodi dikti. Misal : 76134. ([detail](http://administrasi.iain-surakarta.ac.id/baa/feeder.ref.php?exe=data&tb=sms))**|**Yes**|
|**2**|**nilai\_huruf**|**Tbbnl.NLAKHTBBNL**|**Kode nilai huruf. Misal : A+, C-, E**|**Yes**|
|**3**|**bobot\_nilai\_min**|**Tbbnl.RENTANG1**|**Batas bawah. Misal : 3.76**|**Yes**|
|**4**|**bobot\_nilai\_maks**|**Tbbnl.RENTANG2**|**Batas atas. Misal : 4.0**|**Yes**|
|**5**|**Nilai\_indeks**|**Tbbnl.BOBOTTBBNL**|**Nilai indeks akhir. Misal : 4.0 (isinya disamakan dengan bobot\_maks)**|**Yes**|
|**6**|**Tgl\_mulai\_efektif**|**-**|**Tanggal berlaku awal. Misal : 1970-01-01 (default)**|**Yes**|
|**7**|**Tgl\_akhir\_efektif**|**-**|**Tanggal berlaku akhir. Misal : 2099-12-31 (default)**|**Yes**|

1. **Mahasiswa Baru :** 


|**No**|**Feeder**|**SIAKAD**|**Isi**|**wajib**|
| :- | :- | :- | :- | :- |
|**1**|**nm\_pd**|**Msmhs.NMMHSMSMHS**|**Nama mahasiswa** |**yes**|
|**2**|**tmpt\_lahir**|**Msmhs.TPLHRMSMHS**|**Tempat lahir**|**yes**|
|**3**|**jk**|**Msmhs.KDJEKMSMHS**|**Kelamin. Contoh : L/P**|**Yes**|
|**4**|**tgl\_lahir**|**Msmhs.TGLHRMSMHS**|**Kode tanggal lahir. yyyymmdd : 19980101**|**Yes**|
|**5**|**id\_agama**|**Msmhs.AGAMA**|**Kode Angka Agama. default : 1 (islam)**|**yes**|
|**6**|**nm\_ibu\_kandung**|**Msmhs.NAMAORTUWALI**|**Ibu kandung**|**Yes**|
|**7**|**nik**|**Msmhs.NOKTP**|**KTP (angka 16 digit)**|**Yes**|
|**8**|**kewarganegaraan**|**-**|**Kode 2 digit Negara. Default : ID (Indonesia)**|**yes**|
|**9**|**ds\_kel**|**Msmhs.ALAMATLENGKAP**|**Kelurahan (50 char)**|**yes**|
|**10**|**id\_wil**|**-**|**id wilayah sesuai feeder. 5 digit. Default : 00000 ([detail](http://administrasi.iain-surakarta.ac.id/baa/feeder.ref.php?exe=data&tb=wilayah))**||
|**11**|**id\_kebutuhan\_khusus\_ayah**|**Msmhs.id\_kk\_ayah**|**Kode kebutuhan khusus ayah. Default : 0**|**yes**|
|**12**|**id\_kebutuhan\_khusus\_ibu**|**Msmhs.id\_kk\_ibu**|**Kode Kebutuhan khusus ibu. Default : 0**|**yes**|
|**13**|**id\_kk**|**Msmhs.id\_kk**|**Kode kebutuhan khusus siswa. Default : 0**|**yes**|
|**14**|**a\_terima\_kps**|**-**|**Terima KPS tidak? 0: Bukan penerima KPS, 1: Penerima KPS**|**yes**|
|**15**|**kode\_prodi**|**-**|**Kode prodi dikti. Misal : 76134. ([detail](http://administrasi.iain-surakarta.ac.id/baa/feeder.ref.php?exe=data&tb=sms))**|**Yes**|
|**16**|**nipd**|**Msmhs.NIMHSMSMHS**|**NIM mahasiswa** |**Yes**|
|**17**|**id\_jns\_daftar**|**Msmhs.STPIDMSMHS**|**1 : mahasiswa baru; 2 : pindahan**|**yes**|
|**18**|**tgl\_masuk\_sp**|**Msmhs.TGMSKMSMHS**|**Kode tanggal masuk. Yyyymmdd : 20170101**|**yes**|
|**19**|**mulai\_smt**|**Msmhs.BTSUMSMHS**|**Kode semester. Contoh : 20172**|**yes**|
|**20**|**sks\_diakui**|**-**|**Sks diakui mahasiswa transfer. (id\_jns\_daftar :2)**|**Yes; jika (id\_jns\_daftar : 2)**|
|**21**|**nisn**|**Msmhs.NISN**|**Nisn 10 digit**|**yes**|
|**22**|**jln**|**Msmhs.ALAMATLENGKAP**|**Nama jalan 50 char**||
|**23**|**rt**|**-**|**Numeric only**||
|**24**|**rw**|**-**|**Numeric only**||
|**25**|**nm\_dsn**|**-**|**Nama dusun 50 char**||
|**26**|**kode\_pos**|**-**|**Kode pos angka 5 digit**||
|**27**|**no\_tel\_rmh**|**Msmhs.TELP**|**Telp rumah. Numeric only. 12 digit**||
|**28**|**no\_hp**|**-**|**Telp HP. Numeric only. 12 digit**||
|**29**|**email**|**Msmhs.EMAIL**|**Harus format email. Jika tidak, maka error**||
|**30**|**nm\_ayah**|**Msmhs.NAMAORTUWALI**|**Nama ayah**||
|**31**|**nik\_ayah**|**Msmhs.NOKTPAYAH**|**KTP ayah. Numeric only. 16 digit**||
|**32**|**tgl\_lahir\_ayah**|**Msmhs.TGLORTUWALI**|**Kode tanggal lahir. yyyymmdd : 19980101**||
|**33**|**id\_jenjang\_pendidikan\_ayah**|**Msmhs.PENDIDIKANORTUWALI**|**Kode jenjang pendidikan feeder. ([detail](http://administrasi.iain-surakarta.ac.id/baa/feeder.ref.php?tb=jenjang_pendidikan&exe=data))**||
|**34**|**id\_pekerjaan\_ayah**|**Msmhs.PEKERJAANORTUWALI**|**Kode pekerjaan feeder. ([detail](http://administrasi.iain-surakarta.ac.id/baa/feeder.ref.php?exe=data&tb=pekerjaan))**||
|**35**|**id\_penghasilan\_ayah**|**Msmhs.PENGHASILANORTUWALI**|**Kode penghasilan. ([detail](http://administrasi.iain-surakarta.ac.id/baa/feeder.ref.php?exe=data&tb=penghasilan))** ||
|**36**|**nik\_ibu**|**Msmhs.NOKTPIBU**|**KTP ayah. Numeric only. 16 digit**||
|**37**|**tgl\_lahir\_ibu**|**Msmhs.TGLORTUWALI**|**Kode tanggal lahir. yyyymmdd : 19980101**||
|**38**|**id\_jenjang\_pendidikan\_ibu**|**Msmhs.PENDIDIKANORTUWALI**|**Kode jenjang pendidikan feeder. ([detail](http://administrasi.iain-surakarta.ac.id/baa/feeder.ref.php?tb=jenjang_pendidikan&exe=data))**||
|**39**|**id\_pekerjaan\_ibu**|**Msmhs.PEKERJAANORTUWALI**|**Kode pekerjaan feeder. ([detail](http://administrasi.iain-surakarta.ac.id/baa/feeder.ref.php?exe=data&tb=pekerjaan))**||
|**40**|**id\_penghasilan\_ibu**|**Msmhs.PENGHASILANORTUWALI**|**Kode penghasilan. ([detail](http://administrasi.iain-surakarta.ac.id/baa/feeder.ref.php?exe=data&tb=penghasilan))** ||
|**41**|**nm\_wali**|**Msmhs.NAMAORTUWALI**|**Nama wali**||
|**42**|**tgl\_lahir\_wali**|**Msmhs.TGLORTUWALI**|**Kode tanggal lahir. yyyymmdd : 19980101**||
|**43**|**id\_jenjang\_pendidikan\_wali**|**Msmhs.PENDIDIKANORTUWALI**|**Kode jenjang pendidikan feeder. ([detail](http://administrasi.iain-surakarta.ac.id/baa/feeder.ref.php?tb=jenjang_pendidikan&exe=data))**||
|**44**|**id\_pekerjaan\_wali**|**Msmhs.PEKERJAANORTUWALI**|**Kode pekerjaan feeder. ([detail](http://administrasi.iain-surakarta.ac.id/baa/feeder.ref.php?exe=data&tb=pekerjaan))**||
|**45**|**id\_penghasilan\_wali**|**Msmhs.PENGHASILANORTUWALI**|**Kode penghasilan. ([detail](http://administrasi.iain-surakarta.ac.id/baa/feeder.ref.php?exe=data&tb=penghasilan))** ||
|**46**|**No\_kps**|**Msmhs.NOKPS**|**Nomor kps. Numeric only. 50 digit. Default : 0**||
|**47**|**npwp**|**Msmhs.NPWP**|**Npwp. Numeric only. 15 digit**||

1. **Mahasiswa Lulus/Keluar/DO :** 


|**No**|**Feeder**|**SIAKAD**|**Isi**|**wajib**|
| :- | :- | :- | :- | :- |
|**1**|**nipd**|**Trlsm.NIMHSTRLSM**|**NIM**|**Yes**|
|**2**|**nm\_pd**|**Msmhs.NMMHSMSMHS**|**Nama mahasiswa**|**Yes**|
|**3**|**tgl\_keluar**|**Trlsm.TGLLSTRLSM**|**Format tanggal yyyy-mm-dd**|**Yes**|
|**4**|**sk\_yudisium**|**Trlsm.NOSKRTRLSM**|**Nomor SK yudisium. Jika Keluar/DO maka kosongkan**|**Yes**|
|**5**|**tgl\_sk\_yudisium**|**Trlsm.TGLRETRLSM**|**Format tanggal yyyy-mm-dd. Jika Keluar/DO maka kosongkan**|**Yes**|
|**6**|**ipk**|**Trlsm.NLIPKTRLSM**|**IPK akhir mahasiswa.** |**Yes**|
|**7**|**jalur\_skripsi**|**-**|**Default jalur skripsi : 1. Jika Keluar/DO maka kosongkan**|**Yes**|
|**8**|**judul\_skripsi**|**trskr.JUDULTRSKR**|**Judul skripsi 200. Jika Keluar/DO maka kosongkan**|**Yes**|
|**9**|**no\_seri\_ijazah**|**Transkrip.notranskripcert**|**Nomor ijazah. Jika Keluar/DO maka kosongkan**|**Yes**|
|**10**|**wisuda\_ke**|**-**|**Jika ikut wisuda. Jika Keluar/DO maka kosongkan**||
|**11**|**id\_jns\_keluar**|**-**|**Id jenis keluar feeder. 1:lulus; 2:mutasi; 3:dikeluarkan; 4:mengundurkan diri; 5:putus sekolah; 6:wafat; 7:hilang; 8:alih fungsi; 9:pension; z:lainnya**|**Yes**|


1. **Nilai Transfer :** 


|**No**|**Feeder**|**SIAKAD**|**Isi**|**wajib**|
| :- | :- | :- | :- | :- |
|**1**|**nipd**|**-**|**NIM**|**Yes**|
|**2**|**kode\_mk\_diakui**|**-**|**Kode mk di tujuan**|**Yes**|
|**3**|**nm\_mk\_diakui**|**-**|**Nama mk di tujuan**|**Yes**|
|**4**|**sks\_diakui**|**-**|**Sks mk di tujuan**|**Yes**|
|**5**|**nilai\_angka\_diakui**|**-**|**Nilai indeks di tujuan**|**Yes**|
|**6**|**nilai\_huruf\_diakui**|**-**|**Nilai huruf di tujuan**|**Yes**|
|**7**|**kode\_mk\_asal**|**-**|**Kode mk asal**|**Yes**|
|**8**|**nm\_mk\_asal**|**-**|**Nama mk asal**|**Yes**|
|**9**|**sks\_asal**|**-**|**Sks mk asal**|**yes**|
|**10**|**nilai\_huruf\_asal**|**-**|**Nilai huruf asal**|**Yes**|

1. **Mata Kuliah :** 


|**No**|**Feeder**|**SIAKAD**|**Isi**|**wajib**|
| :- | :- | :- | :- | :- |
|**1**|**kode\_prodi**|**-**|**Kode prodi dikti. Misal : 76134. ([detail](http://administrasi.iain-surakarta.ac.id/baa/feeder.ref.php?exe=data&tb=sms))**|**Yes**|
|**2**|**id\_smt**|**Tbkmk.THSMSTBKMK**|**semester**|**Yes**|
|**3**|**kode\_mk**|**Tbkmk.KDKMKTBKMK**|**Kode mk**|**yes**|
|**4**|**nm\_mk**|**Tbkmk.NAKMKTBKMK**|**Nama mk**|**yes**|
|**5**|**jns\_mk**|**-**|**A=Wajib, B=Pilihan, C=Wajib Peminatan, D=Pilihan Peminatan, S=Tugas akhir/Skripsi/Tesis/Disertasi**||
|**6**|**kel\_mk**|**-**|**A=MPK, B=MKK, C=MKB, D=MPB, E=MBB, F=MKU/MKDU, G=MKDK, H=MKK**||
|**7**|**sks\_mk**|**Tbkmk.SKSMKTBKMK**|**Sks MK** **( SKS Tatap Muka + SKS Praktikum + SKS Praktek Lapangan + SKS Simulasi )**|**Yes**|
|**8**|**sks\_tm**|**Tbkmk.SKSTMTBKMK**|**SKS Tatap Muka**|**Yes**|
|**9**|**sks\_prak**|**Tbkmk.SKSPRTBKMK**|**SKS Praktikum**|**Yes**|
|**10**|**sks\_prak\_lap**|**Tbkmk.SKSLPTBKMK**|**SKS Praktek Lapanga**|**Yes**|
|**11**|**sks\_sim**|**Tbkmk.SKSSMTBKMK**|**SKS Simulasi**|**Yes**|
|**12**|**metode\_pelaksanaan\_kuliah**|**-**|**Metode pelaksanaan kuliah**||
|**13**|**a\_sap**|**-**|**Adakah sap?**||
|**14**|**a\_silabus**|**-**|**Adakah silabus?**||
|**15**|**a\_bahan\_ajar**|**-**|**Adakah bahan ajar?**||
|**16**|**acara\_prak**|**-**|**Adakah acara praktek?**||
|**17**|**a\_diktat**|**-**|**Adakah diktat?**||
|**18**|**smt**|**Tbkmk.SEMESTBKMK**|**Persebaran Semester** |**Yes**|
|**19**|**a\_wajib**|**-**|**Apakah wajib?**||

1. **Kelas  Kuliah :** 


|**No**|**Feeder**|**SIAKAD**|**Isi**|**wajib**|
| :- | :- | :- | :- | :- |
|**1**|**id\_smt**|**Trakd.THSMSTRAKD**|**Semester berlaku**|**Yes**|
|**2**|**kode\_mk**|**Trakd.KDKMKTRAKD**|**Kode mk**|**Yes**|
|**3**|**nm\_mk**|**Tbkmk.NAKMKTBKMK**|**Nama mk**|**Yes**|
|**4**|**nm\_kls**|**Trakd.KELASTRAKD**|**Nama kelas. 5 digit**|**Yes**|
|**5**|**kode\_prodi**|**-**|**Kode prodi feeder. ([detail](http://administrasi.iain-surakarta.ac.id/baa/feeder.ref.php?exe=data&tb=sms))**|**Yes**|

1. **Ajar Dosen :** 


|**No**|**Feeder**|**SIAKAD**|**Isi**|**wajib**|
| :- | :- | :- | :- | :- |
|**1**|**id\_smt**|**Trakd.THSMSTRAKD**|**Semester berlaku**|**Yes**|
|**2**|**nidn**|**-**|**Nidn dosen yang mengajar sesuai list ([detail](http://administrasi.iain-surakarta.ac.id/baa/feeder.ref.php?exe=data&tb=dosen_pt))**|**Yes**|
|**3**|**kode\_mk**|**Trakd.KDKMKTRAKD**|**Kode mk**|**Yes**|
|**4**|**nm\_mk**|**Tbkmk.NAKMKTBKMK**|**Nama mk**|**Yes**|
|**5**|**sks\_subst\_tot**|**Tbkmk.SKSMKTBKMK**|**Sks MK**|**Yes**|
|**6**|**nm\_kls**|**Trakd.KELASTRAKD**|**Nama kelas. 5 digit**|**Yes**|
|**7**|**kode\_prodi**|**-**|**Kode prodi feeder. ([detail](http://administrasi.iain-surakarta.ac.id/baa/feeder.ref.php?exe=data&tb=sms))**|**Yes**|
|**8**|**jml\_tm\_renc**|**Trakd.TMRENTRAKD**|**Tatap muka** ||

1. **KRS :** 


|**No**|**Feeder**|**SIAKAD**|**Isi**|**wajib**|
| :- | :- | :- | :- | :- |
|**1**|**kode\_prodi**|**-**|**Kode prodi feeder. ([detail](http://administrasi.iain-surakarta.ac.id/baa/feeder.ref.php?exe=data&tb=sms))**|**Yes**|
|**2**|**kode\_mk**|**Trakd.KDKMKTRAKD**|**Kode mk**|**Yes**|
|**3**|**nm\_mk**|**Tbkmk.NAKMKTBKMK**|**Nama mk**|**Yes**|
|**4**|**nm\_kls**|**Trakd.KELASTRAKD**|**Nama kelas. 5 digit**|**Yes**|
|**5**|**nipd**|**Trnlm.NIMHSTRNLM**|**Nim** |**Yes**|
|**6**|**id\_smt**|**Trnlm.THSMSTRNLM**|**Semester berlaku**|**Yes**|

1. **Nilai :** 


|**No**|**Feeder**|**SIAKAD**|**Isi**|**wajib**|
| :- | :- | :- | :- | :- |
|**1**|**kode\_prodi**|**-**|**Kode prodi feeder. ([detail](http://administrasi.iain-surakarta.ac.id/baa/feeder.ref.php?exe=data&tb=sms))**|**Yes**|
|**2**|**id\_smt**|**Trakd.THSMSTRAKD**|**Semester berlaku**|**Yes**|
|**3**|**kode\_mk**|**Tbkmk.KDKMKTRAKD**|**Kode mk**|**Yes**|
|**4**|**nm\_mk**|**Tbkmk.NAKMKTBKMK**|**Nama mk**|**Yes**|
|**5**|**nm\_kls**|**Trakd.KELASTRAKD**|**Nama kelas. 5 digit**|**Yes**|
|**6**|**nilai\_huruf**|**-**|**Nilai huruf**|**Yes**|
|**7**|**nilai\_indeks**|**-**|**Nilai indeks**|**Yes**|
|**8**|**nilai\_angka**|**-**|**Nilai angka**|**Yes**|

1. **AKM :** 


|**No**|**Feeder**|**SIAKAD**|**Isi**|**wajib**|
| :- | :- | :- | :- | :- |
|**1**|**id\_smt**|**Trakm.THSMSTRAKM**|**Semesnter berlaku**|**yes**|
|**2**|**nipd**|**Trakm.NIMHSTRAKM**|**Nim**|**yes**|
|**3**|**nm\_pd**|**Msmhs.NMMHSMSMHS**|**Nama mhs**|**yes**|
|**4**|**sks\_smt**|**Trakm.SKSEMTRAKM**|**Sks semester**|**yes**|
|**5**|**sks\_total**|**Trakm.SKSTTTRAKM**|**Sks total**|**yes**|
|**6**|**ips**|**Trakm.NLIPSTRAKM**|**Ip semester**|**yes**|
|**7**|**ipk**|**Trakm.NLIPKTRAKM**|**Ip total**|**yes**|
|**8**|**id\_stat\_mhs**|**Msmhs.STMHSMSMHS**|**Status mahasiswa**|**yes**|
|**9**|**kode\_prodi**|**-**|**Kode prodi feeder. ([detail](http://administrasi.iain-surakarta.ac.id/baa/feeder.ref.php?exe=data&tb=sms))**|**Yes**|

1. **Daya Tampung :** 


|**No**|**Feeder**|**SIAKAD**|**Isi**|**wajib**|
| :- | :- | :- | :- | :- |
|**1**|**id\_smt**|**-**|**Semesnter berlaku**|**yes**|
|**2**|**target\_mhs\_baru**|**-**|**numeric**||
|**3**|**calon\_ikut\_seleksi**|**-**|**numeric**||
|**4**|**calon\_lulus\_seleksi**|**-**|**numeric**||
|**5**|**daftar\_sbg\_mhs**|**-**|**numeric**||
|**6**|**pst\_undur\_diri**|**-**|**numeric**||
|**7**|**tgl\_awal\_kul**|**-**|**Yyyy-mm-dd**||
|**8**|**tgl\_akhir\_kul**|**-**|**Yyyy-mm-dd**||
|**9**|**jml\_mgu\_kul**|**-**|**numeric**||
|**10**|**metode\_kul**|**-**|**-**||
|**11**|**metode\_kul\_eks**|**-**|**-**||






