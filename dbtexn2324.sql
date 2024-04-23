-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Εξυπηρετητής: 127.0.0.1
-- Χρόνος δημιουργίας: 21 Μαρ 2024 στις 20:36:28
-- Έκδοση διακομιστή: 10.4.28-MariaDB
-- Έκδοση PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Βάση δεδομένων: `dbtexn2324`
--

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `conference`
--

CREATE TABLE `conference` (
  `id` int(11) NOT NULL,
  `date_create` date NOT NULL DEFAULT current_timestamp(),
  `title` varchar(400) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `conf_paper`
--

CREATE TABLE `conf_paper` (
  `id_conf` int(11) NOT NULL,
  `id_paper` int(11) NOT NULL,
  `date_sbm` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `conf_pcchairs`
--

CREATE TABLE `conf_pcchairs` (
  `id_conf` int(11) NOT NULL,
  `id_pcchair` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `conf_pcmembers`
--

CREATE TABLE `conf_pcmembers` (
  `id_conf` int(11) NOT NULL,
  `id_pcmember` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `papers`
--

CREATE TABLE `papers` (
  `id` int(11) NOT NULL,
  `date_create` date NOT NULL DEFAULT current_timestamp(),
  `title` varchar(400) NOT NULL,
  `abstract` text NOT NULL,
  `description` text NOT NULL,
  `filename` varchar(300) NOT NULL,
  `authors_names` text NOT NULL,
  `author_id` int(11) NOT NULL,
  `pcmember1_id` int(11) NOT NULL,
  `pcmember2_id` int(11) NOT NULL,
  `degree1` int(11) NOT NULL,
  `degree2` int(11) NOT NULL,
  `status` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `roles`
--

CREATE TABLE `roles` (
  `id_user` int(11) NOT NULL,
  `id_conf` int(11) NOT NULL,
  `role` varchar(100) NOT NULL,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `tokens`
--

CREATE TABLE `tokens` (
  `id` int(11) NOT NULL,
  `description` text NOT NULL,
  `id_user` int(11) NOT NULL,
  `type` varchar(400) NOT NULL,
  `state` varchar(30) NOT NULL,
  `date_created` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `fullname` varchar(100) NOT NULL,
  `phone` varchar(30) NOT NULL,
  `email` varchar(100) NOT NULL,
  `address` varchar(400) NOT NULL,
  `city` varchar(100) NOT NULL,
  `country` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Ευρετήρια για άχρηστους πίνακες
--

--
-- Ευρετήρια για πίνακα `conference`
--
ALTER TABLE `conference`
  ADD PRIMARY KEY (`id`);

--
-- Ευρετήρια για πίνακα `conf_paper`
--
ALTER TABLE `conf_paper`
  ADD PRIMARY KEY (`id_conf`,`id_paper`),
  ADD KEY `id_paper` (`id_paper`);

--
-- Ευρετήρια για πίνακα `conf_pcchairs`
--
ALTER TABLE `conf_pcchairs`
  ADD PRIMARY KEY (`id_conf`,`id_pcchair`),
  ADD KEY `id_pcchair` (`id_pcchair`);

--
-- Ευρετήρια για πίνακα `conf_pcmembers`
--
ALTER TABLE `conf_pcmembers`
  ADD PRIMARY KEY (`id_conf`,`id_pcmember`),
  ADD KEY `id_pcmember` (`id_pcmember`);

--
-- Ευρετήρια για πίνακα `papers`
--
ALTER TABLE `papers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `author_id` (`author_id`),
  ADD KEY `pcmember1_id` (`pcmember1_id`),
  ADD KEY `pcmember2_id` (`pcmember2_id`);

--
-- Ευρετήρια για πίνακα `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_user` (`id_user`,`id_conf`,`role`),
  ADD KEY `id_conf` (`id_conf`);

--
-- Ευρετήρια για πίνακα `tokens`
--
ALTER TABLE `tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_user` (`id_user`);

--
-- Ευρετήρια για πίνακα `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT για άχρηστους πίνακες
--

--
-- AUTO_INCREMENT για πίνακα `conference`
--
ALTER TABLE `conference`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT για πίνακα `papers`
--
ALTER TABLE `papers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT για πίνακα `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT για πίνακα `tokens`
--
ALTER TABLE `tokens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT για πίνακα `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Περιορισμοί για άχρηστους πίνακες
--

--
-- Περιορισμοί για πίνακα `conf_paper`
--
ALTER TABLE `conf_paper`
  ADD CONSTRAINT `conf_paper_ibfk_1` FOREIGN KEY (`id_conf`) REFERENCES `conference` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `conf_paper_ibfk_2` FOREIGN KEY (`id_paper`) REFERENCES `papers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Περιορισμοί για πίνακα `conf_pcchairs`
--
ALTER TABLE `conf_pcchairs`
  ADD CONSTRAINT `conf_pcchairs_ibfk_1` FOREIGN KEY (`id_conf`) REFERENCES `conference` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `conf_pcchairs_ibfk_2` FOREIGN KEY (`id_pcchair`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Περιορισμοί για πίνακα `conf_pcmembers`
--
ALTER TABLE `conf_pcmembers`
  ADD CONSTRAINT `conf_pcmembers_ibfk_1` FOREIGN KEY (`id_conf`) REFERENCES `conference` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `conf_pcmembers_ibfk_2` FOREIGN KEY (`id_pcmember`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Περιορισμοί για πίνακα `papers`
--
ALTER TABLE `papers`
  ADD CONSTRAINT `papers_ibfk_1` FOREIGN KEY (`author_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `papers_ibfk_2` FOREIGN KEY (`pcmember1_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `papers_ibfk_3` FOREIGN KEY (`pcmember2_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Περιορισμοί για πίνακα `roles`
--
ALTER TABLE `roles`
  ADD CONSTRAINT `roles_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `roles_ibfk_2` FOREIGN KEY (`id_conf`) REFERENCES `conference` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Περιορισμοί για πίνακα `tokens`
--
ALTER TABLE `tokens`
  ADD CONSTRAINT `tokens_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
