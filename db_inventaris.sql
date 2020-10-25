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
-- Database: `db_inventaris`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `inventaris`
--

CREATE TABLE `inventaris` (
  `id_inventaris` int(11) NOT NULL,
  `nama_barang` varchar(50) NOT NULL,
  `kondisi` varchar(50) NOT NULL,
  `keterangan` varchar(50) NOT NULL,
  `jumlah_inv` int(11) NOT NULL,
  `id_jenis` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  `id_ruang` int(11) NOT NULL,
  `id_pegawai` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `inventaris`
--

INSERT INTO `inventaris` (`id_inventaris`, `nama_barang`, `kondisi`, `keterangan`, `jumlah_inv`, `id_jenis`, `tanggal`, `id_ruang`, `id_pegawai`) VALUES
(4, 'Penghapus Papan Tulis', 'Baik', 'Dapat Digunakan', 13, 1, '2019-10-08', 8, 1),
(5, 'Kursi', 'Baik', 'Dapat Digunakan', 29, 7, '2019-10-03', 10, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `jenis`
--

CREATE TABLE `jenis` (
  `id_jenis` int(11) NOT NULL,
  `nama_jenis` varchar(50) NOT NULL,
  `kode_jenis` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `jenis`
--

INSERT INTO `jenis` (`id_jenis`, `nama_jenis`, `kode_jenis`) VALUES
(1, 'Penghapus Papan Tulis', 'ATK'),
(2, 'Spidol Papan Tulis', 'ATK'),
(3, 'Kipas Angin ', 'ELEKTRONIK'),
(4, 'AC', 'ELEKTRONIK'),
(5, 'Proyektor', 'PROY'),
(6, 'Kabel Colokan Panjang', 'KABPANJANG'),
(7, 'Kursi', 'KRSI'),
(8, 'Meja', 'MJA');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pegawai`
--

CREATE TABLE `pegawai` (
  `id_pegawai` int(11) NOT NULL,
  `nama_pegawai` varchar(50) NOT NULL,
  `nip` int(11) NOT NULL,
  `alamat` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `pegawai`
--

INSERT INTO `pegawai` (`id_pegawai`, `nama_pegawai`, `nip`, `alamat`) VALUES
(1, 'Gibran Muhammad', 2000, 'Jalan Gunung Guntur'),
(2, 'Riska Amalia', 1000, 'Jalan Sepinggan'),
(3, 'Haruta Yuta', 2009, 'Jalan Kejangsaan Timur');

-- --------------------------------------------------------

--
-- Struktur dari tabel `peminjam`
--

CREATE TABLE `peminjam` (
  `id_peminjam` int(11) NOT NULL,
  `id_inventaris` int(11) NOT NULL,
  `jumlah_pemin` int(11) NOT NULL,
  `tanggal_pinjam` date NOT NULL,
  `tanggal_kembali` date NOT NULL,
  `status_peminjam` varchar(50) NOT NULL,
  `id_pegawai` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `peminjam`
--

INSERT INTO `peminjam` (`id_peminjam`, `id_inventaris`, `jumlah_pemin`, `tanggal_pinjam`, `tanggal_kembali`, `status_peminjam`, `id_pegawai`) VALUES
(29, 4, 1, '2019-10-02', '2019-10-18', 'Sedang Dipinjam', 1);

--
-- Trigger `peminjam`
--
DELIMITER $$
CREATE TRIGGER `pinjam` AFTER INSERT ON `peminjam` FOR EACH ROW BEGIN
INSERT INTO pengembalian
(id_inventaris, jumlah_pemin, tanggal_pinjam, tanggal_kembali, status_pengembalian, id_pegawai)
VALUES (NEW.id_inventaris, NEW.jumlah_pemin, NEW.tanggal_pinjam, NEW.tanggal_kembali, "Sedang Dipinjam", NEW.id_pegawai);

UPDATE inventaris
SET jumlah_inv = (inventaris.jumlah_inv - NEW.jumlah_pemin)
WHERE (inventaris.id_inventaris = NEW.id_inventaris);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pengembalian`
--

CREATE TABLE `pengembalian` (
  `id_pengembalian` int(11) NOT NULL,
  `id_inventaris` int(11) NOT NULL,
  `jumlah_peng` int(11) NOT NULL,
  `tanggal_pinjam` date NOT NULL,
  `tanggal_kembali` date NOT NULL,
  `status_pengembalian` varchar(50) NOT NULL,
  `id_pegawai` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Trigger `pengembalian`
--
DELIMITER $$
CREATE TRIGGER `pengembalian` AFTER UPDATE ON `pengembalian` FOR EACH ROW BEGIN
UPDATE inventaris
SET jumlah_inv = jumlah_inv + NEW.jumlah_peng
WHERE 
(inventaris.id_inventaris = NEW.id_inventaris);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `ruang`
--

CREATE TABLE `ruang` (
  `id_ruang` int(11) NOT NULL,
  `nama_ruang` varchar(50) NOT NULL,
  `kode_ruang` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `ruang`
--

INSERT INTO `ruang` (`id_ruang`, `nama_ruang`, `kode_ruang`) VALUES
(1, 'Ruang Kepala Sekolah', 'KS'),
(2, 'Ruang Wakil Kepala Sekolah', 'WKS'),
(3, 'Ruang Guru Bahasa Indonesia', 'GBINDO'),
(4, 'Ruang Guru Matematika', 'GMAT'),
(5, 'Ruang Guru Bahasa Inggris', 'GBING'),
(7, 'Ruang Tata Usaha', 'RTU'),
(8, 'Ruang ATK', 'RATK'),
(9, 'Ruang Elektronik', 'RELEKTR'),
(10, 'Ruang Gudang', 'GDNG'),
(11, 'Ruang Lab IPA', 'LABIPA');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `namaa` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`username`, `password`, `namaa`) VALUES
('anandahisanah', '0', 'Ananda Hisanah'),
('aren', 'jinu', 'aren'),
('jinu', 'aren', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `inventaris`
--
ALTER TABLE `inventaris`
  ADD PRIMARY KEY (`id_inventaris`),
  ADD KEY `id_jenis` (`id_jenis`,`id_ruang`,`id_pegawai`),
  ADD KEY `id_pegawai` (`id_pegawai`),
  ADD KEY `id_ruang` (`id_ruang`);

--
-- Indexes for table `jenis`
--
ALTER TABLE `jenis`
  ADD PRIMARY KEY (`id_jenis`);

--
-- Indexes for table `pegawai`
--
ALTER TABLE `pegawai`
  ADD PRIMARY KEY (`id_pegawai`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
