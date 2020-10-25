-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 25 Okt 2020 pada 04.28
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
-- Database: `kasir`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `menu`
--

CREATE TABLE `menu` (
  `id_menu` int(11) NOT NULL,
  `nama_menu` varchar(100) NOT NULL,
  `harga` int(11) NOT NULL,
  `stok` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `menu`
--

INSERT INTO `menu` (`id_menu`, `nama_menu`, `harga`, `stok`) VALUES
(6, 'Mie Goreng Biasa', 10000, 1),
(7, 'Mie Goreng Spesial', 15000, 1),
(8, 'Kwetiau Goreng', 14000, 0),
(9, 'Kwetiau Kuah ', 14000, 2),
(10, 'Cap Cai Sayur', 15000, 1),
(11, 'Cap Cai Seafood', 20000, 1),
(13, 'Es Teh', 5000, 0),
(14, 'Es Jeruk', 7000, 0),
(15, 'Hangat Teh', 5000, 8),
(16, 'Hangat Jeruk', 7000, 2),
(17, 'Kentang Goreng', 10000, 6);

-- --------------------------------------------------------

--
-- Struktur dari tabel `pelanggan`
--

CREATE TABLE `pelanggan` (
  `id_pelanggan` int(11) NOT NULL,
  `nama_pelanggan` varchar(100) NOT NULL,
  `jk` varchar(100) NOT NULL,
  `hp` varchar(100) NOT NULL,
  `alamat` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `pelanggan`
--

INSERT INTO `pelanggan` (`id_pelanggan`, `nama_pelanggan`, `jk`, `hp`, `alamat`) VALUES
(1, 'Yudhaaa', '', '099864738291', 'Sepinggan'),
(2, 'Hani', 'Perempuan', '087836472835', 'BDI'),
(3, 'Amien', 'Laki-laki', '081564728194', 'BDS'),
(5, 'Nia', 'Perempuan', '081174635298', 'Ring road'),
(6, 'Oman', 'Laki-laki', '081264736118', 'Manggar'),
(7, 'Fira', 'Perempuan', '081546352411', 'Lamaru'),
(8, 'Ghina', 'Perempuan', '081578465589', 'BDS 2'),
(9, 'Firdaus', 'Laki-laki', '081389877432', 'Kilo 8'),
(10, 'Dana', 'Laki-laki', '081673644522', 'Stal Kuda'),
(11, 'Fatir', 'Laki-laki', '081526376448', 'Kilo 3');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pesanan`
--

CREATE TABLE `pesanan` (
  `id_pesanan` int(11) NOT NULL,
  `id_menu` int(11) NOT NULL,
  `nama_pelanggan` varchar(100) NOT NULL,
  `jumlah_pesanan` int(11) NOT NULL,
  `keterangan` varchar(100) NOT NULL,
  `id_user` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `pesanan`
--

INSERT INTO `pesanan` (`id_pesanan`, `id_menu`, `nama_pelanggan`, `jumlah_pesanan`, `keterangan`, `id_user`) VALUES
(6, 7, 'Fira', 1, 'Belum Lunas', 'yena'),
(9, 17, 'Fira', 1, 'Belum Lunas', 'yena'),
(10, 7, 'Nia', 1, 'Belum Lunas', 'yena');

--
-- Trigger `pesanan`
--
DELIMITER $$
CREATE TRIGGER `pesan` AFTER INSERT ON `pesanan` FOR EACH ROW BEGIN

UPDATE menu
SET stok = (menu.stok - NEW.jumlah_pesanan)
WHERE (menu.id_menu = NEW.id_menu);

INSERT INTO transaksi (id_pesanan, total, bayar)
VALUES (NEW.id_pesanan, NEW.jumlah_pesanan, NEW.keterangan);

END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaksi`
--

CREATE TABLE `transaksi` (
  `id_transaksi` int(11) NOT NULL,
  `id_pesanan` int(11) NOT NULL,
  `total` int(11) NOT NULL,
  `bayar` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `transaksi`
--

INSERT INTO `transaksi` (`id_transaksi`, `id_pesanan`, `total`, `bayar`) VALUES
(2, 6, 1, 'Belum Lunas'),
(3, 9, 1, 'Belum Lunas'),
(4, 10, 1, 'Belum Lunas');

--
-- Trigger `transaksi`
--
DELIMITER $$
CREATE TRIGGER `transaksii` AFTER UPDATE ON `transaksi` FOR EACH ROW BEGIN

UPDATE pesanan
SET keterangan = ("Lunas")
WHERE (id_pesanan = NEW.id_pesanan);

END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id_user` varchar(100) NOT NULL,
  `nama_user` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `level` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id_user`, `nama_user`, `password`, `level`) VALUES
('aren', 'Aren Jinu', 'aren', 'Owner'),
('jinu', 'Jinu Aren', 'jinu', 'Admin'),
('nandap', 'Ananda Hisanah', 'nandap', 'MASTER'),
('yena', 'Choi Yena', 'yena', 'Kasir'),
('yuri', 'Jo Yuri', 'yuri', 'Waiter');

-- --------------------------------------------------------

--
-- Stand-in structure for view `vv_pesanan`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `vv_pesanan` (
`id_pesanan` int(11)
,`nama_menu` varchar(100)
,`nama_pelanggan` varchar(100)
,`jumlah_pesanan` int(11)
,`keterangan` varchar(100)
);

-- --------------------------------------------------------

--
-- Struktur untuk view `vv_pesanan`
--
DROP TABLE IF EXISTS `vv_pesanan`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vv_pesanan`  AS  select `pesanan`.`id_pesanan` AS `id_pesanan`,`menu`.`nama_menu` AS `nama_menu`,`pesanan`.`nama_pelanggan` AS `nama_pelanggan`,`pesanan`.`jumlah_pesanan` AS `jumlah_pesanan`,`pesanan`.`keterangan` AS `keterangan` from (`pesanan` left join `menu` on((`pesanan`.`id_menu` = `menu`.`id_menu`))) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id_menu`);

--
-- Indexes for table `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`id_pelanggan`),
  ADD KEY `nama_pelanggan` (`nama_pelanggan`);

--
-- Indexes for table `pesanan`
--
ALTER TABLE `pesanan`
  ADD PRIMARY KEY (`id_pesanan`),
  ADD KEY `id_menu` (`id_menu`),
  ADD KEY `id_pelanggan` (`nama_pelanggan`),
  ADD KEY `id_user` (`id_user`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id_transaksi`),
  ADD KEY `id_pesanan` (`id_pesanan`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`,`nama_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `menu`
--
ALTER TABLE `menu`
  MODIFY `id_menu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT for table `pelanggan`
--
ALTER TABLE `pelanggan`
  MODIFY `id_pelanggan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `pesanan`
--
ALTER TABLE `pesanan`
  MODIFY `id_pesanan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `id_transaksi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `pesanan`
--
ALTER TABLE `pesanan`
  ADD CONSTRAINT `pesanan_ibfk_1` FOREIGN KEY (`id_menu`) REFERENCES `menu` (`id_menu`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pesanan_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pesanan_ibfk_3` FOREIGN KEY (`nama_pelanggan`) REFERENCES `pelanggan` (`nama_pelanggan`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  ADD CONSTRAINT `transaksi_ibfk_1` FOREIGN KEY (`id_pesanan`) REFERENCES `pesanan` (`id_pesanan`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
