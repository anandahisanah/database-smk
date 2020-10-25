-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 25 Okt 2020 pada 04.27
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
-- Database: `db_tiket`
--

-- --------------------------------------------------------

--
-- Stand-in structure for view `maskapai`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `maskapai` (
`id_rute` varchar(50)
,`rute_awal` varchar(50)
,`rute_akhir` varchar(50)
,`harga` int(11)
,`nama_maskapai` varchar(50)
);

-- --------------------------------------------------------

--
-- Struktur dari tabel `pembayaran`
--

CREATE TABLE `pembayaran` (
  `id_pembayaran` int(11) NOT NULL,
  `id_pemesanan` int(11) NOT NULL,
  `total_harga` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `pembayaran`
--

INSERT INTO `pembayaran` (`id_pembayaran`, `id_pemesanan`, `total_harga`) VALUES
(12, 11, 800000),
(13, 12, 60000000),
(14, 13, 350000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `pemesanan`
--

CREATE TABLE `pemesanan` (
  `id_pemesanan` int(11) NOT NULL,
  `tanggal_pemesanan` date NOT NULL,
  `tempat_pemesanan` varchar(50) NOT NULL,
  `id_penumpang` int(11) NOT NULL,
  `jumlah_kursi` int(11) NOT NULL,
  `id_rute` varchar(50) NOT NULL,
  `tanggal_berangkat` date NOT NULL,
  `nama_maskapai` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `pemesanan`
--

INSERT INTO `pemesanan` (`id_pemesanan`, `tanggal_pemesanan`, `tempat_pemesanan`, `id_penumpang`, `jumlah_kursi`, `id_rute`, `tanggal_berangkat`, `nama_maskapai`) VALUES
(11, '2019-11-06', 'Samarinda', 2, 2, 'AIRASIA_BPP-BJB_400', '2019-11-21', 'AirAsia'),
(12, '2019-11-13', 'Balikpapan', 5, 150, 'AIRASIA_BPP-BJB_400', '2019-11-30', 'AirAsia'),
(13, '2019-11-10', 'Balikpapan', 2, 1, 'LION_BPP-BJB_350', '2019-11-15', 'Lion Air');

--
-- Trigger `pemesanan`
--
DELIMITER $$
CREATE TRIGGER `pesann` AFTER INSERT ON `pemesanan` FOR EACH ROW BEGIN
UPDATE transportasi
SET jumlah_kursi = jumlah_kursi - NEW.jumlah_kursi
WHERE nama_maskapai = NEW.nama_maskapai;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `penumpang`
--

CREATE TABLE `penumpang` (
  `id_penumpang` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `alamat` varchar(50) NOT NULL,
  `jk` varchar(50) NOT NULL,
  `telepon` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `penumpang`
--

INSERT INTO `penumpang` (`id_penumpang`, `username`, `password`, `nama`, `alamat`, `jk`, `telepon`) VALUES
(2, 'hyeongjun', 'hyeongjun', 'Song Hyeong Jun', 'Korea Barat', 'Pria', '0934712938'),
(3, 'umji', 'umji', 'Umji', 'Korea Barat', 'Wanita', '097786868'),
(4, 'chanyeol', 'chanyeol', 'Park Chan Yeol', 'Korea Barat', 'Pria', '0127312873'),
(5, 'baekhyun', 'baekhyun', 'Byun Baek Hyun', 'Korea Barat', 'Pria', '019830812'),
(6, 'yena', 'yena', 'Choi Ye Na', 'Korea Barat', 'Wanita', '0192380238'),
(7, 'yohan', 'yohan', 'Kim Yo Han', 'Korea Barat', 'Pria', '09123809238'),
(8, 'yujin', 'yujin', 'Ahn Yu Jin', 'Korea Barat', 'Wanita', '0912830932'),
(9, 'fifi', 'fifi', 'Fifi', 'Jalan Kilo 11', 'Wanita', '0912830183');

-- --------------------------------------------------------

--
-- Stand-in structure for view `pesanan`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `pesanan` (
`id_pemesanan` int(11)
,`nama` varchar(50)
,`tanggal_pemesanan` date
,`tempat_pemesanan` varchar(50)
,`jumlah_kursi` int(11)
,`nama_maskapai` varchar(50)
,`rute_awal` varchar(50)
,`rute_akhir` varchar(50)
,`tanggal_berangkat` date
,`harga` int(11)
,`total_harga` bigint(21)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `pesanan2`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `pesanan2` (
`id_pemesanan` int(11)
,`tanggal_pemesanan` date
,`tempat_pemesanan` varchar(50)
,`jumlah_kursi` int(11)
,`nama` varchar(50)
,`nama_maskapai` varchar(50)
,`rute_awal` varchar(50)
,`rute_akhir` varchar(50)
,`harga` int(11)
);

-- --------------------------------------------------------

--
-- Struktur dari tabel `petugas`
--

CREATE TABLE `petugas` (
  `id_petugas` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `nama_petugas` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `petugas`
--

INSERT INTO `petugas` (`id_petugas`, `username`, `password`, `nama_petugas`) VALUES
(1, 'aren', 'jinu', 'Aren Jinu'),
(2, 'anandahisanah', 'anandahisanah', 'Ananda Hisanah');

-- --------------------------------------------------------

--
-- Struktur dari tabel `rute`
--

CREATE TABLE `rute` (
  `id_rute` varchar(50) NOT NULL,
  `rute_awal` varchar(50) NOT NULL,
  `rute_akhir` varchar(50) NOT NULL,
  `harga` int(11) NOT NULL,
  `kode_transportasi` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `rute`
--

INSERT INTO `rute` (`id_rute`, `rute_awal`, `rute_akhir`, `harga`, `kode_transportasi`) VALUES
('AIRASIA_BPP-BJB_400', 'Balikpapan', 'Banjarbaru', 400000, 'P_AIRASIA'),
('AIRASIA_BPP-JKT_500', 'Balikpapan', 'Jakarta', 500000, 'P_AIRASIA'),
('BATIKAIR_BPP-MDN_650', 'Balikpapan', 'Medan', 650000, 'P_BATIKAIR'),
('CITILINK_BPP-JKT_900', 'Balikpapan', 'Jakarta', 900000, 'P_CITILINK'),
('LION_BPP-BJB_350', 'Balikpapan', 'Banjarbaru', 350000, 'P_LIONAIR'),
('LION_BPP-SMD_200', 'Balikpapan', 'Samarinda', 200000, 'P_LIONAIR');

-- --------------------------------------------------------

--
-- Struktur dari tabel `transportasi`
--

CREATE TABLE `transportasi` (
  `kode_transportasi` varchar(50) NOT NULL,
  `nama_maskapai` varchar(50) NOT NULL,
  `jumlah_kursi` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `transportasi`
--

INSERT INTO `transportasi` (`kode_transportasi`, `nama_maskapai`, `jumlah_kursi`) VALUES
('P_AIRASIA', 'AirAsia', 50),
('P_LIONAIR', 'Lion Air', 99),
('P_BATIKAIR', 'Batik Air', 150),
('P_CITILINK', 'Citilink', 200),
('P_GARUDA', 'Garuda Indonesia', 400);

-- --------------------------------------------------------

--
-- Struktur untuk view `maskapai`
--
DROP TABLE IF EXISTS `maskapai`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `maskapai`  AS  select `rute`.`id_rute` AS `id_rute`,`rute`.`rute_awal` AS `rute_awal`,`rute`.`rute_akhir` AS `rute_akhir`,`rute`.`harga` AS `harga`,`transportasi`.`nama_maskapai` AS `nama_maskapai` from (`rute` left join `transportasi` on((`rute`.`kode_transportasi` = `transportasi`.`kode_transportasi`))) ;

-- --------------------------------------------------------

--
-- Struktur untuk view `pesanan`
--
DROP TABLE IF EXISTS `pesanan`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `pesanan`  AS  select `p`.`id_pemesanan` AS `id_pemesanan`,`g`.`nama` AS `nama`,`p`.`tanggal_pemesanan` AS `tanggal_pemesanan`,`p`.`tempat_pemesanan` AS `tempat_pemesanan`,`p`.`jumlah_kursi` AS `jumlah_kursi`,`maskapai`.`nama_maskapai` AS `nama_maskapai`,`r`.`rute_awal` AS `rute_awal`,`r`.`rute_akhir` AS `rute_akhir`,`p`.`tanggal_berangkat` AS `tanggal_berangkat`,`r`.`harga` AS `harga`,(`r`.`harga` * `p`.`jumlah_kursi`) AS `total_harga` from (((`pemesanan` `p` left join `rute` `r` on((`p`.`id_rute` = `r`.`id_rute`))) left join `penumpang` `g` on((`p`.`id_penumpang` = `g`.`id_penumpang`))) left join `maskapai` on((`p`.`id_rute` = 'maskapai.id_rute'))) ;

-- --------------------------------------------------------

--
-- Struktur untuk view `pesanan2`
--
DROP TABLE IF EXISTS `pesanan2`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `pesanan2`  AS  select `pemesanan`.`id_pemesanan` AS `id_pemesanan`,`pemesanan`.`tanggal_pemesanan` AS `tanggal_pemesanan`,`pemesanan`.`tempat_pemesanan` AS `tempat_pemesanan`,`pemesanan`.`jumlah_kursi` AS `jumlah_kursi`,`penumpang`.`nama` AS `nama`,`maskapai`.`nama_maskapai` AS `nama_maskapai`,`maskapai`.`rute_awal` AS `rute_awal`,`maskapai`.`rute_akhir` AS `rute_akhir`,`maskapai`.`harga` AS `harga` from ((`pemesanan` left join `penumpang` on((`penumpang`.`id_penumpang` = `pemesanan`.`id_penumpang`))) left join `maskapai` on((`pemesanan`.`id_rute` = `maskapai`.`id_rute`))) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD PRIMARY KEY (`id_pembayaran`),
  ADD KEY `id_pemesanan` (`id_pemesanan`);

--
-- Indexes for table `pemesanan`
--
ALTER TABLE `pemesanan`
  ADD PRIMARY KEY (`id_pemesanan`),
  ADD KEY `id_penumpang` (`id_penumpang`),
  ADD KEY `id_rute` (`id_rute`),
  ADD KEY `nama_maskapai` (`nama_maskapai`);

--
-- Indexes for table `penumpang`
--
ALTER TABLE `penumpang`
  ADD PRIMARY KEY (`id_penumpang`),
  ADD KEY `id_penumpang` (`id_penumpang`);

--
-- Indexes for table `petugas`
--
ALTER TABLE `petugas`
  ADD PRIMARY KEY (`id_petugas`);

--
-- Indexes for table `rute`
--
ALTER TABLE `rute`
  ADD PRIMARY KEY (`id_rute`),
  ADD KEY `kode_transportasi` (`kode_transportasi`);

--
-- Indexes for table `transportasi`
--
ALTER TABLE `transportasi`
  ADD KEY `kode_transportasi` (`kode_transportasi`),
  ADD KEY `nama_maskapai` (`nama_maskapai`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pembayaran`
--
ALTER TABLE `pembayaran`
  MODIFY `id_pembayaran` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `pemesanan`
--
ALTER TABLE `pemesanan`
  MODIFY `id_pemesanan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `penumpang`
--
ALTER TABLE `penumpang`
  MODIFY `id_penumpang` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `petugas`
--
ALTER TABLE `petugas`
  MODIFY `id_petugas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD CONSTRAINT `pembayaran_ibfk_1` FOREIGN KEY (`id_pemesanan`) REFERENCES `pemesanan` (`id_pemesanan`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `pemesanan`
--
ALTER TABLE `pemesanan`
  ADD CONSTRAINT `pemesanan_ibfk_1` FOREIGN KEY (`id_penumpang`) REFERENCES `penumpang` (`id_penumpang`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pemesanan_ibfk_2` FOREIGN KEY (`id_rute`) REFERENCES `rute` (`id_rute`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pemesanan_ibfk_3` FOREIGN KEY (`nama_maskapai`) REFERENCES `transportasi` (`nama_maskapai`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `rute`
--
ALTER TABLE `rute`
  ADD CONSTRAINT `rute_ibfk_1` FOREIGN KEY (`kode_transportasi`) REFERENCES `transportasi` (`kode_transportasi`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
