--toMAHASISWABARUWSSTMIK_3 updated 20180324
-----------------------------

SELECT DISTINCT 1 AS [NO],
 NAMA AS nm_pd,
 IIF(ISNULL([Tempat Lahir]),'-',[Tempat Lahir]) AS tmpt_lahir,
 IIF(ISNULL([Jenis Kelamin]),'L',[Jenis Kelamin]) AS jk,
 IIF(ISNULL([Tanggal Lahir]),'19980101',[Tanggal Lahir]) AS tgl_lahir,
 1 AS id_agama,
 IIF(ISNULL([Nama Ibu]),'-',[Nama Ibu]) AS nm_ibu_kandung,
 IIF(ISNULL([No KTP/No KK]),'0',MID(REPLACE(REPLACE(FORMAT([No KTP/No KK],"General Number"),'-',''),'.',''),1,16)) AS nik,
 IIF(ISNULL(KEWARGANEGARAAN1),'ID',KEWARGANEGARAAN1) AS kewarganegaraan,
 IIF(ISNULL([Nama Kelurahan]),'-',TRIM(REPLACE(MID([Nama Kelurahan],1,50),',',''))) AS ds_kel,
 my_regexp([Kode Wilayah Sesuai KTP],'\D+') AS id_wil, IIF(ISNULL([Kebutuhan Khusus Ayah]),0,my_regexp([Kebutuhan Khusus Ayah],'\d+')) AS id_kebutuhan_khusus_ayah,
 IIF(ISNULL([Kebutuhan Khusus Ibu]),0,my_regexp([Kebutuhan Khusus Ibu],'\d+')) AS id_kebutuhan_khusus_ibu,
 IIF(ISNULL([Kebutuhan Khusus]),0,my_regexp([Kebutuhan Khusus],'\d+')) AS id_kk,
 IIF(ISNULL([ada KPS]),'0',[ada KPS]) AS a_terima_kps,
 prodi.[kodedikti] AS kode_prodi,
 NIM AS nipd,
 IIF(ISNULL([Status Masuk]),'1',[Status Masuk]) AS id_jns_daftar,
 [Tgl Masuk] AS tgl_masuk_sp, [Mulai Semester] AS mulai_smt,
 IIF(CInt([Status Masuk])=2,[sks diakui],0) AS sks_diakui,
 IIF(ISNULL(NISN1),'0',IIF(my_regexp(NISN1,'\d{1,10}')='','0',my_regexp(NISN1,'\d{1,10}'))) AS nisn,
 IIF(ISNULL([Alamat Jln]),'-',MID([Alamat Jln],1,50)) AS jln,
 IIF(ISNULL([Alamat Rt]),'0',REPLACE(REPLACE([Alamat Rt],'-',''),'.','')) AS rt,
 IIF(ISNULL([Alamat Rw]),'0',REPLACE(REPLACE([Alamat Rw],'-',''),'.','')) AS rw,
 IIF(ISNULL([Nama Dusun]),'-',MID([Nama Dusun],1,50)) AS nm_dsn,
 IIF(ISNULL([Kode Pos]),'00000',my_regexp([Kode Pos],'\d{5}')) AS kode_pos, 
 IIF(ISNULL([Telp Rumah]),'000000000000',MID(REPLACE(REPLACE(REPLACE(FORMAT([Telp Rumah],"General Number"),'.',''),'-',''),'`','')+'000000000000',1,12)) AS no_tel_rmh,
 IIF(ISNULL([Telp HP]),'000000000000',MID(REPLACE(REPLACE(REPLACE(FORMAT([Telp HP],"General Number"),'.',''),'-',''),'`','')+'000000000000',1,12)) AS no_hp,
 IIF(ISNULL([email1]),'unknown@unknown.unknown',REPLACE(my_regexp(email1,"^[_a-z0-9-]+(.[a-z0-9-]+)@[a-z0-9-]+(.[a-z0-9-]+)*(.[a-z]{2,4})$"),' ','')) AS email,
 IIF(ISNULL([Nama Ayah]),'-',[Nama Ayah]) AS nm_ayah, IIF(ISNULL([NIK Ayah]),'0',MID(REPLACE(REPLACE(FORMAT([NIK Ayah],"General Number"),'-',''),'.',''),1,16)) AS nik_ayah,
 IIF(ISNULL([Tgl Lahir Ayah]),'19700101',[Tgl Lahir Ayah]) AS tgl_lahir_ayah, IIF(ISNULL([Jenjang Pendd Ayah]),99,[Jenjang Pendd Ayah]) AS id_jenjang_pendidikan_ayah,
 IIF(ISNULL([Pekerjaan Ayah]),99,[Pekerjaan Ayah]) AS id_pekerjaan_ayah,
 IIF(ISNULL([Penghasilan Ayah]),0,[Penghasilan Ayah]) AS id_penghasilan_ayah,
 IIF(ISNULL([NIK Ibu]),'0',MID(REPLACE(REPLACE(FORMAT([NIK Ibu],"General Number"),'-',''),'.',''),1,16)) AS nik_ibu,
 IIF(ISNULL([Tgl Lahir Ibu]),'19700101',[Tgl Lahir Ibu]) AS tgl_lahir_ibu,
 IIF(ISNULL([Jenjang Pendd Ibu]),99,[Jenjang Pendd Ibu]) AS id_jenjang_pendidikan_ibu,
 IIF(ISNULL([Pekerjaan Ibu]),99,[Pekerjaan Ibu]) AS id_pekerjaan_ibu,
 IIF(ISNULL([Penghasilan Ibu]),0,[Penghasilan Ayah]) AS id_penghasilan_ibu,
 IIF(ISNULL([Nama Wali]),'-',[Nama Wali]) AS nm_wali,
 IIF(ISNULL([Tanggal Lahir Wali]),'19700101',[Tanggal Lahir Wali]) AS tgl_lahir_wali,
 IIF(ISNULL([Jenjang Pendd Wali]),99,[Jenjang Pendd Wali]) AS id_jenjang_pendidikan_wali,
 IIF(ISNULL([Pekerjaan Wali]),99,[Pekerjaan Wali]) AS id_pekerjaan_wali,
 IIF(ISNULL([Penghasilan Wali]),0,[Penghasilan Wali]) AS id_penghasilan_wali,
 IIF(ISNULL([No KPS]),'0',MID(REPLACE(REPLACE(FORMAT([No KPS],"General Number"),'-',''),'.',''),1,50)) AS no_kps,
 IIF(ISNULL([NPWP1]),'0',MID(REPLACE(REPLACE(FORMAT([NPWP1],"General Number"),'-',''),'.',''),1,15)) AS npwp
