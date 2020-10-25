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
-- Database: `phpdasar`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `mahasiswa`
--

CREATE TABLE `mahasiswa` (
  `id` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `nim` char(8) NOT NULL,
  `jurusan` varchar(50) NOT NULL,
  `email` varchar(70) NOT NULL,
  `gambar` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `mahasiswa`
--

INSERT INTO `mahasiswa` (`id`, `nama`, `nim`, `jurusan`, `email`, `gambar`) VALUES
(1, 'Nandap', '20171960', 'Informatika', 'nandap@yahuuy.com', 'xixi.jpg'),
(2, 'Kim Chuu', '20158392', 'Musik', 'chuukawaii@gmail.chuu', 'chuu.jpg'),
(3, 'Aren Kun', '20179382', 'Sistem Informasi', 'kun-kaneki@waifu.des', 'weebs.jpg'),
(4, 'Yuhuu', '20183943', 'Manajemen', 'lurus@gmail.com', 'ungu.jpg'),
(5, 'Wawa wa Wawa', '20198291', 'Teknik Mesin', 'wahwahwah@haa.com', 'wawa.jpeg'),
(8, 'sfdf', 'dfdf', 'sdfsd', '&lt;h1&gt;ANDA DI HACKKKK&lt;/h1&gt;', 'ASDASD'),
(10, 'rerere', '12323', 'sdfsdf', 'sdfdf', '5f257e1e6a05b.jpg'),
(11, 'dfgdfg', '6756', 'sdfdsf', 'sdggsd', 'IMG_20190623_134730.jpg'),
(12, 'tyjghj', '679679', 'hgjh', 'gjhj', '5f257c2135a83.png');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id`, `username`, `password`) VALUES
(2, 'sdj', '$2y$10$Q.xkOWZ874Y7BcmZsOboGOrp.b4QdFgcLQr0KJRJTULF1fy6WfnMa'),
(3, 'nandap', '$2y$10$B7360Q.W9QJhJYECbQIipejeDndYEIHgnWGTCyeLU46ztrtGFiEvO'),
(4, 'nanda', '$2y$10$xMLJkIPiiegqCDRvpP1ejuwkLe6DqixXWSrpCIh36jpo/Pgyhtmqq'),
(5, 'jaja', '$2y$10$XkREfYOIcwhHh.BZFFIyTe0ImS5itRgCeEVJNrdQzvg4GwknzDxXu');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
