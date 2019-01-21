-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jan 18, 2019 at 09:34 AM
-- Server version: 10.1.34-MariaDB
-- PHP Version: 7.2.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sudoku`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_puzzle`
--

CREATE TABLE `tbl_puzzle` (
  `id` int(11) NOT NULL,
  `l_display` longtext NOT NULL,
  `l_solution` longtext NOT NULL,
  `i_status` tinyint(4) NOT NULL DEFAULT '0',
  `d_added` datetime NOT NULL,
  `d_modified` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_puzzle`
--

INSERT INTO `tbl_puzzle` (`id`, `l_display`, `l_solution`, `i_status`, `d_added`, `d_modified`) VALUES
(1, '[\" \",\"7\",\" \",\" \",\" \",\" \",\"6\",\" \",\" \",\"9\",\" \",\" \",\" \",\" \",\" \",\" \",\"8\",\" \",\" \",\" \",\" \",\"2\",\"6\",\" \",\" \",\"5\",\" \",\"6\",\" \",\"4\",\" \",\" \",\"5\",\" \",\"1\",\" \",\" \",\"2\",\" \",\"9\",\"3\",\" \",\"5\",\" \",\" \",\"3\",\" \",\" \",\" \",\" \",\" \",\"4\",\" \",\"2\",\" \",\" \",\" \",\" \",\" \",\" \",\"3\",\"2\",\" \",\" \",\"6\",\"7\",\" \",\"4\",\"2\",\" \",\" \",\"1\",\"2\",\"3\",\" \",\"8\",\" \",\"1\",\" \",\" \",\" \",\"\"]', '[\"1\",\"7\",\"2\",\"5\",\"9\",\"8\",\"6\",\"3\",\"4\",\"9\",\"5\",\"6\",\"4\",\"1\",\"3\",\"2\",\"8\",\"7\",\"8\",\"4\",\"3\",\"2\",\"6\",\"7\",\"1\",\"5\",\"9\",\"6\",\"8\",\"4\",\"7\",\"2\",\"5\",\"9\",\"1\",\"3\",\"7\",\"2\",\"1\",\"9\",\"3\",\"4\",\"5\",\"6\",\"8\",\"3\",\"9\",\"5\",\"1\",\"8\",\"6\",\"4\",\"7\",\"2\",\"4\",\"1\",\"8\",\"6\",\"7\",\"9\",\"3\",\"2\",\"5\",\"5\",\"6\",\"7\",\"3\",\"4\",\"2\",\"8\",\"9\",\"1\",\"2\",\"3\",\"9\",\"8\",\"5\",\"1\",\"7\",\"4\",\"6\"]', 0, '2019-01-16 00:00:00', '2019-01-16 00:00:00'),
(2, '[\" \",\"4\",\" \",\"6\",\"5\",\" \",\"8\",\" \",\" \",\" \",\" \",\" \",\" \",\"7\",\" \",\" \",\" \",\" \",\"5\",\"8\",\"2\",\"3\",\" \",\" \",\"6\",\" \",\"7\",\" \",\"5\",\" \",\" \",\"1\",\" \",\"2\",\"6\",\"8\",\" \",\" \",\"8\",\"9\",\"6\",\"4\",\"7\",\"1\",\" \",\" \",\"1\",\"6\",\"8\",\"2\",\"5\",\" \",\"3\",\"9\",\"2\",\" \",\"3\",\" \",\" \",\" \",\" \",\" \",\"4\",\" \",\"9\",\" \",\"2\",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\"1\",\" \",\" \",\" \",\" \",\" \",\" \",\" \"]', '[\"1\",\"4\",\"7\",\"6\",\"5\",\"2\",\"8\",\"9\",\"3\",\"6\",\"3\",\"9\",\"4\",\"7\",\"8\",\"5\",\"2\",\"1\",\"5\",\"8\",\"2\",\"3\",\"9\",\"1\",\"6\",\"4\",\"7\",\"9\",\"5\",\"4\",\"7\",\"1\",\"3\",\"2\",\"6\",\"8\",\"3\",\"2\",\"8\",\"9\",\"6\",\"4\",\"7\",\"1\",\"5\",\"7\",\"1\",\"6\",\"8\",\"2\",\"5\",\"4\",\"3\",\"9\",\"2\",\"7\",\"3\",\"1\",\"8\",\"6\",\"9\",\"5\",\"4\",\"4\",\"9\",\"5\",\"2\",\"3\",\"7\",\"1\",\"8\",\"6\",\"8\",\"6\",\"1\",\"5\",\"4\",\"9\",\"3\",\"7\",\"2\"]', 0, '2019-01-16 00:00:00', '2019-01-16 00:00:00'),
(3, '[\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\"5\",\" \",\" \",\" \",\"8\",\" \",\" \",\" \",\"7\",\"1\",\" \",\"3\",\"1\",\" \",\"4\",\" \",\" \",\" \",\" \",\"1\",\"9\",\" \",\"7\",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\"8\",\"1\",\" \",\"3\",\" \",\"2\",\" \",\" \",\" \",\" \",\"2\",\" \",\"9\",\" \",\"8\",\"7\",\" \",\"8\",\" \",\" \",\"9\",\" \",\" \",\" \",\" \",\"6\",\" \",\"7\",\"3\",\" \",\" \",\"9\",\" \",\" \",\"3\",\" \",\"9\",\" \",\"2\",\"7\",\" \",\" \",\" \",\" \"]', '[\"8\",\"2\",\"6\",\"9\",\"7\",\"1\",\"3\",\"4\",\"5\",\"9\",\"5\",\"4\",\"8\",\"3\",\"2\",\"6\",\"7\",\"1\",\"7\",\"3\",\"1\",\"6\",\"4\",\"5\",\"2\",\"9\",\"8\",\"1\",\"9\",\"2\",\"7\",\"8\",\"4\",\"5\",\"3\",\"6\",\"5\",\"7\",\"8\",\"1\",\"6\",\"3\",\"4\",\"2\",\"9\",\"4\",\"6\",\"3\",\"2\",\"5\",\"9\",\"1\",\"8\",\"7\",\"2\",\"8\",\"5\",\"4\",\"9\",\"6\",\"7\",\"1\",\"3\",\"6\",\"4\",\"7\",\"3\",\"1\",\"8\",\"9\",\"5\",\"2\",\"3\",\"1\",\"9\",\"5\",\"2\",\"7\",\"8\",\"6\",\"4\"]', 0, '2019-01-16 00:00:00', '2019-01-16 00:00:00'),
(4, '[\" \",\" \",\" \",\" \",\" \",\"5\",\" \",\" \",\" \",\" \",\" \",\"4\",\"2\",\" \",\" \",\"9\",\" \",\"6\",\" \",\"9\",\" \",\" \",\" \",\" \",\"2\",\"3\",\"7\",\" \",\" \",\"2\",\"7\",\"3\",\" \",\"1\",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\"2\",\"8\",\"7\",\" \",\" \",\" \",\" \",\"8\",\"1\",\" \",\" \",\" \",\" \",\"3\",\"2\",\" \",\" \",\" \",\"7\",\"6\",\" \",\"5\",\" \",\"8\",\" \",\" \",\"9\",\"6\",\" \",\" \",\" \",\" \",\"6\",\" \",\" \",\" \",\"8\",\"3\",\"4\",\" \",\" \"]', '[\"2\",\"3\",\"6\",\"9\",\"7\",\"5\",\"4\",\"1\",\"8\",\"7\",\"1\",\"4\",\"2\",\"8\",\"3\",\"9\",\"5\",\"6\",\"5\",\"9\",\"8\",\"4\",\"6\",\"1\",\"2\",\"3\",\"7\",\"8\",\"5\",\"2\",\"7\",\"3\",\"9\",\"1\",\"6\",\"4\",\"9\",\"4\",\"1\",\"6\",\"5\",\"2\",\"8\",\"7\",\"3\",\"6\",\"7\",\"3\",\"8\",\"1\",\"4\",\"5\",\"9\",\"2\",\"3\",\"2\",\"9\",\"1\",\"4\",\"7\",\"6\",\"8\",\"5\",\"4\",\"8\",\"5\",\"3\",\"9\",\"6\",\"7\",\"2\",\"1\",\"1\",\"6\",\"7\",\"5\",\"2\",\"8\",\"3\",\"4\",\"9\"]', 0, '2019-01-16 00:00:00', '2019-01-16 00:00:00'),
(5, '[\" \",\" \",\" \",\"3\",\"6\",\" \",\" \",\" \",\"2\",\"6\",\" \",\" \",\"8\",\"1\",\" \",\" \",\" \",\"7\",\"3\",\"8\",\"9\",\" \",\"7\",\" \",\" \",\"5\",\" \",\" \",\"5\",\" \",\"6\",\"4\",\" \",\" \",\" \",\"3\",\" \",\"6\",\"4\",\"5\",\"9\",\" \",\"1\",\" \",\" \",\" \",\" \",\" \",\"1\",\" \",\"2\",\" \",\" \",\"6\",\" \",\" \",\" \",\" \",\"5\",\" \",\" \",\" \",\" \",\" \",\"2\",\"8\",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\"9\",\" \",\"7\",\" \",\" \",\"3\",\"6\",\"4\",\" \"]', '[\"5\",\"1\",\"7\",\"3\",\"6\",\"9\",\"4\",\"8\",\"2\",\"6\",\"4\",\"2\",\"8\",\"1\",\"5\",\"9\",\"3\",\"7\",\"3\",\"8\",\"9\",\"2\",\"7\",\"4\",\"6\",\"5\",\"1\",\"8\",\"5\",\"1\",\"6\",\"4\",\"7\",\"2\",\"9\",\"3\",\"2\",\"6\",\"4\",\"5\",\"9\",\"3\",\"1\",\"7\",\"8\",\"9\",\"7\",\"3\",\"1\",\"8\",\"2\",\"5\",\"4\",\"6\",\"7\",\"3\",\"6\",\"4\",\"5\",\"1\",\"8\",\"2\",\"9\",\"4\",\"2\",\"8\",\"9\",\"3\",\"6\",\"7\",\"1\",\"5\",\"1\",\"9\",\"5\",\"7\",\"2\",\"8\",\"3\",\"6\",\"4\"]', 0, '2019-01-16 00:00:00', '2019-01-16 00:00:00'),
(6, '[\"1\",\"2\",\"3\",\"5\",\"4\",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \"]', '[\"1\",\"2\",\"3\",\"5\",\"4\",\"8\",\"9\",\"7\",\"6\",\"8\",\"7\",\"9\",\"6\",\"1\",\"3\",\"4\",\"5\",\"2\",\"5\",\"6\",\"4\",\"7\",\"2\",\"9\",\"1\",\"8\",\"3\",\"4\",\"3\",\"8\",\"1\",\"7\",\"2\",\"6\",\"9\",\"5\",\"7\",\"9\",\"6\",\"4\",\"8\",\"5\",\"3\",\"2\",\"1\",\"2\",\"1\",\"5\",\"3\",\"9\",\"6\",\"8\",\"4\",\"7\",\"3\",\"4\",\"2\",\"8\",\"6\",\"7\",\"5\",\"1\",\"9\",\"9\",\"5\",\"1\",\"2\",\"3\",\"4\",\"7\",\"6\",\"8\",\"6\",\"8\",\"7\",\"9\",\"5\",\"1\",\"2\",\"3\",\"4\"]', 0, '2019-01-17 13:33:46', '2019-01-17 13:33:46'),
(7, '[\"1\",\"2\",\"3\",\"5\",\"6\",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \"]', '[\"1\",\"2\",\"3\",\"5\",\"6\",\"8\",\"9\",\"7\",\"4\",\"7\",\"8\",\"4\",\"3\",\"2\",\"9\",\"6\",\"1\",\"5\",\"5\",\"6\",\"9\",\"1\",\"7\",\"4\",\"3\",\"8\",\"2\",\"4\",\"9\",\"5\",\"7\",\"8\",\"1\",\"2\",\"6\",\"3\",\"3\",\"7\",\"8\",\"6\",\"4\",\"2\",\"1\",\"5\",\"9\",\"6\",\"1\",\"2\",\"9\",\"3\",\"5\",\"7\",\"4\",\"8\",\"2\",\"5\",\"1\",\"4\",\"9\",\"7\",\"8\",\"3\",\"6\",\"8\",\"3\",\"7\",\"2\",\"5\",\"6\",\"4\",\"9\",\"1\",\"9\",\"4\",\"6\",\"8\",\"1\",\"3\",\"5\",\"2\",\"7\"]', 0, '2019-01-17 13:35:08', '2019-01-17 13:35:08'),
(8, '[\" \",\"4\",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \"]', '[\"6\",\"4\",\"8\",\"3\",\"2\",\"9\",\"7\",\"1\",\"5\",\"3\",\"2\",\"1\",\"5\",\"7\",\"4\",\"6\",\"8\",\"9\",\"5\",\"7\",\"9\",\"8\",\"6\",\"1\",\"3\",\"2\",\"4\",\"7\",\"9\",\"4\",\"2\",\"5\",\"6\",\"8\",\"3\",\"1\",\"1\",\"6\",\"3\",\"7\",\"4\",\"8\",\"5\",\"9\",\"2\",\"2\",\"8\",\"5\",\"9\",\"1\",\"3\",\"4\",\"6\",\"7\",\"4\",\"3\",\"6\",\"1\",\"9\",\"5\",\"2\",\"7\",\"8\",\"9\",\"5\",\"2\",\"6\",\"8\",\"7\",\"1\",\"4\",\"3\",\"8\",\"1\",\"7\",\"4\",\"3\",\"2\",\"9\",\"5\",\"6\"]', 0, '2019-01-17 13:39:29', '2019-01-17 13:39:29'),
(10, '[\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \",\" \"]', '[\"4\",\"5\",\"6\",\"8\",\"1\",\"7\",\"2\",\"3\",\"9\",\"7\",\"8\",\"3\",\"9\",\"4\",\"2\",\"6\",\"1\",\"5\",\"9\",\"1\",\"2\",\"5\",\"6\",\"3\",\"7\",\"8\",\"4\",\"5\",\"4\",\"8\",\"6\",\"9\",\"1\",\"3\",\"2\",\"7\",\"6\",\"2\",\"1\",\"3\",\"7\",\"4\",\"5\",\"9\",\"8\",\"3\",\"7\",\"9\",\"2\",\"5\",\"8\",\"1\",\"4\",\"6\",\"2\",\"3\",\"4\",\"7\",\"8\",\"6\",\"9\",\"5\",\"1\",\"1\",\"6\",\"5\",\"4\",\"3\",\"9\",\"8\",\"7\",\"2\",\"8\",\"9\",\"7\",\"1\",\"2\",\"5\",\"4\",\"6\",\"3\"]', 0, '2019-01-17 14:14:56', '2019-01-17 14:14:56');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_puzzle`
--
ALTER TABLE `tbl_puzzle`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_puzzle`
--
ALTER TABLE `tbl_puzzle`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