FROM mahasiswasyncto, prodi
WHERE mahasiswasyncto.[jenjang-prodi]=prodi.[prodiSiakad]
AND [Mulai Semester]=(SELECT DISTINCT TOP 1 Cint([Mulai Semester]) FROM mahasiswasyncto ORDER BY Cint([Mulai Semester]) DESC)
ORDER BY [Mulai Semester], NAMA;



--toMATAKULIAHWSSTMIK updated 20170122
--------------------
SELECT 1 AS [NO],
 prodi.[kodedikti] AS kode_prodi,
 Ta AS id_smt,
 [kode mk] AS kode_mk,
 [nama mk] AS nm_mk,
 [Jenis MK] AS jns_mk,
 [Kelompok MK] AS kel_mk,
 IIF(ISNULL([SKS TOTAL]),'0',[SKS TOTAL]) AS sks_mk,
 IIF(ISNULL([SKS TATAP MUKA]),'0',[SKS TATAP MUKA]) AS sks_tm,
 IIF(ISNULL([SKS PRAK]),'0',[SKS PRAK]) AS sks_prak,
 IIF(ISNULL([SKS PRAK LAP]),'0',[SKS PRAK LAP]) AS sks_prak_lap,
 IIF(ISNULL([SKS SIMULASI]),'0',[SKS SIMULASI]) AS sks_sim,
 IIF(ISNULL([Info Metode Pelaksanaan Kuliah]),'0',[Info Metode Pelaksanaan Kuliah]) AS metode_pelaksanaan_kuliah,
 IIF(ISNULL([Ada SAP]),'0',[Ada SAP]) AS a_sap,
 IIF(ISNULL([ADA SILABUS]),'0',[ADA SILABUS]) AS a_silabus,
 IIF(ISNULL([ADA BAHAN AJAR]),'0',[ADA BAHAN AJAR]) AS a_bahan_ajar,
 IIF(ISNULL([Info Acara Praktek]),'0',[Info Acara Praktek]) AS acara_prak,
 IIF(ISNULL([ADA DIKTAT]),'0',[ADA DIKTAT]) AS a_diktat,
 IIF(ISNULL([SEM]),1,IIF(Cint(SEM)<=0,1,IIF(Cint(SEM)>8,8,SEM))) AS smt,
 IIF(ISNULL([Jenis MK]),'0',IIF([Jenis MK]='A','1','0')) AS a_wajib
