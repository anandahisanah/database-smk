-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 25 Okt 2020 pada 04.29
-- Versi Server: 10.1.26-MariaDB
-- PHP Version: 7.1.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `spp2`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `kelas`
--

CREATE TABLE `kelas` (
  `id_kelas` int(11) NOT NULL,
  `nama_kelas` varchar(10) NOT NULL,
  `kompetensi_keahlian` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `kelas`
--

INSERT INTO `kelas` (`id_kelas`, `nama_kelas`, `kompetensi_keahlian`) VALUES
(35, 'X - MM', 'MULTIMEDIA'),
(36, 'X - RPL', 'REKAYASA PERANGKAT LUNAK'),
(37, 'X - TAB 1', 'TEKNIK ALAT BERAT'),
(38, 'X - TAB 2', 'TEKNIK ALAT BERAT'),
(39, 'X - TKR', 'TEKNIK KENDARAAN RINGAN'),
(40, 'X - TP', 'TEKNIK PEMESINAN'),
(41, 'X - GP', 'GEOLOGI PERTAMBANGAN'),
(42, 'XI - MM', 'MULTIMEDIA'),
(43, 'XI - RPL', 'REKAYASA PERANGKAT LUNAK'),
(44, 'XI - TAB', 'TEKNIK ALAT BERAT'),
(45, 'XI - TKR', 'TEKNIK KENDARAAN RINGAN'),
(46, 'XI - TP', 'TEKNIK PEMESINAN'),
(47, 'XI - GP 1', 'GEOLOGI PERTAMBANGAN'),
(48, 'XI - GP 2', 'GEOLOGI PERTAMBANGAN'),
(49, 'XII - MM', 'MULTIMEDIA'),
(50, 'XII - RPL', 'REKAYASA PERANGKAT LUNAK'),
(51, 'XII - TAB', 'TEKNIK ALAT BERAT'),
(52, 'XII - TKR', 'TEKNIK KENDARAAN RINGAN'),
(53, 'XII - TP 1', 'TEKNIK PEMESINAN'),
(54, 'XII - TP 2', 'TEKNIK PEMESINAN'),
(55, 'XII - GP', 'GEOLOGI PERTAMBANGAN'),
(57, '', '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kota`
--

CREATE TABLE `kota` (
  `kecamatan` varchar(30) NOT NULL,
  `kelurahan` varchar(30) NOT NULL,
  `kode_pos` char(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `kota`
--

INSERT INTO `kota` (`kecamatan`, `kelurahan`, `kode_pos`) VALUES
('Balikpapan Barat', 'Kariangau', '76134'),
('Balikpapan Barat', 'Marga Sari', '76131'),
('Balikpapan Kota', 'Damai', '76114'),
('Balikpapan Kota', 'Prapatan', '76111'),
('Balikpapan Selatan', 'Sepinggan', '76115'),
('Balikpapan Selatan', 'Gunung Bahagia', '76114'),
('Balikpapan Timur', 'Lamaru', '76117'),
('Balikpapan Timur', 'Manggar', '76116'),
('Balikpapan Tengah', 'Karang Jati', '76123'),
('Balikpapan Tengah', 'Mekar Sari', '76122'),
('Balikpapan Utara', 'Muara Rapak', '76125'),
('Balikpapan Utara', 'Karang Joang', '76127');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pembayaran`
--

CREATE TABLE `pembayaran` (
  `id_pembayaran` int(11) NOT NULL,
  `id_petugas` int(11) NOT NULL,
  `nisn` varchar(10) NOT NULL,
  `tgl_bayar` date NOT NULL,
  `bulan_dibayar` varchar(8) NOT NULL,
  `tahun_dibayar` varchar(4) NOT NULL,
  `id_spp` int(11) NOT NULL,
  `jumlah_bayar` int(11) NOT NULL,
  `keterangan` varchar(20) NOT NULL,
  `id_tagihan` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `pembayaran`
--

INSERT INTO `pembayaran` (`id_pembayaran`, `id_petugas`, `nisn`, `tgl_bayar`, `bulan_dibayar`, `tahun_dibayar`, `id_spp`, `jumlah_bayar`, `keterangan`, `id_tagihan`) VALUES
(38, 12, '2002101067', '2020-01-15', 'Januari', '', 10, 0, 'Lunas', 59),
(39, 0, '2002101067', '0000-00-00', 'Februari', '', 10, 0, 'Belum Lunas', 60),
(40, 0, '2002101067', '0000-00-00', 'Maret', '', 10, 0, 'Belum Lunas', 61);

-- --------------------------------------------------------

--
-- Struktur dari tabel `petugas`
--

CREATE TABLE `petugas` (
  `id_petugas` int(11) NOT NULL,
  `username` varchar(25) NOT NULL,
  `password` varchar(25) NOT NULL,
  `nama_petugas` varchar(35) NOT NULL,
  `level` enum('Admin','Petugas') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `petugas`
--

INSERT INTO `petugas` (`id_petugas`, `username`, `password`, `nama_petugas`, `level`) VALUES
(1, 'aren', 'aren', 'YAREN JUN', 'Admin'),
(4, 'jinu', 'jinu', 'JINUZ REN', 'Petugas'),
(7, 'nandap', 'nandap', 'ANANDA NUR HISANAH', 'Admin'),
(8, 'gita', 'gita', 'GITA JKT48', 'Petugas'),
(12, 'gracia', 'gracia', 'GRACIA JKT48', 'Admin');

-- --------------------------------------------------------

--
-- Struktur dari tabel `siswa`
--

CREATE TABLE `siswa` (
  `nisn` char(10) NOT NULL,
  `nis` char(8) NOT NULL,
  `nama` varchar(35) NOT NULL,
  `id_kelas` int(11) NOT NULL,
  `alamat` text NOT NULL,
  `no_telp` varchar(13) NOT NULL,
  `id_spp` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `siswa`
--

INSERT INTO `siswa` (`nisn`, `nis`, `nama`, `id_kelas`, `alamat`, `no_telp`, `id_spp`) VALUES
('2002101067', '20176661', 'SAKURA MIYAWAKI', 35, 'JL. JIWA NO. 44 SEPINGGAN RAYA BALIKPAPAN SELATAN ', '087822396518', 10),
('2002199862', '20179002', 'UBAIDILLAH', 53, 'JL. JIWA NO. 63 BARU TENGAH BALIKPAPAN BARAT ', '089862771845', 10),
('2002451182', '20175364', 'HAMID BIBI', 54, 'JL. PURNAMA NO. 29 MANGGAR BARU BALIKPAPAN TIMUR ', '085864388123', 10),
('2002518892', '20171984', 'YOHAN DANU', 51, 'JL. PAGAR NO. 45 KLANDASAN ULU BALIKPAPAN KOTA ', '087866359002', 10),
('2002547321', '20171882', 'GIBRAN IMMANUEL', 52, 'JL. HAPPY NO. 34 KARANG JOANG BALIKPAPAN UTARA ', '081582993213', 10),
('2002649912', '20177611', 'GEORGE STEVE', 54, 'JL. BARU NO. 78 GUNUNG SARI ILIR BALIKPAPAN TENGAH ', '089954666723', 10),
('2002652711', '20176289', 'ANDINI MAGENTA', 55, 'JL. OBENG NO. 99 GUNUNG BAHAGIA BALIKPAPAN SELATAN ', '081282117921', 10),
('2002744892', '20176774', 'YENA YURI', 49, 'JL. CUCUR NO. 34 MARGO MULYO BALIKPAPAN BARAT ', '089754668902', 10),
('2002755682', '20174366', 'INDI MARSYA', 50, 'JL. KUCING NO. 49 MARGA SARI BALIKPAPAN BARAT ', '085762331299', 10),
('2002768833', '20174538', 'YUDHA RAMA', 51, 'JL. KEMANGI NO. 23 LAMARU BALIKPAPAN TIMUR ', '081372889332', 10),
('2002821129', '20179815', 'GIAN CHANDRA', 54, 'JL. MERPATI NO. 76 KARANG JATI BALIKPAPAN TENGAH ', '081872112911', 10),
('2002831923', '20178211', 'ARAN HUSEIN', 55, 'JL. BIRU NO. 65 PRAPATAN BALIKPAPAN KOTA ', '081528339281', 10),
('2002871233', '20175438', 'BURHAN FIRMAN', 55, 'JL. TINTA NO. 45 TELAGA SARI BALIKPAPAN KOTA ', '081372651228', 10),
('2002901568', '20179233', 'INDAH HANI', 50, 'JL. LANGIT NO. 94 SUMBER REJO BALIKPAPAN TENGAH ', '087653881920', 10),
('2002909056', '20176371', 'RIDHO AQIQAH', 53, 'JL. KOPAS NO. 48 KLANDASAN ULU BALIKPAPAN KOTA ', '089946773181', 10),
('2003147782', '20178392', 'JUAN DADU', 46, 'JL. KENTANG NO. 52 SUNGAI NANGKA BALIKPAPAN SELATAN ', '085172883211', 11),
('2003389211', '20184538', 'MINA SAN', 45, 'JL. KLONING NO. 89 GUNUNG SAMARINDA BALIKPAPAN UTARA ', '081389382212', 11),
('2003575412', '20188688', 'RAVENCLAW', 42, 'JL. SLYTHERIN NO. 77 KARANG JOANG BALIKPAPAN UTARA ', '087853648221', 11),
('2003648933', '20189033', 'YURI GINA', 46, 'JL. CUCUR NO. 42 SEPINGGAN RAYA BALIKPAPAN SELATAN ', '081283992021', 11),
('2003679912', '20183599', 'GRYFFINDOR HOGWARTS', 43, 'JL. SLYTHERIN NO. 66 MANGGAR BARU BALIKPAPAN TIMUR ', '085873992012', 11),
('2003738821', '20184531', 'HILMAN YUSUF', 47, 'JL. TAMBANG NO. 63 GUNUNG SAMARINDA BARU BALIKPAPAN UTARA ', '081378882631', 11),
('2003748233', '20186881', 'HISYAM MAHMUD', 44, 'JL. JIWA NO. 58 SEPINGGAN BALIKPAPAN SELATAN ', '081384773980', 11),
('2003748992', '20184733', 'YUJIN BIRU', 48, 'JL. HIJAU NO. 54 MUARA RAPAK BALIKPAPAN UTARA ', '085673882932', 11),
('2004483755', '20197483', 'GILANG HADI', 37, 'JL. KEMANGI NO. 95 KARIANGAU BALIKPAPAN BARAT ', '081387463328', 12),
('2004638199', '20196388', 'RAFFI SAN', 36, 'JL. KELELAWAR NO. 62 BARU ILIR BALIKPAPAN BARAT ', '089574882931', 12),
('2004639912', '20195399', 'HENRYL', 40, 'JL. PLASTIK NO. 76 GUNUNG SARI ULU BALIKPAPAN TENGAH ', '081274666388', 12),
('2004738299', '20196855', 'MINJU HAN', 41, 'JL. PLASTIK NO. 72 BARU TENGAH BALIKPAPAN BARAT ', '085173883921', 12),
('2004780014', '20196884', 'GUNTUR BUMI', 39, 'JL. PAGAR NO. 32 MANGGAR BARU BALIKPAPAN TIMUR ', '089763889212', 12),
('2004839231', '20198399', 'YUNA ELSA', 35, 'JL. KUCING NO. 38 GRAHA INDAH BALIKPAPAN UTARA ', '081583992030', 12),
('2004857703', '20193812', 'MINO', 38, 'JL. HAPPY NO. 89 DAMAI BAHAGIA BALIKPAPAN SELATAN ', '081264883921', 12);

-- --------------------------------------------------------

--
-- Struktur dari tabel `spp`
--

CREATE TABLE `spp` (
  `id_spp` int(11) NOT NULL,
  `tahun` int(11) NOT NULL,
  `nominal` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `spp`
--

INSERT INTO `spp` (`id_spp`, `tahun`, `nominal`) VALUES
(10, 2017, 100000),
(11, 2018, 150000),
(12, 2019, 200000),
(13, 2020, 250000),
(14, 2021, 300000),
(15, 2022, 350000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tagihan`
--

CREATE TABLE `tagihan` (
  `id_tagihan` int(11) NOT NULL,
  `id_spp` int(11) NOT NULL,
  `bulan` varchar(10) NOT NULL,
  `nisn` char(10) NOT NULL,
  `KETERANGAN` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tagihan`
--

INSERT INTO `tagihan` (`id_tagihan`, `id_spp`, `bulan`, `nisn`, `KETERANGAN`) VALUES
(59, 10, 'Januari', '2002101067', 'Belum Lunas'),
(60, 10, 'Februari', '2002101067', 'Belum Lunas'),
(61, 10, 'Maret', '2002101067', 'Belum Lunas');

--
-- Trigger `tagihan`
--
DELIMITER $$
CREATE TRIGGER `haha` AFTER INSERT ON `tagihan` FOR EACH ROW BEGIN
INSERT INTO pembayaran (nisn, id_spp, id_tagihan, bulan_dibayar, keterangan)
VALUE (NEW.nisn, NEW.id_spp, NEW.id_tagihan, NEW.bulan, "Belum Lunas");
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Stand-in structure for view `vv_tagihan`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `vv_tagihan` (
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_pembayaran`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `v_pembayaran` (
`id_pembayaran` int(11)
,`nisn` varchar(10)
,`nama` varchar(35)
,`id_spp` int(11)
,`nominal` int(11)
,`bulan_dibayar` varchar(8)
,`keterangan` varchar(20)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_siswa`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `v_siswa` (
`nisn` char(10)
,`nama` varchar(35)
,`nama_kelas` varchar(10)
,`alamat` text
,`no_telp` varchar(13)
,`nominal` int(11)
,`tahun` int(11)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_tagihan`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `v_tagihan` (
`id_tagihan` int(11)
,`nisn` char(10)
,`nama` varchar(35)
,`nama_kelas` varchar(10)
,`nominal` int(11)
,`bulan` varchar(10)
,`tahun` int(11)
,`keterangan` varchar(15)
);

-- --------------------------------------------------------

--
-- Struktur untuk view `vv_tagihan`
--
DROP TABLE IF EXISTS `vv_tagihan`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vv_tagihan`  AS  select `t`.`id_tagihan` AS `id_tagihan`,`t`.`nisn` AS `nisn`,`s`.`nama` AS `nama`,`s`.`nama_kelas` AS `nama_kelas`,`s`.`nominal` AS `nominal`,`t`.`bulan` AS `bulan`,`s`.`tahun` AS `tahun`,`t`.`ket` AS `ket` from (`tagihan` `t` left join `v_siswa` `s` on((`t`.`nisn` = `s`.`nisn`))) ;

-- --------------------------------------------------------

--
-- Struktur untuk view `v_pembayaran`
--
DROP TABLE IF EXISTS `v_pembayaran`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_pembayaran`  AS  select `p`.`id_pembayaran` AS `id_pembayaran`,`p`.`nisn` AS `nisn`,`s`.`nama` AS `nama`,`p`.`id_spp` AS `id_spp`,`w`.`nominal` AS `nominal`,`p`.`bulan_dibayar` AS `bulan_dibayar`,`p`.`keterangan` AS `keterangan` from ((`pembayaran` `p` left join `siswa` `s` on((`p`.`nisn` = `s`.`nisn`))) left join `spp` `w` on((`p`.`id_spp` = `w`.`id_spp`))) ;

-- --------------------------------------------------------

--
-- Struktur untuk view `v_siswa`
--
DROP TABLE IF EXISTS `v_siswa`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_siswa`  AS  select `w`.`nisn` AS `nisn`,`w`.`nama` AS `nama`,`k`.`nama_kelas` AS `nama_kelas`,`w`.`alamat` AS `alamat`,`w`.`no_telp` AS `no_telp`,`p`.`nominal` AS `nominal`,`p`.`tahun` AS `tahun` from ((`siswa` `w` left join `kelas` `k` on((`w`.`id_kelas` = `k`.`id_kelas`))) left join `spp` `p` on((`w`.`id_spp` = `p`.`id_spp`))) ;

-- --------------------------------------------------------

--
-- Struktur untuk view `v_tagihan`
--
DROP TABLE IF EXISTS `v_tagihan`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_tagihan`  AS  select `t`.`id_tagihan` AS `id_tagihan`,`t`.`nisn` AS `nisn`,`s`.`nama` AS `nama`,`s`.`nama_kelas` AS `nama_kelas`,`s`.`nominal` AS `nominal`,`t`.`bulan` AS `bulan`,`s`.`tahun` AS `tahun`,`t`.`KETERANGAN` AS `keterangan` from (`tagihan` `t` left join `v_siswa` `s` on((`t`.`nisn` = `s`.`nisn`))) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `kelas`
--
ALTER TABLE `kelas`
  ADD PRIMARY KEY (`id_kelas`);

--
-- Indexes for table `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD PRIMARY KEY (`id_pembayaran`),
  ADD KEY `nisn` (`nisn`),
  ADD KEY `id_spp` (`id_spp`),
  ADD KEY `id_petugas` (`id_petugas`);

--
-- Indexes for table `petugas`
--
ALTER TABLE `petugas`
  ADD PRIMARY KEY (`id_petugas`);

--
-- Indexes for table `siswa`
--
ALTER TABLE `siswa`
  ADD PRIMARY KEY (`nisn`),
  ADD KEY `id_kelas` (`id_kelas`),
  ADD KEY `id_spp` (`id_spp`);

--
-- Indexes for table `spp`
--
ALTER TABLE `spp`
  ADD PRIMARY KEY (`id_spp`);

--
-- Indexes for table `tagihan`
--
ALTER TABLE `tagihan`
  ADD PRIMARY KEY (`id_tagihan`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `kelas`
--
ALTER TABLE `kelas`
  MODIFY `id_kelas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;
--
-- AUTO_INCREMENT for table `pembayaran`
--
ALTER TABLE `pembayaran`
  MODIFY `id_pembayaran` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;
--
-- AUTO_INCREMENT for table `petugas`
--
ALTER TABLE `petugas`
  MODIFY `id_petugas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `spp`
--
ALTER TABLE `spp`
  MODIFY `id_spp` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `tagihan`
--
ALTER TABLE `tagihan`
  MODIFY `id_tagihan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;
--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD CONSTRAINT `pembayaran_ibfk_1` FOREIGN KEY (`nisn`) REFERENCES `siswa` (`nisn`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pembayaran_ibfk_2` FOREIGN KEY (`id_spp`) REFERENCES `siswa` (`id_spp`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `siswa`
--
ALTER TABLE `siswa`
  ADD CONSTRAINT `siswa_ibfk_1` FOREIGN KEY (`id_kelas`) REFERENCES `kelas` (`id_kelas`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `siswa_ibfk_2` FOREIGN KEY (`id_spp`) REFERENCES `spp` (`id_spp`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
