-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 25, 2025 at 08:11 PM
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
  `id_panstwa` int(11) NOT NULL,
  `nominal` varchar(50) NOT NULL,
  `nr_kat` varchar(50) NOT NULL,
  `id_stopu` int(11) NOT NULL,
  `rok` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `monetki`
--

INSERT INTO `monetki` (`id`, `id_panstwa`, `nominal`, `nr_kat`, `id_stopu`, `rok`) VALUES
(1, 1, 'lek', 'km#75', 1, 1989);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `panstwa`
--

CREATE TABLE `panstwa` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `flag_image` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `panstwa`
--

INSERT INTO `panstwa` (`id`, `name`, `flag_image`) VALUES
(1, 'Albania', '/gfx/Albania.jpg');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `stopy`
--

CREATE TABLE `stopy` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `stopy`
--

INSERT INTO `stopy` (`id`, `name`) VALUES
(1, 'aluminium');

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `monetki`
--
ALTER TABLE `monetki`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_panstwa` (`id_panstwa`),
  ADD KEY `id_stopu` (`id_stopu`);

--
-- Indeksy dla tabeli `panstwa`
--
ALTER TABLE `panstwa`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `stopy`
--
ALTER TABLE `stopy`
  ADD PRIMARY KEY (`id`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `stopy`
--
ALTER TABLE `stopy`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `monetki`
--
ALTER TABLE `monetki`
  ADD CONSTRAINT `monetki_ibfk_1` FOREIGN KEY (`id_panstwa`) REFERENCES `panstwa` (`id`),
  ADD CONSTRAINT `monetki_ibfk_2` FOREIGN KEY (`id_stopu`) REFERENCES `stopy` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
