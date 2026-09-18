-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 06, 2026 at 02:14 AM
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
-- Database: `libraryhub`
--

-- --------------------------------------------------------

--
-- Table structure for table `authors`
--

CREATE TABLE `authors` (
  `author_id` int(11) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `birth_date` date DEFAULT NULL,
  `nationality` varchar(50) DEFAULT NULL,
  `gender` enum('Male','Female','Other') DEFAULT NULL,
  `biography` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `authors`
--

INSERT INTO `authors` (`author_id`, `first_name`, `last_name`, `birth_date`, `nationality`, `gender`, `biography`) VALUES
(1, 'Stephen', 'King', '1947-09-21', 'American', 'Male', 'American author known for horror, suspense, and supernatural fiction novels'),
(2, 'J.K.', 'Rowling', '1965-07-31', 'British', 'Female', 'author best known for creating the Harry Potter fantasy series'),
(3, 'George', 'Orwell', '1903-06-25', 'British', 'Male', 'English novelist and essayist famous for 1984 and Animal Farm\r\n\r\n\r\n\r\n'),
(4, 'Agatha', 'Christie', '1890-09-15', 'British', 'Female', 'British mystery writer known for detective novels and crime fiction'),
(5, 'Victor', 'Hugo', '1802-02-26', 'French', 'Male', 'French writer famous for Les Misérables and The Hunchback of Notre-Dame\r\n'),
(6, 'Alexandre', 'Dumas', '1802-07-24', 'French', 'Male', 'French novelist known for adventure novels including The Three Musketeers'),
(7, 'Chinua', 'Achebe', '1939-11-16', 'Nigerian', 'Male', 'Nigerian novelist famous for Things Fall Apart and African literature'),
(8, 'Margaret', 'Atwood', '1939-11-18', 'Canadian', 'Female', 'Canadian author known for The Handmaid\'s Tale and speculative fiction\r\n'),
(9, 'Jules', 'Verne', '1828-02-08', 'French', 'Male', 'French science fiction pioneer known for Twenty Thousand Leagues Under the Sea\r\n'),
(10, 'Harper', 'Lee', '1926-04-28', 'American', 'Female', 'American author famous for To Kill a Mockingbird');

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

CREATE TABLE `books` (
  `book_id` int(11) NOT NULL,
  `title` varchar(150) NOT NULL,
  `publication_date` date DEFAULT NULL,
  `isbn` varchar(20) DEFAULT NULL,
  `pages` int(11) DEFAULT NULL,
  `author_id` int(11) NOT NULL,
  `description` text DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `publisher_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`book_id`, `title`, `publication_date`, `isbn`, `pages`, `author_id`, `description`, `category_id`, `publisher_id`) VALUES
(1, 'The Shining', '1977-01-28', '9780385121675', 447, 1, 'A horror novel about a family staying in an isolated hotel with supernatural events.', NULL, NULL),
(2, 'Harry Potter and the Philosopher\'s Stone', '1997-06-26', '9780747532699', 223, 2, 'A fantasy novel about a young wizard discovering the magical world.', NULL, NULL),
(3, '1984', '1949-06-08', '9780451524935', 328, 3, 'A dystopian novel about surveillance, government control, and freedom.', NULL, NULL),
(4, 'Murder on the Orient Express', '1934-01-01', '9780062693662', 256, 4, 'A detective mystery featuring Hercule Poirot investigating a murder.', NULL, NULL),
(5, 'Les Misérables', '1862-01-01', '9780451419439', 1463, 5, 'A historical novel about justice, love, and social struggles in France.', NULL, NULL),
(6, 'The Three Musketeers', '1844-03-01', '9780140440249', 624, 6, 'An adventure novel about friendship, loyalty, and sword fighting.', NULL, NULL),
(7, 'Things Fall Apart', '1958-06-17', '9780385474542', 209, 7, 'A novel about Igbo society and cultural changes in Nigeria.', NULL, NULL),
(8, 'The Handmaid\'s Tale', '1985-06-01', '9780385490818', 311, 8, 'A dystopian novel about a woman living under an oppressive regime.', NULL, NULL),
(9, 'Twenty Thousand Leagues Under the Sea', '1870-06-20', '9780140443752', 426, 9, 'A science fiction adventure about Captain Nemo and the submarine Nautilus.', NULL, NULL),
(10, 'To Kill a Mockingbird', '1960-07-11', '9780061120084', 336, 10, 'A novel about justice, morality, and childhood in the American South.', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(50) NOT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`category_id`, `category_name`, `description`) VALUES
(1, 'Horror', 'Books that create fear, suspense, and supernatural experiences.'),
(2, 'Fantasy', 'Stories involving magic, mythical worlds, and supernatural elements.'),
(3, 'Science Fiction', 'Stories about science, technology, and future worlds.'),
(4, 'Mystery', 'Stories focused on investigations and solving crimes.'),
(5, 'Romance', 'Stories about love and relationships.'),
(6, 'Adventure', 'Stories involving exploration and exciting journeys.'),
(7, 'Biography', 'Books about the life of real people.'),
(8, 'Historical Fiction', 'Stories set in past historical periods.'),
(9, 'Dystopian', 'Stories about societies with oppressive systems.'),
(10, 'Comedy', 'Books written to entertain and make readers laugh.');

-- --------------------------------------------------------

--
-- Table structure for table `loans`
--

CREATE TABLE `loans` (
  `loan_id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `book_id` int(11) NOT NULL,
  `loan_date` date NOT NULL,
  `return_date` date DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `loans`
--

INSERT INTO `loans` (`loan_id`, `member_id`, `book_id`, `loan_date`, `return_date`, `status`) VALUES
(1, 1, 1, '2025-06-01', '2025-06-10', 'Returned'),
(2, 2, 2, '2025-06-05', NULL, 'Borrowed'),
(3, 3, 3, '2025-06-07', '2025-06-15', 'Returned'),
(4, 4, 4, '2025-06-10', NULL, 'Borrowed'),
(5, 5, 5, '2025-06-12', '2025-06-20', 'Returned'),
(6, 6, 6, '2025-06-15', NULL, 'Borrowed'),
(7, 7, 7, '2025-06-18', '2025-06-25', 'Returned'),
(8, 8, 8, '2025-06-20', NULL, 'Borrowed'),
(9, 9, 9, '2025-06-22', '2025-06-30', 'Returned'),
(10, 10, 10, '2025-06-25', NULL, 'Borrowed');

-- --------------------------------------------------------

--
-- Table structure for table `members`
--

CREATE TABLE `members` (
  `member_id` int(11) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `registration_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `members`
--

INSERT INTO `members` (`member_id`, `first_name`, `last_name`, `email`, `phone`, `registration_date`) VALUES
(1, 'John', 'Smith', 'john.smith@email.com', '555-1001', '2025-01-15'),
(2, 'Emma', 'Johnson', 'emma.johnson@email.com', '555-1002', '2025-02-10'),
(3, 'Michael', 'Brown', 'michael.brown@email.com', '555-1003', '2025-02-20'),
(4, 'Sophia', 'Williams', 'sophia.williams@email.com', '555-1004', '2025-03-05'),
(5, 'Daniel', 'Jones', 'daniel.jones@email.com', '555-1005', '2025-03-18'),
(6, 'Olivia', 'Davis', 'olivia.davis@email.com', '555-1006', '2025-04-01'),
(7, 'James', 'Wilson', 'james.wilson@email.com', '555-1007', '2025-04-12'),
(8, 'Amelia', 'Taylor', 'amelia.taylor@email.com', '555-1008', '2025-05-03'),
(9, 'William', 'Anderson', 'william.anderson@email.com', '555-1009', '2025-05-20'),
(10, 'Isabella', 'Thomas', 'isabella.thomas@email.com', '555-1010', '2025-06-01');

-- --------------------------------------------------------

--
-- Table structure for table `publishers`
--

CREATE TABLE `publishers` (
  `publisher_id` int(11) NOT NULL,
  `publisher_name` varchar(100) NOT NULL,
  `country` varchar(50) DEFAULT NULL,
  `founded_year` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `publishers`
--

INSERT INTO `publishers` (`publisher_id`, `publisher_name`, `country`, `founded_year`) VALUES
(1, 'Penguin Random House', 'USA', 2013),
(2, 'HarperCollins', 'USA', 1989),
(3, 'Hachette Livre', 'France', 1826),
(4, 'Simon & Schuster', 'USA', 1924),
(5, 'Oxford University Press', 'UK', 1586),
(6, 'Macmillan Publishers', 'UK', 1843),
(7, 'Random House', 'USA', 1927),
(8, 'Bloomsbury Publishing', 'UK', 1986),
(9, 'Gallimard', 'France', 1911),
(10, 'Scholastic', 'USA', 1920);

-- --------------------------------------------------------

--
-- Table structure for table `reservations`
--

CREATE TABLE `reservations` (
  `reservation_id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `book_id` int(11) NOT NULL,
  `reservation_date` date NOT NULL,
  `status` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `reservations`
--

INSERT INTO `reservations` (`reservation_id`, `member_id`, `book_id`, `reservation_date`, `status`) VALUES
(1, 2, 1, '2025-06-02', 'Pending'),
(2, 3, 2, '2025-06-06', 'Completed'),
(3, 4, 3, '2025-06-08', 'Pending'),
(4, 5, 4, '2025-06-11', 'Cancelled'),
(5, 6, 5, '2025-06-13', 'Pending'),
(6, 7, 6, '2025-06-16', 'Completed'),
(7, 8, 7, '2025-06-19', 'Pending'),
(8, 9, 8, '2025-06-21', 'Pending'),
(9, 10, 9, '2025-06-23', 'Completed'),
(10, 1, 10, '2025-06-26', 'Pending');

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `review_id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `book_id` int(11) NOT NULL,
  `rating` int(11) NOT NULL,
  `comment` text DEFAULT NULL,
  `review_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`review_id`, `member_id`, `book_id`, `rating`, `comment`, `review_date`) VALUES
(1, 1, 1, 5, 'A very exciting horror story with great suspense.', '2025-06-10'),
(2, 2, 2, 5, 'A fantastic story with an amazing magical world.', '2025-06-12'),
(3, 3, 3, 4, 'A powerful book with interesting ideas about society.', '2025-06-15'),
(4, 4, 4, 5, 'A great mystery with an excellent detective story.', '2025-06-18'),
(5, 5, 5, 5, 'A classic novel with deep emotional themes.', '2025-06-20'),
(6, 6, 6, 4, 'An enjoyable adventure story.', '2025-06-22'),
(7, 7, 7, 5, 'An important book about culture and history.', '2025-06-25'),
(8, 8, 8, 4, 'A fascinating but serious dystopian story.', '2025-06-27'),
(9, 9, 9, 5, 'A creative science fiction adventure.', '2025-06-29'),
(10, 10, 10, 5, 'A meaningful and unforgettable novel.', '2025-07-01');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `authors`
--
ALTER TABLE `authors`
  ADD PRIMARY KEY (`author_id`);

--
-- Indexes for table `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`book_id`),
  ADD KEY `fk_book_category` (`category_id`),
  ADD KEY `fk_book_publisher` (`publisher_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `loans`
--
ALTER TABLE `loans`
  ADD PRIMARY KEY (`loan_id`),
  ADD KEY `fk_member` (`member_id`),
  ADD KEY `fk_book` (`book_id`);

--
-- Indexes for table `members`
--
ALTER TABLE `members`
  ADD PRIMARY KEY (`member_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `publishers`
--
ALTER TABLE `publishers`
  ADD PRIMARY KEY (`publisher_id`);

--
-- Indexes for table `reservations`
--
ALTER TABLE `reservations`
  ADD PRIMARY KEY (`reservation_id`),
  ADD KEY `fk_reservation_member` (`member_id`),
  ADD KEY `fk_reservation_book` (`book_id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`review_id`),
  ADD KEY `fk_review_member` (`member_id`),
  ADD KEY `fk_review_book` (`book_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `authors`
--
ALTER TABLE `authors`
  MODIFY `author_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `books`
--
ALTER TABLE `books`
  MODIFY `book_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `loans`
--
ALTER TABLE `loans`
  MODIFY `loan_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `members`
--
ALTER TABLE `members`
  MODIFY `member_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `publishers`
--
ALTER TABLE `publishers`
  MODIFY `publisher_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `reservations`
--
ALTER TABLE `reservations`
  MODIFY `reservation_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `review_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `books`
--
ALTER TABLE `books`
  ADD CONSTRAINT `fk_book_category` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`),
  ADD CONSTRAINT `fk_book_publisher` FOREIGN KEY (`publisher_id`) REFERENCES `publishers` (`publisher_id`);

--
-- Constraints for table `loans`
--
ALTER TABLE `loans`
  ADD CONSTRAINT `fk_book` FOREIGN KEY (`book_id`) REFERENCES `books` (`book_id`),
  ADD CONSTRAINT `fk_member` FOREIGN KEY (`member_id`) REFERENCES `members` (`member_id`);

--
-- Constraints for table `reservations`
--
ALTER TABLE `reservations`
  ADD CONSTRAINT `fk_reservation_book` FOREIGN KEY (`book_id`) REFERENCES `books` (`book_id`),
  ADD CONSTRAINT `fk_reservation_member` FOREIGN KEY (`member_id`) REFERENCES `members` (`member_id`);

--
-- Constraints for table `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `fk_review_book` FOREIGN KEY (`book_id`) REFERENCES `books` (`book_id`),
  ADD CONSTRAINT `fk_review_member` FOREIGN KEY (`member_id`) REFERENCES `members` (`member_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
