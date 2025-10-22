-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 22, 2025 at 12:49 PM
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
-- Database: `srs_system`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_logs`
--

CREATE TABLE `admin_logs` (
  `id` int(11) NOT NULL,
  `admin_id` int(11) NOT NULL,
  `admin_name` varchar(255) NOT NULL,
  `report_type` enum('Daily Report','Interception Report') NOT NULL,
  `activity` enum('Edit','Delete') NOT NULL,
  `description` text NOT NULL,
  `report_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin_logs`
--

INSERT INTO `admin_logs` (`id`, `admin_id`, `admin_name`, `report_type`, `activity`, `description`, `report_id`, `created_at`) VALUES
(38, 2, 'admin@example.com', 'Interception Report', 'Edit', 'Edited Interception Report (ID: 31) - Changes: Passenger Name: rter → test', 31, '2025-10-21 12:35:53'),
(39, 25, 'admin3@example.com', 'Interception Report', 'Edit', 'Edited Interception Report (ID: 32) - Changes: Shift: 1st Shift → 3rd Shift', 32, '2025-10-21 12:51:44'),
(40, 2, 'admin@example.com', 'Daily Report', 'Delete', 'Deleted Daily Report (ID: 49)', 49, '2025-10-21 13:10:43'),
(41, 2, 'admin@example.com', 'Interception Report', 'Edit', 'Edited Interception Report (ID: 33) - Changes: Passenger Name: te → test name', 33, '2025-10-21 13:10:59'),
(42, 2, 'admin@example.com', 'Interception Report', 'Delete', 'Deleted Interception Report (ID: 33)', 33, '2025-10-21 13:30:53'),
(43, 2, 'admin@example.com', 'Interception Report', 'Edit', 'Edited Interception Report (ID: 36) - Changes: Passenger Name: te → test', 36, '2025-10-21 15:24:46');

-- --------------------------------------------------------

--
-- Table structure for table `daily_reports`
--

CREATE TABLE `daily_reports` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `report_date` date NOT NULL,
  `shift` varchar(50) NOT NULL,
  `team` varchar(50) NOT NULL,
  `screeners_on_duty` int(11) NOT NULL DEFAULT 0,
  `screeners_off` int(11) DEFAULT 0,
  `screeners_on_leave` int(11) DEFAULT 0,
  `screeners_absent` int(11) DEFAULT 0,
  `domestic_departing_flights` int(11) DEFAULT 0,
  `domestic_passengers` int(11) DEFAULT 0,
  `domestic_cancelled_flights` int(11) DEFAULT 0,
  `domestic_affected_passengers` int(11) DEFAULT 0,
  `international_departing_flights` int(11) DEFAULT 0,
  `international_passengers` int(11) DEFAULT 0,
  `international_cancelled_flights` int(11) DEFAULT 0,
  `international_affected_passengers` int(11) DEFAULT 0,
  `blunt_instruments` int(11) DEFAULT 0,
  `liquid_aerosols_gels` int(11) DEFAULT 0,
  `sharp_objects` int(11) DEFAULT 0,
  `workers_tools` int(11) DEFAULT 0,
  `explosives_incendiary` int(11) DEFAULT 0,
  `stunning_devices` int(11) DEFAULT 0,
  `chemical_toxic` int(11) DEFAULT 0,
  `additional_notes` text DEFAULT NULL,
  `image1` varchar(255) DEFAULT NULL,
  `image2` varchar(255) DEFAULT NULL,
  `image3` varchar(255) DEFAULT NULL,
  `image4` varchar(255) DEFAULT NULL,
  `status` varchar(50) NOT NULL DEFAULT 'submitted',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `daily_reports`
--

INSERT INTO `daily_reports` (`id`, `user_id`, `report_date`, `shift`, `team`, `screeners_on_duty`, `screeners_off`, `screeners_on_leave`, `screeners_absent`, `domestic_departing_flights`, `domestic_passengers`, `domestic_cancelled_flights`, `domestic_affected_passengers`, `international_departing_flights`, `international_passengers`, `international_cancelled_flights`, `international_affected_passengers`, `blunt_instruments`, `liquid_aerosols_gels`, `sharp_objects`, `workers_tools`, `explosives_incendiary`, `stunning_devices`, `chemical_toxic`, `additional_notes`, `image1`, `image2`, `image3`, `image4`, `status`, `created_at`, `updated_at`) VALUES
(52, 1, '2025-10-21', '2nd Shift', 'Bravo', 1, 11, 1, 1, 1, 1, 1, 1, 1, 1, 1, 11, 1, 1, 1, 1, 0, 11, 1, '0', 'daily_1_1761060255_1.png', 'daily_1_1761060255_2.png', NULL, NULL, 'submitted', '2025-10-21 15:24:15', '2025-10-21 15:24:15');

-- --------------------------------------------------------

--
-- Table structure for table `interception_reports`
--

CREATE TABLE `interception_reports` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `report_date` date NOT NULL,
  `shift` varchar(50) NOT NULL,
  `team` varchar(50) NOT NULL,
  `passenger_name` varchar(255) NOT NULL,
  `occupation` varchar(255) NOT NULL,
  `flight_number` varchar(50) NOT NULL,
  `destination` varchar(255) DEFAULT NULL,
  `intercepted_item` varchar(255) NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT 1,
  `xray_operator` varchar(255) DEFAULT NULL,
  `baggage_pusher` varchar(255) DEFAULT NULL,
  `remarks` text DEFAULT NULL,
  `image1` varchar(255) DEFAULT NULL,
  `image2` varchar(255) DEFAULT NULL,
  `image3` varchar(255) DEFAULT NULL,
  `image4` varchar(255) DEFAULT NULL,
  `status` varchar(50) NOT NULL DEFAULT 'submitted',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `interception_reports`
--

INSERT INTO `interception_reports` (`id`, `user_id`, `report_date`, `shift`, `team`, `passenger_name`, `occupation`, `flight_number`, `destination`, `intercepted_item`, `quantity`, `xray_operator`, `baggage_pusher`, `remarks`, `image1`, `image2`, `image3`, `image4`, `status`, `created_at`, `updated_at`) VALUES
(36, 1, '2025-10-21', '1st Shift', 'Alpha', 'test', 'tea', 'etw', 'etarsd', 'Suspected Firearms Parts', 500, '0', '', 'test', 'interception_1_1761060238_1.png', 'interception_1_1761060238_2.png', NULL, NULL, 'submitted', '2025-10-21 15:23:58', '2025-10-21 15:24:46');

-- --------------------------------------------------------

--
-- Table structure for table `it_admin_logs`
--

CREATE TABLE `it_admin_logs` (
  `id` int(11) NOT NULL,
  `it_admin_id` int(11) NOT NULL,
  `it_admin_name` varchar(255) NOT NULL,
  `activity` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `it_admin_logs`
--

INSERT INTO `it_admin_logs` (`id`, `it_admin_id`, `it_admin_name`, `activity`, `description`, `created_at`) VALUES
(1, 6, 'itadmin@example.com', 'Add Terminal', 'Created new terminal: NAIA Terminal 5 (Code: terminal5)', '2025-10-21 22:29:12'),
(2, 6, 'itadmin@example.com', 'Add User', 'Created new user: test@sam.com (Role: user, Full Name: test sam)', '2025-10-21 22:29:42'),
(3, 6, 'itadmin@example.com', 'Edit User', 'Updated user: test1@sam.com (Role: user, Full Name: test sam)', '2025-10-21 22:29:54'),
(4, 6, 'itadmin@example.com', 'Edit User', 'Updated user: test123@sam.com (Role: user, Full Name: test c)', '2025-10-21 22:30:24'),
(5, 6, 'itadmin@example.com', 'Delete User', 'Deleted user: test123@sam.com (Role: user, Full Name: test c)', '2025-10-21 22:30:42'),
(6, 6, 'itadmin@example.com', 'Edit Terminal', 'Updated terminal: NAIA Terminal 6 (Code: terminal6)', '2025-10-21 22:31:02'),
(7, 6, 'itadmin@example.com', 'Delete Terminal', 'Deleted terminal: NAIA Terminal 6 (Code: terminal6)', '2025-10-21 22:31:14'),
(8, 6, 'itadmin@example.com', 'Add Terminal', 'Created new terminal: NAIA Terminal 5 (Code: terminal5)', '2025-10-21 23:26:02'),
(9, 6, 'itadmin@example.com', 'Edit Terminal', 'Updated terminal: NAIA Terminal 6 (Code: terminal6)', '2025-10-21 23:26:23'),
(10, 6, 'itadmin@example.com', 'Add User', 'Created new user: test@sam.com (Role: user, Full Name: Test Subject1)', '2025-10-21 23:26:53'),
(11, 6, 'itadmin@example.com', 'Edit User', 'Updated user: test@sam.com (Role: user, Full Name: Test Subject2)', '2025-10-21 23:27:27'),
(12, 6, 'itadmin@example.com', 'Delete User', 'Deleted user: test@sam.com (Role: user, Full Name: Test Subject2)', '2025-10-21 23:27:38'),
(13, 6, 'itadmin@example.com', 'Delete Terminal', 'Deleted terminal: NAIA Terminal 6 (Code: terminal6)', '2025-10-21 23:27:45');

-- --------------------------------------------------------

--
-- Table structure for table `personnel_overview`
--

CREATE TABLE `personnel_overview` (
  `id` int(11) NOT NULL,
  `terminal_code` varchar(50) NOT NULL,
  `terminal_chief` varchar(255) DEFAULT 'Captain Chris',
  `total_personnel` int(11) DEFAULT 100,
  `total_sso` int(11) DEFAULT 42,
  `airport_clerk` int(11) DEFAULT 2,
  `shift_in_charges` int(11) DEFAULT 4,
  `checkpoint_supervisors` int(11) DEFAULT 6,
  `sso_male` int(11) DEFAULT 24,
  `sso_female` int(11) DEFAULT 6,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `personnel_overview`
--

INSERT INTO `personnel_overview` (`id`, `terminal_code`, `terminal_chief`, `total_personnel`, `total_sso`, `airport_clerk`, `shift_in_charges`, `checkpoint_supervisors`, `sso_male`, `sso_female`, `created_at`, `updated_at`) VALUES
(1, 'terminal1', 'Let me sleep please', 2, 2, 2, 2, 2, 2, 2, '2025-10-21 09:09:41', '2025-10-21 15:19:30'),
(14, 'terminal2', 'Test Terminal 2', 3, 3, 3, 3, 3, 3, 3, '2025-10-21 11:48:21', '2025-10-21 12:06:40'),
(20, 'terminal3', 'Admin 3 Test', 5, 5, 5, 5, 5, 5, 5, '2025-10-21 12:09:37', '2025-10-21 12:09:37');

-- --------------------------------------------------------

--
-- Table structure for table `terminals`
--

CREATE TABLE `terminals` (
  `id` int(11) NOT NULL,
  `terminal_name` varchar(100) NOT NULL,
  `terminal_code` varchar(50) NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `terminals`
--

INSERT INTO `terminals` (`id`, `terminal_name`, `terminal_code`, `description`, `created_at`, `updated_at`) VALUES
(1, 'NAIA Terminal 1', 'terminal1', 'Ninoy Aquino International Airport Terminal 1', '2025-10-19 20:47:59', '2025-10-19 20:47:59'),
(2, 'NAIA Terminal 2', 'terminal2', 'Ninoy Aquino International Airport Terminal 2', '2025-10-19 20:47:59', '2025-10-19 20:47:59'),
(7, 'NAIA Terminal 3', 'terminal3', 'Ninoy Aquino International Airport Terminal 3', '2025-10-19 21:45:03', '2025-10-19 23:15:03'),
(8, 'NAIA Terminal 4', 'terminal4', 'Ninoy Aquino International Airport Terminal 4', '2025-10-19 23:14:19', '2025-10-19 23:15:16');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `role` enum('user','admin','executive','it_admin') NOT NULL DEFAULT 'user',
  `terminal_assignment` varchar(50) DEFAULT 'terminal1',
  `full_name` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password_hash`, `role`, `terminal_assignment`, `full_name`, `created_at`, `updated_at`) VALUES
