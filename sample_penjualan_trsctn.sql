-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 30, 2022 at 07:34 PM
-- Server version: 10.4.19-MariaDB
-- PHP Version: 8.0.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sample_penjualan_trsctn`
--

-- --------------------------------------------------------

--
-- Table structure for table `log_update_pengguna`
--

CREATE TABLE `log_update_pengguna` (
  `id_update_pengguna` int(11) NOT NULL,
  `id_pengguna` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `no_hp` varchar(15) NOT NULL,
  `tanggal_lahir` date NOT NULL,
  `kebangsaan` varchar(150) NOT NULL,
  `waktu_update` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `log_update_pengguna`
--

INSERT INTO `log_update_pengguna` (`id_update_pengguna`, `id_pengguna`, `nama`, `no_hp`, `tanggal_lahir`, `kebangsaan`, `waktu_update`) VALUES
(2, 11, 'Joey Alexander', '081245670009', '2022-10-11', 'Uni Emirat Arab', '2022-11-09 12:39:36');

-- --------------------------------------------------------

--
-- Table structure for table `pengguna`
--

CREATE TABLE `pengguna` (
  `id_pengguna` int(3) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `no_hp` varchar(15) NOT NULL,
  `tanggal_lahir` date NOT NULL,
  `kebangsaan` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pengguna`
--

INSERT INTO `pengguna` (`id_pengguna`, `nama`, `no_hp`, `tanggal_lahir`, `kebangsaan`) VALUES
(2, 'Khalid Kashmiri', '081245671234', '1964-03-04', 'Pakistan'),
(4, 'Ismail Ahmad Kanabawi', '081245674098', '1976-08-09', 'Uzbekistan'),
(5, 'Usman Abdul Jalil Sisha', '081245673097', '1955-05-19', 'Vietnam'),
(7, 'Ya\'qub Qamar Ad-Din Dibiazah', '081245670930', '1975-10-08', 'Iran'),
(8, 'Muhammad Sumbul', '081245672987', '1988-06-16', 'Ghana'),
(9, 'Khidir Karawita', '081245670076', '1959-01-27', 'Rusia'),
(11, 'Joey Al Ibn Mama', '081245670007', '2022-10-10', 'Arab Saudi');

-- --------------------------------------------------------

--
-- Table structure for table `penjualan`
--

