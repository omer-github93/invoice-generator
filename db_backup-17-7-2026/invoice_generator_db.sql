-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 17, 2026 at 07:05 PM
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
-- Database: `invoice_generator_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `clients`
--

CREATE TABLE `clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `clients`
--

INSERT INTO `clients` (`id`, `name`, `email`, `phone`, `created_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Ruby', NULL, '07505594999', 2, '2025-11-14 12:06:54', '2025-11-14 12:06:54', NULL),
(2, 'Rizgar Taha', 'rizgar.taha@arizanti.com', '07503034547', 2, '2025-11-14 12:08:12', '2025-11-14 12:08:12', NULL),
(3, 'Biner', 'biner@arminas-iraq.com', '07504457513', 2, '2025-11-14 12:10:13', '2025-11-14 12:10:13', NULL),
(4, 'Derin', 'derin@azinda.com', '07507385921', 2, '2025-11-14 12:11:26', '2025-11-14 12:11:26', NULL),
(5, 'Dlzar', 'ceo@createpulsepharma.com', '07504731486', 2, '2025-11-14 12:12:40', '2025-11-14 12:12:40', NULL),
(6, 'Hezha', 'hezha@ishtar-north.com', '07501092636', 2, '2025-11-14 12:13:43', '2025-11-14 12:13:43', NULL),
(7, 'Hiwa Blbas', NULL, '07504971842', 2, '2025-11-14 12:14:20', '2025-11-14 12:14:20', NULL),
(8, 'Karwan Mohammed', 'karwan@arminas-iraq.com', '07504901781', 2, '2025-11-14 12:15:12', '2025-11-14 12:15:12', NULL),
(9, 'Mohammed Aziz (Hamada)', NULL, '07504781245', 2, '2025-11-14 12:16:09', '2025-11-14 12:16:09', NULL),
(10, 'Ranjdar', NULL, '07504214467', 2, '2025-11-14 12:16:45', '2025-11-14 12:16:45', NULL),
(11, 'Safin', NULL, '07507003580', 2, '2025-11-14 12:17:23', '2025-11-14 12:17:23', NULL),
(12, 'Mohammed Foud', NULL, '07505214441', 2, '2025-11-14 12:18:02', '2025-11-14 12:18:02', NULL),
(13, 'Yazan', 'yazan@nawassi.com', '07515266107', 2, '2025-11-14 12:18:40', '2025-11-14 12:18:40', NULL),
(14, 'Viyan', 'info@deepmonday.com', '07507434995', 2, '2025-12-25 18:39:36', '2025-12-25 18:39:36', NULL),
(15, 'Eng. Mohammed Sabah', NULL, NULL, 2, '2026-03-26 15:34:24', '2026-03-26 15:34:24', NULL),
(16, 'Zana Adnan', 'info@bosalaalthahabia.com', '07502022812', 2, '2026-04-30 04:52:27', '2026-04-30 04:52:27', NULL),
(17, 'Mazloum', 'mazloum@ultra-movers.com', '+964 750 916 1001', 2, '2026-05-30 09:18:45', '2026-05-30 09:18:45', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `client_company`
--

CREATE TABLE `client_company` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `company_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `client_company`
--

INSERT INTO `client_company` (`id`, `client_id`, `company_id`, `created_at`, `updated_at`) VALUES
(1, 1, 13, '2025-11-14 12:06:54', '2025-11-14 12:06:54'),
(2, 2, 2, '2025-11-14 12:08:12', '2025-11-14 12:08:12'),
(3, 3, 3, '2025-11-14 12:10:13', '2025-11-14 12:10:13'),
(4, 4, 5, '2025-11-14 12:11:26', '2025-11-14 12:11:26'),
(5, 5, 19, '2025-11-14 12:12:40', '2025-11-14 12:12:40'),
(6, 5, 14, '2025-11-14 12:12:40', '2025-11-14 12:12:40'),
(7, 5, 11, '2025-11-14 12:12:40', '2025-11-14 12:12:40'),
(8, 5, 10, '2025-11-14 12:12:40', '2025-11-14 12:12:40'),
(9, 5, 9, '2025-11-14 12:12:40', '2025-11-14 12:12:40'),
(10, 5, 8, '2025-11-14 12:12:40', '2025-11-14 12:12:40'),
(11, 5, 7, '2025-11-14 12:12:40', '2025-11-14 12:12:40'),
(12, 5, 6, '2025-11-14 12:12:40', '2025-11-14 12:12:40'),
(13, 6, 12, '2025-11-14 12:13:43', '2025-11-14 12:13:43'),
(14, 7, 16, '2025-11-14 12:14:20', '2025-11-14 12:14:20'),
(15, 7, 17, '2025-11-14 12:14:21', '2025-11-14 12:14:21'),
(16, 8, 4, '2025-11-14 12:15:13', '2025-11-14 12:15:13'),
(17, 9, 21, '2025-11-14 12:16:09', '2025-11-14 12:16:09'),
(18, 10, 1, '2025-11-14 12:16:45', '2025-11-14 12:16:45'),
(19, 11, 20, '2025-11-14 12:17:23', '2025-11-14 12:17:23'),
(20, 12, 18, '2025-11-14 12:18:02', '2025-11-14 12:18:02'),
(21, 13, 15, '2025-11-14 12:18:40', '2025-11-14 12:18:40'),
(22, 14, 22, '2025-12-25 18:39:36', '2025-12-25 18:39:36'),
(23, 15, 23, '2026-03-26 15:34:24', '2026-03-26 15:34:24'),
(24, 16, 24, '2026-04-30 04:52:27', '2026-04-30 04:52:27'),
(25, 9, 25, '2026-05-05 09:28:21', '2026-05-05 09:28:21'),
(27, 17, 26, '2026-05-30 09:21:30', '2026-05-30 09:21:30');

-- --------------------------------------------------------

--
-- Table structure for table `companies`
--

CREATE TABLE `companies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `logo_path` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `companies`
--

INSERT INTO `companies` (`id`, `name`, `logo_path`, `address`, `created_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Almadar', NULL, 'Erbil, Iraq', 2, '2025-11-14 11:16:51', '2025-11-14 11:16:51', NULL),
(2, 'Arizanti', 'uploads/company/VJ1b3q6WTqMClnKcsUnW6psSC8UKrM8Z1fWEtvV1.png', 'Shoresh Street, Erbil, Iraq', 2, '2025-11-14 11:20:19', '2025-11-14 11:20:19', NULL),
(3, 'Arminas', 'uploads/company/f2B3HSiKMqo6osc4Rh6c6NilyO1awa2YGO2pqGXc.png', 'Shoresh Street, Erbil, Iraq', 2, '2025-11-14 11:22:33', '2025-11-14 11:22:33', NULL),
(4, 'Arminas Luxury', 'uploads/company/YIyRqpaZ6UOLCP43uMvyLLElgLpMHvYMyOeWMGs0.png', 'Shoresh Street, Erbil, Iraq', 2, '2025-11-14 11:23:10', '2025-11-14 11:23:10', NULL),
(5, 'Azinda', 'uploads/company/dC3MyaVqppcEp5RKYno5Nlg4fF6vKydYoYQd3joP.png', 'Shoresh Street, Erbil, Iraq', 2, '2025-11-14 11:24:21', '2025-11-14 11:24:21', NULL),
(6, 'CreatePulsePharma', NULL, '4 Towers, Erbil, Iraq', 2, '2025-11-14 11:26:16', '2025-11-14 11:26:16', NULL),
(7, 'Criivo', NULL, 'Germany', 2, '2025-11-14 11:27:09', '2025-11-14 11:27:09', NULL),
(8, 'Dermivy', 'uploads/company/PbyrfhCk6Z4aDtWOB2kdArZdhC7wCasYzXitQEVQ.png', 'R??hrstra??e 15, 99423, Weimar, Germany', 2, '2025-11-14 11:28:59', '2025-11-14 11:28:59', NULL),
(9, 'Enzymebureau', NULL, 'Germany', 2, '2025-11-14 11:29:55', '2025-11-14 11:29:55', NULL),
(10, 'ExcelBioLife', NULL, 'Germany', 2, '2025-11-14 11:30:24', '2025-11-14 11:30:24', NULL),
(11, 'Hedzco', 'uploads/company/smkniMHIko8hxoX1Ra9WrdlJl6j9h475U5I5YoOD.jpg', 'Germany', 2, '2025-11-14 11:33:05', '2025-11-14 11:33:05', NULL),
(12, 'Ishtar North', 'uploads/company/nRYZEQUUKLgs91mAv1kjqB7uiHTsmHSFIIKCXToQ.png', 'Street 120 - opposite Hawler New-A39, Erbil, Iraq', 2, '2025-11-14 11:34:51', '2025-11-14 11:34:51', NULL),
(13, 'Massairaq', NULL, NULL, 2, '2025-11-14 11:35:19', '2025-11-14 11:35:19', NULL),
(14, 'Medzpharma', 'uploads/company/ejLgfAONHkW3lJGw2fdeVCwI4bz6E02kL2Br0mZm.png', 'Germany', 2, '2025-11-14 11:37:09', '2025-11-14 11:37:09', NULL),
(15, 'Nawassi', NULL, 'Shoresh Street, Erbil, Iraq', 2, '2025-11-14 11:38:03', '2025-11-14 11:38:03', NULL),
(16, 'Quartier Francais', NULL, 'Erbil, Iraq', 2, '2025-11-14 11:38:43', '2025-11-14 11:38:43', NULL),
(17, 'Queen Towers', NULL, 'Erbil, Iraq', 2, '2025-11-14 11:39:00', '2025-11-14 11:39:00', NULL),
(18, 'Skyllatrans', 'uploads/company/Me7hxGn8ueIsxg28Mn8mhgVrlJ3n1MseZ2wtiubQ.png', 'Shoresh Street, Erbil, Iraq', 2, '2025-11-14 11:40:07', '2025-11-14 11:40:07', NULL),
(19, 'Themega', NULL, 'Dubai, UAE', 2, '2025-11-14 11:40:50', '2025-11-14 11:40:50', NULL),
(20, 'Zhyar', 'uploads/company/gPJG41BnMO5asn8PSOndpH5pwJXzhvKd5tvEaDCW.jpg', '?????????? ????????????: ???????????? ???????????????? - ???????????????? ?????????????? - ???????????? ??????????????', 2, '2025-11-14 11:42:01', '2025-11-14 11:42:01', NULL),
(21, 'Zonnlighting', 'uploads/company/UfooWOPwzYpWQjWUWPuwDS20OwdzwshBAUKAZoCI.png', 'Koya Road, Setaqan Square Traffic, Kurdistan Region, Erbil, Iraq', 2, '2025-11-14 11:43:55', '2025-11-14 11:43:55', NULL),
(22, 'Deep Monday', NULL, 'Erbil, EMPIRE Business Buildings', 2, '2025-12-25 18:38:53', '2025-12-25 18:38:53', NULL),
(23, 'Seepa Company', NULL, NULL, 2, '2026-03-26 15:33:41', '2026-03-26 15:33:41', NULL),
(24, 'Bosalaalthahabia', 'uploads/company/veciMq8cOg7DpShhBQYgHwFs84c1eY3BH3p7Fxib.png', 'Building A, floor 15, Apartment 5, MRF Quatro, Erbil, Iraq', 2, '2026-04-30 04:51:35', '2026-04-30 04:51:35', NULL),
(25, 'Mada Lighting', NULL, 'Setaqan, Erbil, Iraq', 2, '2026-05-05 09:27:44', '2026-05-05 09:27:44', NULL),
(26, 'Ultra Movers', 'uploads/company/hbfQXQmG32BqPQZxgOKUmNnvKn3ELzmHbpIUNuQN.jpg', 'Erbil - Mosul Road, behind Justice Tower', 2, '2026-05-30 09:21:12', '2026-05-30 09:21:12', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoices`
--

CREATE TABLE `invoices` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `invoice_number` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `due_date` date DEFAULT NULL,
  `payment_terms` enum('cash','credit card','bank transfer') NOT NULL DEFAULT 'cash',
  `status` enum('draft','unpaid','partially_paid','paid','overdue','cancelled') NOT NULL DEFAULT 'draft',
  `subtotal` decimal(15,2) NOT NULL DEFAULT 0.00,
  `tax_amount` decimal(15,2) NOT NULL DEFAULT 0.00,
  `total` decimal(15,2) NOT NULL DEFAULT 0.00,
  `balance_due` decimal(15,2) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `attachments` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`attachments`)),
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `invoices`
--

INSERT INTO `invoices` (`id`, `company_id`, `client_id`, `invoice_number`, `date`, `due_date`, `payment_terms`, `status`, `subtotal`, `tax_amount`, `total`, `balance_due`, `note`, `attachments`, `created_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 20, 11, '#ALPA-2020-01', '2020-05-28', NULL, 'cash', 'paid', 0.00, 0.00, 0.00, NULL, NULL, '[]', 2, '2025-11-14 12:22:01', '2025-11-14 12:22:01', NULL),
(2, 20, 11, '#ALPA-2020-02', '2020-09-09', NULL, 'cash', 'paid', 300.00, 0.00, 300.00, NULL, 'Created a Webhost for (3 years)', '[]', 2, '2025-11-14 12:26:53', '2025-11-14 12:26:53', NULL),
(3, 20, 11, '#ALPA-2020-03', '2021-02-21', NULL, 'cash', 'paid', 70.00, 0.00, 70.00, NULL, 'Domain Renewal (Zhyar.org) for (3 years)', '[]', 2, '2025-11-14 12:30:12', '2025-11-14 12:30:12', NULL),
(4, 20, 11, '#ALPA-2020-04', '2021-01-01', NULL, 'cash', 'paid', 400.00, 0.00, 400.00, NULL, NULL, '[]', 2, '2025-11-14 12:33:15', '2025-11-14 12:33:15', NULL),
(5, 14, 5, '#ALPA-2020-05', '2020-12-31', NULL, 'cash', 'paid', 650.00, 0.00, 650.00, NULL, 'Design & Build Custom Website for Medzpharma', '[]', 2, '2025-11-14 12:36:20', '2025-11-14 12:36:20', NULL),
(6, 14, 5, '#ALPA-2020-06', '2020-01-15', NULL, 'cash', 'paid', 6.40, 0.00, 6.40, NULL, NULL, '[]', 2, '2025-11-14 12:39:21', '2025-11-14 12:39:21', NULL),
(7, 6, 5, '#ALPA-2020-07', '2020-01-15', NULL, 'cash', 'paid', 8.86, 0.00, 8.86, NULL, NULL, '[]', 2, '2025-11-14 12:40:26', '2025-11-14 12:40:26', NULL),
(8, 9, 5, '#ALPA-2020-08', '2020-01-15', NULL, 'cash', 'paid', 7.28, 0.00, 7.28, NULL, NULL, '[]', 2, '2025-11-14 12:41:53', '2025-11-14 12:41:53', NULL),
(9, 14, 5, '#ALPA-2020-09', '2020-03-30', NULL, 'cash', 'paid', 8.98, 0.00, 8.98, NULL, NULL, '[]', 2, '2025-11-14 12:42:56', '2025-11-14 12:42:56', NULL),
(10, 1, 10, '#ALPA-2021-01', '2021-03-27', NULL, 'cash', 'unpaid', 10.99, 0.00, 10.99, 10.99, 'I have cleared this payment!!', '[]', 2, '2025-11-14 12:45:02', '2025-11-14 12:45:02', NULL),
(11, 6, 5, '#ALPA-2021-02', '2021-06-30', NULL, 'cash', 'paid', 13.16, 0.00, 13.16, NULL, NULL, '[]', 2, '2025-11-14 12:46:44', '2025-11-14 12:46:44', NULL),
(12, 10, 5, '#ALPA-2021-03', '2021-07-02', NULL, 'cash', 'paid', 6.98, 0.00, 6.98, NULL, NULL, '[]', 2, '2025-11-14 12:47:35', '2025-11-14 12:47:35', NULL),
(13, 14, 5, '#ALPA-2021-04', '2021-07-07', NULL, 'cash', 'paid', 13.16, 0.00, 13.16, NULL, NULL, '[]', 2, '2025-11-14 12:48:22', '2025-11-14 12:48:22', NULL),
(14, 9, 5, '#ALPA-2021-05', '2021-07-11', NULL, 'cash', 'paid', 13.16, 0.00, 13.16, NULL, NULL, '[]', 2, '2025-11-14 12:48:54', '2025-11-14 12:48:54', NULL),
(15, 6, 5, '#ALPA-2021-06', '2021-08-04', NULL, 'cash', 'paid', 108.00, 0.00, 108.00, NULL, NULL, '[]', 2, '2025-11-14 12:51:15', '2025-11-14 12:51:15', NULL),
(16, 14, 5, '#ALPA-2022-01', '2022-01-15', NULL, 'cash', 'paid', 300.00, 0.00, 300.00, NULL, 'Webhost for 3 years', '[]', 2, '2025-11-14 12:54:56', '2025-11-14 12:54:56', NULL),
(17, 14, 5, '#ALPA-2022-02', '2022-03-29', NULL, 'cash', 'paid', 35.00, 0.00, 35.00, NULL, NULL, '[]', 2, '2025-11-14 12:56:02', '2025-11-14 12:56:02', NULL),
(18, 14, 5, '#ALPA-2022-03', '2022-05-29', NULL, 'cash', 'paid', 15.00, 0.00, 15.00, NULL, NULL, '[]', 2, '2025-11-14 12:57:13', '2025-11-14 12:57:13', NULL),
(19, 6, 5, '#ALPA-2022-04', '2022-05-29', NULL, 'cash', 'paid', 15.00, 0.00, 15.00, NULL, NULL, '[]', 2, '2025-11-14 12:58:11', '2025-11-14 12:58:11', NULL),
(20, 9, 5, '#ALPA-2022-05', '2022-05-29', NULL, 'cash', 'paid', 15.00, 0.00, 15.00, NULL, NULL, '[]', 2, '2025-11-14 12:59:17', '2025-11-14 12:59:17', NULL),
(21, 10, 5, '#ALPA-2022-06', '2022-08-20', NULL, 'cash', 'paid', 15.00, 0.00, 15.00, NULL, NULL, '[]', 2, '2025-11-14 13:00:19', '2025-11-14 13:00:19', NULL),
(22, 11, 5, '#ALPA-2022-07', '2022-08-20', NULL, 'cash', 'paid', 10.00, 0.00, 10.00, NULL, NULL, '[]', 2, '2025-11-14 13:01:28', '2025-11-14 13:01:28', NULL),
(23, 6, 5, '#ALPA-2022-08', '2022-08-20', NULL, 'cash', 'paid', 120.00, 0.00, 120.00, NULL, NULL, '[]', 2, '2025-11-14 13:02:32', '2025-11-14 13:02:32', NULL),
(24, 11, 5, '#ALPA-2022-09', '2022-09-01', NULL, 'cash', 'paid', 300.00, 0.00, 300.00, NULL, 'Web Host for 3 Years', '[]', 2, '2025-11-14 13:03:39', '2025-11-14 13:03:39', NULL),
(25, 17, 7, '#ALPA-2022-10', '2022-11-02', NULL, 'cash', 'paid', 25.00, 0.00, 25.00, NULL, NULL, '[]', 2, '2025-11-14 13:05:21', '2025-11-14 13:05:21', NULL),
(26, 14, 5, '#ALPA-2023-01', '2023-03-29', NULL, 'cash', 'paid', 20.00, 0.00, 20.00, NULL, NULL, '[]', 2, '2025-11-14 13:07:54', '2025-11-14 13:07:54', NULL),
(27, 17, 7, '#ALPA-2023-02', '2023-03-06', NULL, 'cash', 'paid', 30.00, 0.00, 30.00, NULL, NULL, '[]', 2, '2025-11-14 13:09:17', '2025-11-14 13:09:17', NULL),
(28, 6, 5, '#ALPA-2023-03', '2023-06-05', NULL, 'cash', 'paid', 25.00, 0.00, 25.00, NULL, NULL, '[]', 2, '2025-11-14 13:10:35', '2025-11-14 13:10:35', NULL),
(29, 14, 5, '#ALPA-2023-04', '2023-06-05', NULL, 'cash', 'paid', 25.00, 0.00, 25.00, NULL, NULL, '[]', 2, '2025-11-14 13:11:23', '2025-11-14 13:11:23', NULL),
(30, 14, 5, '#ALPA-2023-05', '2023-08-15', NULL, 'cash', 'paid', 20.00, 0.00, 20.00, NULL, NULL, '[]', 2, '2025-11-14 13:12:13', '2025-11-14 13:12:13', NULL),
(31, 6, 5, '#ALPA-2023-06', '2023-09-09', NULL, 'cash', 'paid', 200.00, 0.00, 200.00, NULL, NULL, '[]', 2, '2025-11-14 13:12:59', '2025-11-14 13:12:59', NULL),
(32, 20, 11, '#ALPA-2023-07', '2023-09-14', NULL, 'cash', 'paid', 412.00, 0.00, 412.00, NULL, NULL, '[]', 2, '2025-11-14 13:13:46', '2025-11-14 13:13:46', NULL),
(33, 17, 7, '#ALPA-2023-08', '2023-10-30', NULL, 'cash', 'paid', 25.00, 0.00, 25.00, NULL, NULL, '[]', 2, '2025-11-14 13:14:29', '2025-11-14 13:14:29', NULL),
(34, 7, 5, '#ALPA-2023-09', '2023-11-14', NULL, 'cash', 'paid', 8.00, 0.00, 8.00, NULL, NULL, '[]', 2, '2025-11-14 13:15:15', '2025-11-14 13:15:15', NULL),
(35, 8, 5, '#ALPA-2023-10', '2023-11-22', NULL, 'cash', 'paid', 16.00, 0.00, 16.00, NULL, NULL, '[]', 2, '2025-11-14 13:16:05', '2025-11-14 13:16:05', NULL),
(36, 13, 1, '#ALPA-2024-01', '2024-01-06', NULL, 'cash', 'paid', 100.00, 0.00, 100.00, NULL, NULL, '[]', 2, '2025-11-14 13:18:28', '2025-11-14 13:23:14', NULL),
(37, 6, 5, '#ALPA-2024-02', '2024-01-20', NULL, 'cash', 'paid', 32.00, 0.00, 32.00, NULL, NULL, '[]', 2, '2025-11-14 13:29:40', '2025-11-14 13:29:40', NULL),
(38, 17, 7, '#ALPA-2024-03', '2024-03-06', NULL, 'cash', 'paid', 30.00, 0.00, 30.00, NULL, NULL, '[]', 2, '2025-11-14 13:30:48', '2025-12-25 19:22:16', NULL),
(39, 21, 9, '#ALPA-2024-04', '2024-03-25', NULL, 'cash', 'paid', 32.00, 0.00, 32.00, NULL, NULL, '[]', 2, '2025-11-14 13:32:03', '2025-11-14 13:32:03', NULL),
(40, 14, 5, '#ALPA-2024-05', '2024-03-30', NULL, 'cash', 'paid', 20.00, 0.00, 20.00, NULL, NULL, '[]', 2, '2025-11-14 14:37:09', '2025-11-14 14:37:09', NULL),
(41, 20, 11, '#ALPA-2024-06', '2024-03-15', NULL, 'cash', 'paid', 33.00, 0.00, 33.00, NULL, NULL, '[]', 2, '2025-11-14 14:37:58', '2025-11-14 14:37:58', NULL),
(42, 12, 6, '#ALPA-2024-07', '2024-03-23', NULL, 'cash', 'paid', 835.00, 0.00, 835.00, NULL, NULL, '[]', 2, '2025-11-14 14:38:46', '2025-11-14 14:40:54', NULL),
(43, 21, 9, '#ALPA-2024-08', '2024-04-02', NULL, 'cash', 'paid', 155.00, 0.00, 155.00, NULL, 'SSL Certificate for (5 years)', '[]', 2, '2025-11-14 14:43:09', '2025-11-14 14:43:09', NULL),
(44, 8, 5, '#ALPA-2024-09', '2024-07-23', NULL, 'cash', 'paid', 75.00, 0.00, 75.00, NULL, NULL, '[]', 2, '2025-11-14 14:44:24', '2025-11-14 14:44:24', NULL),
(45, 21, 9, '#ALPA-2024-10', '2024-03-09', NULL, 'cash', 'paid', 60.00, 0.00, 60.00, NULL, 'With 3 months of support', '[]', 2, '2025-11-14 14:46:04', '2025-11-14 14:46:04', NULL),
(46, 11, 5, '#ALPA-2024-11', '2024-08-20', NULL, 'cash', 'paid', 20.00, 0.00, 20.00, NULL, NULL, '[]', 2, '2025-11-14 14:47:07', '2025-11-14 14:47:07', NULL),
(47, 20, 11, '#ALPA-2024-12', '2024-09-21', NULL, 'cash', 'paid', 212.00, 0.00, 212.00, NULL, 'Renew for (6 Months)', '[]', 2, '2025-11-14 14:48:15', '2025-11-14 14:48:15', NULL),
(48, 6, 5, '#ALPA-2024-13', '2024-09-30', NULL, 'cash', 'paid', 155.00, 0.00, 155.00, NULL, NULL, '[]', 2, '2025-11-14 14:49:19', '2025-11-14 14:49:19', NULL),
(49, 15, 13, '#ALPA-2024-14', '2024-10-15', NULL, 'cash', 'paid', 220.00, 0.00, 220.00, NULL, NULL, '[]', 2, '2025-11-14 14:50:59', '2025-11-14 14:50:59', NULL),
(50, 5, 4, '#ALPA-2024-15', '2024-11-15', NULL, 'cash', 'paid', 226.00, 0.00, 226.00, NULL, 'SSL Certificate for (5 Years)', '[]', 2, '2025-11-14 14:52:27', '2025-11-14 14:52:27', NULL),
(51, 7, 5, '#ALPA-2024-16', '2024-11-14', NULL, 'cash', 'paid', 20.00, 0.00, 20.00, NULL, NULL, '[]', 2, '2025-11-14 14:53:31', '2025-11-14 14:53:31', NULL),
(52, 8, 5, '#ALPA-2024-17', '2024-11-22', NULL, 'cash', 'paid', 35.00, 0.00, 35.00, NULL, NULL, '[]', 2, '2025-11-14 14:54:50', '2025-11-14 14:54:50', NULL),
(53, 20, 11, '#ALPA-2024-18', '2024-11-14', NULL, 'cash', 'paid', 600.00, 0.00, 600.00, NULL, 'With (6 months) of Support', '[]', 2, '2025-11-14 14:56:28', '2025-11-14 14:56:28', NULL),
(54, 14, 5, '#ALPA-2025-01', '2025-01-06', NULL, 'cash', 'paid', 75.00, 0.00, 75.00, NULL, 'Instead of paying $268.2/year to Bluehost or $719.64/ 3 years', '[]', 2, '2025-11-14 14:59:44', '2025-11-14 14:59:44', NULL),
(55, 8, 5, '#ALPA-2025-02', '2025-01-01', NULL, 'cash', 'paid', 550.00, 0.00, 550.00, NULL, NULL, '[]', 2, '2025-11-14 15:00:41', '2025-11-14 15:00:41', NULL),
(56, 11, 5, '#ALPA-2025-03', '2025-01-01', NULL, 'cash', 'paid', 450.00, 0.00, 450.00, NULL, NULL, '[]', 2, '2025-11-14 15:01:23', '2025-11-14 15:01:23', NULL),
(57, 3, 3, '#ALPA-2025-04', '2025-01-17', NULL, 'cash', 'paid', 219.95, 0.00, 219.95, NULL, 'SSL Certificate (5 Years)', '[]', 2, '2025-11-14 15:02:56', '2025-11-14 15:02:56', NULL),
(58, 4, 8, '#ALPA-2025-05', '2025-02-20', NULL, 'cash', 'paid', 1500.00, 0.00, 1500.00, NULL, NULL, '[]', 2, '2025-11-14 15:03:58', '2025-11-14 15:03:58', NULL),
(59, 21, 9, '#ALPA-2025-06', '2025-04-06', NULL, 'cash', 'paid', 32.00, 0.00, 32.00, NULL, NULL, '[]', 2, '2025-11-14 15:05:38', '2025-11-14 15:05:38', NULL),
(60, 12, 6, '#ALPA-2025-07', '2025-03-23', NULL, 'cash', 'paid', 202.00, 0.00, 202.00, NULL, 'SSL Certificate for (5 Years)', '[]', 2, '2025-11-14 15:07:29', '2025-11-14 15:07:29', NULL),
(61, 20, 11, '#ALPA-2025-08', '2025-03-04', NULL, 'cash', 'paid', 33.00, 0.00, 33.00, NULL, NULL, '[]', 2, '2025-11-14 15:08:55', '2025-11-14 15:08:55', NULL),
(62, 20, 11, '#ALPA-2025-09', '2025-09-03', NULL, 'cash', 'paid', 212.00, 0.00, 212.00, NULL, 'Prepare for the Transfer to Namecheap before \r\nMarch 09, 2026', '[]', 2, '2025-11-14 15:10:38', '2025-11-14 15:10:38', NULL),
(63, 4, 8, '#ALPA-2025-10', '2025-04-24', NULL, 'cash', 'paid', 22.00, 0.00, 22.00, NULL, NULL, '[]', 2, '2025-11-14 15:11:26', '2025-11-14 15:11:26', NULL),
(64, 4, 8, '#ALPA-2025-11', '2025-03-17', NULL, 'cash', 'paid', 250.00, 0.00, 250.00, NULL, NULL, '[]', 2, '2025-11-14 15:12:08', '2025-11-14 15:12:08', NULL),
(65, 21, 9, '#ALPA-2025-12', '2025-04-02', NULL, 'cash', 'paid', 120.00, 0.00, 120.00, NULL, NULL, '[]', 2, '2025-11-14 15:32:48', '2025-11-14 15:32:48', NULL),
(66, 2, 2, '#ALPA-2025-13', '2025-04-06', NULL, 'cash', 'paid', 34.32, 0.00, 34.32, NULL, NULL, '[]', 2, '2025-11-14 15:33:55', '2025-11-14 15:33:55', NULL),
(67, 14, 5, '#ALPA-2025-14', '2025-03-25', NULL, 'cash', 'paid', 60.00, 0.00, 60.00, NULL, 'domain redemption state', '[]', 2, '2025-11-14 15:34:46', '2025-11-14 15:34:46', NULL),
(68, 18, 12, '#ALPA-2025-15', '2025-04-05', NULL, 'cash', 'paid', 34.32, 0.00, 34.32, NULL, NULL, '[]', 2, '2025-11-14 15:35:39', '2025-11-14 15:35:39', NULL),
(69, 16, 7, '#ALPA-2025-16', '2025-05-18', NULL, 'cash', 'paid', 45.00, 0.00, 45.00, NULL, NULL, '[]', 2, '2025-11-14 15:36:31', '2025-11-14 15:36:31', NULL),
(70, 2, 2, '#ALPA-2025-17', '2025-05-24', NULL, 'cash', 'paid', 120.00, 0.00, 120.00, NULL, NULL, '[]', 2, '2025-11-14 15:37:27', '2025-11-14 15:37:27', NULL),
(71, 6, 5, '#ALPA-2025-18', '2025-01-24', NULL, 'cash', 'paid', 45.00, 0.00, 45.00, NULL, NULL, '[]', 2, '2025-11-14 15:38:38', '2025-11-14 15:38:38', NULL),
(72, 14, 5, '#ALPA-2025-19', '2025-07-09', NULL, 'cash', 'paid', 45.00, 0.00, 45.00, NULL, NULL, '[]', 2, '2025-11-14 15:39:37', '2025-11-14 15:39:37', NULL),
(73, 8, 5, '#ALPA-2025-20', '2025-11-07', NULL, 'cash', 'paid', 185.00, 0.00, 185.00, NULL, 'SSL Certificate (5 Years)', '[]', 2, '2025-11-14 15:41:25', '2025-11-14 15:41:25', NULL),
(74, 11, 5, '#ALPA-2025-21', '2025-11-20', NULL, 'cash', 'paid', 80.00, 0.00, 80.00, NULL, 'domain redemption state', '[]', 2, '2025-11-14 15:42:47', '2025-11-14 15:42:47', NULL),
(75, 11, 5, '#ALPA-2025-22', '2025-09-01', NULL, 'cash', 'paid', 235.00, 0.00, 235.00, NULL, 'Prepare for Transfet to Namecheap before (1/3/2026)\r\nRenew for (6 months)', '[]', 2, '2025-11-14 15:44:28', '2025-11-14 15:44:28', NULL),
(76, 20, 11, '#ALPA-2025-23', '2025-09-03', NULL, 'cash', 'paid', 200.00, 0.00, 200.00, NULL, 'Prepare for the transfer to Namecheap before \r\nMarch 09, 2025', '[]', 2, '2025-11-14 15:46:37', '2025-11-18 07:28:16', NULL),
(77, 6, 5, '#ALPA-2025-24', '2025-10-15', NULL, 'cash', 'paid', 155.00, 0.00, 155.00, NULL, NULL, '[]', 2, '2025-11-14 15:47:54', '2026-01-26 14:23:43', NULL),
(78, 19, 5, '#ALPA-2025-25', '2025-11-06', NULL, 'cash', 'paid', 70.00, 0.00, 70.00, NULL, NULL, '[]', 2, '2025-11-14 15:48:43', '2025-12-25 14:03:54', NULL),
(79, 7, 5, '#ALPA-2025-26', '2025-11-14', NULL, 'cash', 'paid', 20.00, 0.00, 20.00, NULL, NULL, '[]', 2, '2025-11-14 15:49:39', '2026-01-26 14:24:09', NULL),
(80, 8, 5, '#ALPA-2025-27', '2025-11-22', NULL, 'cash', 'paid', 35.00, 0.00, 35.00, NULL, NULL, '[]', 2, '2025-11-14 15:50:28', '2026-01-26 14:23:25', NULL),
(81, 17, 7, '#ALPA-2025-28', '2025-12-25', '2025-12-31', 'cash', 'paid', 85.00, 0.00, 85.00, NULL, 'Domain Registration (queen-towers.com) for 1 year\r\nExpiration date: (Dec 25, 2026)\r\n-------------------------------------------\r\nBusiness Email (sales@queen-towers.com) for 1 year with (10GB Storage)\r\nExpiration date: (Dec 24, 2026)', '[\"invoice-attachments\\/9inumVXlQ2vyhvP5e6ed92VH1VbomulYqDJVDcHT.pdf\"]', 2, '2025-12-25 14:08:01', '2026-01-14 14:33:37', NULL),
(82, 22, 14, '#ALPA-2025-29', '2025-12-25', '2025-12-31', 'cash', 'paid', 20.00, 0.00, 20.00, NULL, 'Business Email (info@deepmonday.com) with 10GB for 1 year ----- Expiration date: (Dec 25, 2026)\r\nPaid through FIB and all cleared!!', '[]', 2, '2025-12-25 18:41:32', '2026-07-17 13:49:05', NULL),
(83, 16, 7, '#ALPA-2025-30', '2025-12-25', '2025-12-31', 'cash', 'paid', 55.00, 0.00, 55.00, NULL, 'Business Email (sales@quartier-francais.co) 10GB for 1 Year---------- Expiration date: (Dec 25, 2026)', '[]', 2, '2025-12-25 19:19:11', '2026-01-13 16:55:33', NULL),
(84, 14, 5, '#ALPA-2026-01', '2026-01-23', NULL, 'cash', 'paid', 150.00, 0.00, 150.00, NULL, 'Web host Renew for (medzpharma.eu) Website 1 Year  ------- Expiration date: (Jan 5, 2027)', '[]', 2, '2026-01-23 15:53:18', '2026-01-26 14:23:04', NULL),
(85, 4, 8, '#ALPA-2026-02', '2026-02-28', NULL, 'cash', 'paid', 30.00, 0.00, 30.00, NULL, 'Renew a domain for (arminasluxury.com) for 1 year, expiration date: Feb 24, 2027', '[]', 2, '2026-02-28 05:50:05', '2026-03-12 01:50:40', NULL),
(86, 4, 8, '#ALPA-2026-03', '2026-03-15', NULL, 'cash', 'paid', 270.00, 0.00, 270.00, 0.00, 'Web host Renew for ((www.arminasluxury.com) Web Application for 1 Year ------- Next Expiration date: (Mar 17, 2027)', '[]', 2, '2026-03-15 07:40:47', '2026-03-17 09:42:08', NULL),
(87, 21, 9, '#ALPA-2026-04', '2026-03-15', NULL, 'cash', 'paid', 160.00, 0.00, 160.00, NULL, 'Web host Renew for (zonnlighting.com) Website host for 1 Year ------- Next Expiration date: (Apr 02, 2027)\r\nDomain Renew for (zonnlighting.com) Website host for 1 Year ------- Next Expiration date: (Mar 25, 2027)', '[]', 2, '2026-03-15 07:53:49', '2026-03-17 08:32:31', NULL),
(88, 12, 6, '#ALPA-2026-05', '2026-03-15', NULL, 'cash', 'paid', 160.00, 0.00, 160.00, NULL, 'Web host Renew for (ishtar-north.com) Website host for 1 Year ------- Next Expiration date: (Mar 22, 2027) \r\nDomain Renew for (ishtar-north.com) Website host for 1 Year ------- Next Expiration date: (Mar 23, 2027)', '[]', 2, '2026-03-15 08:02:27', '2026-04-06 13:48:13', NULL),
(89, 23, 15, '#ALPA-2026-06', '2026-03-26', NULL, 'cash', 'paid', 130.00, 0.00, 130.00, NULL, 'Domain Registration for (seepacompany.com) for 1 Year ------- Next Expiration date: (Mar 26, 2027)\r\nWeb host to host Website (Server) for (seepacompany.com) Website host for 1 Year ------- Next Expiration date: (Apr 24, 2027) \r\nSSL Certificate free of charge  ------- Next Expiration date: (Oct 10, 2026)', '[]', 2, '2026-03-26 16:16:42', '2026-03-30 15:44:16', NULL),
(90, 12, 6, '#ALPA-2026-07', '2026-03-30', NULL, 'cash', 'paid', 30.00, 0.00, 30.00, NULL, 'PositiveSSL (HTTPS) renewed for 5 years', '[]', 2, '2026-03-30 15:50:26', '2026-04-06 13:48:23', NULL),
(91, 24, 16, '#ALPA-2026-08', '2026-04-30', NULL, 'cash', 'paid', 22.00, 0.00, 22.00, NULL, 'Paid through FIB', '[]', 2, '2026-04-30 04:53:50', '2026-06-20 03:38:42', NULL),
(92, 25, 9, '#ALPA-2026-09', '2026-05-05', '2026-05-05', 'cash', 'paid', 25.00, 0.00, 25.00, NULL, 'Domain Registration for (mada-lighting.com) for 1 Year ------- Next Expiration date: (May 5, 2027)\r\nDomain Forward or Redirection ------------> free of charge!', '[]', 2, '2026-05-05 09:45:28', '2026-05-13 03:22:32', NULL),
(93, 16, 7, '#ALPA-2026-10', '2026-05-13', NULL, 'cash', 'paid', 60.00, 0.00, 60.00, NULL, 'Domain Renewal for (quartier-francais.co) for 1 Year ------- Next Expiration date: (May 18, 2027)', '[]', 2, '2026-05-13 03:25:20', '2026-05-30 09:17:32', NULL),
(94, 26, 17, '#ALPA-2026-11', '2026-05-30', NULL, 'cash', 'paid', 2000.00, 0.00, 2000.00, 1000.00, 'End-to-end development and deployment of a web-based shipment tracking system for Ultra Movers Company.\r\nPartially paid ($1,000), Remaining payment: ($1,000)\r\n\r\nLast visit: Fully Paid!!', '[]', 2, '2026-05-30 10:58:40', '2026-06-07 11:09:45', NULL),
(95, 26, 17, '#ALPA-2026-12', '2026-05-30', NULL, 'cash', 'paid', 150.00, 0.00, 150.00, NULL, 'Annual subscription for a VPS hosting server used for (Shipment Tracking System) deployment and hosting services.\r\n\r\nLast visit Fully Paid!!', '[]', 2, '2026-05-30 11:05:59', '2026-06-07 11:10:16', NULL),
(96, 24, 16, '#ALPA-2026-13', '2026-05-31', NULL, 'cash', 'paid', 120.00, 0.00, 120.00, NULL, 'Service : Zoho Workplace\r\nPlan : Mail 10GB\r\nUsers : 4\r\nPayment Duration: Yearly\r\nStart: 30 May 2026 \r\nexpiration date (next renew date): 29 May 2027\r\n\r\nPaid through FIB', '[]', 2, '2026-05-31 13:17:38', '2026-06-20 03:35:55', NULL),
(97, 24, 16, '#ALPA-2026-14', '2026-06-07', NULL, 'cash', 'paid', 20.00, 0.00, 20.00, NULL, '1 Business Email from Zoho \r\nStart: 06 June 2026 \r\nExpires at: 29 May 2027\r\nPaid through FIB', '[]', 2, '2026-06-07 11:08:35', '2026-06-20 03:36:55', NULL),
(98, 26, 17, '#ALPA-2026-15', '2026-06-16', NULL, 'cash', 'paid', 1400.00, 0.00, 1400.00, NULL, 'End-to-end development and deployment of a Custom Website for Ultra Movers Company.\r\nPartially paid ($350), Remaining payment: ($1,050)\r\nFinall visit all Paid!!', '[]', 2, '2026-06-16 05:05:49', '2026-06-16 10:44:45', NULL),
(99, 22, 14, '#ALPA-2026-16', '2026-06-19', NULL, 'cash', 'paid', 50.00, 0.00, 50.00, NULL, 'Web host Registration for (deepmonday.com) Website host for 1 Year ------- Next Expiration date: (Jun 17, 2027)\r\nPaid through FIB and all cleared!!', '[]', 2, '2026-06-19 03:52:16', '2026-07-17 13:46:01', NULL),
(100, 24, 16, '#ALPA-2026-17', '2026-07-21', NULL, 'cash', 'paid', 1000.00, 0.00, 1000.00, NULL, 'End-to-end development and deployment of a Custom Website for Bosalaalthahabia Company.\r\nPartially paid ($250), Remaining payment: ($750)\r\nFinal visit all paid!!', '[]', 2, '2026-07-17 13:51:46', '2026-07-17 13:54:06', NULL),
(101, 26, 17, '#ALPA-2026-18', '2026-07-24', NULL, 'cash', 'partially_paid', 5500.00, 0.00, 5500.00, NULL, 'Contract signing before the project begins; the first visit ($500) is paid\r\nIt\'s monthly; they should pay ($500) on the 24th of each month!', '[]', 2, '2026-07-17 13:57:53', '2026-07-17 13:57:53', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `invoice_items`
--

CREATE TABLE `invoice_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `invoice_id` bigint(20) UNSIGNED NOT NULL,
  `description` text NOT NULL,
  `quantity` decimal(10,2) NOT NULL DEFAULT 1.00,
  `cost_price` decimal(15,2) NOT NULL DEFAULT 0.00,
  `unit_price` decimal(15,2) NOT NULL DEFAULT 0.00,
  `line_total` decimal(15,2) NOT NULL DEFAULT 0.00,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `invoice_items`
--

INSERT INTO `invoice_items` (`id`, `invoice_id`, `description`, `quantity`, `cost_price`, `unit_price`, `line_total`, `created_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'Design & Build Website (Wordpress)', 1.00, 0.00, 0.00, 0.00, 2, '2025-11-14 12:22:01', '2025-11-14 12:22:01', NULL),
(2, 2, 'Web host (Bluehost) Plan: CHOICE PLUS', 1.00, 300.00, 300.00, 300.00, 2, '2025-11-14 12:26:53', '2025-11-14 12:26:53', NULL),
(3, 3, 'Domain Renewal (Zhyar.org)', 1.00, 70.00, 70.00, 70.00, 2, '2025-11-14 12:30:12', '2025-11-14 12:30:12', NULL),
(4, 4, 'Design & Build Database System for (Zhyar.org)', 1.00, 0.00, 400.00, 400.00, 2, '2025-11-14 12:33:15', '2025-11-14 12:33:15', NULL),
(5, 5, 'Website (Custom Website)', 1.00, 0.00, 650.00, 650.00, 2, '2025-11-14 12:36:20', '2025-11-14 12:36:20', NULL),
(6, 6, '(medzpharma.com) Domain (Namecheap)', 1.00, 6.40, 6.40, 6.40, 2, '2025-11-14 12:39:21', '2025-11-14 12:39:21', NULL),
(7, 7, '(createpulsepharma.com) Domain (Namecheap)', 1.00, 8.86, 8.86, 8.86, 2, '2025-11-14 12:40:26', '2025-11-14 12:40:26', NULL),
(8, 8, '(enzymebureau.com) Domain (Namecheap)', 1.00, 7.28, 7.28, 7.28, 2, '2025-11-14 12:41:53', '2025-11-14 12:41:53', NULL),
(9, 9, '(medzpharma.eu) Domain Renew (Namecheap)', 1.00, 8.98, 8.98, 8.98, 2, '2025-11-14 12:42:56', '2025-11-14 12:42:56', NULL),
(10, 10, '(madaralsharq.com) Domain Renew (name.com)', 1.00, 10.99, 10.99, 10.99, 2, '2025-11-14 12:45:02', '2025-11-14 12:45:02', NULL),
(11, 11, '(createpulsepharma.com) Domain Renew (Namecheap)', 1.00, 13.16, 13.16, 13.16, 2, '2025-11-14 12:46:44', '2025-11-14 12:46:44', NULL),
(12, 12, '(excelbiolife.co.uk) Domain (Namecheap)', 1.00, 6.98, 6.98, 6.98, 2, '2025-11-14 12:47:35', '2025-11-14 12:47:35', NULL),
(13, 13, '(medzpharma.com) Domain Renew (Namecheap)', 1.00, 13.16, 13.16, 13.16, 2, '2025-11-14 12:48:22', '2025-11-14 12:48:22', NULL),
(14, 14, '(enzymebureau.com) Domain Renew (Namecheap)', 1.00, 13.16, 13.16, 13.16, 2, '2025-11-14 12:48:54', '2025-11-14 12:48:54', NULL),
(15, 15, '9 Zoho emails (Mail Lite Plan $1/month)', 1.00, 108.00, 108.00, 108.00, 2, '2025-11-14 12:51:15', '2025-11-14 12:51:15', NULL),
(16, 16, 'Web host (Bluehost) Plan: CHOICE PLUS', 1.00, 268.20, 300.00, 300.00, 2, '2025-11-14 12:54:56', '2025-11-14 12:54:56', NULL),
(17, 17, '(medzpharma.eu) Domain Renew (Namecheap)', 1.00, 30.00, 35.00, 35.00, 2, '2025-11-14 12:56:02', '2025-11-14 12:56:02', NULL),
(18, 18, '(medzpharma.com) Domain Renew (Namecheap)', 1.00, 11.36, 15.00, 15.00, 2, '2025-11-14 12:57:13', '2025-11-14 12:57:13', NULL),
(19, 19, '(createpulsepharma.com) Domain Renew (Namecheap)', 1.00, 11.36, 15.00, 15.00, 2, '2025-11-14 12:58:11', '2025-11-14 12:58:11', NULL),
(20, 20, '(enzymebureau.com) Domain Renew (Namecheap)', 1.00, 11.36, 15.00, 15.00, 2, '2025-11-14 12:59:17', '2025-11-14 12:59:17', NULL),
(21, 21, '(excelbiolife.co.uk) Domain Renew (Namecheap)', 1.00, 9.48, 15.00, 15.00, 2, '2025-11-14 13:00:19', '2025-11-14 13:00:19', NULL),
(22, 22, '(hedzco.de) Domain (Namecheap)', 1.00, 5.58, 10.00, 10.00, 2, '2025-11-14 13:01:28', '2025-11-14 13:01:28', NULL),
(23, 23, '9 Zoho emails (Mail Lite Plan $1/month)', 1.00, 112.44, 120.00, 120.00, 2, '2025-11-14 13:02:32', '2025-11-14 13:02:32', NULL),
(24, 24, 'Web host (Bluehost) Plan: CHOICE PLUS', 1.00, 268.20, 300.00, 300.00, 2, '2025-11-14 13:03:39', '2025-11-14 13:03:39', NULL),
(25, 25, 'Zoho mail service 5GB space for (sales@queen-towers.com)', 1.00, 7.82, 25.00, 25.00, 2, '2025-11-14 13:05:21', '2025-11-14 13:05:21', NULL),
(26, 26, '(medzpharma.eu) Domain Renew (Namecheap)', 1.00, 9.00, 20.00, 20.00, 2, '2025-11-14 13:07:54', '2025-11-14 13:07:54', NULL),
(27, 27, 'Domain Renewal (queen-towers.com)', 1.00, 14.76, 30.00, 30.00, 2, '2025-11-14 13:09:17', '2025-11-14 13:09:17', NULL),
(28, 28, '(createpulsepharma.com) Domain Renew (Namecheap)', 1.00, 14.76, 25.00, 25.00, 2, '2025-11-14 13:10:35', '2025-11-14 13:10:35', NULL),
(29, 29, '(medzpharma.com) Domain Renew (Namecheap)', 1.00, 14.76, 25.00, 25.00, 2, '2025-11-14 13:11:23', '2025-11-14 13:11:23', NULL),
(30, 30, '(hedzco.de) Domain Renew (Namecheap)', 1.00, 8.98, 20.00, 20.00, 2, '2025-11-14 13:12:13', '2025-11-14 13:12:13', NULL),
(31, 31, '9 Zoho emails (Mail Lite Plan $1/month)', 1.00, 139.44, 200.00, 200.00, 2, '2025-11-14 13:12:59', '2025-11-14 13:12:59', NULL),
(32, 32, 'Renew Web host (Bluehost) Plan: CHOICE PLUS', 1.00, 311.76, 412.00, 412.00, 2, '2025-11-14 13:13:46', '2025-11-14 13:13:46', NULL),
(33, 33, 'Zoho mail service 5GB space for (sales@queen-towers.com)', 1.00, 12.00, 25.00, 25.00, 2, '2025-11-14 13:14:29', '2025-11-14 13:14:29', NULL),
(34, 34, '(criivo.eu) Domain (Namecheap)', 1.00, 2.98, 8.00, 8.00, 2, '2025-11-14 13:15:15', '2025-11-14 13:15:15', NULL),
(35, 35, '(dermivy.com) Domain (Namecheap)', 1.00, 9.95, 16.00, 16.00, 2, '2025-11-14 13:16:05', '2025-11-14 13:16:05', NULL),
(36, 36, '(massairaq.com) Domain (Namecheap)', 1.00, 9.95, 23.00, 23.00, 2, '2025-11-14 13:18:28', '2025-11-14 13:23:14', '2025-11-14 13:23:14'),
(37, 36, '(massairaq.com) Domain (Namecheap)', 1.00, 9.95, 23.00, 23.00, 2, '2025-11-14 13:23:14', '2025-11-14 13:23:14', NULL),
(38, 36, '1 Microsoft 365 Business Basic NCE Annual Subscription', 1.00, 66.00, 77.00, 77.00, 2, '2025-11-14 13:23:14', '2025-11-14 13:23:14', NULL),
(39, 37, '(createpulsepharma.com) Domain Renew (Namecheap)', 1.00, 16.06, 32.00, 32.00, 2, '2025-11-14 13:29:40', '2025-11-14 13:29:40', NULL),
(40, 38, 'Domain Renewal (queen-towers.com)', 1.00, 16.06, 30.00, 30.00, 2, '2025-11-14 13:30:48', '2025-12-25 19:22:16', '2025-12-25 19:22:16'),
(41, 39, 'Domain Renewal (zonnlighting.com)', 1.00, 16.06, 32.00, 32.00, 2, '2025-11-14 13:32:03', '2025-11-14 13:32:03', NULL),
(42, 40, '(medzpharma.eu) Domain Renew (Namecheap)', 1.00, 8.98, 20.00, 20.00, 2, '2025-11-14 14:37:09', '2025-11-14 14:37:09', NULL),
(43, 41, '(zhyar.org) Domain Renewal (Godaddy)', 1.00, 23.17, 33.00, 33.00, 2, '2025-11-14 14:37:58', '2025-11-14 14:37:58', NULL),
(44, 42, '(ishtar-north.com) Domain Register (Namecheap)', 1.00, 9.95, 25.00, 25.00, 2, '2025-11-14 14:38:46', '2025-11-14 14:40:54', '2025-11-14 14:40:54'),
(45, 42, '(ishtar-north.com) Domain Register (Namecheap)', 1.00, 9.95, 25.00, 25.00, 2, '2025-11-14 14:40:54', '2025-11-14 14:40:54', NULL),
(46, 42, 'Stellar Plus for ishtar-north.com (Namecheap)', 1.00, 34.88, 75.00, 75.00, 2, '2025-11-14 14:40:54', '2025-11-14 14:40:54', NULL),
(47, 42, 'SSL certificate', 1.00, 34.88, 35.00, 35.00, 2, '2025-11-14 14:40:54', '2025-11-14 14:40:54', NULL),
(48, 42, 'Build & Design Website (Wordpress)', 1.00, 0.00, 700.00, 700.00, 2, '2025-11-14 14:40:54', '2025-11-14 14:40:54', NULL),
(49, 43, 'Web host Renewal (zonnlighting.com) Stellar Plus  (Namecheap)', 1.00, 68.88, 120.00, 120.00, 2, '2025-11-14 14:43:09', '2025-11-14 14:43:09', NULL),
(50, 43, 'PositiveSSL Renewal (zonnlighting.com)   (Namecheap)', 1.00, 29.95, 35.00, 35.00, 2, '2025-11-14 14:43:09', '2025-11-14 14:43:09', NULL),
(51, 44, 'Stellar Plus for dermivy.com (Namecheap)', 1.00, 28.56, 75.00, 75.00, 2, '2025-11-14 14:44:24', '2025-11-14 14:44:24', NULL),
(52, 45, 'Design & Build Ciri - Furniture & Interior WooCommerce Theme', 1.00, 0.00, 60.00, 60.00, 2, '2025-11-14 14:46:04', '2025-11-14 14:46:04', NULL),
(53, 46, '(hedzco.de) Domain Renew (Namecheap)', 1.00, 8.98, 20.00, 20.00, 2, '2025-11-14 14:47:07', '2025-11-14 14:47:07', NULL),
(54, 47, 'Renew Web host (Bluehost) Plan: CHOICE PLUS', 1.00, 136.54, 212.00, 212.00, 2, '2025-11-14 14:48:15', '2025-11-14 14:48:15', NULL),
(55, 48, '6  Zoho emails (Mail Lite Plan $1/month) + 5GB Extra Storage', 1.00, 95.53, 155.00, 155.00, 2, '2025-11-14 14:49:19', '2025-11-14 14:49:19', NULL),
(56, 49, '(nawassi.com) Domain (Namecheap)', 1.00, 9.86, 50.00, 50.00, 2, '2025-11-14 14:50:59', '2025-11-14 14:50:59', NULL),
(57, 49, '(nawassi.pro) Domain (Namecheap)', 1.00, 3.16, 35.00, 35.00, 2, '2025-11-14 14:50:59', '2025-11-14 14:50:59', NULL),
(58, 49, 'Stellar Plus for nawassi.com (Namecheap)', 1.00, 33.14, 135.00, 135.00, 2, '2025-11-14 14:50:59', '2025-11-14 14:50:59', NULL),
(59, 50, 'Web host Renewal (azinda.pro) Stellar Business  (Namecheap)', 1.00, 108.88, 160.00, 160.00, 2, '2025-11-14 14:52:27', '2025-11-14 14:52:27', NULL),
(60, 50, 'PositiveSSL Renewal (azinda.pro)   (Namecheap)', 1.00, 34.95, 66.00, 66.00, 2, '2025-11-14 14:52:27', '2025-11-14 14:52:27', NULL),
(61, 51, '(criivo.eu) Domain Renew (Namecheap)', 1.00, 8.98, 20.00, 20.00, 2, '2025-11-14 14:53:31', '2025-11-14 14:53:31', NULL),
(62, 52, '(dermivy.com) Domain Renew  (Namecheap)', 1.00, 17.16, 35.00, 35.00, 2, '2025-11-14 14:54:50', '2025-11-14 14:54:50', NULL),
(63, 53, 'Redesign & Development of Zhyar DB System', 1.00, 0.00, 600.00, 600.00, 2, '2025-11-14 14:56:28', '2025-11-14 14:56:28', NULL),
(64, 54, 'Stellar Plus for medzpharma.eu (Namecheap)', 1.00, 33.14, 75.00, 75.00, 2, '2025-11-14 14:59:44', '2025-11-14 14:59:44', NULL),
(65, 55, 'Create & Develop WordPress Website in 2 Languages', 1.00, 0.00, 550.00, 550.00, 2, '2025-11-14 15:00:41', '2025-11-14 15:00:41', NULL),
(66, 56, 'Create & Develop Custom Website', 1.00, 0.00, 450.00, 450.00, 2, '2025-11-14 15:01:23', '2025-11-14 15:01:23', NULL),
(67, 57, '(arminas.pro) Domain (Namecheap)', 1.00, 28.16, 50.00, 50.00, 2, '2025-11-14 15:02:56', '2025-11-14 15:02:56', NULL),
(68, 57, 'Web host Renewal (arminas.pro) Stellar Business  (Namecheap)', 1.00, 74.88, 135.00, 135.00, 2, '2025-11-14 15:02:56', '2025-11-14 15:02:56', NULL),
(69, 57, 'PositiveSSL Renewal (arminas.pro)   (Namecheap)', 1.00, 34.95, 34.95, 34.95, 2, '2025-11-14 15:02:56', '2025-11-14 15:02:56', NULL),
(70, 58, 'Developing Zonning APP database system', 1.00, 0.00, 1500.00, 1500.00, 2, '2025-11-14 15:03:58', '2025-11-14 15:03:58', NULL),
(71, 59, '(zonnlighting.com) Domain Renew  (Namecheap)', 1.00, 17.16, 32.00, 32.00, 2, '2025-11-14 15:05:38', '2025-11-14 15:05:38', NULL),
(72, 60, '(ishtar-north.com) Domain Renew (Namecheap)', 1.00, 17.16, 32.00, 32.00, 2, '2025-11-14 15:07:29', '2025-11-14 15:07:29', NULL),
(73, 60, 'Stellar Plus for ishtar-north.com (Namecheap)', 1.00, 74.88, 135.00, 135.00, 2, '2025-11-14 15:07:29', '2025-11-14 15:07:29', NULL),
(74, 60, 'SSL certificate', 1.00, 34.88, 35.00, 35.00, 2, '2025-11-14 15:07:29', '2025-11-14 15:07:29', NULL),
(75, 61, '(zhyar.org) Domain Renewal (Godaddy)', 1.00, 23.17, 33.00, 33.00, 2, '2025-11-14 15:08:55', '2025-11-14 15:08:55', NULL),
(76, 62, 'Renew Web host (Bluehost) Plan: CHOICE PLUS', 1.00, 132.55, 212.00, 212.00, 2, '2025-11-14 15:10:38', '2025-11-14 15:10:38', NULL),
(77, 63, 'Domain Registration (arminasluxury.com) Namecheap', 1.00, 10.90, 22.00, 22.00, 2, '2025-11-14 15:11:26', '2025-11-14 15:11:26', NULL),
(78, 64, 'Linux Shared Hosting - Business (www.arminasluxury.com)', 1.00, 171.72, 250.00, 250.00, 2, '2025-11-14 15:12:08', '2025-11-14 15:12:08', NULL),
(79, 65, 'Web host Renewal (zonnlighting.com) Stellar Plus  (Namecheap)', 1.00, 74.88, 120.00, 120.00, 2, '2025-11-14 15:32:48', '2025-11-14 15:32:48', NULL),
(80, 66, '(arizanti.com) Domain Renewal (namecheap)', 1.00, 17.16, 34.32, 34.32, 2, '2025-11-14 15:33:55', '2025-11-14 15:33:55', NULL),
(81, 67, '(medzpharma.eu) Domain Renew (Namecheap)', 1.00, 29.00, 60.00, 60.00, 2, '2025-11-14 15:34:46', '2025-11-14 15:34:46', NULL),
(82, 68, '(skyllatrans.com) Domain Renewal (namecheap)', 1.00, 17.16, 34.32, 34.32, 2, '2025-11-14 15:35:39', '2025-11-14 15:35:39', NULL),
(83, 69, 'Register new Domain (quartier-francais.co)', 1.00, 12.48, 45.00, 45.00, 2, '2025-11-14 15:36:31', '2025-11-14 15:36:31', NULL),
(84, 70, 'Web host Renewal (arizanti.com) Stellar Plus  (Namecheap)', 1.00, 74.88, 120.00, 120.00, 2, '2025-11-14 15:37:27', '2025-11-14 15:37:27', NULL),
(85, 71, '(createpulsepharma.com) Domain Renew (Namecheap)', 1.00, 17.16, 45.00, 45.00, 2, '2025-11-14 15:38:38', '2025-11-14 15:38:38', NULL),
(86, 72, '(medzpharma.com) Domain Renew (Namecheap)', 1.00, 17.18, 45.00, 45.00, 2, '2025-11-14 15:39:37', '2025-11-14 15:39:37', NULL),
(87, 73, 'Web host Renewa (dermivy.com) Stellar Plus  (Namecheap)', 1.00, 74.88, 150.00, 150.00, 2, '2025-11-14 15:41:25', '2025-11-14 15:41:25', NULL),
(88, 73, 'SSL certificate', 1.00, 24.95, 35.00, 35.00, 2, '2025-11-14 15:41:25', '2025-11-14 15:41:25', NULL),
(89, 74, '(hedzco.de) Domain Renew (Namecheap)', 1.00, 38.98, 80.00, 80.00, 2, '2025-11-14 15:42:47', '2025-11-14 15:42:47', NULL),
(90, 75, 'Web host (Bluehost) Plan: CHOICE PLUS', 1.00, 132.55, 235.00, 235.00, 2, '2025-11-14 15:44:28', '2025-11-14 15:44:28', NULL),
(91, 76, 'Renew Web host (Bluehost) Plan: CHOICE PLUS', 1.00, 132.55, 200.00, 200.00, 2, '2025-11-14 15:46:37', '2025-11-18 07:28:16', '2025-11-18 07:28:16'),
(92, 77, '6  Zoho emails (Mail Lite Plan $1/month) + 10GB Extra Storage', 1.00, 77.47, 155.00, 155.00, 2, '2025-11-14 15:47:54', '2025-11-19 10:13:02', '2025-11-19 10:13:02'),
(93, 78, '(https://tasjeel.ae/) NEW DOMAIN Register (themega.ae)', 1.00, 35.00, 70.00, 70.00, 2, '2025-11-14 15:48:43', '2025-12-25 14:03:54', '2025-12-25 14:03:54'),
(94, 79, '(criivo.eu) Domain Renew (Namecheap)', 1.00, 7.18, 20.00, 20.00, 2, '2025-11-14 15:49:39', '2025-11-19 10:14:54', '2025-11-19 10:14:54'),
(95, 80, '(dermivy.com) Domain Renew  (Namecheap)', 1.00, 13.78, 35.00, 35.00, 2, '2025-11-14 15:50:28', '2025-11-19 10:15:11', '2025-11-19 10:15:11'),
(96, 76, 'Renew Web host (Bluehost) Plan: CHOICE PLUS', 1.00, 132.55, 200.00, 200.00, 2, '2025-11-18 07:28:16', '2025-11-18 07:28:16', NULL),
(97, 77, '6  Zoho emails + 10GB Extra Storage', 1.00, 77.47, 155.00, 155.00, 2, '2025-11-19 10:13:02', '2026-01-26 14:23:43', '2026-01-26 14:23:43'),
(98, 79, '(criivo.eu) Domain Renew', 1.00, 7.18, 20.00, 20.00, 2, '2025-11-19 10:14:54', '2026-01-26 14:23:55', '2026-01-26 14:23:55'),
(99, 80, '(dermivy.com) Domain Renew', 1.00, 13.78, 35.00, 35.00, 2, '2025-11-19 10:15:11', '2026-01-26 14:23:25', '2026-01-26 14:23:25'),
(100, 78, '(https://tasjeel.ae/) NEW DOMAIN Register (themega.ae)', 1.00, 35.00, 70.00, 70.00, 2, '2025-12-25 14:03:54', '2025-12-25 14:03:54', NULL),
(101, 81, 'Domain Registration (queen-towers.com)', 1.00, 11.08, 30.00, 30.00, 2, '2025-12-25 14:08:01', '2025-12-25 14:09:49', '2025-12-25 14:09:49'),
(102, 81, 'Domain Registration (queen-towers.com)', 1.00, 11.08, 30.00, 30.00, 2, '2025-12-25 14:09:49', '2025-12-25 14:10:42', '2025-12-25 14:10:42'),
(103, 81, 'Domain Registration (queen-towers.com)', 1.00, 11.08, 30.00, 30.00, 2, '2025-12-25 14:10:42', '2025-12-25 14:12:42', '2025-12-25 14:12:42'),
(104, 81, 'Domain Registration (queen-towers.com)', 1.00, 11.08, 30.00, 30.00, 2, '2025-12-25 14:12:42', '2025-12-25 16:56:20', '2025-12-25 16:56:20'),
(105, 81, 'Domain Registration (queen-towers.com)', 1.00, 11.08, 30.00, 30.00, 2, '2025-12-25 16:56:20', '2025-12-25 17:03:54', '2025-12-25 17:03:54'),
(106, 81, 'Business Email (sales@queen-towers.com)', 1.00, 15.00, 55.00, 55.00, 2, '2025-12-25 16:56:20', '2025-12-25 17:03:54', '2025-12-25 17:03:54'),
(107, 81, 'Domain Registration (queen-towers.com)', 1.00, 11.08, 30.00, 30.00, 2, '2025-12-25 17:03:54', '2026-01-14 14:33:37', '2026-01-14 14:33:37'),
(108, 81, 'Business Email (sales@queen-towers.com)', 1.00, 15.00, 55.00, 55.00, 2, '2025-12-25 17:03:54', '2026-01-14 14:33:37', '2026-01-14 14:33:37'),
(109, 82, 'Business Email (info@deepmonday.com)', 1.00, 15.00, 20.00, 20.00, 2, '2025-12-25 18:41:32', '2025-12-25 18:42:15', '2025-12-25 18:42:15'),
(110, 82, 'Business Email (info@deepmonday.com)', 1.00, 15.00, 20.00, 20.00, 2, '2025-12-25 18:42:15', '2026-07-17 13:49:05', '2026-07-17 13:49:05'),
(111, 83, 'Business Email (sales@quartier-francais.co)', 1.00, 15.00, 55.00, 55.00, 2, '2025-12-25 19:19:11', '2025-12-25 19:20:01', '2025-12-25 19:20:01'),
(112, 83, 'Business Email (sales@quartier-francais.co)', 1.00, 15.00, 55.00, 55.00, 2, '2025-12-25 19:20:01', '2026-01-13 16:55:33', '2026-01-13 16:55:33'),
(113, 38, 'Domain Renewal (queen-towers.com)', 1.00, 16.06, 30.00, 30.00, 2, '2025-12-25 19:22:16', '2025-12-25 19:22:16', NULL),
(114, 83, 'Business Email (sales@quartier-francais.co)', 1.00, 15.00, 55.00, 55.00, 2, '2026-01-13 16:55:33', '2026-01-13 16:55:33', NULL),
(115, 81, 'Domain Registration (queen-towers.com)', 1.00, 11.08, 30.00, 30.00, 2, '2026-01-14 14:33:37', '2026-01-14 14:33:37', NULL),
(116, 81, 'Business Email (sales@queen-towers.com)', 1.00, 15.00, 55.00, 55.00, 2, '2026-01-14 14:33:37', '2026-01-14 14:33:37', NULL),
(117, 84, 'Web host Renew (medzpharma.eu)', 1.00, 74.88, 150.00, 150.00, 2, '2026-01-23 15:53:18', '2026-01-23 15:54:45', '2026-01-23 15:54:45'),
(118, 84, 'Web host Renew (medzpharma.eu)', 1.00, 74.88, 150.00, 150.00, 2, '2026-01-23 15:54:45', '2026-01-26 14:23:04', '2026-01-26 14:23:04'),
(119, 84, 'Web host Renew (medzpharma.eu)', 1.00, 74.88, 150.00, 150.00, 2, '2026-01-26 14:23:04', '2026-01-26 14:23:04', NULL),
(120, 80, '(dermivy.com) Domain Renew', 1.00, 13.78, 35.00, 35.00, 2, '2026-01-26 14:23:25', '2026-01-26 14:23:25', NULL),
(121, 77, '6  Zoho emails + 10GB Extra Storage', 1.00, 77.47, 155.00, 155.00, 2, '2026-01-26 14:23:43', '2026-01-26 14:23:43', NULL),
(122, 79, '(criivo.eu) Domain Renew', 1.00, 7.18, 20.00, 20.00, 2, '2026-01-26 14:23:55', '2026-01-26 14:24:09', '2026-01-26 14:24:09'),
(123, 79, '(criivo.eu) Domain Renew', 1.00, 7.18, 20.00, 20.00, 2, '2026-01-26 14:24:09', '2026-01-26 14:24:09', NULL),
(124, 85, 'Domain Renew for (arminasluxury.com)', 1.00, 14.98, 30.00, 30.00, 2, '2026-02-28 05:50:05', '2026-03-12 01:50:40', '2026-03-12 01:50:40'),
(125, 85, 'Domain Renew for (arminasluxury.com)', 1.00, 14.98, 30.00, 30.00, 2, '2026-03-12 01:50:40', '2026-03-12 01:50:40', NULL),
(126, 86, 'Linux Shared Hosting - Business (www.arminasluxury.com)', 1.00, 171.72, 270.00, 270.00, 2, '2026-03-15 07:40:47', '2026-03-17 09:42:08', '2026-03-17 09:42:08'),
(127, 87, 'Web host Renewal (zonnlighting.com)', 1.00, 74.88, 120.00, 120.00, 2, '2026-03-15 07:53:49', '2026-03-17 08:32:14', '2026-03-17 08:32:14'),
(128, 87, 'Domain Renew (zonnlighting.com)', 1.00, 18.48, 40.00, 40.00, 2, '2026-03-15 07:53:49', '2026-03-17 08:32:14', '2026-03-17 08:32:14'),
(129, 88, 'Web host Renewal (ishtar-north.com)', 1.00, 74.88, 120.00, 120.00, 2, '2026-03-15 08:02:27', '2026-03-17 09:42:31', '2026-03-17 09:42:31'),
(130, 88, 'Domain Renew (ishtar-north.com)', 1.00, 18.48, 40.00, 40.00, 2, '2026-03-15 08:02:27', '2026-03-17 09:42:31', '2026-03-17 09:42:31'),
(131, 87, 'Web host Renewal (zonnlighting.com)', 1.00, 74.88, 120.00, 120.00, 2, '2026-03-17 08:32:14', '2026-03-17 08:32:31', '2026-03-17 08:32:31'),
(132, 87, 'Domain Renew (zonnlighting.com)', 1.00, 14.78, 40.00, 40.00, 2, '2026-03-17 08:32:14', '2026-03-17 08:32:31', '2026-03-17 08:32:31'),
(133, 87, 'Web host Renewal (zonnlighting.com)', 1.00, 74.88, 120.00, 120.00, 2, '2026-03-17 08:32:31', '2026-03-17 08:32:31', NULL),
(134, 87, 'Domain Renew (zonnlighting.com)', 1.00, 14.78, 40.00, 40.00, 2, '2026-03-17 08:32:31', '2026-03-17 08:32:31', NULL),
(135, 86, 'Linux Shared Hosting - Business (www.arminasluxury.com)', 1.00, 171.72, 270.00, 270.00, 2, '2026-03-17 09:42:08', '2026-03-17 09:42:08', NULL),
(136, 88, 'Web host Renewal (ishtar-north.com)', 1.00, 74.88, 120.00, 120.00, 2, '2026-03-17 09:42:31', '2026-03-30 16:01:38', '2026-03-30 16:01:38'),
(137, 88, 'Domain Renew (ishtar-north.com)', 1.00, 14.78, 40.00, 40.00, 2, '2026-03-17 09:42:31', '2026-03-30 16:01:38', '2026-03-30 16:01:38'),
(138, 89, 'Domain Registration for (seepacompany.com)', 1.00, 8.18, 30.00, 30.00, 2, '2026-03-26 16:16:42', '2026-03-26 16:19:17', '2026-03-26 16:19:17'),
(139, 89, 'Web host to host Website (Sever)', 1.00, 34.88, 100.00, 100.00, 2, '2026-03-26 16:16:42', '2026-03-26 16:19:17', '2026-03-26 16:19:17'),
(140, 89, 'Business email (info@seepacompany.com)', 1.00, 0.00, 0.00, 0.00, 2, '2026-03-26 16:16:42', '2026-03-26 16:19:17', '2026-03-26 16:19:17'),
(141, 89, 'SSL certificate', 1.00, 0.00, 0.00, 0.00, 2, '2026-03-26 16:16:42', '2026-03-26 16:19:17', '2026-03-26 16:19:17'),
(142, 89, 'Domain Registration for (seepacompany.com)', 1.00, 8.18, 30.00, 30.00, 2, '2026-03-26 16:19:17', '2026-03-26 16:19:54', '2026-03-26 16:19:54'),
(143, 89, 'Web host to host Website (Sever)', 1.00, 34.88, 100.00, 100.00, 2, '2026-03-26 16:19:17', '2026-03-26 16:19:54', '2026-03-26 16:19:54'),
(144, 89, 'Business email (info@seepacompany.com)', 1.00, 0.00, 0.00, 0.00, 2, '2026-03-26 16:19:17', '2026-03-26 16:19:54', '2026-03-26 16:19:54'),
(145, 89, 'SSL certificate', 1.00, 0.00, 0.00, 0.00, 2, '2026-03-26 16:19:17', '2026-03-26 16:19:54', '2026-03-26 16:19:54'),
(146, 89, 'Domain Registration for (seepacompany.com)', 1.00, 8.18, 30.00, 30.00, 2, '2026-03-26 16:19:54', '2026-03-26 16:40:15', '2026-03-26 16:40:15'),
(147, 89, 'Web host to host Website (Sever)', 1.00, 34.88, 100.00, 100.00, 2, '2026-03-26 16:19:54', '2026-03-26 16:40:15', '2026-03-26 16:40:15'),
(148, 89, 'Business email (info@seepacompany.com)', 1.00, 0.00, 0.00, 0.00, 2, '2026-03-26 16:19:54', '2026-03-26 16:40:15', '2026-03-26 16:40:15'),
(149, 89, 'Domain Registration for (seepacompany.com)', 1.00, 8.18, 30.00, 30.00, 2, '2026-03-26 16:40:15', '2026-03-30 15:44:16', '2026-03-30 15:44:16'),
(150, 89, 'Web host to host Website (Sever)', 1.00, 34.88, 100.00, 100.00, 2, '2026-03-26 16:40:15', '2026-03-30 15:44:16', '2026-03-30 15:44:16'),
(151, 89, 'Business email (info@seepacompany.com)', 1.00, 0.00, 0.00, 0.00, 2, '2026-03-26 16:40:15', '2026-03-30 15:44:16', '2026-03-30 15:44:16'),
(152, 89, 'SSL Certificate', 1.00, 0.00, 0.00, 0.00, 2, '2026-03-26 16:40:15', '2026-03-30 15:44:16', '2026-03-30 15:44:16'),
(153, 89, 'Domain Registration for (seepacompany.com)', 1.00, 8.18, 30.00, 30.00, 2, '2026-03-30 15:44:16', '2026-03-30 15:44:16', NULL),
(154, 89, 'Web host to host Website (Sever)', 1.00, 34.88, 100.00, 100.00, 2, '2026-03-30 15:44:16', '2026-03-30 15:44:16', NULL),
(155, 89, 'Business email (info@seepacompany.com)', 1.00, 0.00, 0.00, 0.00, 2, '2026-03-30 15:44:16', '2026-03-30 15:44:16', NULL),
(156, 89, 'SSL Certificate', 1.00, 0.00, 0.00, 0.00, 2, '2026-03-30 15:44:16', '2026-03-30 15:44:16', NULL),
(157, 90, 'Renew - PositiveSSL (HTTPS)', 1.00, 23.95, 30.00, 30.00, 2, '2026-03-30 15:50:26', '2026-04-06 13:48:23', '2026-04-06 13:48:23'),
(158, 88, 'Web host Renewal (ishtar-north.com)', 1.00, 74.88, 120.00, 120.00, 2, '2026-03-30 16:01:38', '2026-03-30 16:02:06', '2026-03-30 16:02:06'),
(159, 88, 'Domain Renew (ishtar-north.com)', 1.00, 14.78, 40.00, 40.00, 2, '2026-03-30 16:01:38', '2026-03-30 16:02:06', '2026-03-30 16:02:06'),
(160, 88, 'Web host Renewal (ishtar-north.com)', 1.00, 74.88, 120.00, 120.00, 2, '2026-03-30 16:02:06', '2026-04-06 13:48:13', '2026-04-06 13:48:13'),
(161, 88, 'Domain Renew (ishtar-north.com)', 1.00, 14.78, 40.00, 40.00, 2, '2026-03-30 16:02:06', '2026-04-06 13:48:13', '2026-04-06 13:48:13'),
(162, 88, 'Web host Renewal (ishtar-north.com)', 1.00, 74.88, 120.00, 120.00, 2, '2026-04-06 13:48:13', '2026-04-06 13:48:13', NULL),
(163, 88, 'Domain Renew (ishtar-north.com)', 1.00, 14.78, 40.00, 40.00, 2, '2026-04-06 13:48:13', '2026-04-06 13:48:13', NULL),
(164, 90, 'Renew - PositiveSSL (HTTPS)', 1.00, 23.95, 30.00, 30.00, 2, '2026-04-06 13:48:23', '2026-04-06 13:48:23', NULL),
(165, 91, 'Domain Transfer (bosalaalthahabia.com)', 1.00, 11.38, 22.00, 22.00, 2, '2026-04-30 04:53:50', '2026-06-20 03:38:42', '2026-06-20 03:38:42'),
(166, 92, 'New Domain Registration (mada-lighting.com)', 1.00, 8.18, 25.00, 25.00, 2, '2026-05-05 09:45:28', '2026-05-05 09:45:49', '2026-05-05 09:45:49'),
(167, 92, 'New Domain Registration (mada-lighting.com)', 1.00, 8.18, 25.00, 25.00, 2, '2026-05-05 09:45:49', '2026-05-05 10:25:30', '2026-05-05 10:25:30'),
(168, 92, 'New Domain Registration (mada-lighting.com)', 1.00, 8.18, 25.00, 25.00, 2, '2026-05-05 10:25:30', '2026-05-13 03:22:32', '2026-05-13 03:22:32'),
(169, 92, 'New Domain Registration (mada-lighting.com)', 1.00, 8.18, 25.00, 25.00, 2, '2026-05-13 03:22:32', '2026-05-13 03:22:32', NULL),
(170, 93, 'Domain Renewal for (quartier-francais.co)', 1.00, 31.98, 60.00, 60.00, 2, '2026-05-13 03:25:20', '2026-05-30 09:17:33', '2026-05-30 09:17:33'),
(171, 93, 'Domain Renewal for (quartier-francais.co)', 1.00, 31.98, 60.00, 60.00, 2, '2026-05-30 09:17:33', '2026-05-30 09:17:33', NULL),
(172, 94, 'Develop of Shipment Tracking System', 1.00, 0.00, 2000.00, 2000.00, 2, '2026-05-30 10:58:40', '2026-06-07 11:09:45', '2026-06-07 11:09:45'),
(173, 95, 'VPS Hosting ??? 1 Year Subscription', 1.00, 60.00, 150.00, 150.00, 2, '2026-05-30 11:05:59', '2026-06-07 11:10:16', '2026-06-07 11:10:16'),
(174, 96, 'Zoho Workplace Plan : Mail 10GB (Business Email)', 4.00, 15.00, 15.00, 60.00, 2, '2026-05-31 13:17:38', '2026-05-31 13:18:21', '2026-05-31 13:18:21'),
(175, 96, 'Email Migration from Turbify yahoo business mail to Zoho', 4.00, 0.00, 15.00, 60.00, 2, '2026-05-31 13:17:38', '2026-05-31 13:18:21', '2026-05-31 13:18:21'),
(176, 96, 'Zoho Workplace Plan : Mail 10GB (Business Email)', 4.00, 15.00, 15.00, 60.00, 2, '2026-05-31 13:18:21', '2026-06-20 03:35:39', '2026-06-20 03:35:39'),
(177, 96, 'Email Migration fee from Turbify yahoo business mail to Zoho', 4.00, 0.00, 15.00, 60.00, 2, '2026-05-31 13:18:21', '2026-06-20 03:35:39', '2026-06-20 03:35:39'),
(178, 97, '1 Business Email Zoho Workplace Plan : Mail 10GB', 1.00, 14.71, 20.00, 20.00, 2, '2026-06-07 11:08:35', '2026-06-20 03:36:55', '2026-06-20 03:36:55'),
(179, 94, 'Develop of Shipment Tracking System', 1.00, 0.00, 2000.00, 2000.00, 2, '2026-06-07 11:09:45', '2026-06-07 11:09:45', NULL),
(180, 95, 'VPS Hosting ??? 1 Year Subscription', 1.00, 60.00, 150.00, 150.00, 2, '2026-06-07 11:10:16', '2026-06-07 11:10:16', NULL),
(181, 98, 'Develop of Ultra Movers Custom Website', 1.00, 0.00, 1400.00, 1400.00, 2, '2026-06-16 05:05:49', '2026-06-16 10:44:45', '2026-06-16 10:44:45'),
(182, 98, 'Develop of Ultra Movers Custom Website', 1.00, 0.00, 1400.00, 1400.00, 2, '2026-06-16 10:44:45', '2026-06-16 10:44:45', NULL),
(183, 99, 'Shared Web host for deepmonday.com Website', 1.00, 34.88, 50.00, 50.00, 2, '2026-06-19 03:52:16', '2026-06-19 03:54:08', '2026-06-19 03:54:08'),
(184, 99, 'Shared Web host for deepmonday.com Website', 1.00, 34.88, 50.00, 50.00, 2, '2026-06-19 03:54:08', '2026-07-17 13:46:01', '2026-07-17 13:46:01'),
(185, 96, 'Zoho Workplace Plan : Mail 10GB (Business Email)', 4.00, 15.00, 15.00, 60.00, 2, '2026-06-20 03:35:39', '2026-06-20 03:35:55', '2026-06-20 03:35:55'),
(186, 96, 'Email Migration fee from Turbify yahoo business mail to Zoho', 4.00, 0.00, 15.00, 60.00, 2, '2026-06-20 03:35:39', '2026-06-20 03:35:55', '2026-06-20 03:35:55'),
(187, 96, 'Zoho Workplace Plan : Mail 10GB (Business Email)', 4.00, 15.00, 15.00, 60.00, 2, '2026-06-20 03:35:55', '2026-06-20 03:35:55', NULL),
(188, 96, 'Email Migration fee from Turbify yahoo business mail to Zoho', 4.00, 0.00, 15.00, 60.00, 2, '2026-06-20 03:35:55', '2026-06-20 03:35:55', NULL),
(189, 97, '1 Business Email Zoho Workplace Plan : Mail 10GB', 1.00, 14.71, 20.00, 20.00, 2, '2026-06-20 03:36:55', '2026-06-20 03:36:55', NULL),
(190, 91, 'Domain Transfer (bosalaalthahabia.com)', 1.00, 11.38, 22.00, 22.00, 2, '2026-06-20 03:38:42', '2026-06-20 03:38:42', NULL),
(191, 99, 'Shared Web host for deepmonday.com Website', 1.00, 34.88, 50.00, 50.00, 2, '2026-07-17 13:46:01', '2026-07-17 13:46:01', NULL),
(192, 82, 'Business Email (info@deepmonday.com)', 1.00, 15.00, 20.00, 20.00, 2, '2026-07-17 13:49:05', '2026-07-17 13:49:05', NULL),
(193, 100, 'Custome website', 1.00, 0.00, 1000.00, 1000.00, 2, '2026-07-17 13:51:46', '2026-07-17 13:53:17', '2026-07-17 13:53:17'),
(194, 100, 'Develop of Bosalaalthahabia Custom Website', 1.00, 0.00, 1000.00, 1000.00, 2, '2026-07-17 13:53:17', '2026-07-17 13:54:06', '2026-07-17 13:54:06'),
(195, 100, 'Develop of Bosalaalthahabia Custom Website', 1.00, 0.00, 1000.00, 1000.00, 2, '2026-07-17 13:54:07', '2026-07-17 13:54:07', NULL),
(196, 101, 'Develop a custom Warehouse Management System for Ultra Movers Company', 1.00, 0.00, 5500.00, 5500.00, 2, '2026-07-17 13:57:53', '2026-07-17 13:57:53', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2025_11_07_171124_create_companies_table', 1),
(5, '2025_11_07_171148_create_clients_table', 1),
(8, '2025_11_07_180109_create_personal_access_tokens_table', 2),
(9, '2025_11_08_000001_create_client_company_table', 3),
(10, '2025_11_08_000002_update_clients_table_remove_company_id', 3),
(11, '2025_11_07_174027_create_invoices_table', 4),
(12, '2025_11_07_174041_create_invoice_items_table', 4),
(13, '2025_11_12_112926_create_settings_table', 5);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` text NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(3, 'App\\Models\\User', 2, 'auth-token', 'b323ee68f4343e00c1af6e6f838453c5263c37f7c89ed991bf41db414d3d4416', '[\"*\"]', '2025-11-19 10:16:11', NULL, '2025-11-19 10:12:38', '2025-11-19 10:16:11'),
(7, 'App\\Models\\User', 2, 'auth-token', '6319199e99dc1bd310e38466025744067943c012eef012f71844586266aaf8b0', '[\"*\"]', '2026-01-23 15:59:31', NULL, '2026-01-23 15:44:59', '2026-01-23 15:59:31'),
(10, 'App\\Models\\User', 2, 'auth-token', '469cecb6188477f55b4afea7950cc28971ce06aeac2a174a6e906e3d6800750f', '[\"*\"]', '2026-03-17 09:46:47', NULL, '2026-03-12 01:50:21', '2026-03-17 09:46:47'),
(11, 'App\\Models\\User', 2, 'auth-token', '3123480649f30f1561288ff84cde56babe7f3a67169e8b182da82b4d70748d56', '[\"*\"]', '2026-03-27 00:54:10', NULL, '2026-03-26 15:31:44', '2026-03-27 00:54:10'),
(18, 'App\\Models\\User', 2, 'auth-token', '8ee8244592b78fe8101a3605977bf9ee1b1b00b8c17609b01ef135543945c7b7', '[\"*\"]', '2026-05-31 13:23:16', NULL, '2026-05-31 13:13:46', '2026-05-31 13:23:16'),
(19, 'App\\Models\\User', 2, 'auth-token', 'ccc18b2ca60406414ac0190e3f45db8f4602cd10b9ed2a00dd02b4d641a200e8', '[\"*\"]', '2026-05-31 13:37:47', NULL, '2026-05-31 13:37:19', '2026-05-31 13:37:47'),
(20, 'App\\Models\\User', 2, 'auth-token', 'f3e57af4469c4cd359919b78fe306b2c26b3a2c0b1b35857a186127434db4eee', '[\"*\"]', '2026-06-07 10:57:13', NULL, '2026-06-07 10:56:48', '2026-06-07 10:57:13'),
(22, 'App\\Models\\User', 2, 'auth-token', 'ed5d17793330d9be92821311015b6803eed5af1279d4b2b4c3f3301831c78052', '[\"*\"]', '2026-06-19 05:10:04', NULL, '2026-06-16 05:02:23', '2026-06-19 05:10:04'),
(23, 'App\\Models\\User', 2, 'auth-token', 'f5349924dcd149d293c82b6f6f53011fb642a715c623801d3b856ddad7d1b4a5', '[\"*\"]', '2026-06-20 03:38:50', NULL, '2026-06-20 03:27:35', '2026-06-20 03:38:50'),
(24, 'App\\Models\\User', 2, 'auth-token', '5c9ed0c813bddc496f3547e99f8fb99dc0ad3d4e8528f2646125d3fe059b1aa7', '[\"*\"]', NULL, NULL, '2026-07-17 11:21:00', '2026-07-17 11:21:00'),
(25, 'App\\Models\\User', 3, 'auth-token', '2de7d7aef35c89c24f18c8ba62dacce887da32dfae5d2f61d14ca03abb2b92c7', '[\"*\"]', NULL, NULL, '2026-07-17 11:21:27', '2026-07-17 11:21:27'),
(26, 'App\\Models\\User', 2, 'auth-token', '5c198b10f8d8e18a86d80c1e4592042917e67909f5ccf6f8c3af1b22903ce308', '[\"*\"]', NULL, NULL, '2026-07-17 11:24:50', '2026-07-17 11:24:50'),
(34, 'App\\Models\\User', 2, 'auth-token', '32bdb4325f0cc91f08c403f81b6b8f36bd50e6590b8ce5ed4eeaf350a99879c4', '[\"*\"]', '2026-07-17 13:47:39', NULL, '2026-07-17 13:37:36', '2026-07-17 13:47:39'),
(35, 'App\\Models\\User', 2, 'auth-token', '5a7c6eef02f040de701ac55ae54d8f3a73541ca45f95d28c294dc15905fddae6', '[\"*\"]', '2026-07-17 14:01:28', NULL, '2026-07-17 13:42:16', '2026-07-17 14:01:28');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('0jbQnnJSs05gPHXOGdDGkvroRmMid07QMwOWh711', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYlFzM3dQMTd3WEZ5OVNxMlJPamRPblNxVklISko4RnlEZXVQZk5rQiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvZGFzaGJvYXJkL3N0YXRpc3RpY3MiO3M6NToicm91dGUiO047fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1784306583),
('0Z8aSJMwaq2rnlbe1iB8cVK0b0JtiM58SQyUk0DR', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiajhxMEg1SHpxeDRrTENlMm5CTWRIck9ZMDUxWjNLM3NlbHQxMXpkbCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvY2xpZW50cy8xNi9jb21wYW5pZXMiO3M6NToicm91dGUiO047fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1781937427),
('0zKb95rk17op76jTJChxBXPTBmhAE0ukMzAlPORh', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoib3l6R2hRcFNDS1RDYUVzNG1uYWVST2pQMkdsUjZaaHhwcFVkMUxuSyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTM6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaW52b2ljZXM/cGFnZT0xJnBlcl9wYWdlPTEwIjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1784307143),
('104hud0FOGuO4NatcNEyMGz3mkyLXyxaPp9Hvwod', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVUJpYm01TjIxS2k5SHFiVUdRTVhOZmVsRllzbEsyQlBqenFVaGVEeiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzc6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaW52b2ljZXMvOTgiO3M6NToicm91dGUiO047fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1784307151),
('1dRSo9TgQiyGxmTpXc0KtF4sCLpDb3kros8whEEB', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiaUkwcWsxbzVwSFpDdVY3TWRONktZUjhjdnNqbWk1Y1dvcVdPUWVsUSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvY2xpZW50cy8xNC9jb21wYW5pZXMiO3M6NToicm91dGUiO047fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1784306729),
('1GAu9x9df8xn4SN9SbT82xCMVdUyCj0sTUiMDYE8', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiU1E3RnRkekJXdEd0aXp0dFBFd0ZLWDFVSm5Tdm5aWUwyWHRpbTlMbiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NjI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaW52b2ljZXM/cGFnZT0xJnBlcl9wYWdlPTEwJnNlYXJjaD12IjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1781854877),
('1iyjySjr7vozKhqtkrgQL3DHFTaz4TfWLSVidJw6', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiOXJ0SFpRUHhmTnVCTGduRzFtYTl4YW4wQUdieGVYT09NYk4zVkxrRyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1784298461),
('1J5R9665NtkJmYBfzQm0ieK9WdDZ2Ltw84EQWbtL', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUkFkT1o0Tmw0b0xCclQ0U1NpVUhPNkx2amp4WVZKT2FSeGx5WU5LWCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTQ6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvY29tcGFuaWVzP3BhZ2U9MSZwZXJfcGFnZT0xMCI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1784305896),
('1oq1H9BIXBj309kyKEakdvR9Dd74ylqgtPXTrUs2', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiV1RiUUZBSkVWekxIWEQzbFZMTE1IVXNxZ01kSW04RlRPdmxjVkRPTiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTM6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaW52b2ljZXM/cGFnZT0xJnBlcl9wYWdlPTEwIjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1784307135),
('1Ssv9N2eqoigbw7MMuG3ouMadl5XbfikMDf4UcFo', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUWp5dGFiY2MySzRNUjFabHN2c2Z0RlpZWkNIOXJiVXg1VDhqTGY0ciI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvY2xpZW50cy8xNC9jb21wYW5pZXMiO3M6NToicm91dGUiO047fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1784306879),
('22KlNZCdjBgbxxewbQgUTHRDczUfFS9VuX9juKLB', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSHZUTnBRa3hOWmFnQzBGZGp1ZUFVeTR1MGJBQzVhSDNPTk5NN0l4ZyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvZGFzaGJvYXJkL3N0YXRpc3RpY3MiO3M6NToicm91dGUiO047fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1784306297),
('2fcc5U2OfM8ktbtLyrRUnMlnYbRr83ZgXRm7SDbE', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMHhEWG5zWXptTHlTV0Y4blE2dUdUVElMTUVkTm1lWG5pUEVQMzZXaCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTM6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaW52b2ljZXM/cGFnZT0yJnBlcl9wYWdlPTEwIjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1784307131),
('2fi8Cc1X3anyyPvu2txh9UOIPb73lFYcAADbNpyv', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNEt3dXRHT2p3N0hZZVE2amxKNThsVTczRFMyQnh2UTc5aFFpcWNtQiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTM6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaW52b2ljZXM/cGFnZT0xJnBlcl9wYWdlPTEwIjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1781937418),
('2w0UYVsg72OAHfDmmffTis2EOChyBSFrw2wNZiTJ', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTmo3UTVocWx4TldVc3BPanlGaU44Vkp1VHV0YWtEUWpHYW5WNFY1aCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTM6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaW52b2ljZXM/cGFnZT0xJnBlcl9wYWdlPTEwIjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1781851941),
('2W68aYNLAjabl5b1QDpQLpEdAnMKHymciJb8bQu7', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoia2lVVVZMb09hbzZxS1huaWFQdkhiUXBORmVXUWFKbmdSRFpVNGNIWSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvZGFzaGJvYXJkL3N0YXRpc3RpY3MiO3M6NToicm91dGUiO047fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1784306283),
('37hSKDEyEYh2RguzsQ2hAgrRwnkp3dubMOfjJFQm', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoic1RnelQ0M0h3OUY4aE9qdHdkYVdRQWxVVXozMFBrTnVleWRpd0dvNSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDc6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvY2xpZW50cz9wZXJfcGFnZT0xMDAwIjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1781937378),
('37mqMDr89FeJB35BBBctIgWw3I8Tc1VTgBg9Nnsy', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMHRPRGE3NU5RdENnUDBURFc0cFMySnRMR1VoYVZjY1RzS1hEUWl4cyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTM6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaW52b2ljZXM/cGFnZT0xJnBlcl9wYWdlPTEwIjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1784306955),
('3ajVENtod0GXDTrzXItUdaoSh0oknaYNJaKq63XV', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiOG1XOGNQUmxSdzRpRENQMWt1NmRLR3hLWXV4UDVYTGJZQmJSRDFWcyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvY2xpZW50cy8xNC9jb21wYW5pZXMiO3M6NToicm91dGUiO047fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1784306730),
('3eIlANzEixoMvU2P4KDMMsOZno9nFOnsBV1CbEyZ', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRWNUYkpVWnNyMUdXVGhzVEMwY051c0JZY2FZaGpOY3dJOU9FT0RjcCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTM6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaW52b2ljZXM/cGFnZT0xJnBlcl9wYWdlPTEwIjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1784306953),
('3ggNponVqqFDrOjGVlTEMZrE9SjxrFkx7Lr4R1VE', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWVd0djFrbDJqZmZ1Y1VXQmlqSkk0a01GUW4zdW9QdVBUUUtHQmNBMiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDc6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvY2xpZW50cz9wZXJfcGFnZT0xMDAwIjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1781937425),
('3IJ7cBvwfFKUhDCRQTjc3OdVInPa0W7j2dKBv2CJ', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiNWlaSEd5SUhWb3ljRG4zcklLTTNPMlNwaWJNckFEYTF4MjhTMGl4UCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1781852048),
('3Jzoqn1zCigOPdRNmTYNZe8fMZM3Iq5tVjp5CEO0', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoib2VvaXBlWkl5bXdURUNOa0xCWllvR0NVU1pjUGxqOTg2QVloR2xKMyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjg6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvbWUiO3M6NToicm91dGUiO047fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1784306857),
('3lHA748gtVoBjX9LBWpuFQSVeEDDc4airv9ClGQL', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiM3cyM3laeWV0MmNvVjJ5RTZ2QjhqU1BRTDdJN09QaHJ0eEh3bkh4bCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzc6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaW52b2ljZXMvODIiO3M6NToicm91dGUiO047fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1781856604),
('3Rngw16KDe1mc4hOISbdhE2B5q9Px0LyQzkr3XDj', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidWxHWEJwN3FZd0Z3bXBkaHo0d21KV3VzaTF2TTlxcGZhSUZZaVdsQyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTM6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaW52b2ljZXM/cGFnZT0xJnBlcl9wYWdlPTEwIjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1784307110),
('3Vr5hJMKQLvYCOcMgIBe3o0oHr9kKlESl3x5rjzX', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiU3NIcUV4WEE2ajJGaGtDQmNDWVVHMzZZUXVkaGk4Ymd4UzJaUk9VeiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvZGFzaGJvYXJkL3N0YXRpc3RpY3MiO3M6NToicm91dGUiO047fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1784306258),
('3wzgJaseqASzslc7m6DGQPPayKVrEJYF5UrX8Yp4', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYzEzck1kdnlFZThHZUg2Vklvb0xDMnJ6MjhUZ2JUZVlTWjg2QzhrNiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvZGFzaGJvYXJkL3N0YXRpc3RpY3MiO3M6NToicm91dGUiO047fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1784306537),
('4bZbtF4K4HsoAACQ88PHMEFcQnedeSzoWlylfiue', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoieU5CR1dEbDlrWFVxM2oyWWFWTGJGZVFqeThianhNYkM3QnF4aVpCUSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1784305343),
('4GP4ZyIWZslF1SlyWN4hKIgg6qfvYb8c6p2oIT3F', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSFRwUENNV0xtRG8xNzNKUjdTNm91YzRBUDBUeXU5TThyaUVpdUxraSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NjM6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaW52b2ljZXM/cGFnZT0xJnBlcl9wYWdlPTEwJnNlYXJjaD1aYSI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1784306982),
('4MoYflkwdZpT5TkqIL6rTTx2L0e7EmypCcdKWIv8', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWW1wQjBZQzd5enh5NTg0aFR4bWRwZTdZRlNoYTBMRXA4RjY4NFhyTyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTM6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaW52b2ljZXM/cGFnZT0xJnBlcl9wYWdlPTEwIjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1781937358),
('50KjLJZGG5iDQ5v61zJ54WevrxWJjpsvXtMEKhcA', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWnFFM0lHc2dxdXNYa3lIR0ZPVUJnSXJSWVpqMzVpbWRKQ1NRblMzRCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzc6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaW52b2ljZXMvOTgiO3M6NToicm91dGUiO047fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1784307205),
('5iy6QrpBgwo7xYf6b2UpoiyNaZuRG7ydoPnQcyQL', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZk1pazlvN0FXd2lJQ1d5R1RjTk1Fd3NnclZsYkRKem5wMzg1RzV2YSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTM6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaW52b2ljZXM/cGFnZT0xJnBlcl9wYWdlPTEwIjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1784307109),
('5MGTWD3CucaQI32Ton6jTiPWxXv94iOmH1n0zM3V', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUGs2UzlydzlBR2s0UGJDWmJWSDV3YVd5SGZjSVo4SHpyWjhRZE16cCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvZGFzaGJvYXJkL3N0YXRpc3RpY3MiO3M6NToicm91dGUiO047fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1781937530),
('5MLSUgoquPX9pFcXUMPHCG1f0KMUPNQkRVUayTZX', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoib1JjanBOOXU4SlJFM1VSTW1xYkJ3blRxaHhTeUlvV3FIM011eHlBQiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvZGFzaGJvYXJkL3N0YXRpc3RpY3MiO3M6NToicm91dGUiO047fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1781936861),
('64ergM4x3wREVt0jzWXRNsxAAS7mX2ItaP3rZ8NB', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUXkydVlvQ0RxNDZmWGs0VlR6MFZsWm94SlVDUTJ5ZG9CeUNhN0NSVyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvY2xpZW50cz9wYWdlPTEmcGVyX3BhZ2U9MTAiO3M6NToicm91dGUiO047fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1784306571),
('6BXztoLrLzSyM17CrUud0h8spShURlpzwLhJehV5', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiU0hHY0ZvblB1MzNTRFFQTG1JODFVWktab090dEpYUDEzb2ltQnFiMCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTM6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaW52b2ljZXM/cGFnZT0xJnBlcl9wYWdlPTEwIjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1784307163),
('6F6O0SFqYLYQXidOUwqbIKvwcvCBH2TWd3iD8VOP', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWlpaQ1hNZEE2bE1XZ0tNaDFsRWwyZ25OTm9nMkI4WEQ2QjA1SHNCaSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzc6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaW52b2ljZXMvOTYiO3M6NToicm91dGUiO047fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1781937317),
('6KT9kZXSLqioKi9xtn8XdcOd9XPA28nO7Bl49ni6', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicldmUEdBYm5Hb0NwSUJhZWpkWnhWWXZUbWtzSGM1NUV4Y2xxTm9xdyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvY2xpZW50cy8xNi9jb21wYW5pZXMiO3M6NToicm91dGUiO047fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1781937379),
('6Lqj8hwv00QDqseXLzWJL5nUNDTmKqmMVcir06ei', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQ0lZeHpWYWdtanpCSmh4NWlkTk1qdDM0THduOTNyQjBhMjd3b2h3OCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvZGFzaGJvYXJkL3N0YXRpc3RpY3MiO3M6NToicm91dGUiO047fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1784306770),
('6t5VCJLJzlBY920f1PC5TvLirzy0WI8mLsyfVOML', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTnd1Q2I3RlBLd1FCRGlsYmlJc1dkd1B4UWZEbDh0emJ0TXhUTWozMiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTM6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaW52b2ljZXM/cGFnZT0xJnBlcl9wYWdlPTEwIjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1784307659),
('6Yip4KtnaQ93SbOuf7QbQjKebHOafRlZYGPn8wE5', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMlNEem1FbVRLRVlJOGNldFppUVVvWU1ZNHZlb0pIWko0eE5INGdGaSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvY2xpZW50cy8xNi9jb21wYW5pZXMiO3M6NToicm91dGUiO047fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1784307170),
('6yk6ruUanEcIGMMCjjjQTp4a9flzecIf8Zkydmi1', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYnB1dzNPUGVlWWxOdjJnMDlLV05Nb0gxMm1Kc042ekpPRHp6REtXSyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NjQ6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaW52b2ljZXM/cGFnZT0xJnBlcl9wYWdlPTEwJnNlYXJjaD12aXkiO3M6NToicm91dGUiO047fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1781854878),
('717djPdSQ8Dtqf77x5XjgsdHuyyKq2qVZPad0FAn', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiejFwcmliOWRhWXNLY2pEOEhrZ2htaVdsbHpDVVRKZzBzT3JZNFZ5SiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvZGFzaGJvYXJkL3N0YXRpc3RpY3MiO3M6NToicm91dGUiO047fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1784306257),
('71SSZBVkXP7H5jpe1Gme7lsLqsYdBEHh0RYBaJDr', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiR3pjTnBRNDhSdmo1c0JndUV3bWxCTTRyU0F2WGpKd2ViV1RyTjhOUyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTM6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaW52b2ljZXM/cGFnZT0xJnBlcl9wYWdlPTEwIjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1781937342),
('749UoMALs74CSL6Ny0IXT4dz3gCIl2gE02kn97tg', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiNm1SWXBsQUs2VndwREl6eWpSaEN6d05SRHg4RU84VHdxeEtMR2ZnZiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1784298544),
('76f38Tv8enFmKJKTJNSiE24jlu4UBUxbRbKdz7mk', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUDJQY2lzV28zb0Q5ejdJczhCd3hzejJqSVlnNEMxcllGWEZhZ0N1QSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTM6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaW52b2ljZXM/cGFnZT0xJnBlcl9wYWdlPTEwIjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1784307140),
('79ewsgf7CoargkBVp5iimx3geWbeEZfAoSBcIXsO', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiV2J1bVB5WnlMZjB4aGY3eHJxVDJQNTRSaEJoSnVlSkR5QTR4R21rSCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDc6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvY2xpZW50cz9wZXJfcGFnZT0xMDAwIjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1784307151),
('7APydqriLFhBQCVSO5NTsups2pmqN9Zh6uEl32E6', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTlVRaEVSV25GbDBZeWRrT3lBM3pWeHZBWWIzRjRJdTRucHhrSHBCRiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTM6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaW52b2ljZXM/cGFnZT0yJnBlcl9wYWdlPTEwIjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1784307132),
('7DvTvGrGuqwhl57KBXN6zHNN02q6d4TeBHIEAlJr', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZ1MwdDlWZG1sUW9pM0lXUjlYOHRZWlczemVXU2dIaTBzenZpeGpodCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjg6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvbWUiO3M6NToicm91dGUiO047fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1784306856),
('7HYCV6TrYVy5mauzlqygDGSarRKWU87jteKmCt7a', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNklnbjhvYjVMd1Y1OUl1UEViWGxkNDlLN2hQWktPc3dzMWZ1Q1FiSCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTM6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaW52b2ljZXM/cGFnZT0xJnBlcl9wYWdlPTEwIjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1781937343),
('7k0qBaQecGmI7IzOh56ULbzd2QtONVv0c7yI2KAs', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZGROdjJNOGhQaUY3VkRaOGtrd1A0aFB3NmdLbG4xV3V0RllVQ2doWiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzc6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaW52b2ljZXMvOTgiO3M6NToicm91dGUiO047fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1784307152),
('7U3R2pxd6CMBbE3PSz3M1a4untJbw9MNyTXcAMa7', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoia2F3S3BUYlNzU2VBVzBPanVVSjlwMEtZUDNhMFN1RE1Bb25BSUlHUiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvY2xpZW50cz9wYWdlPTEmcGVyX3BhZ2U9MTAiO3M6NToicm91dGUiO047fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1784306201),
('80htqShfZQxoYnh4VyaOM5SzzKxaiSBGG9JPbBjC', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTFNDOXR1MHJVbllkNWpBNFE1NEJxTXpNVVoxRTdKdmIwY3RhZzFyTSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDc6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvY2xpZW50cz9wZXJfcGFnZT0xMDAwIjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1784307217),
('87arsLmUqNRbdHt7W1XJn2OwyV3Tm85BHcntgAvt', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUnExSEdETzc5c0VhTEZxbVlVTU9SVTlLdW9YcDd0ZEkxQnRLVFJTUCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTM6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaW52b2ljZXM/cGFnZT0xJnBlcl9wYWdlPTEwIjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1784306723),
('8k9zsLe1POj6pMDZoqDrNTet3Z8cVLSA4FHHbjqq', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoicTFnang1SFhDbWNQdUxMbXFIRFNKbHBXMEdpeTcxWGtMRzBBSWlnZyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1781937415),
('8QHoB8DNw4J9v1nHWv5XBTjc69f1loJs4uCvDQKQ', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUGVtYXlqSjdDbERwQ2wwMUtyR0UyYm1xenJabExjV3NydjhMTm1KdSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzc6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaW52b2ljZXMvOTYiO3M6NToicm91dGUiO047fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1781937346),
('8tlqDmHpGavamktxXGzVp08WOjqLEMeVUgrCQjwZ', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMWZZMlpJY2ptOVpNbFlvUGkwN2I3TVhwdWpCNUlTa004cTNQZmZxayI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTM6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaW52b2ljZXM/cGFnZT0xJnBlcl9wYWdlPTEwIjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1784306723),
('8yqivlY0je3SN8VkIfPlK9ELvRRx7lynM2dDtWHn', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiOHBxUnVNTjB6cjlGNk9pelY1a2phcUYxZTFpb1JLdjJ3NUJyTDdQNyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTM6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaW52b2ljZXM/cGFnZT0xJnBlcl9wYWdlPTEwIjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1784307137),
('924sBrr6VEPVEAOgL5zwJy61KViGqtkksnZpv04b', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVEk2MlpLTVhHdDMweksxeTM2VjhIZ21QZXlFWnRnRHE1Qm9HTVc4SCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvY2xpZW50cy8xNy9jb21wYW5pZXMiO3M6NToicm91dGUiO047fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1784307153),
('97oJDB9RhxBJjhHpV7vnu7y3mdshaPversFxV8Hy', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicWVVTGFvblNMTUJoeFN5bFBEVU54Y3pkZHVRWEd2RHl2RW5OSk1reiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvY2xpZW50cy8xNi9jb21wYW5pZXMiO3M6NToicm91dGUiO047fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1784307170),
('9cL5RWGn1EWUAUY7kKgl3B7uxZDea9A4XrL6dZ92', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSHhIaVowQWVUNlpDeGNFTVRTYnJtRWVMemdUZmhuMXJETnJEVEZYSiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvY2xpZW50cy8xNi9jb21wYW5pZXMiO3M6NToicm91dGUiO047fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1781937381),
('9hH3FCwRNXaKJku1duPANtLz5R1Ks3HhY8rXMNFF', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiUVhsZjR3aFFxSW1Eem1RZEdHWjFDMFNYQkNDdHF4OHluSndjUmVSQyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1781937522),
('9hnen56w3jIAscnSdxX3NRrcB4KJMWkZPnAtzioD', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYjFsVTdiYnJrY1FXZXcwOHVZTjVQVkZ4dGt4TU1CeWRuUzZmSE1xVCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTM6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaW52b2ljZXM/cGFnZT0xJnBlcl9wYWdlPTEwIjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1784307250),
('9xTh86rSojkOuaKQZVuaftd9C4gpan1wNCzwvwlY', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiN0cwdTJ5OGViRHpkM1I5cDdvOXZGV1FHYmpWMkdWdXVhblBYY1VXaiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjg6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvbWUiO3M6NToicm91dGUiO047fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1784306685),
('a0evWa3mPaNUpK9oVHIDWIP3thHiYNUYnk3AoyPV', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUmpTYUJ1eVFWelA0TlJaUGFnT0xYcmNEN2wxcGNyQXQ3eDhtQUl0TCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTM6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaW52b2ljZXM/cGFnZT0yJnBlcl9wYWdlPTEwIjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1784307134),
('A1oocIDSwEApChyJ6or8eyfafeH94QGpjtBukfvT', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiOWRBYkpVU2FqOEpRM3pTcTF6WFVYR0l0RGFibGdEcnlQa0lKSkRLOSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvY2xpZW50cy8xNC9jb21wYW5pZXMiO3M6NToicm91dGUiO047fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1781851988),
('A77T0UwmEn5OhgwbqJBTIbKwfeGdFSgZ4RTYAsUn', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWFhBcnhoRDdBcjZrelZPUEZFeUZGNFVXOVloRnEyVWpvR1VGT2xWMiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTM6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaW52b2ljZXM/cGFnZT0xJnBlcl9wYWdlPTEwIjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1784307658),
('aclMivPUnt3M1x6UBtfNyowDgXcESRo4SzuXuvMq', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiOFdhYURyZzNJS21ScmYwZ1FwRkZ2Q0RGTWRSbHhPTUV3aVIxVW92ciI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvY2xpZW50cy8xNC9jb21wYW5pZXMiO3M6NToicm91dGUiO047fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1784306936),
('AM7dYA77NktJb1d6lVPsYXiPYCtk29O7v56mTDPW', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiend0MHdkbkl0MTNsOE1iWXR3RFJQTjlCR2FGY1N4RU5PSTlzTWVrSyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvZGFzaGJvYXJkL3N0YXRpc3RpY3MiO3M6NToicm91dGUiO047fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1784307483),
('arwfzGs2oLQmpeZ88txmgfcRCQcLpvpg2HEV58xA', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiU093RG44bXV0VWxISTJlMGdoRFQ2VTBJdHlLdlRUaEtZbVpiaHRkYSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1784298341),
('ATthAf65O6ZVypWdnClUfu06w1vbkGKW03Tr8Bjo', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQUhwczNoUW5Fb2ZVMVRuRE5kdGpYWGdaN0YzaUdOUHFTbHk1UVUwMiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvc2V0dGluZ3MiO3M6NToicm91dGUiO047fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1781852058),
('B7GRkjFqnBlsa5tKzr4jpWTqu7fynGj8FnWYfsWE', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidmFHT1haVDhaVXhEMVFCbWJtS1YyQzZENWVjRm85eEVLWHJPQWJLYyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTM6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaW52b2ljZXM/cGFnZT0xJnBlcl9wYWdlPTEwIjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1784306894),
('B9UPzm2ABBT34ZSiEaaz6iq2ynvY8OvqbWFm8X3r', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRlFkVmdhQkxZdmFUSTEzcnpBcFBMOEFXSjBWZzRNbVdSRkVRb0JNaCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvZGFzaGJvYXJkL3N0YXRpc3RpY3MiO3M6NToicm91dGUiO047fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1784306264),
('BaH3ME31UvHesS6D9RiAF0E7LZyEYlWwBVYCsVfJ', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoieUpxVGFxdDRCUjlMOGQ2bnFsMzN0V21FelUxTDhqQmZlU25ENTlSdCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTM6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaW52b2ljZXM/cGFnZT0xJnBlcl9wYWdlPTEwIjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1784307162),
('BhJGG0vVKiD9GIm0rCJfMZP7MA3CnRIldwbmHc7x', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZXc1Q0QxMU41ZERoT3RPSGpVQmxDa1pUNnVKbjhaQjBPQ2ZQcnN1WSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjg6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvbWUiO3M6NToicm91dGUiO047fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1784298518),
('BiDoMtZQnyUo99anGSH5k1TkxOdd3zD9Uhg84d48', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidXFBc3N2N2I4TU90TjZEYUo5Vm1CM3FFVTNnRHV0RXh0YlFlYnJGeiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvY2xpZW50cz9wYWdlPTEmcGVyX3BhZ2U9MTAiO3M6NToicm91dGUiO047fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1784306220),
('bKwRO8ZOkThTk8rgX7QekejQwzeZDuPn0GAgmmkR', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiSmFIbXBUcnBoODFFRVZUREtlWDhUTDhjUmF4amdGZ3RaMFFxZE1WVCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1784306256),
('Br0i0upSCJIgCywVJjwb4iagcdmL5a1c2wS74FRc', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoianJYd3dRUEgzM1RYOEpmWlIyR2xxMVFqQXlad1dsYkNWM296czNsNyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvZGFzaGJvYXJkL3N0YXRpc3RpY3MiO3M6NToicm91dGUiO047fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1784307688),
('BSXJvSSLMXuLkLOcB3vQokz3ECdicS75kgTmyrhO', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQ3Z3Y3hkT21ubDEyekRPOUJ6ZDhIUHV1THE0OGtLTlBkRTVkWW1wYyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTM6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaW52b2ljZXM/cGFnZT0xJnBlcl9wYWdlPTEwIjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1781852053),
('bTdQzJ7lfuQjRJG3muYkncjSJX6g4obnuc9kNMD1', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVDI5WVl6aE5iY1FTRXAzaE41T3VYTlh3aGU4cVRia1ZWMnZxeFpzVyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDc6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvY2xpZW50cz9wZXJfcGFnZT0xMDAwIjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1781851958),
('bVJL8SUq27ljn46sET6CQ6Ezhr8SnNKNMYTF4ugv', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoienpMRmFXWTZDWlZCV3VEaEZlM2s1UjZyNUxnR05kRHFuSmwwOVZINCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NjU6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaW52b2ljZXM/cGFnZT0xJnBlcl9wYWdlPTEwJnNlYXJjaD1aYW5hIjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1784306984),
('Bx1YGoQgMnaT0fxogGFzHtCNdAUCIDYtH21oWNRX', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiaEcwV1RITlhuUWd2c1B0NzNqV0dEMDNxMmVZMVBxUWdrMmFEa0NoSCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTM6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaW52b2ljZXM/cGFnZT0xJnBlcl9wYWdlPTEwIjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1784306859),
('c9FCILyLWa6WTp8OAIXcTwom3qrbHnn5yb94vxfk', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiUzNEOGk4Y1h2d2dBN3RkODc4enZsdXBWaWw3VzFwbVZJdWxINE9sciI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1784305553),
('CbIuNvJh4nh7pYcNgBN9Eb42uM3bTVkF4In5yT20', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZko2M0taajJsWFpMTG5NMlo4OExNaE41VFl5UjVhWVlqY2Y4VzFXSCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTM6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaW52b2ljZXM/cGFnZT0yJnBlcl9wYWdlPTEwIjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1784307137),
('Cd7oxdBkq1iBbK8qE1nPLaBPNKD9wQ2QOmHDtuvy', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoidjk4UG5CeHNnY2xHam1ISWd3M2tHSXNuZnJUY3llcERtWlIyRGJvOSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1784305365),
('cedVpWiKV5lKhLnCEyV90cLFGu4pgEf7THPwKvjU', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVXk3WWliTXNnMnoxZWFnMHJYQmp1dnl0T0duV3BMSnlkcDBDRVR2SSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvZGFzaGJvYXJkL3N0YXRpc3RpY3MiO3M6NToicm91dGUiO047fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1784306383),
('cgAfI5f5MBt66hDqLeUcaTGxDFxC5SLjHY9CJbAJ', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMWlOYTRSaGgzZEhXQlU0OWh6bW5YWnV6VDBxbG14QU00WnNjMjRPWCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvY2xpZW50cy8xNi9jb21wYW5pZXMiO3M6NToicm91dGUiO047fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1781937348),
('ciDmxsx4BLebWxu16xbwaVQHnik2Zn404A9KWyUp', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUTZFaTFlakFqM2NPNXlFQUlQNlpYWXZHd1hHRmxsOHlUSzJJT0NlOSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvZGFzaGJvYXJkL3N0YXRpc3RpY3MiO3M6NToicm91dGUiO047fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1784306289),
('CmuMZfnICrPKPbzq1NktNyvHn6RGVV2cw7DZIbVC', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQUxmUTlkRkZnN3docEg2cUZIVVk4RFl1UkU0ZkNMcFhPNzM5VTBtMCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Njc6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaW52b2ljZXM/cGFnZT0xJnBlcl9wYWdlPTEwJnN0YXR1cz11bnBhaWQiO3M6NToicm91dGUiO047fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1784306906),
('cqXp9cZwcPdF7wekN6QH7C2d3It6mNrrrwEwbrVJ', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiaEFIUFlmZ1BxaHhuRVgzcGkyY0Rmc2d5eTFiTGdiWW5oaFhvTTdjUCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTM6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaW52b2ljZXM/cGFnZT0xJnBlcl9wYWdlPTEwIjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1781937359),
('D5DZBhvP2tZMGZZMT9nqtlYGrPP5WJ2V3selBRr0', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiTnB5UFd1bmhUd2JJQmtwa3ltRTJVbWhoTjBOamhKQUxCTmM1aTAwRCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1784307473),
('ddBL0Lfc8wenJrWpStyiRvACj1P3vW5AuHxKCBSH', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVVk0MHcyeXFnMUtJZE9RbWhKR0tYSFU2V2xQRjVhbzdYb09Qdm9xVyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTM6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaW52b2ljZXM/cGFnZT0yJnBlcl9wYWdlPTEwIjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1784307135),
('DEkx1nXEMNzRwdmU32TyVmIj50T1IKGqLlRVIsBN', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZnBKcndEZEsyUndQU3dhQ3ByN1JpRUJoVVp2UTBvZ0FtSW83OU9xUiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvY2xpZW50cy8xNC9jb21wYW5pZXMiO3M6NToicm91dGUiO047fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1784306882),
('dFtba0hyYm6XhZ9iOgGDgT08COYIUUDJofdcMDJB', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiU3Q1Y2xlbW5ycFdXdVpsZ3p2ZTF4QU1vcWRHd1lGNjU0VzVvMEZLOCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTM6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaW52b2ljZXM/cGFnZT0xJnBlcl9wYWdlPTEwIjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1784307145),
('diOKcF7KUqCbQAgO87Ab5V57TLynQyvykGvWg9If', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSWdxVEswVkdyNmkyc1VZUmwwaU9QbDBWMWhIQVRINURNNWYyd2RjWiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTQ6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvY29tcGFuaWVzP3BhZ2U9MSZwZXJfcGFnZT0xMCI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1784305896),
('DiZ2Os9ucWrYVZvDNjyY809S5mxBLoTGcSIYy6xC', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVXdMMUhYTlJ3ME9lZkZxSm9wVVV1MkQ5YkhzWmxZbkxEZGJhaTBMUSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzc6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaW52b2ljZXMvODciO3M6NToicm91dGUiO047fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1781851958),
('DJk8ebfz7mkKhmsR4MCtCc2gfladT6H6MNT1sEWo', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicVROcUcyanVsNE1zakxSOVh6N2N2ZWl0SlFzZnNnMWZyUzhJT2xwMyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjg6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvbWUiO3M6NToicm91dGUiO047fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1784306693),
('dmSVws8Iza31ydLUqsxIyfHRRyHJMNAq5jbdvMzV', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiMnVTNjZRR09XU21iRXI0dVJadVhJSmZaTVF2akNRaWJCaW5RRmhYQSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1781936856),
('dP7702LmZy1iE9pxuaziIXlgrA7wfHm6CHvvdzth', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSUxjNW9xMWxHN3Nuc3RCSk9jaTFRQUF2SWVWWVZYaTZTQVVyaVU5WCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvZGFzaGJvYXJkL3N0YXRpc3RpY3MiO3M6NToicm91dGUiO047fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1784306383),
('dpTEmGpSYpfqPYbyIGJv5jp9cgV316f6dot6x4EH', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiaWpGR3o3SDY5YU9NQ29LU2RQRDZWUERxYXpldmZTOWlKRUdZdkNFUyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvY2xpZW50cy8xNy9jb21wYW5pZXMiO3M6NToicm91dGUiO047fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1784307207),
('dQchzFJ0UhVjVEuDz8TJsSoz1gB6taWuGFtmpcIO', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMHlTTk1XcXpUUGxiN1V6T2VNaGI1YjhEc01rTHpNYWh2NnJyc0I0NCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvZGFzaGJvYXJkL3N0YXRpc3RpY3MiO3M6NToicm91dGUiO047fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1784306226),
('DQjgjMh0KXZ0i2l2iwrqrtaRe7DYWy7NtaJcTjEs', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWFdDOWlDSUJiNTRWaklXT0c0ZzFORjhCWURzOUk3VXhzVjI5Mm1aVyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvY2xpZW50cy8xNi9jb21wYW5pZXMiO3M6NToicm91dGUiO047fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1781937319),
('dqOGTQnPoBtxn73TGkD1xjYzrvMV3RdixQqztZvY', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiME8yMVBkQ29BaE5NTDlnY2dBYzgxbWJqWmlsU1NSWUpET0tFUjBmNCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjg6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvbWUiO3M6NToicm91dGUiO047fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1784306674),
('Dt2LqIWkiCDXOk4YKEE9fJ5VjCrtTnLwZjvoY7wg', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiV3RoMTh3TDFIYTU4Sm9uWFlwbHlINVhiT1dSbDB0eFVTYjlpeXA5bSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzc6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaW52b2ljZXMvOTkiO3M6NToicm91dGUiO047fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1784306873),
('DUjLvjKCF7dbK6YPExcItY50Uw6Nj04SwnA8JXLp', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiU0taNXBWYmE2bWJIYkJXUktXZk5vaGdFR2tMMEhhQTNoZURsczlaViI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTM6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaW52b2ljZXM/cGFnZT0xJnBlcl9wYWdlPTEwIjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1781937418),
('dwS5ulwyWdVXplhuMcQC8hzCGQB7xtaxsBoJe5h7', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoidnZaREdDTGUweTI1QzExd1BaOFVvRW5VM1lra01iUFFaSGkwaFBJZyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1781851936),
('e80tCdmMUgdzTHIqSeWVHztitMyDQvajBnyW90pc', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUEkwQ0k0WWZCUjVLSjVNYmV1VEQwWFcwN3d3RHR4YmRLQmJEaE5NWiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTM6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaW52b2ljZXM/cGFnZT0xJnBlcl9wYWdlPTEwIjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1784307213);
INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('eAIoYzhZK1RltjCbu2UtkXgsW79ZEEopfldNmChy', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUGhtb0FWd2FaNXNPRXBabEZ0OWJnRFZ1aFE3SkdyeXpPQUpyQVBubSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvY2xpZW50cy8xNi9jb21wYW5pZXMiO3M6NToicm91dGUiO047fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1781937428),
('EdplMYzuvdj0QKzSAJvENtimj7umjIKcucvWFwgC', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYU1icUdFUUhoN3V3VExqRmdJM3lKa2MxMlV1YTFuVkNUMGljQTBkUyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvY29tcGFuaWVzP3BhZ2U9MSZwZXJfcGFnZT0xMDAwIjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1784306211),
('eEy7TT6m6dJm0f8JBUv9td5gZnVcF4tUUMUWQ0DS', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiemlkQ1JhV3Z6dXZkZnBWaE4yM2hQWk1FeEtBakE4dkNiaEZtMXFyQyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvY2xpZW50cy8xNi9jb21wYW5pZXMiO3M6NToicm91dGUiO047fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1781937427),
('EmZouyYvBwg0fqqESiNKepsQvqgB8he5I9mR1cqM', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoia2drTDlqRUlNcENHT1dra3A4MU1CeDhPeW41SmpibDVzZGZvczE0MCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTM6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaW52b2ljZXM/cGFnZT0xJnBlcl9wYWdlPTEwIjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1781851982),
('EUdfxLtTkB4v32fZRAcj7wohLgCSBYgxnSdSuUdV', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNE52bmNmRHV2ZHpTRDZkWklJSkFCQkVtejhNN2h4c2FYU0ZXR1ZrNSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvY2xpZW50cy8xNy9jb21wYW5pZXMiO3M6NToicm91dGUiO047fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1784307206),
('eUK2g3F7Fthn6tMF9Vwyq2C11MILTi05ZKX7a6Ie', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQlU0MGYzcTZtN0dUZk1URXVrZnRCZmpPblZ3YmdJWkpVemZhSWNEaSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvZGFzaGJvYXJkL3N0YXRpc3RpY3MiO3M6NToicm91dGUiO047fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1784306686),
('EW8FpM1lIQJdPaQNrZw78zzwvw0Y1DJZNgwZjNXQ', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZzNlZUVYaFFFNGR4dWZoS3l4ZlFhUjdON2VqbWZvMXpYczBLaDNlNyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvZGFzaGJvYXJkL3N0YXRpc3RpY3MiO3M6NToicm91dGUiO047fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1784306538),
('F6fCfvc6s27j6nX8J0okLrEog12sPgErphU1yF2R', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiMmhTSGFtTzBIZ2VnaWRuT3JMRUFvT3FSUFhRTVhTNFJ0dTJmNUc4YSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1781937355),
('F7R7IkiTMauNlJQpaHGVBWNFSxwaSBAyq7xLpJAu', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUzFScFZnODZaMDlpenhHbGxqTzAyV3poV2lKZDdwOEt4anA4M3ZIUSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvY2xpZW50cz9wYWdlPTEmcGVyX3BhZ2U9MTAiO3M6NToicm91dGUiO047fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1784306221),
('faOzeHeFeq5LtEEzEYiYKJ5n6UrG6IXzREzdSvWG', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSXJpMEtaRGNTeEEwblJPTDYwRm1JSGczTHJtb0dQNXJuc3Y5NzBLVyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTM6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaW52b2ljZXM/cGFnZT0xJnBlcl9wYWdlPTEwIjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1784306764),
('FbqkCXAA5FQBbHHyFEPeWFgh8nZcJgIZKDoVNmNZ', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSG54YkQzd1lLa0JnYUg1d211QTVzU3N2ODVWVUtiRk1ndDhOeTlhbiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDc6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvY2xpZW50cz9wZXJfcGFnZT0xMDAwIjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1784306727),
('fDxcjvZr9reYj2V03SWfYmTo4TE7COfe4povp7Ny', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSm1hUGJ3NENyamhyYjQzSUlKUEVpR0MzdHBod0hVVWRkaXVVTFpVQSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjg6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvbWUiO3M6NToicm91dGUiO047fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1784307142),
('Fie3uiTOyDMA2CMk0xuJq3YFjpnInx8gdVU4JVoE', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYktIREJMQTF1T2Zzc1F4Z2JLaE82S2lHdTN2cVFTWDZJbGlmRG9oQyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvY2xpZW50cy8xNC9jb21wYW5pZXMiO3M6NToicm91dGUiO047fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1781851989),
('filarm4VH86k1jjqhkNRGhjOm3h0CYbDtGVT9BhR', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicmJqZ01nSmszMTRLNzN3UGRxZTVkZzdhSjVqVklaa2puTVJsSW1PQiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvZGFzaGJvYXJkL3N0YXRpc3RpY3MiO3M6NToicm91dGUiO047fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1784306582),
('fjyFxupn1UFemt1dvDXKm3tBE2oCn7aCkuemK6WY', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibzI0aDVZU21KeUJPU0k4M0ppdENvdDFyR1haZENwNmpwejBaTEFmeCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NjQ6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaW52b2ljZXM/cGFnZT0xJnBlcl9wYWdlPTEwJnNlYXJjaD1aYW4iO3M6NToicm91dGUiO047fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1784306983),
('FOW9wVkEDculgxNK1lJFMsS3t5RRmP8ossKp2s0e', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibzZpVXFjcmF2MDdSTDc3UEhUTTAyOFhXRjY4NXp3MEhXa2tEWXRvWiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvZGFzaGJvYXJkL3N0YXRpc3RpY3MiO3M6NToicm91dGUiO047fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1784306252),
('FQFIQfN4uSuEAJtloYPJsAa9sGIhtxMMLJJ0Tvve', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWDhsS2tBVnEyS2llYkRGZTA3SWFMUjZoQ3ZwdmoxYjhaWUlXSlpvZiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzc6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaW52b2ljZXMvOTkiO3M6NToicm91dGUiO047fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1781852058),
('FQiOGUbTFt4xu9qwjyd3N7OriHazIg8FQK3Nip0X', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRHIwdEt5Vnd2cVlBRVdjUWtvb2l2V2JiZVF2YUhnM0VoTVJFOTNZRyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvZGFzaGJvYXJkL3N0YXRpc3RpY3MiO3M6NToicm91dGUiO047fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1781936862),
('FT5MW8Womz1LkNlX9xwzHIeyDz2BoHxFzeux0rDY', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVmJHeDF3WjZlVHg4bjVaa0M1R1lSQUF3UUtDOXNnN0I0ZDREcnhaeCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NjU6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaW52b2ljZXM/cGFnZT0xJnBlcl9wYWdlPTEwJnNlYXJjaD16b25uIjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1781851952),
('fV3Evf1DpBgaASodYC9oSJonKzLhX4bbGJDiKg8V', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoicVo0UXB6VzRXamdERDk2TmdERU5xVkpOWjhHQ1AwOG1lMVNWRFRSUSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1784305346),
('FwBnPeiCbpHCZvmg0cG0TK0GQeRFngtexvnwJvmm', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZHBRZHZlR1FNQml4UkxKdGZLT3BZNU1mdW9hRzV2NEpGVWFQSnRrMSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTM6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaW52b2ljZXM/cGFnZT0xJnBlcl9wYWdlPTEwIjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1781851983),
('G79FTNvkoIlbrO67Pah6SZU347PXuj4ROhG3Gk8C', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoia0wzWVJuWXg5QUtYYjV4c2RkQ1V6eFRXSDZnVU4wVzJLQW5nWWc3MiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1784298351),
('GDxn5zxjErcCFF4Zlc3iCjqVk2E7HNTlxcz0P2wl', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoick9HMFdqRXlBMmJiTlExb2pveno0aTRSbUZMTEE2Z0JBOTBWTlNMMSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvZGFzaGJvYXJkL3N0YXRpc3RpY3MiO3M6NToicm91dGUiO047fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1784306227),
('gE2A72GyAVwOju3k6IRKpGwBh4zRXh81HqbcGqvl', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidHNZZGZJNmJHbXFoR3J0dXVMQm5HcWVQajJ5MHZsdW5XOFRNNmNuViI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzg6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaW52b2ljZXMvMTAwIjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1784307216),
('GiALW99gWD2wnEfNFKRskWocfptwvaQPrMAt7NVP', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTXFwQ3hXaGRpVXpoUGpZbmxGSXNhWnhKTHNQb3g2MGUyMVFWaW5RZCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTM6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaW52b2ljZXM/cGFnZT0xJnBlcl9wYWdlPTEwIjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1784307133),
('gKHxTcKwPrjI6IWCs8NGq0qRQBU7fHywo7vawl2z', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVjR6ckk0bFpkTTFpSU1WNklTYmxBMDZVY05tZnFGTFcyZTNuZFNGVyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTM6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaW52b2ljZXM/cGFnZT0xJnBlcl9wYWdlPTEwIjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1784307144),
('GlMJ2iEbB2toq0LnfO2ttljJAmidMr4cFBE2qus7', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZHBqQWMzUGIwRjZPVEhPSFpGblFQYlRLczZ1UUJCd1JCbHR6VFhXbSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvZGFzaGJvYXJkL3N0YXRpc3RpY3MiO3M6NToicm91dGUiO047fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1784306143),
('GO6htqCoeK6wt7cgvhaBP41DIE2FIrFj5Bsptu95', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiR2kwZmhEVHdVb3MwNm5palpkNUNaT2FOWTB0WUF5OHhUdkdrUVBsayI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTM6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaW52b2ljZXM/cGFnZT0xJnBlcl9wYWdlPTEwIjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1784307200),
('gQuzGO7YfBeZLGh2Wx9iZ0buVpwfhCLb4qCWtNzu', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSEVFOTB5NFdhUVQ3QmV6RHFEVnZOUGF1WXNkOUZiQVh5ckZjbkt4WiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTM6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaW52b2ljZXM/cGFnZT0xJnBlcl9wYWdlPTEwIjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1784307141),
('GtnY2oEDqu28jO5s3nrcSXkgjz5QflOThMz3wWQq', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMVhCV3A4cWd3NlppblZPcm5XUFB2VmpSTldaSGhhdWVkRkpKNFJOSSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzc6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaW52b2ljZXMvOTEiO3M6NToicm91dGUiO047fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1781937425),
('gWVP6Q272tqwqkhSh8lVl5YX5KOSpXwcDH6pK0gf', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiSTRUblo2Wll2ZTdyaGZBdkU2SUQ2NE83UGRYdElHSTlKMFZpbWUyTyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1784298453),
('gXGkVwJQ7y6NCrMOHg3EDkPvuMxdIVy62jj1SIFZ', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTW1oTzd5Tko4aHhoTXVpRHVBWmc1WXlDRjVaMUcwaVluNzlZWUJtVCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvZGFzaGJvYXJkL3N0YXRpc3RpY3MiO3M6NToicm91dGUiO047fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1784306253),
('gY3wm29Edgt17fJlf1CThgk6Lmhq8Rjuv5V6F7v3', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoibTlZTERPaXNwcmRzb2VBSkhpQzd0bXU3aDhFemJySHI4VHcxNnAxeiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1781937339),
('hCjNJBBrsMWKxIko87XkAcV0nDMX6krisZNJ7RrK', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiM2dmbXVUWXN3SDcwNXVnTFZBMGtVdWlMUWxvVzRnam9OTHh4NkNtWSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTM6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaW52b2ljZXM/cGFnZT0xJnBlcl9wYWdlPTEwIjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1784307478),
('hfqpRIfuejox0P5gpKHsOjGtIPf2x0QxOP4iEcxs', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicm42bUtRRkJrbEIxbTVzZGs0WEh2M1pjaUFkdkY2a3h2aW1JTHpZOCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDc6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvY2xpZW50cz9wZXJfcGFnZT0xMDAwIjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1784307168),
('hFvDA3oS7Xw8lsp97sjpIkZZL68rFpElCHzIhadU', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSmNLY1k2dGNrQ0lBdzlzNmpxZmhPR3lYMk9tVGVvbVdjblhPQzlyRiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDc6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvY2xpZW50cz9wZXJfcGFnZT0xMDAwIjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1784307152),
('hGr73V3Zl0phMqWS41hpemZDr6ZMEY72lRhFoXeD', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiOVhYUHJzUHRQdkJZMWpKQ2NudmdiWDVEckJZNWFLRTZIVW9pc1RQbyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1784305360),
('hsqRomXlsbLZFFoJzrbxv4NE7I8gpC0rP7UNEZI7', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiU1AyNTZ4WlRlVXJJaXMybURqcTJudW1jSHE1WDZlbDUyTzE5eUdsNyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1784298433),
('Ht8vk1TLs3TjOQJsMg4XmFBSXZS2YyHi2JAzgPSO', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicVpGblJqbWtGdlFsbFJwWTlSSUZmOFhmbWE0QnFoclBERlJ6ODk4QiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDc6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvY2xpZW50cz9wZXJfcGFnZT0xMDAwIjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1784306872),
('Htox820t5qwW26DqVoKfqbgKujarg4XxLSvPeGab', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiOER2c0EwTDZHa2dsTnZueWdFN0dVOTFGT2tvbXRwN2VyaVU1YVJpcCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTM6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaW52b2ljZXM/cGFnZT0xJnBlcl9wYWdlPTEwIjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1784307658),
('huLxN6AgFJIuRHoDGpQ3e8z1iBAsv3HPJxaT5Pnr', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZkRweXhkRURzS0ZjVk5XM1M0MFptS2picm1ZSnN3QlJrVVRua0ljTyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDc6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvY2xpZW50cz9wZXJfcGFnZT0xMDAwIjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1784307205),
('HW3X9iFlAETMnxfGFaxYIiInFzw8U7ydBliFFPUv', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZGtGWkU5SUVpWEVsY2ZaSmhpS0xOZ3lLMWt6TWZHekw3dzRWR3AwVSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvY2xpZW50cy8xMCI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1784306212),
('HXiLavaTqG6a4Txrj6LX7NsmFmEUzEhfE8J7161y', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUlVSUkVZN0xtbU5QVGF2VEg4TVlQZTFqTFBac0U0azFNTXg4QngyZCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzc6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaW52b2ljZXMvODciO3M6NToicm91dGUiO047fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1781851959),
('hXK7mY9Tdsvi4XFnmUpMhhtcaUPVdGlt9VxDeNih', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWllZeURrcUY2YWtOdUlRczFQUGlGUnV2V0N0WlU4RkFMOFJ5VEVNeCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTM6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaW52b2ljZXM/cGFnZT0xJnBlcl9wYWdlPTEwIjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1781851525),
('hY11WYUwHeo4Iiuk4nfo5TVMyx6TOeMdMLb82WwA', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQ3JuYjBmWmVJVkM3eTR4U3B0T2JIYmthQXQ0VzNPemV3Z3paaVh4TCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDc6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvY2xpZW50cz9wZXJfcGFnZT0xMDAwIjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1784307280),
('I3nMb1wfUmiGtd6Mmtkiv0v3pOuBIEHhT0md0yAu', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYjA5M2g3a3lJOWJZVWZUeUxsS3FpU0ZQTWVaWnhLUVliNVFmY2wxbCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvY2xpZW50cz9wYWdlPTEmcGVyX3BhZ2U9MTAiO3M6NToicm91dGUiO047fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1784306571),
('i8flRw9bTWgnbSSKapMb0z9lRrpd3U23vMa5T0Qd', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZFl5SnlwODJtRk1PVWNnTFRsVnUybWdkellhTlFLUzNTRG5MMEtXTCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvY2xpZW50cz9wYWdlPTEmcGVyX3BhZ2U9MTAiO3M6NToicm91dGUiO047fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1784306202),
('i8Uqc7gG2xPnhEXhNCOMhYf9njCWITZMezI1cubt', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUnRFcGNGdGtDU3ZoeGJVQmxKUkFEcU9WNHdCQWtkcUlKdG9yT0hKOSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjg6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvbWUiO3M6NToicm91dGUiO047fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1781851475),
('IDh1lABij5DkIKvgKh1AjSohopPm76LNr88NF3Mn', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidFBhUkhaTkF2dFQ0NlBETENVQ0JKelNwMmQ0OU5zRUYycDY2VnpuZiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDc6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvY2xpZW50cz9wZXJfcGFnZT0xMDAwIjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1781851986),
('IhTs0RGdXRGEJ1M4Ie3fPdxAxuuCvLJt9iZuZFaI', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYW1NcWs1VlhiU2tiSHp4TThlUTFKeVZLUFIzMldjelFtMGhHWkhXNCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTM6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaW52b2ljZXM/cGFnZT0yJnBlcl9wYWdlPTEwIjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1784307124),
('ilO1hAWlrfHwc6MmiPcLckpVrIZX8b4P1iQFtTCd', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiREd1bDBCTWxHN3U2SFJBN2VObUZmSEsxQmVFU2c5R2tTMDRmdHlRcCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjg6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvbWUiO3M6NToicm91dGUiO047fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1784307142),
('IRm4GNdR9ZwthQfTgBuRORNQ2nbcmRuiBc3ePStW', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiNVRLdnhURm0zSFNnT3pVaG5qV1NBTHU2NVBVZjhFSWl4SG8zWWJMViI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1784306761),
('iU2DO53w2oIEqtaCUVMZkT6Cljsam5xYZirG5OxY', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoid29JSWRLNkxVZmxSV1ZpaWNTQTNjUEY2U1FtNURsVlF5OFBoOTZOQiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjg6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvbWUiO3M6NToicm91dGUiO047fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1784298518),
('j4QHfCEpB4HlVC4WT0DCmaXyQaIpGPZhUKYNMpwO', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiU2kzVE1wanhlQUNYREJOajRXb2YzYTM3aDBYemE3a0daV3plT0tndyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvZGFzaGJvYXJkL3N0YXRpc3RpY3MiO3M6NToicm91dGUiO047fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1784306404),
('jbGcxZ4wAvjcKhvpQL76xvyE7wqY8w6yprP4YPnN', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVkx5VEdHWEllSmUxMEZpdjZDVkpvdUphaTViZVJ5cjh3dVN5OThLUiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzg6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaW52b2ljZXMvMTAwIjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1784307217),
('JcDymCLpW0BI6RLqo8iOBZKT6WRL7U71AsOPA6BJ', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiOW1hUGQ1QjhSUUJpaXoxNmtleEdGWUhvd1pSRjU5YmJsN0hqY28yTyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvZGFzaGJvYXJkL3N0YXRpc3RpY3MiO3M6NToicm91dGUiO047fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1784306858),
('jeCCudAwVkQo7ZfW4Xz3bj6ip0tfsnfMoSDs3WEH', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSW1HOTVQUkxCS2h0OGhRQ1J1UmlhSVNOQThSU1VqbzdxUnZmSENCMiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTM6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaW52b2ljZXM/cGFnZT0xJnBlcl9wYWdlPTEwIjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1784298371),
('jOFI4lRoXuDlkuszGHHcWHcqmCSAVB9QYTU9MUfz', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoickIwWlZJbEFNMzQ3OXp4N2xDbEVhdVRYVnp3Y1lXSFdEODdjS2laOCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTM6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaW52b2ljZXM/cGFnZT0xJnBlcl9wYWdlPTEwIjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1784306859),
('jPulLSBbrnm32ssIV2Ym403AqMb55uihYX9qFaZH', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicFU1QjQzYW1uZlVvNGwzN3duUmFyZnB4MXBjZmhzc1F4MEIxemhyYSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTM6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaW52b2ljZXM/cGFnZT0xJnBlcl9wYWdlPTEwIjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1781937525),
('JrkfJIEc9BrVao7I3hak2yh84Buxn967UlU9OKqB', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUnFOODhxaFFJbGEwSzhzeDB4QkhmOHpwV2NDdlBDdHl5SFRCelFjciI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTQ6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvY29tcGFuaWVzP3BhZ2U9MSZwZXJfcGFnZT0xMCI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1784305897),
('jUICzUV2naTjdIx53rH6BBmGjqT6Fqn08w3mjvKr', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMnV3dXZxRjcxSlJaQ1dRY0Fjb095Smc4M2d2QVJVc1M4ZnVwN2JucSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTM6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaW52b2ljZXM/cGFnZT0xJnBlcl9wYWdlPTEwIjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1784307477),
('JuXRgI7wts5iJdD78fSYh12QWuXYc6HhoqTHN53T', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoic1I3d3JESm1vRWtqbWJpTEY2MmFBeEtuekE1WEZNa01WeFRHT2RRNiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTM6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaW52b2ljZXM/cGFnZT0yJnBlcl9wYWdlPTEwIjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1784307139),
('JVb4SupAoXluqLdLPwqsIITQUgBFp3S3AQU94yZM', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUDRSVWFFdTNPRU5KOVUybU9vbzhyU0g4N1czY3RMUHo3YjFyVzBiWiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzc6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaW52b2ljZXMvOTkiO3M6NToicm91dGUiO047fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1784306728),
('JVk28aTtcsgED4Lnfu8fNe7O2CCfNbvFQGAbBv5N', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZ0RHeXBvUVJUd3lIdzRsZk1XeHhCNTlrdHFSQXZveXFXWTBQZjNqNSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTM6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaW52b2ljZXM/cGFnZT0xJnBlcl9wYWdlPTEwIjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1784306724),
('JXyXgSuvBHYDpVupOpwPJQny3b5vVCn8kDHHIMuf', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTmpISVNESTdRaDhnMmJPTXRxTGRWTHV6MXZKVkZCVU41VFZNMFFCaSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTM6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaW52b2ljZXM/cGFnZT0xJnBlcl9wYWdlPTEwIjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1784307201),
('JZpYMf03ZVjtdzethUilxvSgNE2S4ndnK8Wv8NI2', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMVNLU1VWb2ZNNTY0bE9iRllHS2Fqa3JweHRGcmxpeDVRNUVEdWVrRiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvZGFzaGJvYXJkL3N0YXRpc3RpY3MiO3M6NToicm91dGUiO047fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1784307688),
('K9XSqgZH9gjDn7aKF1KTPe8svcAU9QGvKup6Z9Xq', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWTBIc0lkWkRBanI0SlVScGRIaUZPMnRudXFxSEViamo4OURrdGNvRCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvY2xpZW50cy8xNC9jb21wYW5pZXMiO3M6NToicm91dGUiO047fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1784306931),
('K9Yy3g2qiyTGXbaGzNDGUK0lSjkGCMO44PJU45Wi', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWG9SbHlxSllIdEZwNFFzZUNvSDV0c1duYjA3ZE5ScnMzME1zZDJ5ZiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTM6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaW52b2ljZXM/cGFnZT0xJnBlcl9wYWdlPTEwIjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1784307139),
('KcFAA5zUGdOTPYzrl0X0MP8FCDmmnkbjIAsN15Rc', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWUtGTGw4OFhZQWU5bzZmekZ0SFZhWldmcUZFUGJpTTM5S0ZtSlBNaCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDU6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvY2xpZW50cy85L2NvbXBhbmllcyI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1781851959),
('KCWFRwkuj7eI98PCHDyalQ2QcxX6MoVlEnZ3BQpG', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSjFSRDY2d0ZPcVNmcnpBZTlqQVRrNGNLUDd1eWlpdThIWWRteUZibiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvZGFzaGJvYXJkL3N0YXRpc3RpY3MiO3M6NToicm91dGUiO047fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1784306386),
('KFXOXfwxz7nSHiGPgoZweClctAQUcBpQppPcWaMc', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZEJWeHIxcUxJaEZ1cmhQbDJSSVlZM3h6UmM2SVNEMTdmMEVqeHdxNiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvZGFzaGJvYXJkL3N0YXRpc3RpY3MiO3M6NToicm91dGUiO047fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1784306299),
('kisASdU5eVcwBaZofMqWOfXz8FR6DYrzXVsjXSil', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUWpFeGVGNUhsUEFMbGo0WHhjSG03dzdSa0FGUEE5M09HeW03angxbCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvZGFzaGJvYXJkL3N0YXRpc3RpY3MiO3M6NToicm91dGUiO047fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1784306263),
('Kj7ULYikHRWHFfFIKeYunQe6mpoiLvVGGAVpaSMy', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoieDRiY3B5UkpFeHZmd1EzUkEyeWk5elJTdjFWazU0MUdXOWlUdFB2ZCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvZGFzaGJvYXJkL3N0YXRpc3RpY3MiO3M6NToicm91dGUiO047fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1784306695),
('kKSHAsiFsMDwpF7b4Bf3dC6lKIQwd9g3Rd32dnKO', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoic2pCR1RUbEgwNE1TRWlPVmdkcFNNeDRrV2w5OWhROWd5SmxoTGVmTiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Njc6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaW52b2ljZXM/cGFnZT0xJnBlcl9wYWdlPTEwJnN0YXR1cz11bnBhaWQiO3M6NToicm91dGUiO047fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1784306909),
('KOtfVRIld6nTT5NiXNJmsBRR7x0BYJ5CAiUu10XJ', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiY3hwNTdmQU9HSGdERHFrTU9BeHhmU1FpblZxdTJVSzZsNkUyeDVHTiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTM6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaW52b2ljZXM/cGFnZT0xJnBlcl9wYWdlPTEwIjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1784306891),
('kt9nod1txd74ETsMBnbHn2xweNR9jHRR3QXsTqCJ', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoieGpxeUYwVmlodTBtem13NVMyQWx4VVVSTjh2ZVJrWTVYdzNHcVVDbSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTM6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaW52b2ljZXM/cGFnZT0xJnBlcl9wYWdlPTEwIjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1781937310),
('KUW2r86HfklrdUNOROYk7l2Rjqt0gUs6EfSPLeBm', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoid2dkVjVrYWFReWt5RkE1eUthRUNOR0pIMlVUcnJnWGo5cTVZV1ZyZCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTQ6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaW52b2ljZXM/cGFnZT0xJnBlcl9wYWdlPTEwMCI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1784307674),
('kWllMGrHZXnK9WX46itnaTjHJOzZqJsFpjCBAgBx', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoic0wzUUxocHJDQk1yWXZueDdpNFdSR082aHM1NWM2RUVzM2RWdmxpUyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvc2V0dGluZ3MiO3M6NToicm91dGUiO047fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1784305854),
('l84gyHbtNNZMUDrVy6C5ysCQFsiZU3rlxAn7QKrn', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZFhZemY1YkhrTDVmQmxCQzVBT1JrRE9YWGNkWlRoMGxpQVl3OHUzRyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvZGFzaGJvYXJkL3N0YXRpc3RpY3MiO3M6NToicm91dGUiO047fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1784306676),
('L9roQajXjZfhGyYmvMxxrTmnW8Fx8ISFwPXgBYG6', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQzBxT2w2RkRWRFVMMGlzTDdYaDlGWnE5eHpMNkxVMjBMQkpBZXBhZiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTM6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaW52b2ljZXM/cGFnZT0xJnBlcl9wYWdlPTEwIjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1784305877),
('Lbkxfby8NeUGG6E8NfI7cJyKtnkE1Qi7kHnprlUn', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiem5ZOTJ5WW9ucVZoS2dkQ252SUxBb0ZVaXh5ZGlFbXRnYmdleGNsUSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDc6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvY2xpZW50cz9wZXJfcGFnZT0xMDAwIjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1784307280),
('LfWmRuy676zC9lfJTUW0A6mYGZCXrWjvh2wXZP0F', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTE9JZkRWbU5ZMWlXYzZsNTF3V2xVbzhNcXNwQlJxbWZ3MllMVU5NMCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzc6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaW52b2ljZXMvOTciO3M6NToicm91dGUiO047fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1781937379),
('lg1UljhuxhKFkbMN0SPgvs4flSTtPfZRDwJNXGJj', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWmNDVkwzSkhCaEtmYkNlV1NSMkY2UUZOM0YyNzRUdlVURHF6YmkxNCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDc6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvY2xpZW50cz9wZXJfcGFnZT0xMDAwIjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1784307167),
('lh7ZyYboADjAwArlLCemRuGWc68bQ5NyGiDZ7pZz', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQWVHOUZMOWY3ZWRHcmg1dXJBWkJsQkl2NUlzZk5OTktXSDRQb2ljNSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzc6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaW52b2ljZXMvOTkiO3M6NToicm91dGUiO047fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1781851986),
('li4DX6mtBPubop7zskJplXxLrIXJFvSqoA5dvJZ8', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoialZJaTBZdDdpU1p4WHdNcEZQcWtFTVAwWm1tdkgyOThpSlRva2hiVCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTM6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaW52b2ljZXM/cGFnZT0xJnBlcl9wYWdlPTEwIjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1781937313),
('lNlhxriKy1C6fyFUSJIG85SfaiXzZD9cLRhEHeIl', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMm9CMTRZQXRoT0NZZmRIeVlzb1o4ck9ZT3RWTWRVMk9YcHlQU1ZBaSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzc6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaW52b2ljZXMvOTEiO3M6NToicm91dGUiO047fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1781937426),
('LSpXngovLQVxoXUvTlh487EOoJ8weZVwTmxdkvMp', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSDRMNjhIOU1KNnFDRFdhOFg4NGN0dkcxWHFYRnBZeXVxQ1lsYWpiTCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvZGFzaGJvYXJkL3N0YXRpc3RpY3MiO3M6NToicm91dGUiO047fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1784306771),
('lx3NDBtaDAbNL6XidCsow3fX0kUEnZZpNl69M4cw', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMEc0MUZBbVBGSU1vWU5FSU9DT2ZPY24yN0xvdzNyZHlLWHV6THNDTSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvZGFzaGJvYXJkL3N0YXRpc3RpY3MiO3M6NToicm91dGUiO047fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1784306859),
('M3DRyGHQhNyJ6LVlkwz01VgPOHET1etn7c7BNcrb', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVzBUdXpzSkp5bDNFbXZLSmhzRFFDZXlxRGY0TFdJQ2tpc0FRUmw4bCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvY2xpZW50cy8xNC9jb21wYW5pZXMiO3M6NToicm91dGUiO047fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1784306885),
('M3F7uNNN0BqqVCRi7vEbtb3GQD4AGewswgioCIUe', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZ01POVJzQzd3REpyUFk2d2pLUDd4SDVDVjJqWG80MElmZE5sQ01QdyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjg6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvbWUiO3M6NToicm91dGUiO047fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1784298448),
('M3SBdaScYeZ1fngHwURd9foQ6gDCRG5Bx5bdh0Qg', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoia252TUJ1Z01KTmdLR2ZPd0pBckFtU3o2QTdhamlzczJGVVRmbGxpQiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTM6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaW52b2ljZXM/cGFnZT0xJnBlcl9wYWdlPTEwIjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1784306951),
('m97jGJ9biuBwqYNkwa3XRjGgRha7FXDkNVVtiHo4', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTFh6a2lmUzM4UUZsNE5lUmJSY2FlclloUUZYcHZsRnF5VnMxMTNBTSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTM6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaW52b2ljZXM/cGFnZT0xJnBlcl9wYWdlPTEwIjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1784307134),
('MDL9MuUKcGmaBBFmCRjQ13ampAA1pDBYfbfjvOS8', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiV25vNEtqWHZpSERsVFJqWVdPdE5YMUtJSndiVllLU1VOdkJsanRrbCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTM6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaW52b2ljZXM/cGFnZT0xJnBlcl9wYWdlPTEwIjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1781937311),
('mFpbRfS9mBF6CrJUyGf896kFtXD8xkOz1vnXyrMa', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidjAyN0JEQWJRSVdXTEJMdk53YzFBYmxhbEx6NEFwNHJQOWhJZXJqOSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzg6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaW52b2ljZXMvMTAwIjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1784307168),
('mhcgDpfu6u2g3czD2mxrGw8EZ0wBImLpScW8VyLU', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiOHJWaTIzQklYQjBqWDBEbk95WjdzY2Rqdm5kWFBUSm5XSVowR0J4ZCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTM6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaW52b2ljZXM/cGFnZT0xJnBlcl9wYWdlPTEwIjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1781937419),
('mmPTgtiNUCriCLMbBNbm35JiXMEJbmUlmJnmTNsS', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoicWQ0bWlSVGJGQlozUER4aG1WMHIwMlh6ZTBRY05xVGpFMjFZaEtFVyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1784306536),
('MSUeRMEgRlgEcdbA4TgRxGh0UOMcriwavyfFwbhC', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVlVwb0JyOGZqVzhPTll3WUFTRWlJcnA2UEJsR0xHUWtpUlhCdThDOCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzc6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaW52b2ljZXMvOTkiO3M6NToicm91dGUiO047fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1784306727),
('mT1lxGAgRdKD6hxK0WVCsLwEdo7GqjUV7sZbethl', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMUFvU0djaU41UVVtYzRhTTVhcnRyQVloejNQbGk5akNobHFyYjFMZCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzc6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaW52b2ljZXMvODIiO3M6NToicm91dGUiO047fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1784306925),
('MuUMIMlrlq2KQ3jgn1IjHT48MzWLzgCpnESzbw2O', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQ0dEUWUyMmNTd05nTjdnbnN5ZVJ5bjlCZDJybjN6S0ZxaUFLRzM5MyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDc6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvY2xpZW50cz9wZXJfcGFnZT0xMDAwIjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1781851986),
('MZ8fECzxtTlEZRAMo2aixwmKDOywzKPOv3cRo2Nr', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZUpNMGtWck1iMXR1OGFpZkRjT1RLbHZSdTZpbGNjekpuN3dmZUlZYSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDc6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvY2xpZW50cz9wZXJfcGFnZT0xMDAwIjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1781937318),
('n2dehqGF9ojP9pKo0PccaPZHvdYWOaCXRImayAq9', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoieHdUbGlVYjlhSzJma2NNQmNMQVl4bjdJdlZNbjlwcExTcnRPQWxrcCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1784305570),
('nC9I1QgoqstZOeaDvIiquILhm9BhqcuBumDK26pR', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiNHZjbFBWVXhOUGVOT2JKaWxURWFlYnp1aXZYOGt3MUhUUXFxS3dwYiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1784298545),
('ncSJXaxn4h5GjlqemqK3BKgTG2E0d5ZIy76MDRaW', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNERUN1NkTE9zUUM5RUoyWlFIRFk3UExhRmd0UWxjR1ZwTGdoaUphWCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDc6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvY2xpZW50cz9wZXJfcGFnZT0xMDAwIjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1784306924),
('nD4uxMMwQYyKnRZE0wprm9NEQM2uplGlOlw9yIW5', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiOUpIVTRUQUFEWWNCT0M1RnlMaGRocmFJb2lzSW50YnFUYkxvRU1ONiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTM6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaW52b2ljZXM/cGFnZT0yJnBlcl9wYWdlPTEwIjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1784307140),
('nduOuXY72pCzVNmwChqZ0vKtw2PlTkvaBokoxlSW', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiN0JtQ0l5OFZyRmlDbUVlV1ZYWlhTUWRtSnBueWlFZmlmdlJpUDV5TCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NjU6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaW52b2ljZXM/cGFnZT0xJnBlcl9wYWdlPTEwJnNlYXJjaD16b25uIjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1781851953),
('nI0LcXpIK87n5KKEPOjb7UGIQ4iFvSkRgZDuyv8H', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiaEJmYW1CWGVBN3M1b0Rzckd1UWFnWjR5dmVYcnVqdGk4MGV4aDJvMSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDc6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvY2xpZW50cz9wZXJfcGFnZT0xMDAwIjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1784306873);
INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('nmLbW1vQfbQgOPlPcGdEn1rne2dhbxqaeAQsFdVa', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidGhjOTB3NzFIVkNFclNTaWJYTUVyVEQ1cmFETzhOczVjMkpNNXRrMiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzc6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaW52b2ljZXMvODIiO3M6NToicm91dGUiO047fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1784306922),
('npoiAi0WoqZfKgPOeQ2xMD4jxpklBm35SPPAiGAl', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiOWpYdmY5VGpsVnlVdDdIOHdLNndzUFJKSzlKcE5aczZiWURsUFRwUiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvY2xpZW50cz9wYWdlPTEmcGVyX3BhZ2U9MTAiO3M6NToicm91dGUiO047fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1784306570),
('nrPhRmTY5JyrxbtVvRUMWEdVAIEUNh9LUgHMRFd2', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibW42elpHYmp1UTJSU2Y0MDBIOHM0c3NabUdSejMxM3ZCUFg5SGhzSyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTM6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaW52b2ljZXM/cGFnZT0xJnBlcl9wYWdlPTEwIjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1784307132),
('nsEw7sWmghHW7OQYSYRYqTNAddZMiolJsgR6XfJ9', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiN2NXeUVnMHhHVjBqRTFVUGN1TlQxckxvQkg3Y2pFU0VaV29SQm4yYSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDc6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvY2xpZW50cz9wZXJfcGFnZT0xMDAwIjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1784307216),
('NTatV0Y3Vo2MEazXv8ipxZPmUX3Xl08wcjsTmMuN', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibHRVOTNDZmtxekJHenN4ZnBwMW9OZ3RRWU81elBBMTRhOW52eFBrRCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvY2xpZW50cy8xNi9jb21wYW5pZXMiO3M6NToicm91dGUiO047fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1784307219),
('NTeHdDw2K2J0fVmgtglKsaOx7oulW0dNyiP5w10M', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidVlIa1J2em9MZll1eHZqeEZGYWxMUnpLTzVLY2xWWGVndTZyQ3BPSCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDc6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvY2xpZW50cz9wZXJfcGFnZT0xMDAwIjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1784307063),
('o0MDwoi2Cd3bnRovEdv6tmdeuQWfYjXxqa8pnwi9', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYk5QRndjN2xkM0pWVTZNbEdBVXcwRmdBeHZGYTZ0a2lCVmJuenVNeiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvY2xpZW50cz9wYWdlPTEmcGVyX3BhZ2U9MTAiO3M6NToicm91dGUiO047fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1784306202),
('O1a9oXVn5UQbsoRhWhzWwsDEBfIsgDMhgEeuYbp2', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiMEJlelhRT1VNZldPVEo3MjFVN2x1WW9WcjJrYjNUYnV5RUVuR2RkQyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1784307247),
('O70NOQs6jDCCD2T9ys2zYKShdj0P8PJWc2YJ6iId', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidGxJZUd4dEZDNnNJbVdOcjJmaWc3bEF4cWZlUlhPOXFPUE5RYnlkRCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjg6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvbWUiO3M6NToicm91dGUiO047fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1784298449),
('OEAJHRyBUh5VCVwIVLIC2sXePTW86706opovAOpl', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZEw3b3U4QVlnQ3JyUkJ2MndwaE13Q1gzSHRYUXhuYmV3VzhndW1JayI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDc6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvY2xpZW50cz9wZXJfcGFnZT0xMDAwIjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1784306727),
('oirwE7K7rkMSR9TeBtbwICMcep3CZ5q4mde2kNvr', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidlpweXVET2tqQ2Q3MlRlTERRTklPZG9EaEJyaHp6UHhMcXBsdGQzdyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NjI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaW52b2ljZXM/cGFnZT0xJnBlcl9wYWdlPTEwJnNlYXJjaD16IjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1781851951),
('oUzJWdYoFEBjokoXHncGgVpruNDtqSFWxF7lyNVv', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiRlBheHhiZ3lqa2xKOTFQWnhjQmsxUWRDUTRrOWZFSWN0TXlLSHdybyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1784298392),
('OXIcYRjWuwGFZGyL3T4cweU24tctIHfzck0YrYpp', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiY2ZzVURJSVdJNDNoUXFtMkxVU2tOcnBKMHlYWk8wUlh4aGRzYlkwQSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzc6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaW52b2ljZXMvOTgiO3M6NToicm91dGUiO047fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1784307206),
('OYWHdFhMoegdNmBBNrgWbUXpEkcOkZNjPQ5c49lc', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiOGlkdWdDbDF0WFZrR3dqckZvSWl3NkQ4YmtzTEdFMkU1WWlwUHE0NiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDU6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvY2xpZW50cy85L2NvbXBhbmllcyI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1781851960),
('PhE7SIAl9awEVYkNB7ZUN7pvsz6MpW86PyFjUpJ5', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiN3VFVnBHOHhKbHZwRWJXQ09pUnozZnJHd1FoNzRuc1dDWGU4RG9lSiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1784306530),
('PlxdemaAlKyx9S01tCCG0EeaWBwrn5zv9JKwUYgW', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiZVVjWVh3emhCRHFlaEl1eHZtS0lzRkh2Z0swSXA0VmVWaUFIZ0ZQYyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1784298168),
('PrCXQocMvYT2najJCIyeRs3q7Tg00MkW0184wAVL', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicllGcFJpT0dUYVpabDdoNFBMdWlvYk9uZE8yWTZUUTlBVEVxTTBOUCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTM6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaW52b2ljZXM/cGFnZT0xJnBlcl9wYWdlPTEwIjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1781937526),
('puDvQS13gP5WGrsTayznerIRyfYcf6WTGO8f2sLN', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUnZaUHNHUlpubFRPdUVMZ3dpVHcybVFKV2FVQjJ2M2ZDcTZUM3daRSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzg6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaW52b2ljZXMvMTAwIjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1784307168),
('q0e5tXKZpT30Ki01n6iJwpIq3Y1nIbEW7jNLtf5B', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidFMwUkxTQ0tIYnBXMEIzaUVBWjBvNXlIbFVleWQ2UHU4UGpCUFhSSyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTM6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaW52b2ljZXM/cGFnZT0xJnBlcl9wYWdlPTEwIjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1784307213),
('q26VNoTt7ljsew8a6mF0c0z5uTRmLIb2hqGlIj4i', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVllGN2llQ01INTNpaVE3ZXVGb2dWS0F3OWlkMnloVkdxOUNPQVRJYyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTM6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaW52b2ljZXM/cGFnZT0xJnBlcl9wYWdlPTEwIjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1781851524),
('qFRqDwRYqGKhqvvqzLgFMC9n6f6CRqQOU8fEDAwX', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibzJpcEVmTkp0N3hieDNZa052b3h0RnlwOUtBR3p6Uk5RaHR2aDBnSiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzc6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaW52b2ljZXMvOTkiO3M6NToicm91dGUiO047fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1781851987),
('qhOd6mOZIOfvnS7FRddpwD2aUPs2WieNftst5OtO', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTmx5TUgxd09IVHFoSXIxd3ZSYzNUb2VnSGNnWUI3UE5uVTJpZU1XayI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDc6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvY2xpZW50cz9wZXJfcGFnZT0xMDAwIjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1781937378),
('qhPzt6NRo56oWjCDo0RTzKLRYbD3NPtBoNgc8HIK', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWW04VjB2cVRHd000bm5IU0tYTlc4SW1ZeUtxZll1MGVCUGswcXpFOCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTM6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaW52b2ljZXM/cGFnZT0xJnBlcl9wYWdlPTEwIjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1784307477),
('qJ6xHGVm9EHcMaARKkcHfF3YJOEDRgs1WwqdYJI0', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUGFzcnA3Tm5YNVlSWmlrSDE4V00wVkh4OEw2UmdCaTl6cWdiaDJxdCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTM6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaW52b2ljZXM/cGFnZT0xJnBlcl9wYWdlPTEwIjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1781852052),
('QNnIk0Sc0uA8FWboqPIRZ8VwmYJpvJ02J6GZXvGz', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNXNaQVBUaDhxSUNBVHJBRld6OGF6NDBKNkNiOUhBZVZYenQ4QTBFViI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvZGFzaGJvYXJkL3N0YXRpc3RpY3MiO3M6NToicm91dGUiO047fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1784306283),
('QT54i7EspwZItEmn6RisFnW97ecJqNuq78yVK2QQ', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWGpjRnVjRDVWbFpPQkhLb3QyZmllSGF0YkJNYXZzdm9qMWpIZzE0QSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTM6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaW52b2ljZXM/cGFnZT0xJnBlcl9wYWdlPTEwIjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1784306903),
('qTDjZ5JVFg2HZzOgkxQaOJCiRPFLNRkT7OWtSeZr', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoibVlpbWVGY3hYVFkwem93OUtqMjZVbEFVOVNzdTF6cHhDYmVaTzRWWCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1784298180),
('qtqZQavjdSXVb4w0VBdGvj6VXpj66ebcZ5k1ie8j', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUDRTQnltSE5iRGFyMGQzVjZOOTUydzg0Uzk3TDd3aHhhdTA0WWlhUyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvY2xpZW50cy8xNi9jb21wYW5pZXMiO3M6NToicm91dGUiO047fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1781937380),
('rDd07kTOtwBp2Uvzt2rymqPhObulTpko4TCUgwbt', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibTdoN0d4RlF5U2NETUkzRjFsaWhWbEV3dVdQbjM4ell1T1F2Wk51RSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTM6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaW52b2ljZXM/cGFnZT0xJnBlcl9wYWdlPTEwIjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1784307251),
('rfEgzZUuc3XRJS9tQD4vtJo793KbWQurRG9uJuVS', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRjhyUkRUaU1hc3BRRENqWDB2Z2hKeTkxTWJXTDB1UHNOMUNXRmtTbSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvY2xpZW50cy8xNi9jb21wYW5pZXMiO3M6NToicm91dGUiO047fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1781937347),
('rg2k67bXts1Wf7OJEIqW3yh47C65JJjKKgfSP5dw', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVDlRN09hVkowYXNMS1dPNzd5U1VaZkY0b1lwTFo4cHdESEdNYnl1MiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDc6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvY2xpZW50cz9wZXJfcGFnZT0xMDAwIjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1784307062),
('riutaruhYdjsW0FtcjP5FXjQZFOVGVBI0qKJMvW1', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYzFWTk1JNGlWQnlVd005Z3dDVk9jNm9tbE1pV21tRDdxVDRTNGw1NyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvZGFzaGJvYXJkL3N0YXRpc3RpY3MiO3M6NToicm91dGUiO047fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1784306299),
('RKmVBTAw9J8WLZvclGYpexlSlc285bmy3r282HED', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoieWV2bzB6WmZHelFWdjIxOHFRMWppd2s4cDNGM1JURjRRYVcxTlZyUCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTM6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaW52b2ljZXM/cGFnZT0xJnBlcl9wYWdlPTEwIjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1781937358),
('rkqs4dOGkkC5Qq32IpevvV438koVgaXvz8nKS17D', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiN1dxeWxZOWNiTXFYR0pLNmVLbmlVQ0cwRW9WeTlHUWJzUTBkdUQ4UiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTQ6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaW52b2ljZXM/cGFnZT0xJnBlcl9wYWdlPTEwMCI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1784307673),
('ROsDnZdbHAnE2ntts5b0DRTcoEPasKpUnyDV50qR', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiaDVLRklsS3RPYk1IOVVxbWZqNVNOdzhWWEV4NU1VS1BjOGQ5TXlSbSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvY2xpZW50cy8xNi9jb21wYW5pZXMiO3M6NToicm91dGUiO047fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1781937320),
('rrrnNvpIvoIwZ3xDOdDr8Xaxb2Rddl8QO8VrpgFC', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNGRvNVN3T2JDQ2MzcklFc1BEd0RIdjVVOXlXNU0ybkhGMFZzV2FGZyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDc6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvY2xpZW50cz9wZXJfcGFnZT0xMDAwIjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1781937426),
('ruO3yjs32hEKrQgYGHdupYcQTI9WAcARj2rb1yjd', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiU2w0Z1FRS2FRaWpZUHB6SUVZMUQxMTVHdUNSSjJnYXVydHpPeDhtQSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NjQ6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaW52b2ljZXM/cGFnZT0xJnBlcl9wYWdlPTEwJnNlYXJjaD16b24iO3M6NToicm91dGUiO047fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1781851952),
('rwlXa5z9gaE35BscOZki8hyiD6hS5pP2znuSdf75', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoicE9heG5OQkw5UEprZWZrMjRIWlhzY0o0N1Jhb3hYdnhtckVTYU1ZVyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1784305559),
('RXN8pglOTbnRdOMg9OjVpLZQoeXJ6Uijjz25ynnf', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZ0NDTXQ5VUYxcUFjcnplWVE1WmtFeDlPUHUySzFCMk4zTmRiVE5hTiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvZGFzaGJvYXJkL3N0YXRpc3RpY3MiO3M6NToicm91dGUiO047fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1784306297),
('RyVebBSof7WkOScBVrXaIN4flXawIwABtmS8xENz', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZ05XOUFxb0NJeElJNW1tUFVDNjk4MGlkZ3hUZndSYzh5VUZNWEFHbyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDc6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvY2xpZW50cz9wZXJfcGFnZT0xMDAwIjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1781851958),
('s0GQngYywVY1jcEktDtFCMWKTvbGURqWvcm9vIiM', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiV2FEV1FVbTNiM0JuWVpiblB0UU9yUzBtR1FpRm1JRk1wMkVjM3JqWCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDc6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvY2xpZW50cz9wZXJfcGFnZT0xMDAwIjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1781851530),
('S117UtYGD7zgPHZBs2WpLD9FtQX8Fxw8ZM4tkKkP', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMXVIYklobXRKcmxiQ1A0WFMxMzNzTm81Q0JPRk9RWWxsOGtFbTNQZyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTM6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaW52b2ljZXM/cGFnZT0xJnBlcl9wYWdlPTEwIjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1784305876),
('s38O4Eownk5eVguoxbNdXDIcNLGyeUXiYdZ2pnZF', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiOGdsMTNyY3R6ZG5VRVdmelZxZGdTTGlRS1Z3YTVHeDZrdnBBZUJldyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTM6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaW52b2ljZXM/cGFnZT0xJnBlcl9wYWdlPTEwIjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1784307249),
('S3BibGSn3qFi2y5fuxvWc1Ww8MRd505joHPytt9E', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiclJDWWMxbTdiNTlKaTBTc01GZ3ZzSTVEVjBXbkFDVGhRZEV2MDYyQSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1784307106),
('SahEd7ujkadTR7E4V4UhsFQ5x8OYMI9T5ptNL85Q', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiM0szcnNSZ0xjTFkyQVR3R3hRTmJ5NFU3dlZiaDgxWGpZZFREbTloRSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvZGFzaGJvYXJkL3N0YXRpc3RpY3MiO3M6NToicm91dGUiO047fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1784306330),
('sB4aUr8qj6DHX9IjacfUq8dydCatTvwStlWnbAfv', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWDB4T1FiMFBla2hkdlFqcnhRRGRaTUpGZ0FxMHlta2ZUeURsY0pGTyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NjQ6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaW52b2ljZXM/cGFnZT0xJnBlcl9wYWdlPTEwJnNlYXJjaD16b24iO3M6NToicm91dGUiO047fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1781851953),
('sBguQ0jxoAVeaPRpH0o6bqbxZZV0bLterYVP47ke', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiU2w1bnRLRmN0cUNsdjZyN0REU2tFRjU0REd5UVFEOWZsQVo4YkNzYSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTM6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaW52b2ljZXM/cGFnZT0xJnBlcl9wYWdlPTEwIjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1784298371),
('sBoRDKYgubPxylezffRu3lalUF17T1ogSLkJvjAM', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiT1RlY0I1U1lNOFJ4VFFCVjJxTzJwRjZvY3FqNFY4blc4cGFPd3lrbCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvY2xpZW50cy8xNy9jb21wYW5pZXMiO3M6NToicm91dGUiO047fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1784307154),
('SDW2DljTgWiktRJI1rjZZrflg79wHied9kTeXrC8', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYmRLWEpna0I1alhMdXc3Umd4a1dQYWFGWHEyUjBHVHJhM1o3YnNRdiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTM6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaW52b2ljZXM/cGFnZT0xJnBlcl9wYWdlPTEwIjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1781851939),
('sSFOhxJx8z93Qgink6XLJs82PuJdHWwQsP2wxBwL', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUE5nZkV6SWRzYlRNdzRCU0lYbzRRZDNFMGdUOUFReFdyRmNYeGw5dyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvZGFzaGJvYXJkL3N0YXRpc3RpY3MiO3M6NToicm91dGUiO047fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1781937529),
('sXMfvPJybrpo1tOaF6AYH7vYtEbcJVfNkq023qMT', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTDZRMzdTQ09lV3B4Z1JJQkdLV1V0bTFDdWdQcVBYMFN6bmZnbWdjbiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTM6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaW52b2ljZXM/cGFnZT0xJnBlcl9wYWdlPTEwIjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1784307214),
('t6c3RZmbQI0uisXeRcsqDdd5MZlk2JYG8dlMwQbH', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidVNMWXFLUEVMYUpPWnZqZ3JwTDEzMnh3YWRRcThoU0RKTjNGMFp1RiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvY2xpZW50cy8xNC9jb21wYW5pZXMiO3M6NToicm91dGUiO047fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1781851988),
('TAYWS8SmYcx4J6tgzqfSfoRvSlr0VvrTGDcfYJON', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiN1A4YmVzNWxnR2JYUHF1ZGtDQ2lMWUhqQkJiOUtFVUg2THJCS1V5biI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTM6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaW52b2ljZXM/cGFnZT0xJnBlcl9wYWdlPTEwIjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1784307140),
('TBgpHqk0ZQhggs9s82QWS2XluJ2rlJBk298yUV1H', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoieHlYdjZPQ001SDdDcmVPQXo2YW5kRWlRNm1BSHh2RjloUEw0NTBycCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvZGFzaGJvYXJkL3N0YXRpc3RpY3MiO3M6NToicm91dGUiO047fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1784306330),
('tBI2ZAghOw7WwmqoKVGvNDCk7NAqOEZykjMwuzo8', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicDBlSkdqOER1N3RpZEtXdUxVWjNFYjZ6SjVITnAwdGJwTjFab3lqMSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTM6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaW52b2ljZXM/cGFnZT0xJnBlcl9wYWdlPTEwIjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1784307057),
('tc1m4E3JlFoT3orzR3bc4UHqfyI8eOnEpzJXiD4U', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibzNJczBwOFA3ZlZSa1RqT3BWRjQyMkNSMHhldGU2NFdiYmlqRkJ3RSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvY2xpZW50cz9wYWdlPTEmcGVyX3BhZ2U9MTAiO3M6NToicm91dGUiO047fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1784306220),
('TDvuHpjwxPkhJTq0ZO8dEPmyGUXPJHflbb3F4HS6', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiN0RWbWdYQkxoWXN6VlFIaXN6NzlrQkpzV3d5QjBRekVNbTlOTXozaiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTM6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaW52b2ljZXM/cGFnZT0xJnBlcl9wYWdlPTEwIjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1784307138),
('TeNeTGwT1vJD9AjtCYNd3TjMl6LOMRBDHkMABdmi', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZVNuemVJTnNtUWhLelQ3TmVTa3dIbmx5V3VoU0RJMUEwM09zTXBFNyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NjM6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaW52b2ljZXM/cGFnZT0xJnBlcl9wYWdlPTEwJnNlYXJjaD16byI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1781851952),
('TfDkThdLNVL2vuAIVt3IXPNKBGe86pijLxTmeYUg', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiakxNWUlFMzk1NlVwN3hPQm92ZWR1WjJ1QWZmODVmclJwTmp0MEE5aiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvZGFzaGJvYXJkL3N0YXRpc3RpY3MiO3M6NToicm91dGUiO047fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1784306386),
('tfKdPKTX2nleTUMdkP1evmOhLCSo8AlVDLeFXI6Z', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWThEeTBZU2xyNTl6UkNhakl0UVNoS08wUnhtOWtsa3BFMTdJR1hVUyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDc6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvY2xpZW50cz9wZXJfcGFnZT0xMDAwIjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1781937345),
('THUqsP7aBSKAjTU8UaJsDKKTye1RgLaCcyVr7xmD', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSFFvZ1JVQ0pkempTS2MzbHF6N1pLUjhhdXUyQThjRGpHYmVkNGQ4VSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvY2xpZW50cy8xNC9jb21wYW5pZXMiO3M6NToicm91dGUiO047fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1781851544),
('tiH73iJI5HgJDcTbKw3rOJC0dsebwpkpVLOZTI35', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZW5oSXVsWjRzUGF5TWRiTnBkZEFJS3A1c09QTlQwbVhDY0lsWGV3cSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzc6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaW52b2ljZXMvOTYiO3M6NToicm91dGUiO047fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1781937318),
('tLQz8iC3EXjjXmemA16sPUz27KNhsS0BLbewcNO6', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVk9XMmVaUk5MNW5XcjRZNDBEdkhTbjJaWHU4RE8zNEwycWR5VzJNUiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjg6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvbWUiO3M6NToicm91dGUiO047fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1784306684),
('tmwHI5KyrKRlbiXhDecywRbFKHW6VljORQn6VQ8F', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibHZhZXZ1QlJCcHltNDF6ckRyek00NnFuTUFvODJ2YXdkT0FZSGlITiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvc2V0dGluZ3MiO3M6NToicm91dGUiO047fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1781856604),
('tR32HGAhNDpDxIkfPQdaQieSNHGjF8BVcW3N3qea', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicVJoRkJDR2RDTERQTXQ0WWJCOVBCTENxMXhkakpOd2Zod1BKS2Y1TyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTM6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaW52b2ljZXM/cGFnZT0xJnBlcl9wYWdlPTEwIjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1784306860),
('TspEweGQqVJtlVeExE3xpt28sQzP7XRGtrFN0V6L', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiS2Z5Vkx2d2xQUjhSMm96bTlVTGdUMzMwdk9FWWFDekVWbzVzZ0hFbiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTM6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaW52b2ljZXM/cGFnZT0xJnBlcl9wYWdlPTEwIjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1781937342),
('ttG2xWbzkSJWSgpOcAaDH3aOj3axp31mmzL8Bv2T', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQ2tOaEhLVjEyV2pGMWRNRXFsM2RkTVdMa1d2RWY4MEc2R2xOTnc3WSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDc6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvY2xpZW50cz9wZXJfcGFnZT0xMDAwIjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1781937317),
('u7U4MX3svrhifYj1jMbM2eWmvSPqg1ioJRuXNmjY', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMGF3ZkowMXhrZG42ZWZueFhzQUFaNFhNcUxBVVFMVktja2dTSm9ieiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTM6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaW52b2ljZXM/cGFnZT0xJnBlcl9wYWdlPTEwIjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1784306765),
('uI2ug3UAKVVTHR58hAOaQbJzzUvPeBnk6gcUlc4r', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiOU1odHhQTXhDRUxvUW1qbnJySU5BMEFSZEVYZ2VCbDA3akJaY3J2cyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvZGFzaGJvYXJkL3N0YXRpc3RpY3MiO3M6NToicm91dGUiO047fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1784306675),
('UsBpvQul4wEhFgobyZWA9MSPDVv2dNuvkGm6coJG', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMVFuZDRONjViZkdsYjdLMVFGRk1qbWFwRmtVSmVLQzZoQ2tIYWVRSyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvY2xpZW50cy8xNi9jb21wYW5pZXMiO3M6NToicm91dGUiO047fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1781937321),
('uT4HKMf1EARV6FpBI4s5oEwsncqFFVwsNNuhxtoN', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoieFBsUk9kRm51dFEzWUdxcnpiVVoyeDQ2TkRDQXhwVnVWM0ZlZkNRRCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvc2V0dGluZ3MiO3M6NToicm91dGUiO047fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1784305855),
('UU3GpEmY2ZLIGHwwp2qDOv7E4wEDaZ7vh5s8vFBQ', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoicVJNTlBxZ3R6cnZ2U1ZvSXlxcDlyckZnMGZQczdza29lbjBYdnJ0VCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1784306946),
('uuMeylfJwroBsgOjm20VWwY1IudeCUmshyFQFtfq', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTlNjcUp0VVJOSk9LMHpZMVdvNUUwaG5CVjk2dWpoSnBDWkYwVlJReiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTM6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaW52b2ljZXM/cGFnZT0xJnBlcl9wYWdlPTEwIjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1784307056),
('UvgWVnE5KzDB6D8gXYX0PysrvZrTfOjMs3Uu4VKZ', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMmRXSVBneElIV0NocWdRbGJrWHQ1TG9zRkZEVVNwV0VhVHdFZTdSMSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvY2xpZW50cy8xNi9jb21wYW5pZXMiO3M6NToicm91dGUiO047fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1784307066),
('uW2Kxe2IfYoLh9cRsCpx8jl5PKmL2rCvZBLAk1jd', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQXNGUDJ2RHhFS0NXVjhRengzdlFyaUFMMHpUa1paMWo1aWY0ZE12SSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDc6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvY2xpZW50cz9wZXJfcGFnZT0xMDAwIjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1784307205),
('UWxYgJ4kCgcjdhUOkQwUggQXrvplL6ZVIS8cZY0W', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNm4xMEY3ODB6U1UwSTIyN2VjemkyOWp5eWY0UndEVWExNEJMTHJDeCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvY2xpZW50cy8xNi9jb21wYW5pZXMiO3M6NToicm91dGUiO047fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1784307169),
('uy0soZyiR9nWJJRRLL8gtpraDaSAjMSutHSNo9h5', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRkZNTlE2Vng5aEZXbEFxWmVpbVVMUGV1MXhhc0FoTjV3T3JWbURFbiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTM6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaW52b2ljZXM/cGFnZT0xJnBlcl9wYWdlPTEwIjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1781851524),
('V0PaHDiVQKW3VR4Wvy5HDgTVHt3aaOorPiqDvCgr', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicmM3N2N5Qm1aczh2aGN2dFFmM3lDOFBtTUZZU0xxeU1YbFpzZ1FuVSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvZGFzaGJvYXJkL3N0YXRpc3RpY3MiO3M6NToicm91dGUiO047fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1784305753),
('v4fgxiIAbj0UJdZ7FuI1iqJgG7YvynfMs4J60gp5', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoib09VbTB0MXBINmVnWU9sajIwTFY5RFdtd1Z4TDZFcnJ4WndKSEFJRyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTM6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaW52b2ljZXM/cGFnZT0xJnBlcl9wYWdlPTEwIjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1784307109),
('VGPiXUYcZhzhMcUGW9QtBRAh4bY0pa2nm29sPwa7', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNnZzbnMwVHBxRXNtWG9MSGJFZW1YSG91aDBHMnhTRkZtd3c2aG5uSiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTM6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaW52b2ljZXM/cGFnZT0xJnBlcl9wYWdlPTEwIjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1784307162),
('VjRK4YU2j26hBiubh6qmkZva0ahTJpyMjCZCgOwc', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiam50QUFBSEpFR0VwNHFlbkFvSERTUGh3bUM1ZlZ2dm5mY2w5Tk1sTCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTM6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaW52b2ljZXM/cGFnZT0xJnBlcl9wYWdlPTEwIjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1781851940),
('VzMNZsQw8rK9eJx2Pc1StjidWW786l3uHtXtumSH', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidGlXSlFZQlA1d2ZNa0hpcHFhcG9acEx6Y0hadTdIUUZISU5UcDVqVCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvY2xpZW50cy8xNi9jb21wYW5pZXMiO3M6NToicm91dGUiO047fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1784307218),
('VztoNqVOSiudXHGF500BUaNpeDbso36HbWZ5akib', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibFRkVjZxcGdCOGp2WGx5Q21ZWDFzWVRXdzJGZ1k4UmlaQlQ5VkVieSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvZGFzaGJvYXJkL3N0YXRpc3RpY3MiO3M6NToicm91dGUiO047fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1784306406),
('w2dv07dGGNkko2ouIddzND2Oo7v1ITqapg6GUN8o', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiOVlWWUJ1N3paRElRZEY3dmFHVjlSUEdsNnVTdkZkZTJNZHUzVWhmRSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvZGFzaGJvYXJkL3N0YXRpc3RpY3MiO3M6NToicm91dGUiO047fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1784307482),
('W3J0wzZ8J1WZmChFPjmfvf9WCLprZA3UrSd9EAPd', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWkw0amQ2Sk52VUxCUXBSb1JzR08yUlB6UE84bVNaQUhHUTNzcVRxQyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjg6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvbWUiO3M6NToicm91dGUiO047fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1784306693),
('W4Xac3ah0mY9Kyfz4MFmUWd4AoicUaTxp3ttT0A1', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidENDWWtJMmNKNFRhb0JGbFlob1BCT1daVGhLdW9jUGpvRVFzbGJlUCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NjU6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaW52b2ljZXM/cGFnZT0xJnBlcl9wYWdlPTEwJnNlYXJjaD1aYW5hIjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1784306983),
('WEeaaY2jtNojDovNbv4zTRvWhhTizVrhzFnaSPLm', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiM2dveEtnRkwwRTRvenZBWEowUmlXeTN5NFdrWTBPS3Fma0ZSeG9ldSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvY2xpZW50cy8xNy9jb21wYW5pZXMiO3M6NToicm91dGUiO047fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1784307153),
('wg9j7d5ZQP9e1xYWRhAaQGshFr6ucJooEF5E7vcU', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUk14anVURVFGeEZ5eVl2ZnZLb2N0NzVPcVd5TXFqNE9lNE0zZDBDYSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvY2xpZW50cy8xNC9jb21wYW5pZXMiO3M6NToicm91dGUiO047fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1784306729),
('WjcieA8Qwc6QgGL7kfIDzXFEMgVYM7gER6y4Tptf', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQzhjZmFOYlhUZE4zQURHZHFHRWxROEZQT29GQ2lZTVFhVWQ0eTEwOSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTM6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaW52b2ljZXM/cGFnZT0xJnBlcl9wYWdlPTEwIjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1781937526),
('WjjLoZu6yYBwOo9Up3rmBkz4MYyhn17ObzMBL1yJ', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiaW8wbTZDdExQaFNWVVFnaUVwVHZjSmlzVDc3TWtTdGFNYXIxb1JQcCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvY2xpZW50cy8xNy9jb21wYW5pZXMiO3M6NToicm91dGUiO047fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1784307207),
('wJOsmXvP5hHV0hve85qX2sR62YjRxgu9MMwdhS1v', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicE93YmZ4WW9ncERCakNmbXZsSWhWNXBXU0lJa253bGpFNkNxSHBudyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NjQ6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaW52b2ljZXM/cGFnZT0xJnBlcl9wYWdlPTEwJnNlYXJjaD12aXkiO3M6NToicm91dGUiO047fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1781854879),
('WSePzc7oVcevdWZqTdlTO5iVT0Q4flwlGo3ZrSwU', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZmd5R1JXdm9vV0JKU0tnTk14RGtRUzdoZk1ralZaSmdoS0NMZXZTaCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvZGFzaGJvYXJkL3N0YXRpc3RpY3MiO3M6NToicm91dGUiO047fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1784306289),
('wShv1ZztjbvY9dDdRXKc7K2bcDyaY7NvcMQ4IAFQ', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicXlmc2tHN0VyMk0zWTF0N1ByY1NkZzlVT3poSXhqWThKcVZuUjZqRSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjg6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvbWUiO3M6NToicm91dGUiO047fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1781851475),
('wtlfXn9w1IY27vPlPn8ZElbdqPJw7AUEbHSe8H3g', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTmdmUUh4bG1JRjhWbVFtcjJyODJhZkc1VlhNZ3JIM2p2MlVOUmpyRiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTM6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaW52b2ljZXM/cGFnZT0yJnBlcl9wYWdlPTEwIjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1784307138),
('Wufempg5VRrXWOo7nE9YttHbY9o432fUQxPmaUrq', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoieGw2NWNHb0c3Z1hUSGFWT0ZjZWl3cEkxSVdSZDExTFFXbmU2UkNzNyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzc6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaW52b2ljZXMvOTkiO3M6NToicm91dGUiO047fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1784306873),
('WZj6dN4zDHpyolhvgkHTlcKCy2tLmGyhFgNH4MtC', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTXNYVzFIOEFSV09DMXYzUU5RcmRSRGZudWFvZ2xLYnJrUnJPRjllVyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvY2xpZW50cy8xNi9jb21wYW5pZXMiO3M6NToicm91dGUiO047fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1781937347),
('x1Y7zPcbphc1Nc0Ic03mNg4m3McD3PWnkB9RcEyu', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoieXJjTTJxVjRyQ3ZFTXJ4THE0QmZEbEJJTzNiWHJ1Y3lQbUh2NGpjdiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvY29tcGFuaWVzP3BhZ2U9MSZwZXJfcGFnZT0xMDAwIjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1784306211),
('x7I41Efh4UqhjKXoYd7aC5FKWjhUXVKqwXTh50My', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiOGhJUUJxQ2VwSm5aU05QQUZPMlMzMlNYcHo4S285SlUycFY4VEZJdCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvZGFzaGJvYXJkL3N0YXRpc3RpY3MiO3M6NToicm91dGUiO047fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1784305753),
('xcyG61mgUBXfz0kBRuqMdFqXOibjKbBHcgHz6gQN', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRUYzTWwwVmJMVm9UZ1ZidjJldkFkTjZ5OWlXY3kwUmxJMDBVbkhmdyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NjI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaW52b2ljZXM/cGFnZT0xJnBlcl9wYWdlPTEwJnNlYXJjaD1aIjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1784306980),
('XGJpdZEkq2dWaVMIXZPRt8gQXUTRbQakmqduLDmQ', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVEZkcTlJTVJPazRSRFd5VnlpSTVOVEV4MFB4aDRKcjZ5MXVya0JwNyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDc6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvY2xpZW50cz9wZXJfcGFnZT0xMDAwIjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1784306921),
('XLEbZvDEpBndz9ncSxiHvz0TH7OxrnXDaeHfGoCg', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiS3FhVmpkbzVaZzBCbUJnN216cm9WYTFhQXJNd09Od0kwbGlUM2lVWCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTM6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaW52b2ljZXM/cGFnZT0xJnBlcl9wYWdlPTEwIjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1784306765),
('XNYN2qo2d9WErmOdpHO11qX5oQxEsHHeE07j8L0s', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTWlScFU3RTNLVFNFVEtOQmtXOEZ3RW9xT2RBOEV3QlVRRVBENjBsUyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTM6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaW52b2ljZXM/cGFnZT0xJnBlcl9wYWdlPTEwIjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1781851982),
('XoXwJq4ufK2KzBRMRv0ADbD77yOzjdxN9xA8iGJi', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidWJYbG90R0dGeWVHdjIySmkybTJPSFNpR3EwMXhRUm90YmtPSXRVbiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTM6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaW52b2ljZXM/cGFnZT0xJnBlcl9wYWdlPTEwIjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1784298370),
('XSoVge0ALnlTCW146Dt0Arwm8wZfWqMtWZ3bkalY', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiVmYwTXhjOUUxb0NNZHlYeXZnOGtRdmtWcXNKaEJOZWIycHZEclZ3VCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1784307197),
('Xvqal8lOUEjJHvwHRQxxRJK24wLkHe6pIhDQPMZV', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZTd5TjkyWXJRNE12eGhoaGY2dkxSbDJzdXNIS3NGTWtvZjJ1S2NoNSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvY2xpZW50cy8xNi9jb21wYW5pZXMiO3M6NToicm91dGUiO047fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1784307218);
INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('xWjLEk6tFdGAgOlBdE2TQpKMdVbCvLUFuERQJARv', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMWJveldndjY0eXpiekhZbDhLNFd3czRkdGpPb3d5c2lVajhuQ3lyMiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvZGFzaGJvYXJkL3N0YXRpc3RpY3MiO3M6NToicm91dGUiO047fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1784306694),
('xY6OXEScOfSOws0BmNZOa47JMXd8VvM2rGGCoIXO', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiUmllcmVwcVd5QjA4eHRKTmFBUmtGMWVrRmhWUHEyS3pOcGJHU012NCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1784298545),
('y33ieMFtRrz6wJi5Wo730HItaMTh8KqEwZqeZn6a', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoia29UbWR4NFJGTGdrWE84dWFxNWp6ZE42TjFEdEFZQUNuRDlvb0M1ZyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTM6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaW52b2ljZXM/cGFnZT0yJnBlcl9wYWdlPTEwIjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1784307133),
('y6WbPNRBrFe5EVSlhEW8BQN05Ne0r4IoKgNDRDLB', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiNTBXYlM2c2JEaDB1VlZnbW5YMFhjbkZsMVFwVGVmY0NZUGphTmk0MiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1784298379),
('Y9QCAgckIvdB00L3hZvshwFIaW0dSLXJr7gGQbep', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidnM0aE1xOTN2NVo1VmswTzhBbXlLNUdUYWczYVdMMjY0ajUxS05NOCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTM6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaW52b2ljZXM/cGFnZT0yJnBlcl9wYWdlPTEwIjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1784307123),
('yEFurbIZhlPYhfTxvrDttSKigGp6eg3aUFQmjgf4', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTmxRUFFDNmg3NFZORmdvWll2N1N3aE56MHd4eGhjT21pUlJUNTFmNyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTM6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaW52b2ljZXM/cGFnZT0xJnBlcl9wYWdlPTEwIjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1781852051),
('ynJTIIzlvWqIzslJxR8Wi8iaIu3lKCAfPCj9lVx8', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoickpvNnl3WTdSUk5jcVRKYzdZQ1ZiZ0JQbXVOUUV0dE9UWjJvNlVqZiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvY2xpZW50cy8xNy9jb21wYW5pZXMiO3M6NToicm91dGUiO047fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1784307283),
('YzMMoo3krvbUWE9gvUl79Enxw2M6W9nYU07K4df0', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicHFHY3BSUk9nNk80ZTNtWFRBV0lKNTU0a1h6bWY5V3FYcTNDYWJhQyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NjM6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaW52b2ljZXM/cGFnZT0xJnBlcl9wYWdlPTEwJnNlYXJjaD12aSI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1781854878),
('z0ASyVO3ciIqOLDlNXCvx7zNI3DMaiyLjVDDRWz6', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSzlDQ3lVVHJhMVJLSEF6b1BHSWJFdmlkM25qVnIxVVlkNEdqU011SCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvZGFzaGJvYXJkL3N0YXRpc3RpY3MiO3M6NToicm91dGUiO047fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1784306686),
('z0Zo5REyY51fKoLy5sw8yQHZcN4pIiYnicevzO1l', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiaWVqMks3WDVIeHZMRWVud01XbFZrME1xSEtKNVNZTUFvdVFPMmRYSiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzc6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaW52b2ljZXMvOTciO3M6NToicm91dGUiO047fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1781937378),
('Z15ycuwT16JLQ41BuM0lquLhOTZ65a6cueHlmhzl', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRHJxR0l2TkVKRDdjT0ZXcFJkSU9nbmhObFFnQXFvd3lPWm5SNmNpMCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvY2xpZW50cy8xNC9jb21wYW5pZXMiO3M6NToicm91dGUiO047fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1784306933),
('Z6rshw5JCXt24NGIhKXbTtp7VmttDtskB3bG0DSJ', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNU1jN0gyN3UwQm9OcVVyYlE0aXZYUnlobUEzTThkb1I0NkRyMURETCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDc6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvY2xpZW50cz9wZXJfcGFnZT0xMDAwIjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1781937346),
('ZEfZqpZspkwhWlLvWJ8c49vllV2oEnW4P3VWTPHd', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiV1N3aXl4N1gxRlI4QWVzUkt6cENtQUNhQlBhNENoV3ZxNXpHNUxydyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTM6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaW52b2ljZXM/cGFnZT0xJnBlcl9wYWdlPTEwIjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1784305878),
('zlBiTCBS2hPfsUy1USM1mVWFQOzrIjNYszaQIXst', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWXFSMjJyM0lIZWhqQ0c4YlJyS3pydnBvN3pjeEc2aFpxempJR1RvOCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvY2xpZW50cy8xMCI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1784306211),
('ZLMxaFTXP3zEnzOFz1Z0wOnLmJ7v1DlW3Fb18fRp', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidFNSYmFKMkZuZXFiSXRBZFAzbkd5STRoSU15ZVVuVjhrVlk1cElENCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjg6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvbWUiO3M6NToicm91dGUiO047fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1784306674),
('ZowQOZeAIVNEOH3JIvbJxDTc1q6nVfaSOMNHWw4F', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQ1hEQjUzRmRTVVhqNGdwZzdZS2YzY1psMEtyUXJMdnhTUzdDRGp1ayI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTM6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaW52b2ljZXM/cGFnZT0yJnBlcl9wYWdlPTEwIjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1784307136),
('zQZxZ48Q6nbkkp7je8fbkTpfSJjMHXFAoResQpUn', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoieVVNblI3Sm9wUXdkUlZYaXhtcTZRaWVZaE9XTmpWcHV1Z2ZwWWowdSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDc6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvY2xpZW50cz9wZXJfcGFnZT0xMDAwIjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1781851530),
('zsijIV4SBLJXnMtezXa0mC5p12OtCDq4qssOAk32', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUmpTTU1BMmx3M09UbGVYcTNBWE1HWUY0WldGSU1uSUhMYUkxNlEyeSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTM6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaW52b2ljZXM/cGFnZT0xJnBlcl9wYWdlPTEwIjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1784307200),
('ZSxDaMTupgTqjYMOPzzagTMldLlP3YCc94yINSlB', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZThpSU5wdDlaUG12Yks5OFd4UzdOaXppVVZpSWxPSEx4aFlVQ2swZyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDU6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvY2xpZW50cy85L2NvbXBhbmllcyI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1781851960),
('ZyNjJtMyy23lPjV0ChOCK1DaAWJbqL3oAitSJbvI', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYWZoUHBjUTBxWWt3aDdDd1VBTjJURkRiUk9IWkJBSWh1MDZyb0pCYyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzc6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaW52b2ljZXMvOTYiO3M6NToicm91dGUiO047fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1781937345);

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `logo_tagline` varchar(100) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `privacy_and_policy` longtext DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `name`, `logo`, `logo_tagline`, `address`, `phone`, `email`, `privacy_and_policy`, `created_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Alpha IT Solution', 'uploads/setting/CnU4jbRRdmpgwPU1RqK7N6k48HTm6ozwoFJe2wvO.png', 'Your Vision, Our Solution', 'Erbil, Iraq', '07507398815', 'omer.hamajan@gmail.com', 'For support or inquiries about this invoice, please contact us directly via the channels listed.', 2, '2025-11-12 08:52:53', '2025-11-18 19:01:13', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(2, 'admin', 'admin@example.com', NULL, '$2y$12$xmya1BW9qHWa2BoIteZZHOngaD9ryMoi7oQIQiu11xK5RaSxrQFDW', NULL, '2025-11-07 16:17:53', '2025-11-07 16:17:53');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `clients_created_by_foreign` (`created_by`);

--
-- Indexes for table `client_company`
--
ALTER TABLE `client_company`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `client_company_client_id_company_id_unique` (`client_id`,`company_id`),
  ADD KEY `client_company_company_id_foreign` (`company_id`);

--
-- Indexes for table `companies`
--
ALTER TABLE `companies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `companies_created_by_foreign` (`created_by`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `invoices_invoice_number_unique` (`invoice_number`),
  ADD KEY `invoices_company_id_foreign` (`company_id`),
  ADD KEY `invoices_client_id_foreign` (`client_id`),
  ADD KEY `invoices_created_by_foreign` (`created_by`);

--
-- Indexes for table `invoice_items`
--
ALTER TABLE `invoice_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoice_items_invoice_id_foreign` (`invoice_id`),
  ADD KEY `invoice_items_created_by_foreign` (`created_by`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`),
  ADD KEY `personal_access_tokens_expires_at_index` (`expires_at`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `settings_created_by_foreign` (`created_by`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `clients`
--
ALTER TABLE `clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `client_company`
--
ALTER TABLE `client_company`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `companies`
--
ALTER TABLE `companies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `invoices`
--
ALTER TABLE `invoices`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=102;

--
-- AUTO_INCREMENT for table `invoice_items`
--
ALTER TABLE `invoice_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=197;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `clients`
--
ALTER TABLE `clients`
  ADD CONSTRAINT `clients_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `client_company`
--
ALTER TABLE `client_company`
  ADD CONSTRAINT `client_company_client_id_foreign` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `client_company_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `companies`
--
ALTER TABLE `companies`
  ADD CONSTRAINT `companies_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `invoices`
--
ALTER TABLE `invoices`
  ADD CONSTRAINT `invoices_client_id_foreign` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `invoices_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `invoices_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `invoice_items`
--
ALTER TABLE `invoice_items`
  ADD CONSTRAINT `invoice_items_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `invoice_items_invoice_id_foreign` FOREIGN KEY (`invoice_id`) REFERENCES `invoices` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `settings`
--
ALTER TABLE `settings`
  ADD CONSTRAINT `settings_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