(1, 'user@example.com', '$2y$10$DuvUKtYwQT77Gsrb1EiVNu7lhsDznLZgY5iyT4e1fdH7PZOM7yZG2', 'user', 'terminal1', 'Christian Arrhol Sabijon', '2025-10-07 07:49:11', '2025-10-18 05:40:03'),
(2, 'admin@example.com', '$2y$10$eZtygzuI/KaEI2BU1jhRtuS/CnV8wctkXsPPMin5f3sPgxMynCZBu', 'admin', 'terminal1', 'Admin User', '2025-10-07 07:49:11', '2025-10-07 07:52:18'),
(3, 'executive@example.com', '$2y$10$hKtKlOlWrCXa3dihUZ.jIOmbCguF1IdmSfIZLk8aSRxqGkJK84r7S', 'executive', 'terminal1', 'Executive User', '2025-10-07 07:49:11', '2025-10-07 07:52:28'),
(6, 'itadmin@example.com', '$2y$10$8iaXcGbeeNz/.RYuf9eEmuwGWoPNEJM.uXhWQX9ggDDcXlIt2SKda', 'it_admin', 'terminal1', 'IT Administrator', '2025-10-18 04:57:02', '2025-10-20 13:56:11'),
(21, 'itadmin1@example.com', '$2y$10$0nICySoNexp7ue1DuRXDterQgL2h16n.lTObxnedXYIsj/Gdtf/9a', 'it_admin', 'terminal1', 'IT Admin Backup', '2025-10-20 13:55:22', '2025-10-20 13:55:22'),
(23, 't2user@example.com', '$2y$10$WYKBwelxjWr.S8GPw4SiU.CfX.dRX8L.Cy/i10ggZMHd2zkHppMbK', 'user', 'terminal2', 'Terminal Two', '2025-10-21 04:29:20', '2025-10-21 04:29:20'),
(24, 't2admin@example.com', '$2y$10$JrNdG/jHn1G8yRLitTNUXeOGvAjaO23QhuPh69NbX1Db7.b51NQOS', 'admin', 'terminal2', 'Terminal Two Admin', '2025-10-21 04:30:18', '2025-10-21 04:30:18'),
(25, 'admin3@example.com', '$2y$10$0qB67U/humS/mg/AAtZzje4K/mxIzIAFV05lLsp3m6o8uULP7JUfu', 'admin', 'terminal3', 'Admin 3', '2025-10-21 12:08:55', '2025-10-21 12:08:55'),
(26, 'user3@example.com', '$2y$10$1OaSjsGZbF3nQ9hhUFVui.tKXgrU99iK1a.ZLFCUSsNsQ3N3UvQgS', 'user', 'terminal3', 'user 3', '2025-10-21 12:09:13', '2025-10-21 12:09:13');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_logs`
--
ALTER TABLE `admin_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `admin_id` (`admin_id`),
  ADD KEY `created_at` (`created_at`);

