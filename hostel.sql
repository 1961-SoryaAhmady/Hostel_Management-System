-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 20, 2020 at 10:32 AM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 8.0.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hostel`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `admin_id` int(11) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(8) NOT NULL,
  `position` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`admin_id`, `username`, `password`, `position`) VALUES
(2, 'mariam', 'popal123', 'cheifwarden'),
(2, 'sorya_ahmady', 'sori1234', 'warden');

-- --------------------------------------------------------

--
-- Table structure for table `attendance`
--

CREATE TABLE `attendance` (
  `student_id` int(11) NOT NULL,
  `room_no` int(11) NOT NULL,
  `date` date NOT NULL,
  `attendance` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `attendance`
--

INSERT INTO `attendance` (`student_id`, `room_no`, `date`, `attendance`) VALUES
(1, 12, '2020-12-20', 'present'),
(1, 12, '0000-00-00', 'absent'),
(4, 1, '2020-12-20', 'absent'),
(4, 1, '2020-12-14', 'present'),
(5, 1, '2020-12-14', 'present'),
(4, 1, '2020-12-14', 'present'),
(5, 7, '2020-12-14', 'present'),
(6, 8, '2020-12-19', 'present');

-- --------------------------------------------------------

--
-- Stand-in structure for view `attendance_list`
-- (See below for the actual view)
--
CREATE TABLE `attendance_list` (
`first_name` varchar(20)
,`room_no` int(11)
,`date` date
,`attendance` varchar(10)
);

-- --------------------------------------------------------

--
-- Table structure for table `room`
--

CREATE TABLE `room` (
  `room_no` int(11) NOT NULL,
  `seater` int(11) NOT NULL,
  `floor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `room`
--

INSERT INTO `room` (`room_no`, `seater`, `floor`) VALUES
(1, 2, 1),
(2, 3, 2),
(4, 1, 1),
(7, 2, 3),
(8, 2, 3),
(12, 2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `student_id` int(11) NOT NULL,
  `first_name` varchar(20) NOT NULL,
  `last_name` varchar(20) NOT NULL,
  `phone` int(10) NOT NULL,
  `email` varchar(320) NOT NULL,
  `room_no` int(11) NOT NULL,
  `department` varchar(20) NOT NULL,
  `duration` varchar(15) NOT NULL,
  `status` varchar(10) NOT NULL,
  `mess` int(10) NOT NULL,
  `fees` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`student_id`, `first_name`, `last_name`, `phone`, `email`, `room_no`, `department`, `duration`, `status`, `mess`, `fees`) VALUES
(1, 'sorya', 'ahmady', 900809, 'ahmadi.sorya@yahoo.com', 12, 'mca', 'three year', 'single', 6000, 3000),
(2, 'sadaf', 'jawid', 912345678, 'sadaf.jawid@gmail.com', 3, 'mba', 'two year', 'single', 3000, 6000),
(3, 'sahar', 'jawid', 912345678, 'sahar.jawid@gmail.com', 3, 'mba', 'two year', 'single', 3000, 6000),
(4, 'akshi', 'jaa', 2147483647, 'akshi.jaa@gmail.com', 4, 'french', 'two year', 'married', 3000, 5000),
(5, 'mariam', 'popal', 91290394, 'mariam@gmail.com', 7, 'mba', 'two year', 'single', 6000, 3000),
(6, 'nilum', 'sadat', 2147483647, 'nilum.sadat@gmail.com', 8, 'MA', 'two year', 'single', 2500, 2000);

-- --------------------------------------------------------

--
-- Table structure for table `visitors`
--

CREATE TABLE `visitors` (
  `name` varchar(30) NOT NULL,
  `student_id` int(11) NOT NULL,
  `room_no` int(11) NOT NULL,
  `relation` varchar(20) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `visitors`
--

INSERT INTO `visitors` (`name`, `student_id`, `room_no`, `relation`, `date`) VALUES
('sahar', 1, 12, 'friend', '2020-12-15'),
('sahar', 1, 12, 'friend', '2020-12-15'),
('sadaf', 1, 12, 'cousin', '2020-12-14'),
('sadaf', 1, 12, 'cousin', '2020-12-14'),
('sorya', 4, 1, 'friend', '2020-12-14'),
('sofya', 5, 1, 'sister', '2020-12-16');

-- --------------------------------------------------------

--
-- Stand-in structure for view `visitors_list`
-- (See below for the actual view)
--
CREATE TABLE `visitors_list` (
`name` varchar(30)
,`date` date
,`relation` varchar(20)
,`first_name` varchar(20)
,`last_name` varchar(20)
);

-- --------------------------------------------------------

--
-- Structure for view `attendance_list`
--
DROP TABLE IF EXISTS `attendance_list`;

CREATE ALGORITHM=MERGE DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `attendance_list`  AS SELECT `student`.`first_name` AS `first_name`, `student`.`room_no` AS `room_no`, `attendance`.`date` AS `date`, `attendance`.`attendance` AS `attendance` FROM (`student` join `attendance` on(`student`.`student_id` = `attendance`.`student_id`)) ;

-- --------------------------------------------------------

--
-- Structure for view `visitors_list`
--
DROP TABLE IF EXISTS `visitors_list`;

CREATE ALGORITHM=MERGE DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `visitors_list`  AS SELECT `visitors`.`name` AS `name`, `visitors`.`date` AS `date`, `visitors`.`relation` AS `relation`, `student`.`first_name` AS `first_name`, `student`.`last_name` AS `last_name` FROM (`visitors` join `student` on(`visitors`.`student_id` = `student`.`student_id`)) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_id`,`username`);

--
-- Indexes for table `room`
--
ALTER TABLE `room`
  ADD PRIMARY KEY (`room_no`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`student_id`);

--
-- Indexes for table `visitors`
--
ALTER TABLE `visitors`
  ADD KEY `std_id_fk` (`student_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `attendance`
--
ALTER TABLE `attendance`
  ADD CONSTRAINT `room_no_fk` FOREIGN KEY (`room_no`) REFERENCES `room` (`room_no`);

--
-- Constraints for table `visitors`
--
ALTER TABLE `visitors`
  ADD CONSTRAINT `std_id_fk` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
