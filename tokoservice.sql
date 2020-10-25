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
-- Database: `tokoservice`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `barang`
--

CREATE TABLE `barang` (
  `username` varchar(15) NOT NULL,
  `status` varchar(15) NOT NULL,
  `tgl_in` date NOT NULL,
  `kode` varchar(6) NOT NULL,
  `merk` varchar(30) NOT NULL,
  `tipe` varchar(30) NOT NULL,
  `problem` varchar(50) NOT NULL,
  `problem_tambahan` varchar(50) NOT NULL,
  `tgl_out` date NOT NULL,
  `biaya` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `barang`
--

INSERT INTO `barang` (`username`, `status`, `tgl_in`, `kode`, `merk`, `tipe`, `problem`, `problem_tambahan`, `tgl_out`, `biaya`) VALUES
('sdfsfd', 'lbkjb', '2020-06-01', '', 'sdgsdf', 'sdfs', 'aaa', 'sdsd', '2020-06-03', 12);

-- --------------------------------------------------------

--
-- Struktur dari tabel `message`
--

CREATE TABLE `message` (
  `username` varchar(15) NOT NULL,
  `job` set('Manager','Teknisi','Programmer','Admin') NOT NULL,
  `pesan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `nama` varchar(30) NOT NULL,
  `username` varchar(15) NOT NULL,
  `password` varchar(15) NOT NULL,
  `jk` enum('Laki laki','Perempuan') NOT NULL,
  `job` set('Manager','Teknisi','Programmer','Admin') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`nama`, `username`, `password`, `jk`, `job`) VALUES
('Aren Jinu', 'aren', 'aren', 'Laki laki', 'Manager'),
('John Doe', 'johndoe', 'johndoe', 'Laki laki', 'Manager'),
('Nanda', 'nandapq', 'nandapq', 'Perempuan', 'Programmer');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `message`
--
ALTER TABLE `message`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`username`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
