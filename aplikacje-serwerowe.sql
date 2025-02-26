-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 26, 2025 at 06:36 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `aplikacje-serwerowe`
--

-- --------------------------------------------------------

--
-- Table structure for table `monetki`
--

CREATE TABLE `monetki` (
  `id` int(11) NOT NULL,
  `country_id` int(11) NOT NULL,
  `nominal` varchar(50) NOT NULL,
  `catalog_number` varchar(50) NOT NULL,
  `alloy_id` int(11) NOT NULL,
  `year` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `monetki`
--

INSERT INTO `monetki` (`id`, `country_id`, `nominal`, `catalog_number`, `alloy_id`, `year`) VALUES
(1, 1, 'lek', 'km#75', 1, 1989);

-- --------------------------------------------------------

--
-- Table structure for table `panstwa`
--

CREATE TABLE `panstwa` (
  `country_id` int(11) NOT NULL,
  `country_name` varchar(50) NOT NULL,
  `flag_image` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `panstwa`
--

INSERT INTO `panstwa` (`country_id`, `country_name`, `flag_image`) VALUES
(1, 'Albania', '/gfx/Albania.jpg'),
(2, 'Algieria', '/gfx/Algieria.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `stopy`
--

CREATE TABLE `stopy` (
  `alloy_id` int(11) NOT NULL,
  `alloy_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `stopy`
--

INSERT INTO `stopy` (`alloy_id`, `alloy_name`) VALUES
(1, 'aluminium'),
(2, 'stainless steel'),
(3, 'bronze');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `monetki`
--
ALTER TABLE `monetki`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_panstwa` (`country_id`),
  ADD KEY `id_stopu` (`alloy_id`);

--
-- Indexes for table `panstwa`
--
ALTER TABLE `panstwa`
  ADD PRIMARY KEY (`country_id`);

--
-- Indexes for table `stopy`
--
ALTER TABLE `stopy`
  ADD PRIMARY KEY (`alloy_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `monetki`
--
ALTER TABLE `monetki`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `panstwa`
--
ALTER TABLE `panstwa`
  MODIFY `country_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `stopy`
--
ALTER TABLE `stopy`
  MODIFY `alloy_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `monetki`
--
ALTER TABLE `monetki`
  ADD CONSTRAINT `monetki_ibfk_1` FOREIGN KEY (`country_id`) REFERENCES `panstwa` (`country_id`),
  ADD CONSTRAINT `monetki_ibfk_2` FOREIGN KEY (`alloy_id`) REFERENCES `stopy` (`alloy_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
