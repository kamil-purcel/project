-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Cze 15, 2023 at 11:50 PM
-- Wersja serwera: 10.4.28-MariaDB
-- Wersja PHP: 8.2.4

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
-- Struktura tabeli dla tabeli `books`
--

CREATE TABLE `books` (
  `isbn` varchar(13) NOT NULL,
  `title` varchar(250) NOT NULL,
  `authors` varchar(100) NOT NULL,
  `publisher` varchar(100) NOT NULL,
  `published_date` date NOT NULL,
  `category` varchar(50) NOT NULL,
  `pages` int(11) NOT NULL,
  `image` varchar(100) NOT NULL,
  `description` varchar(10000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`isbn`, `title`, `authors`, `publisher`, `published_date`, `category`, `pages`, `image`, `description`) VALUES
('9780008581404', 'Gangsta Granny', 'David Walliams', 'HarperCollins', '2023-09-26', 'Children\'s literature', 296, '0000009.jpg', 'Another hilarious and moving novel from bestselling, critically acclaimed author David Walliams, the natural successor to Roald Dahl. A story of prejudice and acceptance, funny lists and silly words, this new book has all the hallmarks of David¿s previous bestsellers. Our hero Ben is bored beyond belief after he is made to stay at his grandma¿s house. She¿s the boringest grandma ever: all she wants to do is to play Scrabble, and eat cabbage soup. But there are two things Ben doesn¿t know about his grandma. 1) She was once an international jewel thief. 2) All her life, she has been plotting to steal the crown jewels, and now she needs Ben¿s help.'),
('9780142424179', 'The Fault in Our Stars ', 'John Green', 'Penguin Books', '2014-04-08', 'Romance', 352, '0000017.jpg', 'Despite the tumor-shrinking medical miracle that has bought her a few years, Hazel has never been anything but terminal, her final chapter inscribed upon diagnosis. But when a gorgeous plot twist named Augustus Waters suddenly appears at Cancer Kid Support Group, Hazel’s story is about to be completely rewritten.\r\n\r\nFrom John Green, #1 bestselling author of The Anthropocene Reviewed and Turtles All the Way Down, The Fault in Our Stars is insightful, bold, irreverent, and raw. It brilliantly explores the funny, thrilling, and tragic business of being alive and in love.'),
('9780156012195', 'The Little Prince', 'Antoine de Saint-Exupéry', 'Reynal & Hitchcock ', '1943-04-06', 'Children\'s literature', 96, '0000001.jpg', 'A pilot crashes in the Sahara Desert and encounters a strange young boy who calls himself the Little Prince. The Little Prince has traveled there from his home on a lonely, distant asteroid with a single rose. The story that follows is a beautiful and at times heartbreaking meditation on human nature.'),
('9780439023528', 'The Hunger Games', 'Suzanne Collins', 'Scholastic Press', '2010-07-03', 'Fantasy', 384, '0000008.jpg', 'In the ruins of a place once known as North America lies the nation of Panem, a shining Capitol surrounded by twelve outlying districts. Long ago the districts waged war on the Capitol and were defeated. As part of the surrender terms, each district agreed to send one boy and one girl to appear in an annual televised event called, \"The Hunger Games,\" a fight to the death on live TV. Sixteen-year-old Katniss Everdeen, who lives alone with her mother and younger sister, regards it as a death sentence when she is forced to represent her district in the Games. The terrain, rules, and level of audience participation may change but one thing is constant: kill or be killed.'),
('9780525556541', 'Looking for Alaska', 'John Green', 'Dutton Books for Young Readers\r\n', '2023-04-04', 'Novel', 272, '0000042.jpg', 'First drink. First prank. First friend. First love.\r\n\r\nLast words. \r\n\r\nMiles Halter is fascinated by famous last words—and tired of his safe life at home. He leaves for boarding school to seek what the dying poet François Rabelais called “The Great Perhaps.” Much awaits Miles at Culver Creek, including Alaska Young, who will pull Miles into her labyrinth and catapult him into the Great Perhaps.'),
('9780553496673', 'Everything, Everything', 'Nicola Yoon', 'Ember', '2017-03-07', 'Romance', 352, '0000020.jpg', 'Risk everything . . . for love with this #1 New York Times bestseller. \r\n\r\nWhat if you couldn’t touch anything in the outside world? Never breathe in the fresh air, feel the sun warm your face . . . or kiss the boy next door? In Everything, Everything, Maddy is a girl who’s literally allergic to the outside world, and Olly is the boy who moves in next door . . . and becomes the greatest risk she’s ever taken. \r\n\r\nMy disease is as rare as it is famous. Basically, I’m allergic to the world.I don’t leave my house, have not left my house in seventeen years. The only people I ever see are my mom and my nurse, Carla.\r\n \r\nBut then one day, a moving truck arrives next door. I look out my window, and I see him. He\'s tall, lean and wearing all black—black T-shirt, black jeans, black sneakers, and a black knit cap that covers his hair completely. He catches me looking and stares at me. I stare right back. His name is Olly.\r\n \r\nMaybe we can’t predict the future, but we can predict some things. For example, I am certainly going to fall in love with Olly. It’s almost certainly going to be a disaster.\r\n\r\nEverything, Everything will make you laugh, cry, and feel everything in between. It\'s an innovative,  inspiring, and heartbreakingly romantic debut novel that unfolds via vignettes, diary entries, illustrations, and more. \r\n\r\nAnd don’t miss Nicola Yoon\'s The Sun Is Also A Star, the #1 New York Times bestseller in which two teens are brought together just when it seems like the universe is sending them in opposite directions.'),
('9781338216660', 'Harry Potter and the Cursed Child', 'J. K. Rowling, Jack Thorne, John Tiffany ', 'Arthur A. Levine Books', '2017-07-25', 'Adventure Drama Fantasy', 336, '0000002.jpg', 'It was always difficult being Harry Potter and it isn’t much easier now that he is an overworked employee of the Ministry of Magic, a husband, and father of three school-age children.While Harry grapples with a past that refuses to stay where it belongs, his youngest son, Albus, must struggle with the weight of a family legacy he never wanted. As past and present fuse ominously, both father and son learn the uncomfortable truth: Sometimes, darkness comes from unexpected places.The playscript for Harry Potter and the Cursed Child was originally released as a \"special rehearsal edition\" alongside the opening of Jack Thorne’s play in London’s West End in summer 2016. Based on an original story by J.K. Rowling, John Tiffany, and Jack Thorne, the play opened to rapturous reviews from theatergoers and critics alike, while the official playscript became an immediate global bestseller.'),
('9781338216790', 'Fantastic Beasts and Where to Find Them', 'J. K. Rowling', 'Arthur A. Levine Books', '2017-11-07', 'Fantasy', 160, '0000007.jpg', 'Fantastic Beasts and Where to Find Them, Newt Scamander\'s classic compendium of magical creatures, has delighted generations of wizarding readers. With this beautiful, large-scale new edition illustrated in full color, Muggles too will have the chance to discover where the Runespoor lives, what the Puffskein eats, and why shiny objects should always be kept away from the Niffler. Proceeds from the sale of this book will go to Comic Relief and J.K. Rowling\'s international charity, Lumos, which will do magic beyond the powers of any wizard. If you feel that this is insufficient reason to part with your money, one can only hope that passing wizards feel more charitable if they see you being attacked by a Manticore.'),
('9781428181922', 'Diary of a Wimpy Kid', 'Jeff Kinney', 'Alliance Entertainment', '2010-01-01', 'Comedy', 224, '0000028.jpg', 'It\'s a new school year, and Greg Heffley finds himself thrust into middle school, where undersized weaklings share the hallways with kids who are taller, meaner, and already shaving. The hazards of growing up before you\'re ready are uniquely revealed through words and drawings as Greg records them in his diary.'),
('9781534427037', 'The To All the Boys I\'ve Loved Before', 'Jenny Han', 'Simon & Schuster Books for Young Readers', '2018-04-24', 'Romance', 1072, '0000022.jpg', 'To All the Boys I’ve Loved Before is now a major motion picture streaming on Netflix!\r\n\r\nNew York Times bestselling author Jenny Han’s beloved novels are now available together in this delightful paperback boxed set!\r\n\r\nWhat if all the crushes you ever had found out how you felt about them…all at once?\r\n\r\nLara Jean Song keeps her love letters in a hatbox her mother gave her. They aren’t love letters that anyone else wrote for her; these are ones she’s written. One for every boy she’s ever loved—five in all. When she writes, she pours out her heart and soul and says all the things she would never say in real life, because her letters are for her eyes only. Until the day her secret letters are mailed, and suddenly, Lara Jean’s love life goes from imaginary to out of control.\r\n\r\nThis enchanting collection includes paperback editions of To All the Boys I’ve Loved Before; P.S. I Still Love You; and Always and Forever, Lara Jean.'),
('9781639730957', 'Throne of Glass', 'Sarah J. Maas', 'Bloomsbury Publishing', '2023-02-14', 'Fantasy', 432, '0000018.jpg', 'Enter the world of Throne of Glass with the first book in the #1 bestselling series by Sarah J. Maas.\r\n\r\nIn a land without magic, an assassin is summoned to the castle. She has no love for the vicious king who rules from his throne of glass, but she has not come to kill him. She has come to win her freedom. If she defeats twenty-three murderers, thieves, and warriors in a competition, she will be released from prison to serve as the King\'s Champion.\r\n\r\nHer name is Celaena Sardothien.\r\n\r\nThe Crown Prince will provoke her. The Captain of the Guard will protect her. And a princess from a faraway country will befriend her. But something rotten dwells in the castle, and it\'s there to kill. When her competitors start dying mysteriously, one by one, Celaena\'s fight for freedom becomes a fight for survival-and a desperate quest to root out the evil before it destroys her world.\r\n\r\nThrilling and fierce, Throne of Glass is the first book in the #1 New York Times bestselling series that has captivated readers worldwide.'),
('9781780552491', 'Brain Games for Clever Kids', 'Dr. Gareth Moore', 'Buster Books', '2014-10-01', 'Education', 192, '0000005.jpg', 'The perfect companion for vacation, this collection contains more than 90 puzzles, including memory, word, and number workouts; codes; battleships; and mind-bending spot-the-differences. There are hours of fun to be had with Japanese puzzles, including hanjie, kakuro, hitori, sudoku, and lots more. Let the brain games begin.');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `logs`
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
(1, 1, 'admin@wsb.pl', 3, '127.0.0.1', '2023-06-15 21:43:46'),
(2, 1, 'admin@wsb.pl', 1, '127.0.0.1', '2023-06-15 21:44:18'),
(3, 2, 'librarian@wsb.pl', 3, '127.0.0.1', '2023-06-15 21:45:07'),
(4, 3, 'user@wsb.pl', 3, '127.0.0.1', '2023-06-15 21:45:39'),
(5, 3, 'user@wsb.pl', 1, '127.0.0.1', '2023-06-15 21:46:09'),
(6, 2, 'librarian@wsb.pl', 1, '127.0.0.1', '2023-06-15 21:46:13'),
(7, 2, 'librarian@wsb.pl', 1, '127.0.0.1', '2023-06-15 21:49:49');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `logs_type`
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
-- Struktura tabeli dla tabeli `permissions`
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
-- Struktura tabeli dla tabeli `rental`
--

CREATE TABLE `rental` (
  `id` int(10) NOT NULL,
  `userId` int(10) UNSIGNED NOT NULL,
  `seen` tinyint(1) NOT NULL DEFAULT 0,
  `userSeen` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `rental_info`
--

CREATE TABLE `rental_info` (
  `id` int(11) NOT NULL,
  `isbn` varchar(13) NOT NULL,
  `rentalDate` date NOT NULL DEFAULT current_timestamp(),
  `returnDate` date DEFAULT NULL,
  `accept` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `users`
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
(1, 3, 'admin@wsb.pl', 'Admin', 'Adminek', '2023-06-15', '$2y$10$O2usEjnPmjs.HZFAUq7QeOdckAFPFZM6hL2VsYeO9zEJFk7cCu4AW', '2023-06-15 23:43:46', '2.jpg'),
(2, 2, 'librarian@wsb.pl', 'Librarian', 'Librek', '2023-06-15', '$2y$10$lFCJXIO6sFHGjGQ1CdJNsONDiMLAkts7QryKiE7mwwpyHVjX3L32i', '2023-06-15 23:45:07', '6.jpg'),
(3, 1, 'user@wsb.pl', 'User', 'Userek', '2023-06-15', '$2y$10$yCXCZjKSrWQUIqfrHGYg5evmNW5B1hpAozE2ghNaf.Paf7uiwpPBy', '2023-06-15 23:45:39', '5.jpg');

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`isbn`);

--
-- Indeksy dla tabeli `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userId` (`userId`),
  ADD KEY `status` (`status`);

--
-- Indeksy dla tabeli `logs_type`
--
ALTER TABLE `logs_type`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `rental`
--
ALTER TABLE `rental`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userId` (`userId`);

--
-- Indeksy dla tabeli `rental_info`
--
ALTER TABLE `rental_info`
  ADD KEY `id` (`id`,`isbn`),
  ADD KEY `isbn` (`isbn`);

--
-- Indeksy dla tabeli `users`
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

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
-- AUTO_INCREMENT for table `rental`
--
ALTER TABLE `rental`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

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
