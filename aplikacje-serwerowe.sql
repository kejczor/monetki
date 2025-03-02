-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 02, 2025 at 03:09 PM
-- Wersja serwera: 10.4.32-MariaDB
-- Wersja PHP: 8.2.12

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
-- Struktura tabeli dla tabeli `monetki`
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
(2, 2, 'aaaa', '', 2, 1988),
(4, 1, 'aaaaa', 'v', 2, 21),
(13, 1, 'a', 'a', 1, 0),
(18, 1, 'a', 'a', 1, 0),
(20, 1, 'a', 'a', 2, 0),
(21, 2, 'a', 'a', 2, 0),
(22, 1, '', '', 1, 0),
(23, 1, '', 'pppppppppppp', 1, 0),
(24, 1, '', '', 1, 0),
(25, 1, '', '', 1, 0),
(26, 1, '', '', 1, 0);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `panstwa`
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
-- Struktura tabeli dla tabeli `stopy`
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
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `monetki`
--
ALTER TABLE `monetki`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_panstwa` (`country_id`),
  ADD KEY `id_stopu` (`alloy_id`);

--
-- Indeksy dla tabeli `panstwa`
--
ALTER TABLE `panstwa`
  ADD PRIMARY KEY (`country_id`);

--
-- Indeksy dla tabeli `stopy`
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

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