FROM matakuliahsyncto, prodi
WHERE matakuliahsyncto.[jenjang-prodi]=prodi.prodisiakad;


--toKELASWSSTMIK updated 20170122
--------------------
--VERSI KELAS CONCAT PRODI
----------------------------
SELECT 1 AS [NO],
 Ta AS id_smt,
 [kode mk] AS kode_mk,
 [nama mk] AS nm_mk,
 MID(TRIM(Str(Cint(MID(Ta,3,3))+Cint(REPLACE(kodeSiakad,'.','')))+[nama kelas]),1,5) AS nm_kls,
 prodi.[kodedikti] AS kode_prodi
FROM kelassyncto, prodi
WHERE kelassyncto.[jenjang-prodi]=prodi.prodisiakad;

--toKELASWSSTMIK updated 20170122
--------------------
--VERSI KELAS TIDAK CONCAT PRODI
----------------------------

SELECT 1 AS [NO],
 Ta AS id_smt,
 [kode mk] AS kode_mk,
 [nama mk] AS nm_mk,
 mid([nama kelas],1,5) AS nm_kls,
 prodi.[kodedikti] AS kode_prodi
FROM kelassyncto, prodi
WHERE kelassyncto.[jenjang-prodi]=prodi.prodisiakad;

--toKRSWSSTMIK updated 20170122
-----------------

SELECT 1 AS [NO],
 prodi.[kodedikti] AS kode_prodi,
 KELASSYNCTO.[kode mk] AS kode_mk,
 KELASSYNCTO.[nama mk] AS nm_mk,
 MID(TRIM(Str(Cint(MID(KELASSYNCTO.TA,3,3))+Cint(REPLACE(prodi.kodeSiakad,'.','')))+NILAISYNCTO.[Nama kelas]),1,5) AS nm_kls,
 NIM AS nipd,
  KELASSYNCTO.TA AS id_smt
FROM NILAISYNCTO, prodi, KELASSYNCTO
WHERE KELASSYNCTO.[jenjang-prodi]=prodi.prodisiakad
AND NILAISYNCTO.[Kode MK]=KELASSYNCTO.[Kode MK] 
AND NILAISYNCTO.[Nama MK]=KELASSYNCTO.[Nama MK]
AND NILAISYNCTO.[Nama kelas]=KELASSYNCTO.[Nama kelas]
ORDER BY NIM;



--toAJARDOSENWSSTMIK  updated 20170122
----------------------
--VERSI KELAS CONCAT PRODI
----------------------------
SELECT 1 AS NO,
TA AS id_smt,
IIF(ISNULL(NIDN1),prodi.[kepala prodi],IIF(NIDN1 NOT IN(SELECT NIDN FROM DosenDikti),prodi.[kepala prodi],NIDN1)) AS nidn, 
[KODE MK] AS kode_mk,
[NAMA MK] AS nm_mk,
[SKS TOTAL] AS sks_subst_tot,
 MID(TRIM(Str(Cint(MID(TA,3,3))+Cint(REPLACE(prodi.kodeSiakad,'.','')))+KELAS),1,5) AS nm_kls,
