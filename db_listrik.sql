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
-- Database: `db_listrik`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `login`
--

CREATE TABLE `login` (
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `login`
--

INSERT INTO `login` (`username`, `password`) VALUES
('anandahisanah', '0'),
('jinu', '0'),
('aren', 'aren');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pelanggan`
--

CREATE TABLE `pelanggan` (
  `id_pelanggan` varchar(50) NOT NULL,
  `no_meter` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `alamat` varchar(50) NOT NULL,
  `kode_tarif` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `pelanggan`
--

INSERT INTO `pelanggan` (`id_pelanggan`, `no_meter`, `nama`, `alamat`, `kode_tarif`) VALUES
('R1a', 1000, 'Endah Maryani', 'Jalan Jembatan Maryani', 'R1'),
('R1b', 1001, 'Guntur Bumi', 'Perumahan Rengganis Blok G', 'R1'),
('R2a', 2000, 'Widya Rahmah', 'Perumahan Rengganis Blok C', 'R2');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pembayaran`
--

CREATE TABLE `pembayaran` (
  `id_bayar` int(11) NOT NULL,
  `id_pelanggan` varchar(50) NOT NULL,
  `tanggal` date NOT NULL,
  `bulan_bayar` varchar(50) NOT NULL,
  `harga` int(11) NOT NULL,
  `biaya_admin` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `pembayaran`
--

INSERT INTO `pembayaran` (`id_bayar`, `id_pelanggan`, `tanggal`, `bulan_bayar`, `harga`, `biaya_admin`) VALUES
(1, 'R1a', '2019-04-02', 'Maret', 1000000, 2500),
(2, 'R1b', '2020-03-10', 'Maret', 800000, 2500),
(3, 'R1a', '0000-00-00', 'April', 2200000, 2500);

--
-- Trigger `pembayaran`
--
DELIMITER $$
CREATE TRIGGER `bayar` AFTER UPDATE ON `pembayaran` FOR EACH ROW BEGIN
UPDATE tagihan
SET statuss = "Lunas"
WHERE
id_pelanggan = NEW.id_pelanggan AND bulan = NEW.bulan_bayar;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `penggunaan`
--

CREATE TABLE `penggunaan` (
  `id_pelanggan` varchar(50) NOT NULL,
  `bulan` varchar(50) NOT NULL,
  `tahun` varchar(50) NOT NULL,
  `meter_awal` int(11) NOT NULL,
  `meter_akhir` int(11) NOT NULL,
  `kode_tarif` varchar(50) NOT NULL,
  `tarif_per_kwh` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `penggunaan`
--

INSERT INTO `penggunaan` (`id_pelanggan`, `bulan`, `tahun`, `meter_awal`, `meter_akhir`, `kode_tarif`, `tarif_per_kwh`) VALUES
('R1a', 'Maret', '2019', 1000, 1500, 'R1', '2000'),
('R1b', 'Maret', '2019', 1000, 1400, 'R1', '2000'),
('R1a', 'April', '2019', 2000, 3100, 'R1', '2000');

--
-- Trigger `penggunaan`
--
DELIMITER $$
CREATE TRIGGER `isi_tagihan` AFTER INSERT ON `penggunaan` FOR EACH ROW BEGIN
INSERT INTO tagihan (id_pelanggan, bulan, tahun, jumlah_meter, harga, statuss)
VALUES
(NEW.id_pelanggan, NEW.bulan, NEW.tahun,(NEW.meter_akhir - NEW.meter_awal), 
((NEW.meter_akhir - NEW.meter_awal) *  NEW.tarif_per_kwh),
'Belum Lunas');
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tagihan`
--

CREATE TABLE `tagihan` (
  `id_pelanggan` varchar(50) NOT NULL,
  `bulan` varchar(50) NOT NULL,
  `tahun` varchar(50) NOT NULL,
  `jumlah_meter` int(11) NOT NULL,
  `harga` int(11) NOT NULL,
  `statuss` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tagihan`
--

INSERT INTO `tagihan` (`id_pelanggan`, `bulan`, `tahun`, `jumlah_meter`, `harga`, `statuss`) VALUES
('R1a', 'Maret', '2019', 500, 1000000, 'Lunas'),
('R1b', 'Maret', '2019', 400, 800000, 'Lunas'),
('R1a', 'April', '2019', 1100, 2200000, 'Belum Lunas');

--
-- Trigger `tagihan`
--
DELIMITER $$
CREATE TRIGGER `isi_pembayaran` AFTER INSERT ON `tagihan` FOR EACH ROW BEGIN
INSERT INTO pembayaran (id_pelanggan, bulan_bayar, harga, tanggal, biaya_admin)
VALUES
(NEW.id_pelanggan, NEW.bulan, NEW.harga, 0, 2500);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tarif`
--

CREATE TABLE `tarif` (
  `kode_tarif` varchar(50) NOT NULL,
  `daya` varchar(50) NOT NULL,
  `tarif_per_kwh` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tarif`
--

INSERT INTO `tarif` (`kode_tarif`, `daya`, `tarif_per_kwh`) VALUES
('R1', '1000', '2000'),
('R2', '1200', '3000');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD KEY `id_pelanggan` (`id_pelanggan`,`kode_tarif`),
  ADD KEY `kode_tarif` (`kode_tarif`);

--
-- Indexes for table `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD KEY `id_pelanggan` (`id_pelanggan`),
  ADD KEY `id_bayar` (`id_bayar`);

--
-- Indexes for table `penggunaan`
--
ALTER TABLE `penggunaan`
  ADD KEY `id_pelanggan` (`id_pelanggan`,`kode_tarif`),
  ADD KEY `kode_tarif` (`kode_tarif`);

--
-- Indexes for table `tagihan`
--
ALTER TABLE `tagihan`
  ADD KEY `id_pelanggan` (`id_pelanggan`);

--
-- Indexes for table `tarif`
--
ALTER TABLE `tarif`
  ADD UNIQUE KEY `kode_tarif` (`kode_tarif`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pembayaran`
--
ALTER TABLE `pembayaran`
  MODIFY `id_bayar` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD CONSTRAINT `pelanggan_ibfk_1` FOREIGN KEY (`kode_tarif`) REFERENCES `tarif` (`kode_tarif`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `penggunaan`
--
ALTER TABLE `penggunaan`
  ADD CONSTRAINT `penggunaan_ibfk_1` FOREIGN KEY (`kode_tarif`) REFERENCES `tarif` (`kode_tarif`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `penggunaan_ibfk_2` FOREIGN KEY (`id_pelanggan`) REFERENCES `pelanggan` (`id_pelanggan`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `tagihan`
--
ALTER TABLE `tagihan`
  ADD CONSTRAINT `tagihan_ibfk_1` FOREIGN KEY (`id_pelanggan`) REFERENCES `penggunaan` (`id_pelanggan`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
