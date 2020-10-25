-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 25 Okt 2020 pada 04.26
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
-- Database: `db_akademik`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `guru`
--

CREATE TABLE `guru` (
  `nip` int(10) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `jk` varchar(10) NOT NULL,
  `mata_pelajaran` varchar(35) NOT NULL,
  `alamat` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `guru`
--

INSERT INTO `guru` (`nip`, `nama`, `jk`, `mata_pelajaran`, `alamat`) VALUES
(1000, 'Andini aja', 'Putri', 'Bahasa', 'Kilo'),
(1001, 'Hani', 'Putri', 'Bahasa Inggris', 'Rapak'),
(1002, 'Ilham', 'Putra', 'Matematika', 'Gunung Guntur'),
(1003, 'Yudha', 'Putra', 'Agama Kristen', 'Kilo 10'),
(1004, 'Muchtar', 'Putra', 'Agama Islam', 'Gunung Malang'),
(1005, 'Endah', 'Putri', 'Biologi', 'Gunung Tembak'),
(1006, 'Bima', 'Putra', 'Kimia', 'Kilo 3'),
(1007, 'Rahman', 'Putra', 'Seni Budaya', 'Gunung Kawi'),
(1008, 'Guntur', 'Putra', 'PKN', 'Graha Indah'),
(1009, 'Tio', 'Putra', 'Produktif TKJ', 'Ring Road'),
(1010, 'Hasyim', 'Putra', 'Produktif RPL', 'Gunung Bakaran'),
(1011, 'Rio', 'Putra', 'Produktif TP', 'Balikpapan Baru'),
(1012, 'Yuyun', 'Putri', 'Produktif MM', 'Sepinggan'),
(1013, 'Jamal', 'Putra', 'Produktif TITL', 'Pasar Baru');

-- --------------------------------------------------------

--
-- Struktur dari tabel `mapel`
--

CREATE TABLE `mapel` (
  `kode_mapel` varchar(20) NOT NULL,
  `mata_pelajaran` varchar(35) NOT NULL,
  `kkm` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `mapel`
--

INSERT INTO `mapel` (`kode_mapel`, `mata_pelajaran`, `kkm`) VALUES
('AGISLAM', 'Agama Islam', 77),
('AGKRIS', 'Agama Kristen', 77),
('BINDO', 'Bahasa Indonesia', 78),
('BINGG', 'Bahasa Inggris', 78),
('BIO', 'Biologi', 75),
('KIM', 'Kimia', 75),
('MAT', 'Matematika', 75),
('MM', 'Produktif MM', 78),
('PKN', 'PKN', 76),
('RPL', 'Produktif RPL', 78),
('SBK', 'Seni Budaya', 76),
('TITL', 'Produktif TITL', 78),
('TKJ', 'Produktif TKJ', 78),
('TP', 'Produktif TP', 78);

-- --------------------------------------------------------

--
-- Stand-in structure for view `n`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `n` (
`id_nilai` int(11)
,`nis` int(11)
,`nama` varchar(35)
,`nilai` varchar(5)
);

-- --------------------------------------------------------

--
-- Struktur dari tabel `nilai`
--

CREATE TABLE `nilai` (
  `id_nilai` int(11) NOT NULL,
  `nis` varchar(11) NOT NULL,
  `nip` varchar(10) NOT NULL,
  `kode_mapel` varchar(35) NOT NULL,
  `nilai` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `nilai`
--

INSERT INTO `nilai` (`id_nilai`, `nis`, `nip`, `kode_mapel`, `nilai`) VALUES
(2, '2000', '1000', 'BINDO', '80'),
(3, '2000', '1001', 'BINGG', '96'),
(4, '2000', '1002', 'MAT', '68'),
(5, '2000', '1003', 'AGKRIS', '82'),
(6, '2000', '1005', 'BIO', '70'),
(7, '2000', '1006', 'KIM', '80'),
(8, '2000', '1007', 'SBK', '90'),
(9, '2000', '1008', 'PKN', '84'),
(10, '2000', '1012', 'MM', '80'),
(11, '2001', '1000', 'BINDO', '86'),
(12, '2001', '1001', 'BINGG', '90'),
(13, '2001', '1002', 'MAT', '72'),
(14, '2001', '1004', 'AGISLAM', '82'),
(15, '2001', '1005', 'BIO', '86'),
(16, '2001', '1006', 'KIM', '70'),
(17, '2001', '1007', 'SBK', '74'),
(18, '2001', '1008', 'PKN', '80'),
(19, '2001', '1010', 'RPL', '84'),
(20, '2002', '1000', 'BINDO', '86'),
(21, '2002', '1001', 'BINGG', '88'),
(22, '2002', '1002', 'MAT', '70'),
(23, '2002', '1004', 'AGISLAM', '80'),
(24, '2002', '1005', 'BIO', '80'),
(25, '2002', '1006', 'KIM', '92'),
(26, '2002', '1007', 'SBK', '80'),
(27, '2002', '1008', 'PKN', '88'),
(28, '2002', '1010', 'RPL', '90'),
(29, '2003', '1000', 'BINDO', '88'),
(30, '2003', '1000', 'BINDO', '88'),
(31, '2003', '1001', 'BINGG', '78'),
(32, '2003', '1002', 'MAT', '68'),
(33, '2003', '1004', 'AGISLAM', '90'),
(34, '2003', '1005', 'BIO', '50'),
(35, '2003', '1006', 'KIM', '88'),
(36, '2003', '1007', 'SBK', '80'),
(37, '2003', '1008', 'PKN', '76'),
(38, '2003', '1013', 'TITL', '86'),
(39, '2004', '1000', 'BINDO', '80'),
(40, '2004', '1001', 'BINGG', '64'),
(41, '2004', '1002', 'MAT', '74'),
(42, '2004', '1004', 'AGISLAM', '96'),
(43, '2004', '1005', 'BIO', '82'),
(44, '2004', '1006', 'KIM', '85'),
(45, '2004', '1007', 'SBK', '78'),
(46, '2004', '1008', 'PKN', '82'),
(47, '2004', '1009', 'TKJ', '90'),
(48, '2005', '1000', 'BINDO', '84'),
(49, '2005', '1001', 'BINGG', '80'),
(50, '2005', '1002', 'MAT', '78'),
(51, '2005', '1004', 'AGISLAM', '90');

-- --------------------------------------------------------

--
-- Struktur dari tabel `siswa`
--

CREATE TABLE `siswa` (
  `nis` int(11) NOT NULL,
  `nama` varchar(35) NOT NULL,
  `jk` varchar(15) NOT NULL,
  `kelas` varchar(35) NOT NULL,
  `asal_sekolah` varchar(35) NOT NULL,
  `alamat` varchar(35) NOT NULL,
  `hp` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `siswa`
--

INSERT INTO `siswa` (`nis`, `nama`, `jk`, `kelas`, `asal_sekolah`, `alamat`, `hp`) VALUES
(2000, 'Andin', 'Putri', 'XII MM 2', 'SMP 10', 'Ring road', '08152424'),
(2001, 'Jinu', 'Putra', 'XII RPL 1', 'SMP 1', 'Kilo', '08982313'),
(2002, 'Hyeongjun', 'Putra', 'XII RPL 1', 'SMP 12', 'Ring road', '081526728'),
(2003, 'Abdullah', 'Putra', 'XII TITL 3', 'SMP 8', 'Samboja', '089823131'),
(2004, 'Abdul Jamal', 'Putra', 'XII TKJ 6', 'SMP 12', 'Jalanan', '09812123'),
(2005, 'Aminah', 'Putri', 'XII RPL 1', 'SMP 14', 'Rapak', '087675467'),
(2006, 'Hamdan', 'Putra', 'XII RPL 2', 'SMP 9', 'Kilo', '0935467789'),
(2007, 'Sintia', 'Putri', 'XII TKJ 2', 'SMP 5', 'Sepinggan', '01248293'),
(2008, 'Haru', 'Putra', 'XII RPL 1', 'SMP 10', 'Jalan', '09667466'),
(2009, 'Gigi', 'Putra', 'XII RPL 2', 'SMP 11', 'Gunung Malang', '0712983782'),
(2010, 'Yudhi', 'Putra', 'XII TP', 'SMP 2', 'Gunung Pasir', '02834923');

-- --------------------------------------------------------

--
-- Struktur untuk view `n`
--
DROP TABLE IF EXISTS `n`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `n`  AS  select `n`.`id_nilai` AS `id_nilai`,`s`.`nis` AS `nis`,`s`.`nama` AS `nama`,`n`.`nilai` AS `nilai` from (`nilai` `n` join `siswa` `s` on((`s`.`nis` = `n`.`nis`))) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `guru`
--
ALTER TABLE `guru`
  ADD PRIMARY KEY (`nip`);

--
-- Indexes for table `mapel`
--
ALTER TABLE `mapel`
  ADD PRIMARY KEY (`kode_mapel`);

--
-- Indexes for table `nilai`
--
ALTER TABLE `nilai`
  ADD PRIMARY KEY (`id_nilai`);

--
-- Indexes for table `siswa`
--
ALTER TABLE `siswa`
  ADD PRIMARY KEY (`nis`),
  ADD UNIQUE KEY `nis` (`nis`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `nilai`
--
ALTER TABLE `nilai`
  MODIFY `id_nilai` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;
--
-- AUTO_INCREMENT for table `siswa`
--
ALTER TABLE `siswa`
  MODIFY `nis` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2011;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