prodi.[kodedikti] AS kode_prodi,
[Rencana Tatap Muka] AS jml_tm_renc
FROM AJARDOSENSYNCTO, prodi
WHERE AJARDOSENSYNCTO.[jenjang-prodi]=prodi.prodisiakad;

--toAJARDOSENWSSTMIK  updated 20170122
----------------------
--VERSI KELAS TIDAK CONCAT PRODI
----------------------------
SELECT 1 AS [NO],
 TA AS id_smt,
 IIF(ISNULL(NIDN1),prodi.[kepala prodi],IIF(NIDN1 NOT IN(SELECT NIDN FROM DosenDikti),prodi.[kepala prodi],NIDN1)) AS nidn,
 [KODE MK] AS kode_mk,
 [NAMA MK] AS nm_mk,
 [SKS TOTAL] AS sks_subst_tot,
 MID(KELAS,1,5) AS nm_kls,
 prodi.[kodedikti] AS kode_prodi,
 [Rencana Tatap Muka] AS jml_tm_renc
FROM AJARDOSENSYNCTO, prodi
WHERE AJARDOSENSYNCTO.[jenjang-prodi]=prodi.prodisiakad;



--toNILAIWSSTMIK
-----------------
--VERSI KELAS CONCAT PRODI
----------------------------
SELECT 1 AS [NO],
 prodi.[kodedikti] AS kode_prodi,
   KELASSYNCTO.TA AS id_smt,
 KELASSYNCTO.[kode mk] AS kode_mk,
 KELASSYNCTO.[nama mk] AS nm_mk,
 MID(TRIM(Str(Cint(MID(KELASSYNCTO.TA,3,3))+Cint(REPLACE(prodi.kodeSiakad,'.','')))+KELASSYNCTO.[Nama kelas]),1,5) AS nm_kls,
 NIM AS nipd,
 [NILAI HURUF] AS nilai_huruf,
 [NILAI INDEKS] AS nilai_indeks,
 [NILAI ANGKA] AS nilai_angka
FROM NILAISYNCTO, prodi, KELASSYNCTO
WHERE KELASSYNCTO.[jenjang-prodi]=prodi.prodisiakad
AND NILAISYNCTO.[Kode MK]=KELASSYNCTO.[Kode MK] 
AND NILAISYNCTO.[Nama MK]=KELASSYNCTO.[Nama MK]
AND NILAISYNCTO.[Nama kelas]=KELASSYNCTO.[Nama kelas]
ORDER BY NIM;
--toNILAIWSSTMIK
-----------------
--VERSI KELAS TIDAK CONCAT PRODI
----------------------------
SELECT 1 AS [NO],
 prodi.[kodedikti] AS kode_prodi,
 KELASSYNCTO.TA AS id_smt,
 KELASSYNCTO.[kode mk] AS kode_mk,
 KELASSYNCTO.[nama mk] AS nm_mk,
 mid(KELASSYNCTO.[Nama kelas],1,5) AS nm_kls,
 NIM AS nipd, [NILAI HURUF] AS nilai_huruf,
 [NILAI INDEKS] AS nilai_indeks,
 [NILAI ANGKA] AS nilai_angka
FROM NILAISYNCTO, prodi, KELASSYNCTO
WHERE KELASSYNCTO.[jenjang-prodi]=prodi.prodisiakad And NILAISYNCTO.[Kode MK]=KELASSYNCTO.[Kode MK] And NILAISYNCTO.[Nama MK]=KELASSYNCTO.[Nama MK] And NILAISYNCTO.[Nama kelas]=KELASSYNCTO.[Nama kelas]
ORDER BY NIM;

--toAKMWSSTMIK
---------------

