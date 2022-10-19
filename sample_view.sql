-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 19, 2022 at 05:18 PM
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
-- Database: `sample_view`
--

-- --------------------------------------------------------

--
-- Table structure for table `agent`
--

CREATE TABLE `agent` (
  `agent_code` int(5) NOT NULL,
  `name` varchar(255) NOT NULL,
  `code_name` varchar(50) NOT NULL,
  `nationality` varchar(255) NOT NULL,
  `id_role` int(1) NOT NULL,
  `ultimate` varchar(255) NOT NULL,
  `best_map` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `agent`
--

INSERT INTO `agent` (`agent_code`, `name`, `code_name`, `nationality`, `id_role`, `ultimate`, `best_map`) VALUES
(1, 'Liam Byrne', 'Brimstone', 'United States', 1, 'Orbital Strike', 2),
(2, 'Sabine Callas', 'Viper', 'United States', 1, 'Viper\'s Pit', 7),
(3, 'Unknown', 'Omen', 'Unknown', 1, 'From the Shadow', 5),
(4, 'Klara Böhringer', 'Killjoy', 'Germany', 3, 'Lockdown', 5),
(5, 'Amir El Amari', 'Cypher', 'Morocco', 3, 'Neural Theft', 4),
(6, 'Alexander (Sasha) Novikov', 'Sova', 'Russia', 2, 'Hunter\'s Fury', 5),
(7, 'Ling Ying Wei', 'Sage', 'China', 3, 'Resurrection', 6),
(9, 'Jamie Adeyemi', 'Phoenix', 'United Kingdom', 4, 'Run it Back', 3),
(10, 'Sunwoo Han', 'Jett', 'South Korea', 4, 'Blade Storm', 7),
(11, 'Zyanya Mondragón', 'Reyna', 'Mexico', 4, 'Empress', 1),
(12, 'Tayane Alves', 'Raze', 'Brazil', 4, 'Showstopper', 2),
(13, 'Erik Torsten', 'Breach', 'Sweden', 2, 'Rolling Thunder', 8),
(14, 'Kirra Foster', 'Skye', 'Australia', 2, 'Seekers', 2),
(15, 'Ryo Kiritani', 'Yoru', 'Japan', 4, 'Dimensional Drift', 2),
(16, 'Efia Danso', 'Astra', 'Ghana', 1, 'Cosmic Divide', 9),
(17, 'Kill All Your Opponents', 'KAY/O', 'Alternate Timeline Earth', 2, 'NULL/cmd', 7),
(18, 'Vincent Fabron', 'Chamber', 'France', 3, 'Tour De Force', 6),
(19, 'Tala Nicole Dimaapi Valdez', 'Neon', 'Philippines', 4, 'Overdrive', 8),
(20, 'Hazal Eyletmez', 'Fade', 'Turkey', 2, 'Nightfall', 3),
(21, 'Varun Batra', 'Harbor', 'India', 1, 'Reckoning', 9);

-- --------------------------------------------------------

--
-- Table structure for table `agent_role`
--

CREATE TABLE `agent_role` (
  `id_role` int(1) NOT NULL,
  `role` varchar(20) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `agent_role`
--

INSERT INTO `agent_role` (`id_role`, `role`, `description`) VALUES
(1, 'Controller', 'The abilities of agents under this role allow them to assist their teammates by cutting enemy vision, taking control of an area, and forcing enemies into choke points.'),
(2, 'Initiator', 'The abilities of agents under this role focus on initiating attacks on site, flushing enemies out of hiding spots and corners in order to assist the team when charging into battle.'),
(3, 'Sentinel', 'The abilities of agents under this role focus on defensive play, with emphasis on supporting the rest of the team through providing intel, anchoring down sites, and preventing the enemy from flanking.'),
(4, 'Duelist', 'Agents under this role have abilities that allow them to focus on being the first to enter sites and engage the enemy.');

-- --------------------------------------------------------

--
-- Table structure for table `map`
--

CREATE TABLE `map` (
  `id_map` int(2) NOT NULL,
  `name` varchar(50) NOT NULL,
  `location` varchar(50) NOT NULL,
  `country` varchar(50) NOT NULL,
  `earth` enum('Alpha','Omega') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `map`
--

INSERT INTO `map` (`id_map`, `name`, `location`, `country`, `earth`) VALUES
(1, 'The Range', 'Venice', 'Italy', 'Alpha'),
(2, 'Bind', 'Rabat', 'Morocco', 'Alpha'),
(3, 'Haven', 'Thimphu', 'Bhutan', 'Alpha'),
(4, 'Split', 'Tokyo', 'Japan', 'Alpha'),
(5, 'Ascent', 'Venice', 'Italy', 'Alpha'),
(6, 'Icebox', 'Bennett Island', 'Russia', 'Alpha'),
(7, 'Breeze', 'Bermuda Triangle', 'Atlantic Ocean', 'Alpha'),
(8, 'Fracture', 'Santa Fe', 'United States', 'Alpha'),
(9, 'Pearl', 'Lisbon', 'Portugal', 'Omega');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `agent`
--
ALTER TABLE `agent`
  ADD PRIMARY KEY (`agent_code`),
  ADD KEY `best_map` (`best_map`),
  ADD KEY `role` (`id_role`);

--
-- Indexes for table `agent_role`
--
ALTER TABLE `agent_role`
  ADD PRIMARY KEY (`id_role`);

--
-- Indexes for table `map`
--
ALTER TABLE `map`
  ADD PRIMARY KEY (`id_map`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `agent`
--
ALTER TABLE `agent`
  MODIFY `agent_code` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `agent_role`
--
ALTER TABLE `agent_role`
  MODIFY `id_role` int(1) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `map`
--
ALTER TABLE `map`
  MODIFY `id_map` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `agent`
--
ALTER TABLE `agent`
  ADD CONSTRAINT `agent_ibfk_1` FOREIGN KEY (`best_map`) REFERENCES `map` (`id_map`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `agent_ibfk_2` FOREIGN KEY (`id_role`) REFERENCES `agent_role` (`id_role`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
