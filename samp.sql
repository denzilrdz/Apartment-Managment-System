-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3307
-- Generation Time: Jun 29, 2020 at 05:14 PM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.1.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `samp`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_login`
--

CREATE TABLE `admin_login` (
  `uname` varchar(10) NOT NULL,
  `pass` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin_login`
--

INSERT INTO `admin_login` (`uname`, `pass`) VALUES
('admin', '123456');

-- --------------------------------------------------------

--
-- Table structure for table `amenities_prices`
--

CREATE TABLE `amenities_prices` (
  `amenity_name` varchar(5) NOT NULL,
  `price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `amenities_prices`
--

INSERT INTO `amenities_prices` (`amenity_name`, `price`) VALUES
('hall', 1000),
('swim', 5000);

-- --------------------------------------------------------

--
-- Table structure for table `apartment`
--

CREATE TABLE `apartment` (
  `apart_no` varchar(5) NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `apartment`
--

INSERT INTO `apartment` (`apart_no`, `status`) VALUES
('A001', 0),
('A002', 0),
('B001', 0),
('B002', 0),
('C001', 0),
('C002', 0),
('D001', 0),
('D002', 0);

-- --------------------------------------------------------

--
-- Table structure for table `appointment`
--

CREATE TABLE `appointment` (
  `slno` int(11) NOT NULL,
  `email` varchar(30) DEFAULT NULL,
  `type` varchar(5) DEFAULT NULL,
  `adate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `assign`
--

CREATE TABLE `assign` (
  `service_number` int(11) NOT NULL,
  `email` varchar(30) NOT NULL,
  `apart_no` varchar(10) NOT NULL,
  `t_number` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `complaint`
--

CREATE TABLE `complaint` (
  `regno` int(11) NOT NULL,
  `apart_no` varchar(10) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `subject` varchar(500) DEFAULT NULL,
  `comp` varchar(5000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `entry_log`
--

CREATE TABLE `entry_log` (
  `regno` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `exit_log`
--

CREATE TABLE `exit_log` (
  `regno` int(11) NOT NULL,
  `exit_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `guest_apart`
--

CREATE TABLE `guest_apart` (
  `email` varchar(30) NOT NULL,
  `apart_type` varchar(5) NOT NULL,
  `rdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `guest_login`
--

CREATE TABLE `guest_login` (
  `regno` int(11) NOT NULL,
  `username` varchar(30) DEFAULT NULL,
  `password` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `gym_swimming`
--

CREATE TABLE `gym_swimming` (
  `regno` int(10) NOT NULL,
  `email` varchar(30) NOT NULL,
  `bdate` date NOT NULL,
  `edate` date NOT NULL,
  `o_id` varchar(10) NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `hall_booking`
--

CREATE TABLE `hall_booking` (
  `regno` int(10) NOT NULL,
  `email` varchar(30) NOT NULL,
  `apart_no` varchar(10) NOT NULL,
  `date` date NOT NULL,
  `status` tinyint(1) NOT NULL,
  `o_id` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `invoice`
--

CREATE TABLE `invoice` (
  `invoice_no` int(11) NOT NULL,
  `date` datetime DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `o_id` varchar(10) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `MID` varchar(20) NOT NULL,
  `TXNID` varchar(64) NOT NULL,
  `ORDERID` varchar(50) NOT NULL,
  `BANKTXNID` varchar(500) NOT NULL,
  `TXNAMOUNT` varchar(10) NOT NULL,
  `CURRENCY` varchar(3) NOT NULL,
  `RESPCODE` varchar(10) NOT NULL,
  `TXNDATE` datetime NOT NULL,
  `GATEWAYNAME` varchar(15) NOT NULL,
  `BANKNAME` varchar(500) NOT NULL,
  `PAYMENTMODE` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `request_service`
--

CREATE TABLE `request_service` (
  `email` varchar(30) NOT NULL,
  `service` varchar(20) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fstatus` tinyint(1) NOT NULL,
  `slno` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `technician`
--

CREATE TABLE `technician` (
  `slno` int(11) NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `contact` int(15) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tenent_amt`
--

CREATE TABLE `tenent_amt` (
  `regno` int(5) NOT NULL,
  `amt` int(10) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `o_id` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tenent_email`
--

CREATE TABLE `tenent_email` (
  `regno` int(11) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `apart_no` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tenent_login`
--

CREATE TABLE `tenent_login` (
  `username` varchar(50) NOT NULL,
  `password` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `watch_login`
--

CREATE TABLE `watch_login` (
  `username` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `watch_login`
--

INSERT INTO `watch_login` (`username`, `password`) VALUES
('watch1', '123');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_login`
--
ALTER TABLE `admin_login`
  ADD PRIMARY KEY (`uname`);

--
-- Indexes for table `apartment`
--
ALTER TABLE `apartment`
  ADD PRIMARY KEY (`apart_no`);

--
-- Indexes for table `appointment`
--
ALTER TABLE `appointment`
  ADD PRIMARY KEY (`slno`);

--
-- Indexes for table `complaint`
--
ALTER TABLE `complaint`
  ADD PRIMARY KEY (`regno`);

--
-- Indexes for table `entry_log`
--
ALTER TABLE `entry_log`
  ADD PRIMARY KEY (`regno`);

--
-- Indexes for table `guest_login`
--
ALTER TABLE `guest_login`
  ADD PRIMARY KEY (`regno`);

--
-- Indexes for table `invoice`
--
ALTER TABLE `invoice`
  ADD PRIMARY KEY (`invoice_no`);

--
-- Indexes for table `request_service`
--
ALTER TABLE `request_service`
  ADD PRIMARY KEY (`slno`);

--
-- Indexes for table `technician`
--
ALTER TABLE `technician`
  ADD PRIMARY KEY (`slno`);

--
-- Indexes for table `tenent_email`
--
ALTER TABLE `tenent_email`
  ADD PRIMARY KEY (`regno`);

--
-- Indexes for table `tenent_login`
--
ALTER TABLE `tenent_login`
  ADD PRIMARY KEY (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `appointment`
--
ALTER TABLE `appointment`
  MODIFY `slno` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `complaint`
--
ALTER TABLE `complaint`
  MODIFY `regno` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `entry_log`
--
ALTER TABLE `entry_log`
  MODIFY `regno` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `guest_login`
--
ALTER TABLE `guest_login`
  MODIFY `regno` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `invoice`
--
ALTER TABLE `invoice`
  MODIFY `invoice_no` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `request_service`
--
ALTER TABLE `request_service`
  MODIFY `slno` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `technician`
--
ALTER TABLE `technician`
  MODIFY `slno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tenent_email`
--
ALTER TABLE `tenent_email`
  MODIFY `regno` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