/*
SELECT  1 AS [NO],
[TA SEM] AS id_smt,
 AKMSYNCTO.NIM AS nipd,
  AKMSYNCTO.NAMA AS nm_pd,
 [SKS Sementara] AS sks_smt,
 [SKS Kumulatif] AS sks_total,
 [IP Sementara] AS ips,
 [IP Kumulatif] AS ipk,
 IIF(ISNULL([AKMSYNCTO.Status Mahasiswa]),'N',IIF([AKMSYNCTO.Status Mahasiswa]='L','A',IIF([AKMSYNCTO.Status Mahasiswa]='D','N',[AKMSYNCTO.Status Mahasiswa]))) AS id_stat_mhs,
 IIF(ISNULL(kodeDikti),(SELECT TOP 1 kodeDikti FROM prodi,mahasiswasyncto WHERE mahasiswasyncto.[jenjang-prodi]=prodi.[prodiSiakad] ),kodeDikti ) as kode_prodi
FROM ((AKMSYNCTO) LEFT JOIN MAHASISWASYNCTO ON AKMSYNCTO.nim =  MAHASISWASYNCTO.nim)
 LEFT JOIN PRODI ON mahasiswasyncto.[jenjang-prodi]=prodi.[prodiSiakad]
 */
 
 SELECT 1 AS [NO],
 [TA SEM] AS id_smt,
 AKMSYNCTO.NIM AS nipd,
 REPLACE(AKMSYNCTO.NAMA,'\`','') AS nm_pd,
 [SKS Sementara] AS sks_smt,
 [SKS Kumulatif] AS sks_total,
 [IP Sementara] AS ips,
 [IP Kumulatif] AS ipk,
 IIF(ISNULL([AKMSYNCTO.Status Mahasiswa]),'N',IIF([AKMSYNCTO.Status Mahasiswa]='L','A',IIF([AKMSYNCTO.Status Mahasiswa]='D','N',IIF([AKMSYNCTO.Status Mahasiswa]='K','N',[AKMSYNCTO.Status Mahasiswa])))) AS id_stat_mhs,
 IIF(ISNULL(kodeDikti),(SELECT TOP 1 kodeDikti FROM prodi,mahasiswasyncto WHERE mahasiswasyncto.[jenjang-prodi]=prodi.[prodiSiakad] ),kodeDikti ) AS kode_prodi
FROM (AKMSYNCTO LEFT JOIN MAHASISWASYNCTO ON AKMSYNCTO.nim=MAHASISWASYNCTO.nim) LEFT JOIN PRODI ON mahasiswasyncto.[jenjang-prodi]=prodi.[prodiSiakad];

 
 

--toMAHASISWALULUSWSSTMIK_versiIMPORTANIHSAN
-------------------------
 /*
 SELECT 1 AS NO,
i.nim AS nipd,
 i.nama AS nm_pd,
 IIF(ISNULL([tgl lulus]),FORMAT([tgl sk rektor],'yyyy-mm-dd'),FORMAT([tgl lulus],'yyyy-mm-dd')) AS tgl_keluar,
 [no sk rektor] AS sk_yudisium,
 FORMAT([tgl sk rektor],'yyyy-mm-dd') AS tgl_sk_yudisium,
 [ipk transkrip nilai akhir] AS ipk,
 1 AS jalur_skripsi,
 REPLACE(mid(w.[judul skripsi],1,200),'"','') AS judul_skripsi,
 [no ijazah] AS no_seri_ijazah
 FROM (import_ijazah_ihsan AS i LEFT JOIN import_transkrip_ihsan AS t ON i.nim=t.nim) LEFT JOIN wisuda AS w ON t.nim=w.nim;
 */
  SELECT 1 AS NO,
i.nim AS nipd,
 i.nama AS nm_pd,
 IIF(ISNULL([tgl lulus]),FORMAT([tgl sk rektor],'yyyy-mm-dd'),FORMAT([tgl lulus],'yyyy-mm-dd')) AS tgl_keluar,
 [no sk rektor] AS sk_yudisium,
 FORMAT([tgl sk rektor],'yyyy-mm-dd') AS tgl_sk_yudisium,
 [ipk transkrip nilai akhir] AS ipk,
 1 AS jalur_skripsi,
 REPLACE(mid(w.[judul skripsi],1,200),'"','') AS judul_skripsi,
 [no ijazah] AS no_seri_ijazah,