CREATE TABLE `penjualan` (
  `id_penjualan` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  `id_pengguna` int(11) NOT NULL,
  `alamat_kirim` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `penjualan`
--

INSERT INTO `penjualan` (`id_penjualan`, `tanggal`, `id_pengguna`, `alamat_kirim`) VALUES
(1, '2022-11-15', 4, 'Jl. Medan-Binjai'),
(2, '2022-11-16', 9, 'Jl. Dr. Mansyur'),
(3, '2022-11-17', 5, 'Jl. Stasiun Sunggal');

-- --------------------------------------------------------

--
-- Table structure for table `penjualan_detail`
--

CREATE TABLE `penjualan_detail` (
  `id_detail` int(5) NOT NULL,
  `id_penjualan` int(11) NOT NULL,
  `id_produk` int(11) NOT NULL,
  `jumlah_beli` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `penjualan_detail`
--

INSERT INTO `penjualan_detail` (`id_detail`, `id_penjualan`, `id_produk`, `jumlah_beli`) VALUES
(2, 1, 1, 1),
(3, 1, 2, 1),
(4, 2, 4, 2),
(5, 3, 4, 1),
(6, 3, 3, 2);

-- --------------------------------------------------------

--
-- Table structure for table `produk`
--

CREATE TABLE `produk` (
  `id_produk` int(3) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `merk` varchar(50) NOT NULL,
  `harga` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `produk`
--

INSERT INTO `produk` (`id_produk`, `nama`, `merk`, `harga`) VALUES
(1, 'Flextape 30mm - 2 meter', 'Flextape', 10000),
(2, 'Penggaris 2 cm', 'Kiko', 3000),
(3, 'Remote AC Lab Database', 'SCP-6969', 300000),
(4, 'Roti Bantal Unknown', 'Unknown', 15000);

-- --------------------------------------------------------

--
-- Table structure for table `produk_stok`
--

CREATE TABLE `produk_stok` (
  `id_stok` int(3) NOT NULL,
  `id_produk` int(3) NOT NULL,
  `stok` int(10) NOT NULL,
  `terakhir_diubah` char(19) NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `produk_stok`
--

INSERT INTO `produk_stok` (`id_stok`, `id_produk`, `stok`, `terakhir_diubah`) VALUES
(4, 1, 10, '2022-11-09 18:04:37'),
(5, 2, 20, '2022-12-01 01:28:40'),
(6, 3, 24, '2022-11-09 18:04:37'),
(7, 4, 17, '2022-12-01 00:07:46');

--
-- Triggers `produk_stok`
--
DELIMITER $$
CREATE TRIGGER `update_stok_time` BEFORE UPDATE ON `produk_stok` FOR EACH ROW BEGIN
IF (NEW.stok != OLD.stok) THEN
SET NEW.terakhir_diubah = NOW();
END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `validasi_stok` BEFORE UPDATE ON `produk_stok` FOR EACH ROW BEGIN
IF (NEW.stok = OLD.stok) THEN
SIGNAL SQLSTATE '45000'
SET MESSAGE_TEXT = 'Jumlah stok sama!';
END IF;
END
$$
DELIMITER ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `log_update_pengguna`
--
ALTER TABLE `log_update_pengguna`
  ADD PRIMARY KEY (`id_update_pengguna`),
  ADD KEY `id_pengguna` (`id_pengguna`);

--
-- Indexes for table `pengguna`
--
ALTER TABLE `pengguna`
  ADD PRIMARY KEY (`id_pengguna`);

--
-- Indexes for table `penjualan`
--
ALTER TABLE `penjualan`
  ADD PRIMARY KEY (`id_penjualan`),
  ADD KEY `id_pengguna` (`id_pengguna`);

--
-- Indexes for table `penjualan_detail`
--
ALTER TABLE `penjualan_detail`
  ADD PRIMARY KEY (`id_detail`),
  ADD KEY `id_produk` (`id_produk`),
  ADD KEY `id_penjualan` (`id_penjualan`);

--
-- Indexes for table `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`id_produk`);

--
-- Indexes for table `produk_stok`
--
ALTER TABLE `produk_stok`
  ADD PRIMARY KEY (`id_stok`),
  ADD KEY `id_produk` (`id_produk`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `log_update_pengguna`
--
ALTER TABLE `log_update_pengguna`
  MODIFY `id_update_pengguna` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `pengguna`
--
ALTER TABLE `pengguna`
  MODIFY `id_pengguna` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `penjualan`
--
ALTER TABLE `penjualan`
  MODIFY `id_penjualan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `penjualan_detail`
--
ALTER TABLE `penjualan_detail`
  MODIFY `id_detail` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `produk`
--
ALTER TABLE `produk`
  MODIFY `id_produk` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `produk_stok`
--
ALTER TABLE `produk_stok`
  MODIFY `id_stok` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `log_update_pengguna`
--
ALTER TABLE `log_update_pengguna`
  ADD CONSTRAINT `log_update_pengguna_ibfk_1` FOREIGN KEY (`id_pengguna`) REFERENCES `pengguna` (`id_pengguna`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `penjualan`
--
ALTER TABLE `penjualan`
  ADD CONSTRAINT `penjualan_ibfk_1` FOREIGN KEY (`id_pengguna`) REFERENCES `pengguna` (`id_pengguna`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `penjualan_detail`
--
ALTER TABLE `penjualan_detail`
  ADD CONSTRAINT `penjualan_detail_ibfk_1` FOREIGN KEY (`id_produk`) REFERENCES `produk` (`id_produk`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `penjualan_detail_ibfk_2` FOREIGN KEY (`id_penjualan`) REFERENCES `penjualan` (`id_penjualan`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `produk_stok`
--
ALTER TABLE `produk_stok`
  ADD CONSTRAINT `produk_stok_ibfk_1` FOREIGN KEY (`id_produk`) REFERENCES `produk` (`id_produk`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
