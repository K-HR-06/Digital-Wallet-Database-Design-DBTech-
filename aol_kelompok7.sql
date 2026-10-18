-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 29, 2025 at 10:45 AM
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
-- Database: `aol_kelompok7`
--

-- --------------------------------------------------------

--
-- Table structure for table `balance_topup_method`
--

CREATE TABLE `balance_topup_method` (
  `user_id` varchar(255) NOT NULL CHECK (`user_id` regexp '^USR[0-9][0-9][0-9]$'),
  `payment_method` enum('Debit Card','Merchant','Transfer') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `balance_topup_method`
--

INSERT INTO `balance_topup_method` (`user_id`, `payment_method`) VALUES
('USR001', 'Debit Card'),
('USR002', 'Merchant'),
('USR003', 'Merchant'),
('USR004', 'Transfer'),
('USR005', 'Transfer');

-- --------------------------------------------------------

--
-- Table structure for table `location`
--

CREATE TABLE `location` (
  `location_id` varchar(255) NOT NULL CHECK (`location_id` regexp '^LOC[0-9][0-9][0-9]$'),
  `street` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `province` varchar(255) DEFAULT NULL,
  `postal_code` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `location`
--

INSERT INTO `location` (`location_id`, `street`, `city`, `province`, `postal_code`, `country`) VALUES
('LOC001', 'Jl. Sudirman No. 123', 'Jakarta', 'DKI Jakarta', '10220', 'Indonesia'),
('LOC002', 'Jl. Gatot Subroto No. 456', 'Jakarta', 'DKI Jakarta', '12930', 'Indonesia'),
('LOC003', 'Jl. Thamrin No. 789', 'Jakarta', 'DKI Jakarta', '10350', 'Indonesia'),
('LOC004', 'Jl. HR Rasuna Said No. 101', 'Jakarta', 'DKI Jakarta', '12940', 'Indonesia'),
('LOC005', 'Jl. Kuningan Raya No. 202', 'Jakarta', 'DKI Jakarta', '12950', 'Indonesia');

-- --------------------------------------------------------

--
-- Table structure for table `merchant_info`
--

CREATE TABLE `merchant_info` (
  `merchant_id` varchar(255) NOT NULL CHECK (`merchant_id` regexp '^MERCH[0-9][0-9][0-9]$'),
  `merchant_name` varchar(255) NOT NULL,
  `acquirer_name` varchar(255) NOT NULL,
  `merchant_pan` varchar(255) NOT NULL,
  `terminal_id` varchar(255) DEFAULT NULL,
  `qris_rrn` varchar(255) DEFAULT NULL,
  `location_id` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `merchant_info`
--

INSERT INTO `merchant_info` (`merchant_id`, `merchant_name`, `acquirer_name`, `merchant_pan`, `terminal_id`, `qris_rrn`, `location_id`) VALUES
('MERCH001', 'Warung Makan Sederhana', 'Bank ABC', '1234567890123456', 'T001', '923456789012', 'LOC001'),
('MERCH002', 'Toko Elektronik Jaya', 'Bank XYZ', '2345678901234567', 'T002', '812345678901', 'LOC002'),
('MERCH003', 'Apotek Sehat', 'Bank DEF', '3456789012345678', 'T003', '703456789123', 'LOC003'),
('MERCH004', 'Minimarket 24', 'Bank GHI', '4567890123456789', 'T004', '691234567890', 'LOC004'),
('MERCH005', 'Restoran Padang Minang', 'Bank JKL', '5678901234567890', 'T005', '845612347890', 'LOC005');

-- --------------------------------------------------------

--
-- Table structure for table `transaction_cashback`
--

CREATE TABLE `transaction_cashback` (
  `transaction_id` varchar(255) NOT NULL CHECK (`transaction_id` regexp '^TRX[0-9][0-9][0-9]$'),
  `cashback_source` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transaction_cashback`
--

INSERT INTO `transaction_cashback` (`transaction_id`, `cashback_source`) VALUES
('TRX005', 'Merchant promo'),
('TRX011', 'Loyalty program'),
('TRX017', 'Seasonal bonus'),
('TRX023', 'Referral bonus'),
('TRX029', 'Welcome bonus');

-- --------------------------------------------------------

--
-- Table structure for table `transaction_info`
--

CREATE TABLE `transaction_info` (
  `transaction_id` varchar(255) NOT NULL CHECK (`transaction_id` regexp '^TRX[0-9][0-9][0-9]$'),
  `user_id` varchar(255) NOT NULL,
  `from_wallet_id` varchar(255) DEFAULT NULL,
  `to_wallet_id` varchar(255) DEFAULT NULL,
  `transaction_type` enum('Top up','Withdrawal','Payment','Transfer','Cashback','Refund') DEFAULT NULL,
  `amount` decimal(15,2) NOT NULL,
  `currency_code` varchar(3) DEFAULT NULL,
  `status` enum('Processing','Failed','Completed') NOT NULL,
  `created_at` date DEFAULT NULL,
  `time_hour` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transaction_info`
--

INSERT INTO `transaction_info` (`transaction_id`, `user_id`, `from_wallet_id`, `to_wallet_id`, `transaction_type`, `amount`, `currency_code`, `status`, `created_at`, `time_hour`) VALUES
('TRX001', 'USR001', NULL, 'WLT001', 'Top up', 500000.00, 'IDR', 'Completed', '2024-06-28', '09:30:15'),
('TRX002', 'USR001', 'WLT001', NULL, 'Withdrawal', 200000.00, 'IDR', 'Completed', '2024-06-28', '14:30:15'),
('TRX003', 'USR001', 'WLT001', NULL, 'Payment', 75000.00, 'IDR', 'Completed', '2024-06-28', '12:30:15'),
('TRX004', 'USR001', 'WLT001', 'WLT002', 'Transfer', 150000.00, 'IDR', 'Completed', '2024-06-28', '16:30:15'),
('TRX005', 'USR001', NULL, 'WLT001', 'Cashback', 5000.00, 'IDR', 'Completed', '2024-06-28', '18:30:15'),
('TRX006', 'USR001', NULL, 'WLT001', 'Refund', 50000.00, 'IDR', 'Completed', '2024-06-28', '20:30:15'),
('TRX007', 'USR002', NULL, 'WLT002', 'Top up', 750000.00, 'IDR', 'Completed', '2024-06-28', '10:15:22'),
('TRX008', 'USR002', 'WLT002', NULL, 'Withdrawal', 150000.00, 'IDR', 'Completed', '2024-06-28', '15:15:22'),
('TRX009', 'USR002', 'WLT002', NULL, 'Payment', 125000.00, 'IDR', 'Completed', '2024-06-28', '13:15:22'),
('TRX010', 'USR002', 'WLT002', 'WLT003', 'Transfer', 200000.00, 'IDR', 'Completed', '2024-06-28', '17:15:22'),
('TRX011', 'USR002', NULL, 'WLT002', 'Cashback', 7500.00, 'IDR', 'Completed', '2024-06-28', '19:15:22'),
('TRX012', 'USR002', NULL, 'WLT002', 'Refund', 75000.00, 'IDR', 'Completed', '2024-06-28', '21:15:22'),
('TRX013', 'USR003', NULL, 'WLT003', 'Top up', 300000.00, 'IDR', 'Processing', '2024-06-29', '08:45:33'),
('TRX014', 'USR003', 'WLT003', NULL, 'Withdrawal', 100000.00, 'IDR', 'Failed', '2024-06-29', '09:45:33'),
('TRX015', 'USR003', 'WLT003', NULL, 'Payment', 95000.00, 'IDR', 'Completed', '2024-06-29', '10:45:33'),
('TRX016', 'USR003', 'WLT003', 'WLT001', 'Transfer', 120000.00, 'IDR', 'Processing', '2024-06-29', '11:45:33'),
('TRX017', 'USR003', NULL, 'WLT003', 'Cashback', 3000.00, 'IDR', 'Completed', '2024-06-29', '12:45:33'),
('TRX018', 'USR003', NULL, 'WLT003', 'Refund', 30000.00, 'IDR', 'Processing', '2024-06-29', '13:45:33'),
('TRX019', 'USR004', NULL, 'WLT004', 'Top up', 1000000.00, 'IDR', 'Completed', '2024-06-29', '11:20:45'),
('TRX020', 'USR004', 'WLT004', NULL, 'Withdrawal', 250000.00, 'IDR', 'Completed', '2024-06-29', '16:20:45'),
('TRX021', 'USR004', 'WLT004', NULL, 'Payment', 220000.00, 'IDR', 'Completed', '2024-06-29', '14:20:45'),
('TRX022', 'USR004', 'WLT004', 'WLT005', 'Transfer', 300000.00, 'IDR', 'Completed', '2024-06-29', '18:20:45'),
('TRX023', 'USR004', NULL, 'WLT004', 'Cashback', 10000.00, 'IDR', 'Completed', '2024-06-29', '20:20:45'),
('TRX024', 'USR004', NULL, 'WLT004', 'Refund', 100000.00, 'IDR', 'Completed', '2024-06-29', '22:20:45'),
('TRX025', 'USR005', NULL, 'WLT005', 'Top up', 600000.00, 'IDR', 'Completed', '2024-06-29', '13:55:12'),
('TRX026', 'USR005', 'WLT005', NULL, 'Withdrawal', 180000.00, 'IDR', 'Processing', '2024-06-29', '17:55:12'),
('TRX027', 'USR005', 'WLT005', NULL, 'Payment', 160000.00, 'IDR', 'Completed', '2024-06-29', '15:55:12'),
('TRX028', 'USR005', 'WLT005', 'WLT001', 'Transfer', 180000.00, 'IDR', 'Completed', '2024-06-29', '19:55:12'),
('TRX029', 'USR005', NULL, 'WLT005', 'Cashback', 6000.00, 'IDR', 'Completed', '2024-06-29', '21:55:12'),
('TRX030', 'USR005', NULL, 'WLT005', 'Refund', 60000.00, 'IDR', 'Completed', '2024-06-29', '23:55:12');

-- --------------------------------------------------------

--
-- Table structure for table `transaction_payment`
--

CREATE TABLE `transaction_payment` (
  `transaction_id` varchar(255) NOT NULL CHECK (`transaction_id` regexp '^TRX[0-9][0-9][0-9]$'),
  `merchant_id` varchar(255) NOT NULL,
  `order_id` varchar(100) DEFAULT NULL
) ;

--
-- Dumping data for table `transaction_payment`
--

INSERT INTO `transaction_payment` (`transaction_id`, `merchant_id`, `order_id`) VALUES
('TRX003', 'MERCH001', 'ORD001'),
('TRX009', 'MERCH002', 'ORD002'),
('TRX015', 'MERCH003', 'ORD003'),
('TRX021', 'MERCH004', 'ORD004'),
('TRX027', 'MERCH005', 'ORD005');

-- --------------------------------------------------------

--
-- Table structure for table `transaction_refund`
--

CREATE TABLE `transaction_refund` (
  `transaction_id` varchar(255) NOT NULL CHECK (`transaction_id` regexp '^TRX[0-9][0-9][0-9]$'),
  `original_transaction_id` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transaction_refund`
--

INSERT INTO `transaction_refund` (`transaction_id`, `original_transaction_id`) VALUES
('TRX006', 'TRX003'),
('TRX012', 'TRX009'),
('TRX018', 'TRX015'),
('TRX024', 'TRX021'),
('TRX030', 'TRX027');

-- --------------------------------------------------------

--
-- Table structure for table `transaction_topup`
--

CREATE TABLE `transaction_topup` (
  `transaction_id` varchar(255) DEFAULT NULL,
  `payment_method` enum('Debit Card','Merchant','Transfer') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transaction_topup`
--

INSERT INTO `transaction_topup` (`transaction_id`, `payment_method`) VALUES
('TRX001', 'Debit Card'),
('TRX007', 'Merchant'),
('TRX013', 'Merchant'),
('TRX019', 'Transfer'),
('TRX025', 'Transfer');

-- --------------------------------------------------------

--
-- Table structure for table `transaction_transfer`
--

CREATE TABLE `transaction_transfer` (
  `transaction_id` varchar(255) NOT NULL CHECK (`transaction_id` regexp '^TRX[0-9][0-9][0-9]$'),
  `receiver_user_id` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transaction_transfer`
--

INSERT INTO `transaction_transfer` (`transaction_id`, `receiver_user_id`) VALUES
('TRX016', 'USR001'),
('TRX028', 'USR001'),
('TRX004', 'USR002'),
('TRX010', 'USR003'),
('TRX022', 'USR005');

-- --------------------------------------------------------

--
-- Table structure for table `transaction_withdrawal`
--

CREATE TABLE `transaction_withdrawal` (
  `transaction_id` varchar(255) NOT NULL CHECK (`transaction_id` regexp '^TRX[0-9][0-9][0-9]$'),
  `withdrawal_bank` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transaction_withdrawal`
--

INSERT INTO `transaction_withdrawal` (`transaction_id`, `withdrawal_bank`) VALUES
('TRX002', 'Bank Mandiri'),
('TRX008', 'Bank BCA'),
('TRX014', 'Bank BRI'),
('TRX020', 'Bank BNI'),
('TRX026', 'Bank CIMB');

-- --------------------------------------------------------

--
-- Table structure for table `user_info`
--

CREATE TABLE `user_info` (
  `user_id` varchar(255) NOT NULL CHECK (`user_id` regexp '^USR[0-9][0-9][0-9]$'),
  `phone_number` varchar(20) NOT NULL,
  `email` varchar(255) NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `profile_picture_url` varchar(500) DEFAULT NULL,
  `date_of_birth` date NOT NULL,
  `pin` int(11) NOT NULL,
  `status_user` tinyint(1) NOT NULL,
  `location_id` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_info`
--

INSERT INTO `user_info` (`user_id`, `phone_number`, `email`, `full_name`, `profile_picture_url`, `date_of_birth`, `pin`, `status_user`, `location_id`) VALUES
('USR001', '081234567890', 'john.doe@email.com', 'John Doe', 'https://example.com/profiles/john.jpg', '1990-05-15', 123456, 1, 'LOC001'),
('USR002', '081234567891', 'jane.smith@email.com', 'Jane Smith', 'https://example.com/profiles/jane.jpg', '1988-08-22', 654321, 1, 'LOC002'),
('USR003', '081234567892', 'mike.wilson@email.com', 'Mike Wilson', 'https://example.com/profiles/mike.jpg', '1992-12-03', 789012, 1, 'LOC003'),
('USR004', '081234567893', 'sarah.brown@email.com', 'Sarah Brown', 'https://example.com/profiles/sarah.jpg', '1995-03-18', 345678, 0, 'LOC004'),
('USR005', '081234567894', 'david.jones@email.com', 'David Jones', 'https://example.com/profiles/david.jpg', '1987-09-25', 901234, 1, 'LOC005');

-- --------------------------------------------------------

--
-- Table structure for table `wallet_info`
--

CREATE TABLE `wallet_info` (
  `wallet_id` varchar(255) NOT NULL CHECK (`wallet_id` regexp '^WLT[0-9][0-9][0-9]$'),
  `user_id` varchar(255) NOT NULL,
  `balance` int(11) NOT NULL,
  `coins_balance` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `wallet_info`
--

INSERT INTO `wallet_info` (`wallet_id`, `user_id`, `balance`, `coins_balance`) VALUES
('WLT001', 'USR001', 1500000, 250),
('WLT002', 'USR002', 2300000, 180),
('WLT003', 'USR003', 850000, 420),
('WLT004', 'USR004', 3200000, 95),
('WLT005', 'USR005', 1750000, 310);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `balance_topup_method`
--
ALTER TABLE `balance_topup_method`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `location`
--
ALTER TABLE `location`
  ADD PRIMARY KEY (`location_id`);

--
-- Indexes for table `merchant_info`
--
ALTER TABLE `merchant_info`
  ADD PRIMARY KEY (`merchant_id`),
  ADD KEY `location_id` (`location_id`);

--
-- Indexes for table `transaction_cashback`
--
ALTER TABLE `transaction_cashback`
  ADD PRIMARY KEY (`transaction_id`);

--
-- Indexes for table `transaction_info`
--
ALTER TABLE `transaction_info`
  ADD PRIMARY KEY (`transaction_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `from_wallet_id` (`from_wallet_id`),
  ADD KEY `to_wallet_id` (`to_wallet_id`);

--
-- Indexes for table `transaction_payment`
--
ALTER TABLE `transaction_payment`
  ADD PRIMARY KEY (`transaction_id`),
  ADD KEY `merchant_id` (`merchant_id`);

--
-- Indexes for table `transaction_refund`
--
ALTER TABLE `transaction_refund`
  ADD PRIMARY KEY (`transaction_id`),
  ADD KEY `original_transaction_id` (`original_transaction_id`);

--
-- Indexes for table `transaction_topup`
--
ALTER TABLE `transaction_topup`
  ADD KEY `transaction_id` (`transaction_id`);

--
-- Indexes for table `transaction_transfer`
--
ALTER TABLE `transaction_transfer`
  ADD PRIMARY KEY (`transaction_id`),
  ADD KEY `receiver_user_id` (`receiver_user_id`);

--
-- Indexes for table `transaction_withdrawal`
--
ALTER TABLE `transaction_withdrawal`
  ADD PRIMARY KEY (`transaction_id`);

--
-- Indexes for table `user_info`
--
ALTER TABLE `user_info`
  ADD PRIMARY KEY (`user_id`),
  ADD KEY `location_id` (`location_id`);

--
-- Indexes for table `wallet_info`
--
ALTER TABLE `wallet_info`
  ADD PRIMARY KEY (`wallet_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `balance_topup_method`
--
ALTER TABLE `balance_topup_method`
  ADD CONSTRAINT `balance_topup_method_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`user_id`);

--
-- Constraints for table `merchant_info`
--
ALTER TABLE `merchant_info`
  ADD CONSTRAINT `merchant_info_ibfk_1` FOREIGN KEY (`location_id`) REFERENCES `location` (`location_id`);

--
-- Constraints for table `transaction_cashback`
--
ALTER TABLE `transaction_cashback`
  ADD CONSTRAINT `transaction_cashback_ibfk_1` FOREIGN KEY (`transaction_id`) REFERENCES `transaction_info` (`transaction_id`);

--
-- Constraints for table `transaction_info`
--
ALTER TABLE `transaction_info`
  ADD CONSTRAINT `transaction_info_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`user_id`),
  ADD CONSTRAINT `transaction_info_ibfk_2` FOREIGN KEY (`from_wallet_id`) REFERENCES `wallet_info` (`wallet_id`),
  ADD CONSTRAINT `transaction_info_ibfk_3` FOREIGN KEY (`to_wallet_id`) REFERENCES `wallet_info` (`wallet_id`);

--
-- Constraints for table `transaction_payment`
--
ALTER TABLE `transaction_payment`
  ADD CONSTRAINT `transaction_payment_ibfk_1` FOREIGN KEY (`transaction_id`) REFERENCES `transaction_info` (`transaction_id`),
  ADD CONSTRAINT `transaction_payment_ibfk_2` FOREIGN KEY (`merchant_id`) REFERENCES `merchant_info` (`merchant_id`);

--
-- Constraints for table `transaction_refund`
--
ALTER TABLE `transaction_refund`
  ADD CONSTRAINT `transaction_refund_ibfk_1` FOREIGN KEY (`transaction_id`) REFERENCES `transaction_info` (`transaction_id`),
  ADD CONSTRAINT `transaction_refund_ibfk_2` FOREIGN KEY (`original_transaction_id`) REFERENCES `transaction_info` (`transaction_id`);

--
-- Constraints for table `transaction_topup`
--
ALTER TABLE `transaction_topup`
  ADD CONSTRAINT `transaction_topup_ibfk_1` FOREIGN KEY (`transaction_id`) REFERENCES `transaction_info` (`transaction_id`);

--
-- Constraints for table `transaction_transfer`
--
ALTER TABLE `transaction_transfer`
  ADD CONSTRAINT `transaction_transfer_ibfk_1` FOREIGN KEY (`transaction_id`) REFERENCES `transaction_info` (`transaction_id`),
  ADD CONSTRAINT `transaction_transfer_ibfk_2` FOREIGN KEY (`receiver_user_id`) REFERENCES `user_info` (`user_id`);

--
-- Constraints for table `transaction_withdrawal`
--
ALTER TABLE `transaction_withdrawal`
  ADD CONSTRAINT `transaction_withdrawal_ibfk_1` FOREIGN KEY (`transaction_id`) REFERENCES `transaction_info` (`transaction_id`);

--
-- Constraints for table `user_info`
--
ALTER TABLE `user_info`
  ADD CONSTRAINT `user_info_ibfk_1` FOREIGN KEY (`location_id`) REFERENCES `location` (`location_id`);

--
-- Constraints for table `wallet_info`
--
ALTER TABLE `wallet_info`
  ADD CONSTRAINT `wallet_info_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`user_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