[wisuda ke] AS wisuda_ke
 FROM (import_ijazah_ihsan AS i LEFT JOIN import_transkrip_ihsan AS t ON i.nim=t.nim) LEFT JOIN wisuda AS w ON t.nim=w.nim;
 
 

  --toMAHASISWALULUSWSSTMIK_versi_SIMPLEFEEDER003
 ----------------------
 SELECT 1 AS NO,
 T.NIM AS nipd,
 T.NAMA AS nm_pd,
 Mid([TGL TRANSKRIP],7,4)+'-'+Mid([TGL TRANSKRIP],4,2)+'-'+Mid([TGL TRANSKRIP],1,2) AS tgl_keluar,
 [NO SK REKTOR] AS sk_yudisium,
 Mid([TGL SK REKTOR],7,4)+'-'+Mid([TGL SK REKTOR],4,2)+'-'+Mid([TGL SK REKTOR],1,2) AS tgl_sk_yudisium,
  IPK,
 '1' AS jalur_skripsi,
 REPLACE(MID([judul skripsi],1,200),'"','') AS judul_skripsi,
 [NO IJAZAH] AS no_seri_ijazah
FROM WISUDA AS W LEFT JOIN TRANSKRIP AS T ON T.NIM=W.NIM;

 
 --Format_input_MhsLulus_SIMPLEFEEDER_003
 ----------------------
 SELECT T.NIM AS nipd,
 T.NAMA AS nm_pd,
 '1' AS id_jns_keluar,
 Mid([TGL TRANSKRIP],7,4)+'-'+Mid([TGL TRANSKRIP],4,2)+'-'+Mid([TGL TRANSKRIP],1,2) AS tgl_keluar,
 '' AS ket,
 '1' AS jalur_skripsi,
 REPLACE(MID([judul skripsi],1,250),'"','') AS judul_skripsi,
 '' AS bln_awal_bimbingan,
 '' AS bln_akhir_bimbingan,
 [NO SK REKTOR] AS sk_yudisium,
 Mid([TGL SK REKTOR],7,4)+'-'+Mid([TGL SK REKTOR],4,2)+'-'+Mid([TGL SK REKTOR],1,2) AS tgl_sk_yudisium,
 IPK,
 [NO IJAZAH] AS no_seri_ijazah
FROM WISUDA AS W LEFT JOIN TRANSKRIP AS T ON T.NIM=W.NIM;
 
 
--ImportIhsan_2_SFNEW
--------------------
SELECT i.nim,
 i.nama,
 1 AS id_jns_keluar,
 IIF(ISNULL([tgl lulus]),
 FORMAT([tgl sk rektor],'yyyy-mm-dd'),
 FORMAT([tgl lulus],'yyyy-mm-dd')) AS tgl_keluar,
 '' AS ket,
 1 AS jalur_skripsi,
 REPLACE(mid(w.[judul skripsi],1,200),'"','') AS judul_skripsi,
 '' AS bln_awal_bimbingan,
 '' AS bln_akhir_bimbingan,
 [no sk rektor] AS sk_yudisium,
 FORMAT([tgl sk rektor],'yyyy-mm-dd') AS tgl_sk_yudisium,
 [ipk transkrip nilai akhir] AS ipk,
 [no ijazah] AS no_seri_ijazah
FROM (import_ijazah_ihsan AS i LEFT JOIN import_transkrip_ihsan AS t ON i.nim=t.nim) LEFT JOIN wisuda AS w ON t.nim=w.nim;