--
-- Indexes for table `daily_reports`
--
ALTER TABLE `daily_reports`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `report_date` (`report_date`),
  ADD KEY `status` (`status`);

--
-- Indexes for table `interception_reports`
--
ALTER TABLE `interception_reports`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `report_date` (`report_date`),
  ADD KEY `status` (`status`);

--
-- Indexes for table `it_admin_logs`
--
ALTER TABLE `it_admin_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_it_admin_id` (`it_admin_id`),
  ADD KEY `idx_created_at` (`created_at`);

--
-- Indexes for table `personnel_overview`
--
ALTER TABLE `personnel_overview`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_terminal` (`terminal_code`);

--
-- Indexes for table `terminals`
--
ALTER TABLE `terminals`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `terminal_code` (`terminal_code`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD KEY `idx_users_terminal_assignment` (`terminal_assignment`),
  ADD KEY `idx_users_role` (`role`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_logs`
--
ALTER TABLE `admin_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `daily_reports`
--
ALTER TABLE `daily_reports`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `interception_reports`
--
ALTER TABLE `interception_reports`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `it_admin_logs`
--
ALTER TABLE `it_admin_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `personnel_overview`
--
ALTER TABLE `personnel_overview`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `terminals`
--
ALTER TABLE `terminals`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `daily_reports`
--
ALTER TABLE `daily_reports`
  ADD CONSTRAINT `daily_reports_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `interception_reports`
--
ALTER TABLE `interception_reports`
  ADD CONSTRAINT `interception_reports_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `it_admin_logs`
--
ALTER TABLE `it_admin_logs`
  ADD CONSTRAINT `it_admin_logs_ibfk_1` FOREIGN KEY (`it_admin_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
