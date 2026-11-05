-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 05, 2026 at 02:06 PM
-- Server version: 10.11.16-MariaDB
-- PHP Version: 8.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `smart_kisan`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `username`, `password`) VALUES
(1, 'admin', 'admin123');

-- --------------------------------------------------------

--
-- Table structure for table `crops`
--

CREATE TABLE `crops` (
  `id` int(11) NOT NULL,
  `farmer_id` int(11) NOT NULL,
  `crop_name` varchar(100) NOT NULL,
  `variety` varchar(100) DEFAULT NULL,
  `sowing_date` date NOT NULL,
  `area` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `crops`
--

INSERT INTO `crops` (`id`, `farmer_id`, `crop_name`, `variety`, `sowing_date`, `area`, `created_at`) VALUES
(1, 5, 'genhu', 'dp-32', '2026-11-01', 1.00, '2026-11-05 03:19:05');

-- --------------------------------------------------------

--
-- Table structure for table `crop_queries`
--

CREATE TABLE `crop_queries` (
  `id` int(11) NOT NULL,
  `farmer_id` int(11) NOT NULL,
  `crop_name` varchar(100) NOT NULL,
  `question` text NOT NULL,
  `status` varchar(50) DEFAULT 'Pending',
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `answer` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `crop_queries`
--

INSERT INTO `crop_queries` (`id`, `farmer_id`, `crop_name`, `question`, `status`, `created_at`, `answer`) VALUES
(1, 5, 'genhu', 'keede ki samsya', 'Resolved', '2026-11-05 03:22:04', 'kism');

-- --------------------------------------------------------

--
-- Table structure for table `crop_records`
--

CREATE TABLE `crop_records` (
  `id` int(11) NOT NULL,
  `farmer_id` int(11) NOT NULL,
  `crop_name` varchar(100) NOT NULL,
  `season` varchar(50) DEFAULT NULL,
  `sowing_date` date DEFAULT NULL,
  `area` decimal(10,2) DEFAULT NULL,
  `irrigation_type` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `farmers`
--

CREATE TABLE `farmers` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `mobile` varchar(15) NOT NULL,
  `village` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `farmers`
--

INSERT INTO `farmers` (`id`, `name`, `mobile`, `village`, `password`, `created_at`) VALUES
(1, 'rahul', '9859443355', 'reva', '$2y$12$RxZjlNLeTnVUmE9SPzDhmOvlZrxHp9ksVpumIWhJB6w.IXO1FVSf2', '2026-11-04 11:45:25'),
(4, 'siddharth choubey', '91095432789', 'khamariya', '$2y$12$/kOhieq56ZJGwko7SQn40uKjNvFVK6sRZHSPPrs/NhFQwB4c3cWg2', '2026-11-04 11:53:01'),
(5, 'abhay mishra', '99999999999', 'reva', '$2y$12$ovNIGXWs2lLQwfMWiCX/E.tP1tLX6eodgTW3ScutPMEpVCKJ4dnqy', '2026-11-05 03:13:01');

-- --------------------------------------------------------

--
-- Table structure for table `mandi_rates`
--

CREATE TABLE `mandi_rates` (
  `id` int(11) NOT NULL,
  `crop_name` varchar(100) NOT NULL,
  `market_location` varchar(100) NOT NULL,
  `min_price` decimal(10,2) NOT NULL,
  `max_price` decimal(10,2) NOT NULL,
  `update_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `mandi_rates`
--

INSERT INTO `mandi_rates` (`id`, `crop_name`, `market_location`, `min_price`, `max_price`, `update_date`) VALUES
(1, 'Wheat (?????)', 'Jabalpur Mandi', 2200.00, 2450.00, '2026-11-05'),
(2, 'Paddy (???)', 'Jabalpur Mandi', 2100.00, 2300.00, '2026-11-05'),
(3, 'Gram (???)', 'Panagar Mandi', 5100.00, 5500.00, '2026-11-05');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `crops`
--
ALTER TABLE `crops`
  ADD PRIMARY KEY (`id`),
  ADD KEY `farmer_id` (`farmer_id`);

--
-- Indexes for table `crop_queries`
--
ALTER TABLE `crop_queries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `farmer_id` (`farmer_id`);

--
-- Indexes for table `crop_records`
--
ALTER TABLE `crop_records`
  ADD PRIMARY KEY (`id`),
  ADD KEY `farmer_id` (`farmer_id`);

--
-- Indexes for table `farmers`
--
ALTER TABLE `farmers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mobile` (`mobile`);

--
-- Indexes for table `mandi_rates`
--
ALTER TABLE `mandi_rates`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `crops`
--
ALTER TABLE `crops`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `crop_queries`
--
ALTER TABLE `crop_queries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `crop_records`
--
ALTER TABLE `crop_records`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `farmers`
--
ALTER TABLE `farmers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `mandi_rates`
--
ALTER TABLE `mandi_rates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `crops`
--
ALTER TABLE `crops`
  ADD CONSTRAINT `crops_ibfk_1` FOREIGN KEY (`farmer_id`) REFERENCES `farmers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `crop_queries`
--
ALTER TABLE `crop_queries`
  ADD CONSTRAINT `crop_queries_ibfk_1` FOREIGN KEY (`farmer_id`) REFERENCES `farmers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `crop_records`
--
ALTER TABLE `crop_records`
  ADD CONSTRAINT `crop_records_ibfk_1` FOREIGN KEY (`farmer_id`) REFERENCES `farmers` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
