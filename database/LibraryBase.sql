-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jun 13, 2023 at 01:27 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `LibraryBase`
--

-- --------------------------------------------------------

--
-- Table structure for table `logs`
--

CREATE TABLE `logs` (
  `id` int(11) NOT NULL,
  `userId` int(10) UNSIGNED DEFAULT NULL,
  `email` varchar(64) DEFAULT NULL,
  `status` tinyint(10) NOT NULL,
  `IPAddress` varchar(15) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `logs`
--

INSERT INTO `logs` (`id`, `userId`, `email`, `status`, `IPAddress`, `createdAt`) VALUES
(1, 3, 'admin@admin.pl', 1, '127.0.0.1', '2023-06-12 23:07:24'),
(2, NULL, 'top@op.lok', 3, '127.0.0.1', '2023-06-12 23:07:55'),
(3, NULL, 'top@op.lok', 5, '127.0.0.1', '2023-06-12 23:08:24'),
(4, NULL, NULL, 9, '127.0.0.1', '2023-06-12 23:08:27'),
(5, 3, 'admin@admin.pl', 1, '127.0.0.1', '2023-06-12 23:10:57'),
(7, NULL, NULL, 9, '127.0.0.1', '2023-06-12 23:10:59'),
(8, 3, 'admin@admin.pl', 1, '127.0.0.1', '2023-06-12 23:11:42'),
(10, NULL, NULL, 9, '127.0.0.1', '2023-06-12 23:11:47'),
(11, 3, 'admin@admin.pl', 1, '127.0.0.1', '2023-06-12 23:15:00'),
(13, NULL, NULL, 9, '127.0.0.1', '2023-06-12 23:15:03'),
(14, 3, 'admin@admin.pl', 1, '127.0.0.1', '2023-06-12 23:16:32'),
(16, NULL, NULL, 9, '127.0.0.1', '2023-06-12 23:16:50'),
(17, 3, 'admin@admin.pl', 1, '127.0.0.1', '2023-06-12 23:19:28'),
(19, NULL, NULL, 9, '127.0.0.1', '2023-06-12 23:19:30'),
(20, 3, 'admin@admin.pl', 1, '127.0.0.1', '2023-06-12 23:21:05'),
(22, NULL, NULL, 9, '127.0.0.1', '2023-06-12 23:21:07'),
(23, 3, 'admin@admin.pl', 1, '127.0.0.1', '2023-06-12 23:23:17'),
(25, NULL, NULL, 9, '127.0.0.1', '2023-06-12 23:23:20'),
(26, 3, 'admin@admin.pl', 1, '127.0.0.1', '2023-06-12 23:24:34'),
(27, NULL, 'fds', 7, '127.0.0.1', '2023-06-12 23:24:36'),
(28, NULL, 'admin@admin.plp', 3, '127.0.0.1', '2023-06-12 23:25:25'),
(29, NULL, 'admin@admin.plp', 5, '127.0.0.1', '2023-06-12 23:25:40'),
(30, NULL, 'admin@admin.plp', 7, '127.0.0.1', '2023-06-12 23:25:43'),
(31, 3, 'admin@admin.pl', 1, '127.0.0.1', '2023-06-12 23:26:27');

-- --------------------------------------------------------

--
-- Table structure for table `logs_type`
--

CREATE TABLE `logs_type` (
  `id` tinyint(10) NOT NULL,
  `type` enum('logged','not logged','registered','not registered','updated','not updated','deleted','not deleted','error','unknown') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `logs_type`
--

INSERT INTO `logs_type` (`id`, `type`) VALUES
(1, 'logged'),
(2, 'not logged'),
(3, 'registered'),
(4, 'not registered'),
(5, 'updated'),
(6, 'not updated'),
(7, 'deleted'),
(8, 'not deleted'),
(9, 'error'),
(10, 'unknown');

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `permission` enum('user','librarian','admin') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `permission`) VALUES
(1, 'user'),
(2, 'librarian'),
(3, 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `permissionId` tinyint(3) UNSIGNED NOT NULL DEFAULT 1,
  `email` varchar(64) NOT NULL,
  `firstName` varchar(30) NOT NULL,
  `lastName` varchar(50) NOT NULL,
  `birthday` date NOT NULL,
  `password` varchar(150) NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT current_timestamp(),
  `image` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `permissionId`, `email`, `firstName`, `lastName`, `birthday`, `password`, `createdAt`, `image`) VALUES
(3, 3, 'admin@admin.pl', 'Kamil', 'Purcel', '2023-06-10', '$2y$10$JQfV.lwRoCRyCDJYFifUpOlO6sBVq6UYGSRndh/JxEeVcLaBBdmwa', '2023-06-10 22:10:20', '2.jpg'),
(5, 1, 'tester@test.test', 'test', 'test', '2023-06-10', '$2y$10$DB6Vq1Kf0BEV5GQodQQN8O4wWGrxcmMm6ugqWnnypMXmMqVcviza6', '2023-06-10 22:25:07', '1.jpg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userId` (`userId`),
  ADD KEY `status` (`status`);

--
-- Indexes for table `logs_type`
--
ALTER TABLE `logs_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `permissionId` (`permissionId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `logs`
--
ALTER TABLE `logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `logs_type`
--
ALTER TABLE `logs_type`
  MODIFY `id` tinyint(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `logs`
--
ALTER TABLE `logs`
  ADD CONSTRAINT `logs_ibfk_1` FOREIGN KEY (`status`) REFERENCES `logs_type` (`id`),
  ADD CONSTRAINT `logs_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE NO ACTION;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`permissionId`) REFERENCES `permissions` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
