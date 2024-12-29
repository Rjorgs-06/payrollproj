-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 29, 2024 at 02:47 PM
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
-- Database: `payrollproj`
--

-- --------------------------------------------------------

--
-- Table structure for table `deduction`
--

CREATE TABLE `deduction` (
  `id` int(20) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `pagibig_gs` decimal(10,2) DEFAULT NULL,
  `pagibig_mp3` decimal(10,2) DEFAULT NULL,
  `gsis_ps` decimal(10,2) DEFAULT NULL,
  `gsis_gs` decimal(10,2) DEFAULT NULL,
  `sif` decimal(10,2) DEFAULT NULL,
  `philhealth_ps` decimal(10,2) DEFAULT NULL,
  `philhealth_gs` decimal(10,2) DEFAULT NULL,
  `withholding_tax` decimal(10,2) DEFAULT NULL,
  `prg` decimal(10,2) DEFAULT NULL,
  `cnl` decimal(10,2) DEFAULT NULL,
  `eml` decimal(10,2) DEFAULT NULL,
  `mpl` decimal(10,2) DEFAULT NULL,
  `gfal` decimal(10,2) DEFAULT NULL,
  `cpl` decimal(10,2) DEFAULT NULL,
  `help` decimal(10,2) DEFAULT NULL,
  `cfi` decimal(10,2) DEFAULT NULL,
  `csb` decimal(10,2) DEFAULT NULL,
  `total_deductions` decimal(10,2) DEFAULT NULL,
  `bangus` float DEFAULT NULL,
  `prawn` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `employee_cos`
--

CREATE TABLE `employee_cos` (
  `id` int(11) NOT NULL,
  `fullname` varchar(100) NOT NULL,
  `position` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employee_cos`
--

INSERT INTO `employee_cos` (`id`, `fullname`, `position`) VALUES
(10, 'Eugine E. Abejar', 'Instructor 2'),
(11, 'Raffy O. Orogan', 'instructor 1');

-- --------------------------------------------------------

--
-- Table structure for table `employee_parttime`
--

CREATE TABLE `employee_parttime` (
  `id` int(20) NOT NULL,
  `fullname` varchar(255) NOT NULL,
  `position` varchar(255) NOT NULL,
  `category` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employee_parttime`
--

INSERT INTO `employee_parttime` (`id`, `fullname`, `position`, `category`) VALUES
(15, 'Jerson A. Aballa', 'Instructor 1', 'NONMASTER');

-- --------------------------------------------------------

--
-- Table structure for table `employee_regular`
--

CREATE TABLE `employee_regular` (
  `id` int(30) NOT NULL,
  `fullname` varchar(100) NOT NULL,
  `position` varchar(255) NOT NULL,
  `employee_id` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employee_regular`
--

INSERT INTO `employee_regular` (`id`, `fullname`, `position`, `employee_id`) VALUES
(39, 'Radgie B. Lopez', 'Instructor 1', 'B1023R24'),
(41, 'Veronica A. Cristobal', 'Instructor 2', 'C2131A21V'),
(43, 'Rogelio Jesus O. Orogan', 'Instructor 2', '123456A'),
(45, 'Anthony G. Cotoner', 'Instructor 1', 'C080417AG');

-- --------------------------------------------------------

--
-- Table structure for table `gross_amount`
--

CREATE TABLE `gross_amount` (
  `id` int(11) NOT NULL,
  `monthly_salary` decimal(10,2) NOT NULL,
  `PERA` decimal(10,2) NOT NULL,
  `gross_amount_earned` decimal(10,2) NOT NULL,
  `employee_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(30) NOT NULL,
  `name` varchar(255) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(200) NOT NULL,
  `type` enum('employee','admin') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `password`, `type`) VALUES
(7, 'admin', 'admin', 'admin123', 'admin'),
(19, 'Lenie F. Llaneta', 'lenie', 'kate', 'admin'),
(20, 'Veronica A. Cristobal', 'Veronica', 'Veronica', 'employee'),
(48, 'Radgie B. Lopez', 'Lopez', 'Lopez', 'employee'),
(49, 'Jerson A. Aballa', 'Jerson', 'Jerson', 'employee'),
(50, 'Eugine E. Abejar', 'Eugine', 'Eugine', 'employee'),
(51, 'Rogelio Jesus O. Orogan', 'Orogan', 'Orogan', 'employee'),
(53, 'Raffy O. Orogan', 'Orogan', 'Orogan', 'employee'),
(54, 'Anthony G. Cotoner', 'Cotoner', 'Cotoner', 'employee');

-- --------------------------------------------------------

--
-- Table structure for table `wages`
--

CREATE TABLE `wages` (
  `id` int(11) NOT NULL,
  `monthly_salary` float NOT NULL,
  `pera` float DEFAULT NULL,
  `gross_amount_earned` int(255) DEFAULT NULL,
  `pagibig_ps` float NOT NULL,
  `pagibig_gs` int(11) NOT NULL,
  `pagibig_mp3` int(255) NOT NULL,
  `gsis_ps` decimal(10,2) NOT NULL,
  `gsis_gs` decimal(10,2) NOT NULL,
  `sif` int(255) NOT NULL,
  `philhealth_ps` float NOT NULL,
  `philhealth_gs` float NOT NULL,
  `withholding_tax` float NOT NULL,
  `prg` float NOT NULL,
  `cnl` float NOT NULL,
  `eml` float NOT NULL,
  `mpl` float NOT NULL,
  `gfal` float NOT NULL,
  `cpl` float NOT NULL,
  `help` float NOT NULL,
  `cfi` float NOT NULL,
  `csb` float NOT NULL,
  `total_deductions` decimal(10,2) NOT NULL,
  `net_salary` decimal(10,2) NOT NULL,
  `net_received1` decimal(10,2) NOT NULL,
  `net_received2` decimal(10,2) NOT NULL,
  `employee_id` int(11) DEFAULT NULL,
  `bangus` float NOT NULL,
  `prawns` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `wages`
--

INSERT INTO `wages` (`id`, `monthly_salary`, `pera`, `gross_amount_earned`, `pagibig_ps`, `pagibig_gs`, `pagibig_mp3`, `gsis_ps`, `gsis_gs`, `sif`, `philhealth_ps`, `philhealth_gs`, `withholding_tax`, `prg`, `cnl`, `eml`, `mpl`, `gfal`, `cpl`, `help`, `cfi`, `csb`, `total_deductions`, `net_salary`, `net_received1`, `net_received2`, `employee_id`, `bangus`, `prawns`) VALUES
(54, 30888, 2000, 32888, 200, 200, 0, 2779.92, 3706.56, 0, 772.2, 772.2, 1500, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5252.12, 27635.88, 13817.94, 13817.94, 39, 0, 0),
(55, 30989, 2000, 32989, 200, 200, 0, 2789.01, 3718.68, 100, 774.72, 774.73, 1249.75, 0, 0, 0, 9750.94, 0, 0, 0, 0, 0, 14764.42, 18224.58, 9112.29, 9112.29, 41, 0, 0),
(58, 5000, 2000, 7000, 0, 0, 0, 450.00, 600.00, 0, 125, 125, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 755.00, 6245.00, 3122.50, 3122.50, 43, 90, 90),
(59, 30000, 2000, 32000, 200, 200, 0, 2700.00, 3600.00, 100, 750, 750, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3650.00, 28350.00, 14175.00, 14175.00, 45, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `wages_cos`
--

CREATE TABLE `wages_cos` (
  `id` int(20) NOT NULL,
  `days_work` int(11) NOT NULL,
  `rate_per_hour` float NOT NULL,
  `tardiness` float NOT NULL,
  `overtime` float NOT NULL,
  `undertime` float NOT NULL,
  `grand_total` float NOT NULL,
  `sss` float NOT NULL,
  `total_deduction` float NOT NULL,
  `net_amount` float NOT NULL,
  `employee_id` int(11) NOT NULL,
  `bangus` float DEFAULT NULL,
  `prawn` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `wages_cos`
--

INSERT INTO `wages_cos` (`id`, `days_work`, `rate_per_hour`, `tardiness`, `overtime`, `undertime`, `grand_total`, `sss`, `total_deduction`, `net_amount`, `employee_id`, `bangus`, `prawn`) VALUES
(8, 30, 200, 0, 200, 0, 0, 2000, 2000, 4200, 10, NULL, NULL),
(9, 30, 503, 20, 0, 0, 0, 2000, 2000, 13090, 11, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `wages_parttime`
--

CREATE TABLE `wages_parttime` (
  `id` int(20) NOT NULL,
  `days_work` int(100) NOT NULL,
  `hrs_work` int(100) NOT NULL,
  `rate_per_hr` float NOT NULL,
  `underpayment` float NOT NULL,
  `overtime` float NOT NULL,
  `grand_total` float NOT NULL,
  `employee_id` int(20) NOT NULL,
  `sss` float NOT NULL,
  `total_deduction` float NOT NULL,
  `net_amount` float NOT NULL,
  `bangus` float DEFAULT NULL,
  `prawns` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `wages_parttime`
--

INSERT INTO `wages_parttime` (`id`, `days_work`, `hrs_work`, `rate_per_hr`, `underpayment`, `overtime`, `grand_total`, `employee_id`, `sss`, `total_deduction`, `net_amount`, `bangus`, `prawns`) VALUES
(14, 0, 240, 205, 200, 0, 49200, 15, 0, 200, 49000, 100, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `deduction`
--
ALTER TABLE `deduction`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employee_id` (`employee_id`);

--
-- Indexes for table `employee_cos`
--
ALTER TABLE `employee_cos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employee_parttime`
--
ALTER TABLE `employee_parttime`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employee_regular`
--
ALTER TABLE `employee_regular`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gross_amount`
--
ALTER TABLE `gross_amount`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employee_id` (`employee_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `wages`
--
ALTER TABLE `wages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_employee` (`employee_id`);

--
-- Indexes for table `wages_cos`
--
ALTER TABLE `wages_cos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employee_id` (`employee_id`);

--
-- Indexes for table `wages_parttime`
--
ALTER TABLE `wages_parttime`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employee_id` (`employee_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `deduction`
--
ALTER TABLE `deduction`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

--
-- AUTO_INCREMENT for table `employee_cos`
--
ALTER TABLE `employee_cos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `employee_parttime`
--
ALTER TABLE `employee_parttime`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `employee_regular`
--
ALTER TABLE `employee_regular`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `gross_amount`
--
ALTER TABLE `gross_amount`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT for table `wages`
--
ALTER TABLE `wages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT for table `wages_cos`
--
ALTER TABLE `wages_cos`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `wages_parttime`
--
ALTER TABLE `wages_parttime`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `deduction`
--
ALTER TABLE `deduction`
  ADD CONSTRAINT `deduction_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employee_regular` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `gross_amount`
--
ALTER TABLE `gross_amount`
  ADD CONSTRAINT `gross_amount_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employee_regular` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `wages`
--
ALTER TABLE `wages`
  ADD CONSTRAINT `fk_employee` FOREIGN KEY (`employee_id`) REFERENCES `employee_regular` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `wages_cos`
--
ALTER TABLE `wages_cos`
  ADD CONSTRAINT `wages_cos_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employee_cos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `wages_parttime`
--
ALTER TABLE `wages_parttime`
  ADD CONSTRAINT `wages_parttime_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employee_parttime` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