--toMAHASISWALULUSWSSTMIK_versiMAHASISWASYNCTO
---------------------------------------------
/* 
 SELECT 1 AS NO,
nim AS nipd,
 nama AS nm_pd,
 IIF(NOT ISNULL([Tanggal Lulus]),MID([Tanggal Lulus],1,4)+'-'+MID([Tanggal Lulus],5,2)+'-'+MID([Tanggal Lulus],7,2),IIF(NOT ISNULL([Tgl SK Yudisium]) OR NOT [Tgl SK Yudisium]=0,MID([Tgl SK Yudisium],1,4)+'-'+MID([Tgl SK Yudisium],5,2)+'-'+MID([Tgl SK Yudisium],7,2),'')) AS tgl_keluar,
 IIF(ISNULL([No SK YUdisium]),'',[No SK Yudisium])  AS sk_yudisium,
IIF(NOT ISNULL([Tgl SK Yudisium]) OR NOT [Tgl SK Yudisium]=0,MID([Tgl SK Yudisium],1,4)+'-'+MID([Tgl SK Yudisium],5,2)+'-'+MID([Tgl SK Yudisium],7,2),'')  AS tgl_sk_yudisium,
ipk,
IIF(ISNULL([judul skripsi]),'',1) AS jalur_skripsi,
 IIF(ISNULL([judul skripsi]),'',REPLACE(mid([judul skripsi],1,200),'"',''))  AS judul_skripsi,
 [no ijazah] AS no_seri_ijazah,
 [status keluar] AS id_jns_keluar
 FROM MAHASISWASYNCTO 
 WHERE NOT ISNULL([status keluar]) ;
 */
 
   SELECT 1 AS NO,
nim AS nipd,
 nama AS nm_pd,
 IIF(NOT ISNULL([Tanggal Lulus]),MID([Tanggal Lulus],1,4)+'-'+MID([Tanggal Lulus],5,2)+'-'+MID([Tanggal Lulus],7,2),'') AS tgl_keluar,
 IIF(ISNULL([No SK YUdisium]),'',[No SK Yudisium])  AS sk_yudisium,
IIF((NOT ISNULL([Tgl SK Yudisium])) AND (NOT [Tgl SK Yudisium]='0'),MID([Tgl SK Yudisium],1,4)+'-'+MID([Tgl SK Yudisium],5,2)+'-'+MID([Tgl SK Yudisium],7,2),'')  AS tgl_sk_yudisium,
ipk,
IIF(ISNULL([judul skripsi]),'',1) AS jalur_skripsi,
 IIF(ISNULL([judul skripsi]),'',REPLACE(mid([judul skripsi],1,200),'"',''))  AS judul_skripsi,
 [no ijazah] AS no_seri_ijazah,
 [status keluar] AS id_jns_keluar
 FROM MAHASISWASYNCTO 
 WHERE NOT ISNULL([status keluar]) ;
 
 
 
--toMAHASISWAKELUARSTMIK_versiMAHASISWASYNCTO
-------------------------
SELECT 1 AS [NO],
 nim AS nipd,
 nama AS nm_pd,
 IIF(NOT ISNULL([Tanggal Lulus]),MID([Tanggal Lulus],1,4)+'-'+MID([Tanggal Lulus],5,2)+'-'+MID([Tanggal Lulus],7,2),'') AS tgl_keluar,
 IIF(ISNULL([No SK YUdisium]),'',[No SK Yudisium]) AS sk_yudisium,
 IIF((NOT ISNULL([Tgl SK Yudisium])) AND (NOT [Tgl SK Yudisium]='0'),MID([Tgl SK Yudisium],1,4)+'-'+MID([Tgl SK Yudisium],5,2)+'-'+MID([Tgl SK Yudisium],7,2),'') AS tgl_sk_yudisium,
 [ipk1] AS ipk,
 IIF(ISNULL([judul skripsi]),'',1) AS jalur_skripsi,
 IIF(ISNULL([judul skripsi]),'',REPLACE(mid([judul skripsi],1,200),'"','')) AS judul_skripsi,
 [no ijazah] AS no_seri_ijazah,
 '' AS wisuda_ke,
 [status keluar] AS id_jns_keluar
FROM MAHASISWASYNCTO
WHERE NOT ISNULL([status keluar]) AND [status keluar]<>'1';

 
 

 
 
 