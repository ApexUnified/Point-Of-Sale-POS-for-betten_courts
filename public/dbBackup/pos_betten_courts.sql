-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 17, 2025 at 09:45 AM
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
-- Database: `pos_betten_courts`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE `accounts` (
  `id` int(10) UNSIGNED NOT NULL,
  `account_no` varchar(191) NOT NULL,
  `name` varchar(191) NOT NULL,
  `initial_balance` double DEFAULT NULL,
  `total_balance` double NOT NULL,
  `note` text DEFAULT NULL,
  `is_default` tinyint(1) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `accounts`
--

INSERT INTO `accounts` (`id`, `account_no`, `name`, `initial_balance`, `total_balance`, `note`, `is_default`, `is_active`, `created_at`, `updated_at`) VALUES
(1, '0000', 'Main Account', 8000000, 8000000, NULL, 1, 1, '2024-10-07 08:38:24', '2024-10-07 08:38:24');

-- --------------------------------------------------------

--
-- Table structure for table `adjustments`
--

CREATE TABLE `adjustments` (
  `id` int(10) UNSIGNED NOT NULL,
  `reference_no` varchar(191) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `document` varchar(191) DEFAULT NULL,
  `total_qty` double NOT NULL,
  `item` int(11) NOT NULL,
  `note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `adjustments`
--

INSERT INTO `adjustments` (`id`, `reference_no`, `warehouse_id`, `document`, `total_qty`, `item`, `note`, `created_at`, `updated_at`) VALUES
(1, 'adr-20241128-111643', 1, NULL, 1, 1, NULL, '2024-11-28 10:16:43', '2024-11-28 10:16:43');

-- --------------------------------------------------------

--
-- Table structure for table `attendances`
--

CREATE TABLE `attendances` (
  `id` int(10) UNSIGNED NOT NULL,
  `date` date DEFAULT NULL,
  `employee_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `checkin` varchar(191) DEFAULT NULL,
  `checkout` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL,
  `note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `billers`
--

CREATE TABLE `billers` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `image` varchar(191) DEFAULT NULL,
  `company_name` varchar(191) NOT NULL,
  `vat_number` varchar(191) DEFAULT NULL,
  `email` varchar(191) NOT NULL,
  `phone_number` varchar(191) NOT NULL,
  `address` varchar(191) NOT NULL,
  `city` varchar(191) NOT NULL,
  `state` varchar(191) DEFAULT NULL,
  `postal_code` varchar(191) DEFAULT NULL,
  `country` varchar(191) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `billers`
--

INSERT INTO `billers` (`id`, `name`, `image`, `company_name`, `vat_number`, `email`, `phone_number`, `address`, `city`, `state`, `postal_code`, `country`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Bettencourt\'s', '20241120055310.jpg', 'Bettencourt\'s Home', NULL, 'info@linkintechnology.com', '0000000000', 'ZZ 22 Durban Street, Wortmanville', 'Georgetown', 'South America', NULL, 'Guyana', 0, '2024-11-17 19:03:44', '2024-12-12 08:26:14'),
(2, 'Kiara', NULL, 'Betten_courts', NULL, 'kiara@gmail.com', '5555555', 'D332 Lasi para Model Colony Malir Karachi', 'Karachi', NULL, NULL, NULL, 0, '2024-11-28 10:30:59', '2024-12-12 08:26:14'),
(3, 'Anna', '20241212113236.png', 'Bettencourt\'s Home Style Diner', '112-271-298', 'anna@gmail.com', '592-225-1008/592-688-9009', 'ZZ 22 Durban Street Wortmanville', 'Georgetown', NULL, NULL, 'Guyana', 1, '2024-12-12 08:33:36', '2024-12-12 10:32:36'),
(4, 'Renatta', '20241212113327.png', 'Bettencourt\'s Home Style Diner', '112-271-298', 'renatta@gmail.com', '592-225-1008/592-688-9009', 'ZZ 22 Durban Street Wortmanville', 'Georgetown', NULL, NULL, 'Guyana', 1, '2024-12-12 08:52:45', '2024-12-12 10:33:27'),
(5, 'Shakira', '20241212113356.png', 'Bettencourt\'s Home Style Diner', '112-271-298', 'shakira@gmail.com', '592-225-1008/592-688-9009', 'ZZ 22 Durban Street Wortmanville', 'Georgetown', NULL, NULL, 'Guyana', 1, '2024-12-12 08:57:45', '2024-12-12 10:33:56'),
(6, 'Kiara', '20241212113420.png', 'Bettencourt\'s Home Style Diner', '112-271-298', 'kiara@gmail.com', '592-225-1008/592-688-9009', 'ZZ 22 Durban Street Wortmanville', 'Georgetown', NULL, NULL, 'Guyana', 1, '2024-12-12 08:58:36', '2024-12-12 10:34:20');

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(191) NOT NULL,
  `image` varchar(191) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `title`, `image`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'haha', NULL, 1, '2025-02-12 07:01:10', '2025-02-12 07:01:10');

-- --------------------------------------------------------

--
-- Table structure for table `cash_registers`
--

CREATE TABLE `cash_registers` (
  `id` int(10) UNSIGNED NOT NULL,
  `cash_in_hand` double NOT NULL,
  `user_id` int(11) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cash_registers`
--

INSERT INTO `cash_registers` (`id`, `cash_in_hand`, `user_id`, `warehouse_id`, `status`, `created_at`, `updated_at`) VALUES
(1, 100, 1, 1, 0, '2024-11-14 05:27:54', '2024-11-17 08:01:04'),
(2, 110, 1, 1, 0, '2024-11-17 08:01:26', '2024-12-12 07:30:13'),
(3, 500, 11, 1, 1, '2024-11-28 10:32:21', '2024-11-28 10:32:21'),
(4, 2222, 1, 3, 1, '2024-12-09 14:37:15', '2024-12-09 14:37:15'),
(5, 0, 1, 1, 0, '2024-12-11 00:35:38', '2024-12-12 07:30:29'),
(6, 500, 1, 3, 1, '2024-12-12 07:30:36', '2024-12-12 07:30:36'),
(7, 4000, 1, 3, 1, '2024-12-12 07:31:07', '2024-12-12 07:31:07'),
(8, 500, 1, 1, 1, '2024-12-12 07:31:12', '2024-12-12 07:31:12'),
(9, 500, 1, 4, 1, '2024-12-12 08:48:48', '2024-12-12 08:48:48'),
(10, 1000, 14, 1, 1, '2025-02-09 05:39:01', '2025-02-09 05:39:01'),
(11, 500, 18, 1, 1, '2025-02-17 05:46:08', '2025-02-17 05:46:08');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `image` varchar(191) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `image`, `parent_id`, `is_active`, `created_at`, `updated_at`) VALUES
(12, 'Chicken', '20250212124458.jpg', NULL, 1, '2024-11-18 11:34:18', '2024-11-18 11:34:18'),
(13, 'Fish', NULL, NULL, 1, '2024-11-18 11:34:54', '2024-11-18 11:34:54'),
(14, 'Beef', NULL, NULL, 1, '2024-11-18 11:35:18', '2024-11-18 11:35:18'),
(16, 'Mutton', NULL, NULL, 1, '2024-11-18 11:36:01', '2024-11-18 11:36:01'),
(17, 'Duck', NULL, NULL, 1, '2024-11-18 11:36:12', '2024-11-18 11:36:12'),
(18, 'Shrimp', NULL, NULL, 1, '2024-11-18 11:36:28', '2024-11-18 11:36:28'),
(19, 'Prawns', NULL, NULL, 1, '2024-11-18 11:36:42', '2024-11-18 11:36:42'),
(20, 'vegetarian', NULL, NULL, 1, '2024-11-18 11:37:21', '2024-11-18 11:37:21'),
(21, 'Meat Cookup', NULL, NULL, 1, '2024-11-18 11:38:02', '2024-11-18 11:38:02'),
(22, 'Pastries', NULL, NULL, 1, '2024-11-18 11:38:15', '2024-11-18 11:38:15'),
(23, 'Snacks', NULL, NULL, 1, '2024-11-18 11:38:33', '2024-11-18 11:38:33'),
(24, 'Salads', NULL, NULL, 1, '2024-11-18 11:38:45', '2024-11-18 11:38:45'),
(25, 'Beverages', NULL, NULL, 1, '2024-11-18 11:39:46', '2024-11-18 11:39:46'),
(26, 'Local Juices', NULL, NULL, 1, '2024-11-18 11:40:03', '2024-11-18 11:40:03'),
(27, 'Eco Meal/Chicken', NULL, NULL, 1, '2024-11-18 11:40:26', '2024-11-18 11:40:26'),
(28, 'Eco Meal/Beef', NULL, NULL, 1, '2024-11-18 11:40:44', '2024-11-18 11:40:44'),
(29, 'Eco Meal/Fish', NULL, NULL, 1, '2024-11-18 11:41:12', '2024-11-18 11:41:12'),
(30, 'Cross Burns', NULL, NULL, 1, '2024-11-18 11:41:33', '2024-11-18 11:41:33'),
(31, 'Mother\'s Day', NULL, NULL, 1, '2024-11-18 11:42:06', '2024-11-18 11:42:06'),
(32, 'Father\'s Day', NULL, NULL, 1, '2024-11-18 11:42:17', '2024-11-18 11:42:17'),
(33, 'Valentine Day', NULL, NULL, 1, '2024-11-18 11:42:35', '2024-11-18 11:42:35'),
(34, 'Food Boxes', NULL, NULL, 1, '2024-11-18 11:42:51', '2024-11-18 11:42:51'),
(35, 'Cups', NULL, NULL, 1, '2024-11-18 11:43:01', '2024-11-18 11:43:01'),
(36, 'Soup Bowls', NULL, NULL, 1, '2024-11-18 11:43:45', '2024-11-18 11:43:45'),
(37, 'Metem Bowls', NULL, NULL, 1, '2024-11-18 11:44:09', '2024-11-18 11:44:09'),
(38, 'Plastic Containers', NULL, NULL, 1, '2024-11-18 11:44:31', '2024-11-18 11:44:31'),
(39, 'Delivery', NULL, NULL, 1, '2024-11-18 11:44:43', '2024-11-18 11:44:43'),
(40, 'Boxes', NULL, NULL, 1, '2024-11-18 13:24:26', '2024-11-18 13:24:26'),
(41, 'Bowls', NULL, NULL, 1, '2024-11-18 13:24:36', '2024-11-18 13:24:36');

-- --------------------------------------------------------

--
-- Table structure for table `challans`
--

CREATE TABLE `challans` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `reference_no` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `courier_id` int(11) NOT NULL,
  `packing_slip_list` longtext NOT NULL,
  `amount_list` longtext NOT NULL,
  `cash_list` longtext DEFAULT NULL,
  `online_payment_list` longtext DEFAULT NULL,
  `cheque_list` longtext DEFAULT NULL,
  `delivery_charge_list` longtext DEFAULT NULL,
  `status_list` longtext DEFAULT NULL,
  `closing_date` date DEFAULT NULL,
  `created_by_id` int(11) NOT NULL,
  `closed_by_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(191) NOT NULL,
  `type` varchar(191) NOT NULL,
  `amount` double NOT NULL,
  `minimum_amount` double DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `used` int(11) NOT NULL,
  `expired_date` date NOT NULL,
  `user_id` int(11) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `coupons`
--

INSERT INTO `coupons` (`id`, `code`, `type`, `amount`, `minimum_amount`, `quantity`, `used`, `expired_date`, `user_id`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'EMG1bF5527', 'percentage', 500, NULL, 5, 0, '2024-10-07', 1, 0, '2024-10-07 13:24:32', '2024-10-07 13:24:40'),
(2, 'TeFYND6901', 'percentage', 500, NULL, 5, 1, '2024-11-17', 1, 1, '2024-11-17 07:50:49', '2024-11-17 07:52:09'),
(3, '6FlMdDeh8d', 'fixed', 2000, 200, 5, 0, '2024-11-17', 1, 1, '2024-11-17 13:39:32', '2024-11-17 13:39:32'),
(4, 'uW4349nG1T', 'percentage', 10, 0, 10, 5, '2025-02-28', 1, 1, '2025-02-14 11:05:39', '2025-02-17 07:13:31');

-- --------------------------------------------------------

--
-- Table structure for table `couriers`
--

CREATE TABLE `couriers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `phone_number` varchar(255) NOT NULL,
  `address` text NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `couriers`
--

INSERT INTO `couriers` (`id`, `name`, `phone_number`, `address`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'SHEIKH MUHAMMAD ABDULLAH', '03092657113', 'Model Colony Hashim Raza Road Near Umar Bin Khattab Masjid', 1, '2024-09-21 16:39:20', '2024-09-21 16:39:20');

-- --------------------------------------------------------

--
-- Table structure for table `currencies`
--

CREATE TABLE `currencies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `code` varchar(191) NOT NULL,
  `exchange_rate` double NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `currencies`
--

INSERT INTO `currencies` (`id`, `name`, `code`, `exchange_rate`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'US Dollar', 'USD', 0.95, 1, '2020-11-01 00:22:58', '2024-11-20 06:21:46'),
(2, 'Euro', 'Euro', 0.95, 1, '2020-11-01 01:29:12', '2023-06-08 10:10:32'),
(4, 'Guyana Dollar', 'GYD', 1, 1, '2024-11-20 06:22:03', '2024-11-20 06:22:03');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` int(10) UNSIGNED NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(191) NOT NULL,
  `company_name` varchar(191) DEFAULT NULL,
  `email` varchar(191) DEFAULT NULL,
  `phone_number` varchar(191) NOT NULL,
  `tax_no` varchar(191) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `state` varchar(191) DEFAULT NULL,
  `postal_code` varchar(191) DEFAULT NULL,
  `country` varchar(191) DEFAULT NULL,
  `points` double DEFAULT NULL,
  `deposit` double DEFAULT NULL,
  `expense` double DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `ecom` varchar(255) DEFAULT NULL,
  `dsf` varchar(255) DEFAULT 'df',
  `arabic_name` varchar(255) DEFAULT NULL,
  `admin` varchar(255) DEFAULT NULL,
  `franchise_location` varchar(255) DEFAULT NULL,
  `customer_type` varchar(255) DEFAULT 'Same as Customer',
  `customer_assigned_to` varchar(255) DEFAULT 'Advocate',
  `assigned` varchar(255) DEFAULT 'Advocate',
  `aaaaaaaa` varchar(255) DEFAULT 'aa',
  `district` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `customer_group_id`, `user_id`, `name`, `company_name`, `email`, `phone_number`, `tax_no`, `address`, `city`, `state`, `postal_code`, `country`, `points`, `deposit`, `expense`, `is_active`, `created_at`, `updated_at`, `ecom`, `dsf`, `arabic_name`, `admin`, `franchise_location`, `customer_type`, `customer_assigned_to`, `assigned`, `aaaaaaaa`, `district`) VALUES
(1, 1, NULL, 'customer', NULL, NULL, '12345', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2024-10-07 13:02:02', '2024-10-07 13:21:09', NULL, 'df', NULL, NULL, NULL, 'Same as Customer', 'Advocate', 'Advocate', 'aa', NULL),
(2, 1, 7, 'Walk_In', NULL, NULL, '0000000', NULL, NULL, 'Georgetown', 'South America', NULL, 'Guyana', 4484, 5000, 0, 1, '2024-11-13 20:19:15', '2025-02-17 07:13:31', NULL, 'df', NULL, NULL, NULL, 'Same as Customer', 'Advocate', 'Advocate', 'aa', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `customer_groups`
--

CREATE TABLE `customer_groups` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `percentage` varchar(191) NOT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customer_groups`
--

INSERT INTO `customer_groups` (`id`, `name`, `percentage`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'walk in', '0', 1, '2024-09-20 15:25:27', '2024-09-20 15:25:27'),
(2, 'Government', '0', 1, '2025-01-19 15:00:06', '2025-01-19 15:00:06');

-- --------------------------------------------------------

--
-- Table structure for table `custom_fields`
--

CREATE TABLE `custom_fields` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `belongs_to` varchar(191) NOT NULL,
  `name` varchar(191) NOT NULL,
  `type` varchar(191) NOT NULL,
  `default_value` text DEFAULT NULL,
  `option_value` text DEFAULT NULL,
  `grid_value` int(11) NOT NULL,
  `is_table` tinyint(1) NOT NULL,
  `is_invoice` tinyint(1) NOT NULL,
  `is_required` tinyint(1) NOT NULL,
  `is_admin` tinyint(1) NOT NULL,
  `is_disable` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `deliveries`
--

CREATE TABLE `deliveries` (
  `id` int(10) UNSIGNED NOT NULL,
  `reference_no` varchar(191) NOT NULL,
  `sale_id` int(11) NOT NULL,
  `packing_slip_ids` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `courier_id` int(11) DEFAULT NULL,
  `address` text NOT NULL,
  `delivered_by` varchar(191) DEFAULT NULL,
  `recieved_by` varchar(191) DEFAULT NULL,
  `file` varchar(191) DEFAULT NULL,
  `note` varchar(191) DEFAULT NULL,
  `status` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `deliveries`
--

INSERT INTO `deliveries` (`id`, `reference_no`, `sale_id`, `packing_slip_ids`, `user_id`, `courier_id`, `address`, `delivered_by`, `recieved_by`, `file`, `note`, `status`, `created_at`, `updated_at`) VALUES
(1, 'dr-20241214-071608', 4, NULL, 1, NULL, 'Georgetown Guyana', NULL, NULL, NULL, NULL, '1', '2024-12-14 18:16:13', '2024-12-14 18:16:13');

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`id`, `name`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Admin Department', 1, '2024-10-07 08:27:18', '2024-10-07 08:27:18');

-- --------------------------------------------------------

--
-- Table structure for table `deposits`
--

CREATE TABLE `deposits` (
  `id` int(10) UNSIGNED NOT NULL,
  `amount` double NOT NULL,
  `customer_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `deposits`
--

INSERT INTO `deposits` (`id`, `amount`, `customer_id`, `user_id`, `note`, `created_at`, `updated_at`) VALUES
(1, 5000, 2, 1, NULL, '2025-02-17 04:40:44', '2025-02-17 04:40:44');

-- --------------------------------------------------------

--
-- Table structure for table `discounts`
--

CREATE TABLE `discounts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `applicable_for` varchar(191) NOT NULL,
  `product_list` longtext DEFAULT NULL,
  `valid_from` date NOT NULL,
  `valid_till` date NOT NULL,
  `type` varchar(191) NOT NULL,
  `value` double NOT NULL,
  `minimum_qty` double NOT NULL,
  `maximum_qty` double NOT NULL,
  `days` varchar(191) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `discounts`
--

INSERT INTO `discounts` (`id`, `name`, `applicable_for`, `product_list`, `valid_from`, `valid_till`, `type`, `value`, `minimum_qty`, `maximum_qty`, `days`, `is_active`, `created_at`, `updated_at`) VALUES
(1, '10% Discount', 'All', NULL, '2024-11-18', '2024-11-18', 'percentage', 10, 1, 1, 'Mon,Tue,Wed,Thu,Fri,Sat,Sun', 1, '2024-11-17 07:43:45', '2024-11-17 07:43:45');

-- --------------------------------------------------------

--
-- Table structure for table `discount_plans`
--

CREATE TABLE `discount_plans` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `discount_plans`
--

INSERT INTO `discount_plans` (`id`, `name`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Demo', 1, '2024-11-17 07:43:15', '2024-11-17 07:43:15');

-- --------------------------------------------------------

--
-- Table structure for table `discount_plan_customers`
--

CREATE TABLE `discount_plan_customers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `discount_plan_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `discount_plan_customers`
--

INSERT INTO `discount_plan_customers` (`id`, `discount_plan_id`, `customer_id`, `created_at`, `updated_at`) VALUES
(1, 1, 2, '2024-11-17 07:43:15', '2024-11-17 07:43:15');

-- --------------------------------------------------------

--
-- Table structure for table `discount_plan_discounts`
--

CREATE TABLE `discount_plan_discounts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `discount_id` int(11) NOT NULL,
  `discount_plan_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `discount_plan_discounts`
--

INSERT INTO `discount_plan_discounts` (`id`, `discount_id`, `discount_plan_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '2024-11-17 07:43:45', '2024-11-17 07:43:45');

-- --------------------------------------------------------

--
-- Table structure for table `dso_alerts`
--

CREATE TABLE `dso_alerts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_info` longtext NOT NULL,
  `number_of_products` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `email` varchar(191) DEFAULT NULL,
  `phone_number` varchar(191) DEFAULT NULL,
  `department_id` int(11) NOT NULL,
  `device_id` varchar(255) DEFAULT NULL,
  `shift` varchar(255) DEFAULT NULL,
  `shift_days` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `staff_id` varchar(191) DEFAULT NULL,
  `image` varchar(191) DEFAULT NULL,
  `address` varchar(191) DEFAULT NULL,
  `city` varchar(191) DEFAULT NULL,
  `country` varchar(191) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `expenses`
--

CREATE TABLE `expenses` (
  `id` int(10) UNSIGNED NOT NULL,
  `reference_no` varchar(191) NOT NULL,
  `expense_category_id` int(11) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `cash_register_id` int(11) DEFAULT NULL,
  `amount` double NOT NULL,
  `note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `expense_categories`
--

CREATE TABLE `expense_categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(191) NOT NULL,
  `name` varchar(191) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `expense_categories`
--

INSERT INTO `expense_categories` (`id`, `code`, `name`, `is_active`, `created_at`, `updated_at`) VALUES
(1, '89049952', 'Expense', 0, '2024-10-07 10:41:09', '2024-10-07 10:42:39'),
(2, '01137946', 'Ex', 0, '2024-10-07 11:16:49', '2024-10-07 11:16:57');

-- --------------------------------------------------------

--
-- Table structure for table `external_services`
--

CREATE TABLE `external_services` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `details` longtext DEFAULT NULL,
  `active` int(11) DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `external_services`
--

INSERT INTO `external_services` (`id`, `name`, `type`, `details`, `active`, `created_at`, `updated_at`) VALUES
(1, 'PayPal', 'payment', 'Client ID,Client Secret;abcd1234,wxyz5678', 0, NULL, NULL),
(2, 'Stripe', 'payment', 'Public Key,Private Key;efgh1234,stuv5678', 0, NULL, NULL),
(3, 'twilio', 'sms', '{\"account_sid\":\"AC93d4a6580b5ac2aa273ae3b310c80b49\",\"auth_token\":\"bcd7662f19781307109da76c36732b26\",\"twilio_number\":\"+15308838771\"}', 1, '2024-09-21 11:33:20', '2024-09-23 09:02:03'),
(4, 'revesms', 'sms', NULL, 0, '2024-09-23 09:01:48', '2024-09-23 09:01:48');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `general_settings`
--

CREATE TABLE `general_settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `site_title` varchar(191) NOT NULL,
  `site_logo` varchar(191) DEFAULT NULL,
  `is_rtl` tinyint(1) DEFAULT NULL,
  `currency` varchar(191) NOT NULL,
  `package_id` int(11) DEFAULT NULL,
  `subscription_type` varchar(255) DEFAULT NULL,
  `staff_access` varchar(191) NOT NULL,
  `without_stock` varchar(255) NOT NULL DEFAULT 'no',
  `date_format` varchar(191) NOT NULL,
  `developed_by` varchar(191) DEFAULT NULL,
  `invoice_format` varchar(191) DEFAULT NULL,
  `decimal` int(11) DEFAULT 2,
  `state` int(11) DEFAULT NULL,
  `theme` varchar(191) NOT NULL,
  `modules` text CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `currency_position` varchar(191) NOT NULL,
  `expiry_date` date DEFAULT NULL,
  `is_zatca` tinyint(1) DEFAULT NULL,
  `company_name` varchar(191) DEFAULT NULL,
  `vat_registration_number` varchar(191) DEFAULT NULL,
  `is_packing_slip` tinyint(1) DEFAULT NULL,
  `display_section` text DEFAULT NULL,
  `pos_search` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `general_settings`
--

INSERT INTO `general_settings` (`id`, `site_title`, `site_logo`, `is_rtl`, `currency`, `package_id`, `subscription_type`, `staff_access`, `without_stock`, `date_format`, `developed_by`, `invoice_format`, `decimal`, `state`, `theme`, `modules`, `created_at`, `updated_at`, `currency_position`, `expiry_date`, `is_zatca`, `company_name`, `vat_registration_number`, `is_packing_slip`, `display_section`, `pos_search`) VALUES
(1, 'Betten Courts', '20241212020142.jpeg', 0, '4', NULL, NULL, 'all', 'yes', 'd-m-Y', 'www.linkintechnology.com', 'standard', NULL, 1, 'default.css', NULL, '2018-07-06 06:13:11', '2025-02-13 14:12:01', 'prefix', NULL, 0, 'Betten Courts', '112-271-298', NULL, '[\"category\"]', 1);

-- --------------------------------------------------------

--
-- Table structure for table `gift_cards`
--

CREATE TABLE `gift_cards` (
  `id` int(10) UNSIGNED NOT NULL,
  `card_no` varchar(191) NOT NULL,
  `amount` double NOT NULL,
  `expense` double NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `expired_date` date DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gift_card_recharges`
--

CREATE TABLE `gift_card_recharges` (
  `id` int(10) UNSIGNED NOT NULL,
  `gift_card_id` int(11) NOT NULL,
  `amount` double NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `holidays`
--

CREATE TABLE `holidays` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `from_date` date NOT NULL,
  `to_date` date NOT NULL,
  `note` text DEFAULT NULL,
  `is_approved` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hrm_settings`
--

CREATE TABLE `hrm_settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `beginning_in` varchar(255) NOT NULL,
  `shift` varchar(255) NOT NULL,
  `checkin` varchar(191) NOT NULL,
  `checkout` varchar(191) NOT NULL,
  `ending_out` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `hrm_settings`
--

INSERT INTO `hrm_settings` (`id`, `beginning_in`, `shift`, `checkin`, `checkout`, `ending_out`, `created_at`, `updated_at`) VALUES
(1, '2:05pm', 'Testing Shift', '2:10pm', '2:12pm', '2:13pm', '2024-10-07 09:01:29', '2024-10-07 09:11:51');

-- --------------------------------------------------------

--
-- Table structure for table `incomes`
--

CREATE TABLE `incomes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `reference_no` varchar(255) NOT NULL,
  `income_category_id` int(11) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `cash_register_id` int(11) DEFAULT NULL,
  `amount` double NOT NULL,
  `note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `income_categories`
--

CREATE TABLE `income_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`id`, `code`, `created_at`, `updated_at`) VALUES
(1, 'en', '2018-07-07 22:59:17', '2019-12-24 17:34:20');

-- --------------------------------------------------------

--
-- Table structure for table `mail_settings`
--

CREATE TABLE `mail_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `driver` varchar(191) NOT NULL,
  `host` varchar(191) NOT NULL,
  `port` varchar(191) NOT NULL,
  `from_address` varchar(191) NOT NULL,
  `from_name` varchar(191) NOT NULL,
  `username` varchar(191) NOT NULL,
  `password` varchar(191) NOT NULL,
  `encryption` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `mail_settings`
--

INSERT INTO `mail_settings` (`id`, `driver`, `host`, `port`, `from_address`, `from_name`, `username`, `password`, `encryption`, `created_at`, `updated_at`) VALUES
(1, 'smtp', 'mail.linkintechnology.com', '465', '_mainaccount@linkintechnology.com', 'Betten Courts', '_mainaccount@linkintechnology.com', 'i!FFDh2ub1F79!', 'tls', '2024-09-21 11:10:41', '2024-11-28 13:48:24');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2018_02_17_060412_create_categories_table', 1),
(4, '2018_02_20_035727_create_brands_table', 1),
(5, '2018_02_25_100635_create_suppliers_table', 1),
(6, '2018_02_27_101619_create_warehouse_table', 1),
(7, '2018_03_03_040448_create_units_table', 1),
(8, '2018_03_04_041317_create_taxes_table', 1),
(9, '2018_03_10_061915_create_customer_groups_table', 1),
(10, '2018_03_10_090534_create_customers_table', 1),
(11, '2018_03_11_095547_create_billers_table', 1),
(12, '2018_04_05_054401_create_products_table', 1),
(13, '2018_04_06_133606_create_purchases_table', 1),
(14, '2018_04_06_154600_create_product_purchases_table', 1),
(15, '2018_04_06_154915_create_product_warhouse_table', 1),
(16, '2018_04_10_085927_create_sales_table', 1),
(17, '2018_04_10_090133_create_product_sales_table', 1),
(18, '2018_04_10_090254_create_payments_table', 1),
(19, '2018_04_10_090341_create_payment_with_cheque_table', 1),
(20, '2018_04_10_090509_create_payment_with_credit_card_table', 1),
(21, '2018_04_13_121436_create_quotation_table', 1),
(22, '2018_04_13_122324_create_product_quotation_table', 1),
(23, '2018_04_14_121802_create_transfers_table', 1),
(24, '2018_04_14_121913_create_product_transfer_table', 1),
(25, '2018_05_13_082847_add_payment_id_and_change_sale_id_to_payments_table', 2),
(26, '2018_05_13_090906_change_customer_id_to_payment_with_credit_card_table', 3),
(27, '2018_05_20_054532_create_adjustments_table', 4),
(28, '2018_05_20_054859_create_product_adjustments_table', 4),
(29, '2018_05_21_163419_create_returns_table', 5),
(30, '2018_05_21_163443_create_product_returns_table', 5),
(31, '2018_06_02_050905_create_roles_table', 6),
(32, '2018_06_02_073430_add_columns_to_users_table', 7),
(33, '2018_06_03_053738_create_permission_tables', 8),
(36, '2018_06_21_063736_create_pos_setting_table', 9),
(37, '2018_06_21_094155_add_user_id_to_sales_table', 10),
(38, '2018_06_21_101529_add_user_id_to_purchases_table', 11),
(39, '2018_06_21_103512_add_user_id_to_transfers_table', 12),
(40, '2018_06_23_061058_add_user_id_to_quotations_table', 13),
(41, '2018_06_23_082427_add_is_deleted_to_users_table', 14),
(42, '2018_06_25_043308_change_email_to_users_table', 15),
(43, '2018_07_06_115449_create_general_settings_table', 16),
(44, '2018_07_08_043944_create_languages_table', 17),
(45, '2018_07_11_102144_add_user_id_to_returns_table', 18),
(46, '2018_07_11_102334_add_user_id_to_payments_table', 18),
(47, '2018_07_22_130541_add_digital_to_products_table', 19),
(49, '2018_07_24_154250_create_deliveries_table', 20),
(50, '2018_08_16_053336_create_expense_categories_table', 21),
(51, '2018_08_17_115415_create_expenses_table', 22),
(55, '2018_08_18_050418_create_gift_cards_table', 23),
(56, '2018_08_19_063119_create_payment_with_gift_card_table', 24),
(57, '2018_08_25_042333_create_gift_card_recharges_table', 25),
(58, '2018_08_25_101354_add_deposit_expense_to_customers_table', 26),
(59, '2018_08_26_043801_create_deposits_table', 27),
(60, '2018_09_02_044042_add_keybord_active_to_pos_setting_table', 28),
(61, '2018_09_09_092713_create_payment_with_paypal_table', 29),
(62, '2018_09_10_051254_add_currency_to_general_settings_table', 30),
(63, '2018_10_22_084118_add_biller_and_store_id_to_users_table', 31),
(65, '2018_10_26_034927_create_coupons_table', 32),
(66, '2018_10_27_090857_add_coupon_to_sales_table', 33),
(67, '2018_11_07_070155_add_currency_position_to_general_settings_table', 34),
(68, '2018_11_19_094650_add_combo_to_products_table', 35),
(69, '2018_12_09_043712_create_accounts_table', 36),
(70, '2018_12_17_112253_add_is_default_to_accounts_table', 37),
(71, '2018_12_19_103941_add_account_id_to_payments_table', 38),
(72, '2018_12_20_065900_add_account_id_to_expenses_table', 39),
(73, '2018_12_20_082753_add_account_id_to_returns_table', 40),
(74, '2018_12_26_064330_create_return_purchases_table', 41),
(75, '2018_12_26_144210_create_purchase_product_return_table', 42),
(76, '2018_12_26_144708_create_purchase_product_return_table', 43),
(77, '2018_12_27_110018_create_departments_table', 44),
(78, '2018_12_30_054844_create_employees_table', 45),
(79, '2018_12_31_125210_create_payrolls_table', 46),
(80, '2018_12_31_150446_add_department_id_to_employees_table', 47),
(81, '2019_01_01_062708_add_user_id_to_expenses_table', 48),
(82, '2019_01_02_075644_create_hrm_settings_table', 49),
(83, '2019_01_02_090334_create_attendances_table', 50),
(84, '2019_01_27_160956_add_three_columns_to_general_settings_table', 51),
(85, '2019_02_15_183303_create_stock_counts_table', 52),
(86, '2019_02_17_101604_add_is_adjusted_to_stock_counts_table', 53),
(87, '2019_04_13_101707_add_tax_no_to_customers_table', 54),
(89, '2019_10_14_111455_create_holidays_table', 55),
(90, '2019_11_13_145619_add_is_variant_to_products_table', 56),
(91, '2019_11_13_150206_create_product_variants_table', 57),
(92, '2019_11_13_153828_create_variants_table', 57),
(93, '2019_11_25_134041_add_qty_to_product_variants_table', 58),
(94, '2019_11_25_134922_add_variant_id_to_product_purchases_table', 58),
(95, '2019_11_25_145341_add_variant_id_to_product_warehouse_table', 58),
(96, '2019_11_29_182201_add_variant_id_to_product_sales_table', 59),
(97, '2019_12_04_121311_add_variant_id_to_product_quotation_table', 60),
(98, '2019_12_05_123802_add_variant_id_to_product_transfer_table', 61),
(100, '2019_12_08_114954_add_variant_id_to_product_returns_table', 62),
(101, '2019_12_08_203146_add_variant_id_to_purchase_product_return_table', 63),
(102, '2020_02_28_103340_create_money_transfers_table', 64),
(103, '2020_07_01_193151_add_image_to_categories_table', 65),
(105, '2020_09_26_130426_add_user_id_to_deliveries_table', 66),
(107, '2020_10_11_125457_create_cash_registers_table', 67),
(108, '2020_10_13_155019_add_cash_register_id_to_sales_table', 68),
(109, '2020_10_13_172624_add_cash_register_id_to_returns_table', 69),
(110, '2020_10_17_212338_add_cash_register_id_to_payments_table', 70),
(111, '2020_10_18_124200_add_cash_register_id_to_expenses_table', 71),
(112, '2020_10_21_121632_add_developed_by_to_general_settings_table', 72),
(113, '2019_08_19_000000_create_failed_jobs_table', 73),
(114, '2020_10_30_135557_create_notifications_table', 73),
(115, '2020_11_01_044954_create_currencies_table', 74),
(116, '2020_11_01_140736_add_price_to_product_warehouse_table', 75),
(117, '2020_11_02_050633_add_is_diff_price_to_products_table', 76),
(118, '2020_11_09_055222_add_user_id_to_customers_table', 77),
(119, '2020_11_17_054806_add_invoice_format_to_general_settings_table', 78),
(120, '2021_02_10_074859_add_variant_id_to_product_adjustments_table', 79),
(121, '2021_03_07_093606_create_product_batches_table', 80),
(122, '2021_03_07_093759_add_product_batch_id_to_product_warehouse_table', 80),
(123, '2021_03_07_093900_add_product_batch_id_to_product_purchases_table', 80),
(124, '2021_03_11_132603_add_product_batch_id_to_product_sales_table', 81),
(127, '2021_03_25_125421_add_is_batch_to_products_table', 82),
(128, '2021_05_19_120127_add_product_batch_id_to_product_returns_table', 82),
(130, '2021_05_22_105611_add_product_batch_id_to_purchase_product_return_table', 83),
(131, '2021_05_23_124848_add_product_batch_id_to_product_transfer_table', 84),
(132, '2021_05_26_153106_add_product_batch_id_to_product_quotation_table', 85),
(133, '2021_06_08_213007_create_reward_point_settings_table', 86),
(134, '2021_06_16_104155_add_points_to_customers_table', 87),
(135, '2021_06_17_101057_add_used_points_to_payments_table', 88),
(136, '2021_07_06_132716_add_variant_list_to_products_table', 89),
(137, '2021_09_27_161141_add_is_imei_to_products_table', 90),
(138, '2021_09_28_170052_add_imei_number_to_product_warehouse_table', 91),
(139, '2021_09_28_170126_add_imei_number_to_product_purchases_table', 91),
(140, '2021_10_03_170652_add_imei_number_to_product_sales_table', 92),
(141, '2021_10_10_145214_add_imei_number_to_product_returns_table', 93),
(142, '2021_10_11_104504_add_imei_number_to_product_transfer_table', 94),
(143, '2021_10_12_160107_add_imei_number_to_purchase_product_return_table', 95),
(144, '2021_10_12_205146_add_is_rtl_to_general_settings_table', 96),
(145, '2021_10_23_142451_add_is_approve_to_payments_table', 97),
(146, '2022_01_13_191242_create_discount_plans_table', 97),
(147, '2022_01_14_174318_create_discount_plan_customers_table', 97),
(148, '2022_01_14_202439_create_discounts_table', 98),
(149, '2022_01_16_153506_create_discount_plan_discounts_table', 98),
(150, '2022_02_05_174210_add_order_discount_type_and_value_to_sales_table', 99),
(154, '2022_05_26_195506_add_daily_sale_objective_to_products_table', 100),
(155, '2022_05_28_104209_create_dso_alerts_table', 101),
(156, '2022_06_01_112100_add_is_embeded_to_products_table', 102),
(157, '2022_06_14_130505_add_sale_id_to_returns_table', 103),
(159, '2022_07_19_115504_add_variant_data_to_products_table', 104),
(160, '2022_07_25_194300_add_additional_cost_to_product_variants_table', 104),
(161, '2022_09_04_195610_add_purchase_id_to_return_purchases_table', 105),
(162, '2023_01_18_123842_alter_table_pos_setting', 106),
(164, '2023_01_18_125040_alter_table_general_settings', 107),
(165, '2023_01_18_133701_alter_table_pos_setting', 108),
(166, '2023_01_25_145309_add_expiry_date_to_general_settings_table', 109),
(167, '2023_02_23_125656_alter_table_sales', 110),
(168, '2023_02_26_124100_add_package_id_to_general_settings_table', 111),
(169, '2023_03_04_120325_create_custom_fields_table', 111),
(170, '2023_03_22_174352_add_currency_id_and_exchange_rate_to_returns_table', 112),
(171, '2023_03_27_114320_add_currency_id_and_exchange_rate_to_purchases_table', 113),
(172, '2023_03_27_132747_add_currency_id_and_exchange_rate_to_return_purchases_table', 114),
(173, '2023_04_25_150236_create_mail_settings_table', 115),
(174, '2023_05_13_125424_add_zatca_to_general_settings_table', 116),
(175, '2023_05_28_155540_create_tables_table', 117),
(176, '2023_05_29_115039_add_is_table_to_pos_setting_table', 117),
(177, '2023_05_29_115301_add_table_id_to_sales_table', 117),
(178, '2023_05_31_165049_add_queue_no_to_sales_table', 117),
(190, '2023_08_12_124016_add_staff_id_to_employees_table', 121),
(192, '2023_07_23_160254_create_couriers_table', 122),
(193, '2023_07_23_174343_add_courier_id_to_deliveries_table', 122),
(194, '2023_08_14_142608_add_is_active_to_currencies_table', 122),
(195, '2023_08_24_130203_change_columns_to_attendances_table', 122),
(196, '2023_09_10_134503_add_without_stock_to_general_settings_table', 123),
(204, '2023_09_26_211542_add_modules_to_general_settings_table', 125),
(217, '2023_10_15_124306_add_return_qty_to_product_sales_table', 129),
(219, '2023_12_03_235606_crete_external_services_table', 131),
(221, '2023_03_14_174658_add_subscription_type_to_general_setting_table', 130),
(222, '2024_02_04_131826_add_unit_cost_to_product_adjustments_table', 132),
(223, '2024_02_13_173126_change_modules_to_general_settings_table', 133),
(224, '2024_05_02_114215_add_payment_receiver_to_payments', 134),
(225, '2024_05_06_132553_create_sms_templates_table', 135),
(226, '2024_05_07_102225_add_send_sms_to_pos_setting_table', 135),
(227, '2024_05_07_132625_add_is_default_to_sms_templates_table', 135),
(228, '2024_05_08_112211_change_address_and_city_field_to_nullable_in_customers_table', 135),
(229, '2024_05_08_151050_add_is_default_ecommerce_columne_to_sms_templates_table', 135),
(230, '2024_05_20_182757_add_wholesale_price_to_products_table', 136),
(231, '2024_05_21_170500_add_is_sent_to_transfers_table', 137),
(232, '2023_02_05_132001_add_change_to_payments_table', 138),
(233, '2024_06_04_225113_create_income_categories_table', 138),
(234, '2024_06_04_225128_create_incomes_table', 138),
(235, '2024_06_29_131917_add_is_packing_slip_to_general_settings_table', 138),
(236, '2024_07_05_192531_create_packing_slips_table', 138),
(237, '2024_07_05_193002_create_packing_slip_products_table', 138),
(238, '2024_07_05_194501_add_is_packing_and_delivered_to_product_sales_table', 138),
(239, '2024_07_14_122245_add_delivery_id_to_packing_slips_table', 138),
(240, '2024_07_14_122415_add_variant_id_to_packing_slip_products_table', 138),
(241, '2024_07_14_122519_add_packing_slip_ids_to_deliveries_table', 138),
(242, '2024_07_16_125908_create_challans_table', 138);

-- --------------------------------------------------------

--
-- Table structure for table `money_transfers`
--

CREATE TABLE `money_transfers` (
  `id` int(10) UNSIGNED NOT NULL,
  `reference_no` varchar(191) NOT NULL,
  `from_account_id` int(11) NOT NULL,
  `to_account_id` int(11) NOT NULL,
  `amount` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` char(36) NOT NULL,
  `type` varchar(191) NOT NULL,
  `notifiable_type` varchar(191) NOT NULL,
  `notifiable_id` bigint(20) UNSIGNED NOT NULL,
  `data` text NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `out_of_shifts`
--

CREATE TABLE `out_of_shifts` (
  `id` int(11) NOT NULL,
  `employee_id` int(11) DEFAULT NULL,
  `type` int(11) NOT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `packing_slips`
--

CREATE TABLE `packing_slips` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `reference_no` varchar(255) NOT NULL,
  `sale_id` int(11) NOT NULL,
  `delivery_id` int(11) DEFAULT NULL,
  `amount` double NOT NULL,
  `status` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `packing_slip_products`
--

CREATE TABLE `packing_slip_products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `packing_slip_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `variant_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) NOT NULL,
  `token` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
('ashfaqdev.php@gmail.com', '$2y$10$plxHOMxChJlHd9t6FQkoN.4dXMdtZ9fE5tXBBItzjxB1R5JF9OpbO', '2023-07-15 11:31:30');

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` int(10) UNSIGNED NOT NULL,
  `payment_reference` varchar(191) NOT NULL,
  `user_id` int(11) NOT NULL,
  `purchase_id` int(11) DEFAULT NULL,
  `sale_id` int(11) DEFAULT NULL,
  `cash_register_id` int(11) DEFAULT NULL,
  `account_id` int(11) NOT NULL,
  `payment_receiver` varchar(255) DEFAULT NULL,
  `amount` double NOT NULL,
  `used_points` double DEFAULT NULL,
  `change` double DEFAULT NULL,
  `paying_method` varchar(191) NOT NULL,
  `payment_note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`id`, `payment_reference`, `user_id`, `purchase_id`, `sale_id`, `cash_register_id`, `account_id`, `payment_receiver`, `amount`, `used_points`, `change`, `paying_method`, `payment_note`, `created_at`, `updated_at`) VALUES
(1, 'ppr-20241212-051114', 1, 10, NULL, NULL, 1, NULL, 25000, NULL, 0, 'Cash', NULL, '2024-12-12 16:11:14', '2024-12-12 16:11:14'),
(2, 'spr-20241212-052005', 1, NULL, 1, 8, 1, NULL, 360, NULL, 0, 'Credit Card', NULL, '2024-12-12 16:20:05', '2024-12-12 16:20:05'),
(3, 'spr-20241212-053630', 1, NULL, 2, 8, 1, NULL, 360, NULL, 0, 'Credit Card', NULL, '2024-12-12 16:36:30', '2024-12-12 16:36:30'),
(4, 'spr-20241212-053859', 1, NULL, 3, 8, 1, NULL, 360, NULL, 0, 'Cash', NULL, '2024-12-12 16:38:59', '2024-12-12 16:38:59'),
(5, 'spr-20241212-081341', 1, NULL, 4, 8, 1, NULL, 360, NULL, 0, 'Cash', NULL, '2024-12-12 19:13:41', '2024-12-12 19:13:41'),
(6, 'spr-20241215-055538', 1, NULL, 4, 8, 1, NULL, 19, NULL, 81, 'Cash', NULL, '2024-12-15 04:55:38', '2024-12-15 04:55:38'),
(7, 'spr-20250126-070827', 14, NULL, 5, NULL, 1, NULL, 360, NULL, 0, 'Cash', NULL, '2025-01-26 18:08:27', '2025-01-26 18:08:27'),
(8, 'spr-20250126-070845', 14, NULL, 6, NULL, 1, NULL, 360, NULL, 0, 'Cash', NULL, '2025-01-26 18:08:45', '2025-01-26 18:08:45'),
(9, 'spr-20250126-071053', 14, NULL, 7, NULL, 1, NULL, 360, NULL, 0, 'Cash', NULL, '2025-01-26 18:10:53', '2025-01-26 18:10:53'),
(10, 'spr-20250126-071347', 1, NULL, 8, 8, 1, NULL, 360, NULL, 0, 'Cash', NULL, '2025-01-26 18:13:47', '2025-01-26 18:13:47'),
(11, 'spr-20250127-042629', 1, NULL, 9, 8, 1, NULL, 360, NULL, 0, 'Cash', NULL, '2025-01-27 03:26:29', '2025-01-27 03:26:29'),
(12, 'spr-20250127-042647', 1, NULL, 10, 8, 1, NULL, 1080, NULL, 0, 'Credit Card', NULL, '2025-01-27 03:26:47', '2025-01-27 03:26:47'),
(13, 'spr-20250127-042738', 1, NULL, 11, 8, 1, NULL, 3600, NULL, 0, 'Cash', NULL, '2025-01-27 03:27:38', '2025-01-27 03:27:38'),
(14, 'spr-20250127-042959', 1, NULL, 12, 8, 1, NULL, 1080, NULL, 0, 'Cash', NULL, '2025-01-27 03:29:59', '2025-01-27 03:29:59'),
(15, 'spr-20250127-043126', 1, NULL, 13, 8, 1, NULL, 1080, NULL, 0, 'Cash', NULL, '2025-01-27 03:31:26', '2025-01-27 03:31:26'),
(16, 'spr-20250127-043150', 1, NULL, 14, 8, 1, NULL, 18000, NULL, 0, 'Credit Card', NULL, '2025-01-27 03:31:50', '2025-01-27 03:31:50'),
(17, 'spr-20250127-043213', 1, NULL, 15, 8, 1, NULL, 360, NULL, 0, 'Cash', NULL, '2025-01-27 03:32:13', '2025-01-27 03:32:13'),
(18, 'spr-20250127-043217', 1, NULL, 16, 8, 1, NULL, 3600, NULL, 0, 'Cash', NULL, '2025-01-27 03:32:17', '2025-01-27 03:32:17'),
(19, 'spr-20250127-060238', 14, NULL, 17, NULL, 1, NULL, 360, NULL, 0, 'Cash', NULL, '2025-01-27 05:02:38', '2025-01-27 05:02:38'),
(20, 'spr-20250212-122356', 1, NULL, 18, 8, 1, NULL, 1080, NULL, 0, 'Credit Card', NULL, '2025-02-12 07:23:56', '2025-02-12 07:23:56'),
(21, 'ppr-20250213-122545', 1, 11, NULL, NULL, 1, NULL, 8000000, NULL, 0, 'Cash', NULL, '2025-02-13 07:25:45', '2025-02-13 07:25:45'),
(22, 'spr-20250213-062527', 1, NULL, 19, 8, 1, NULL, 1000, NULL, 0, 'Credit Card', NULL, '2025-02-13 13:25:27', '2025-02-13 13:25:27'),
(23, 'ppr-20250213-080033', 1, 14, NULL, NULL, 1, NULL, 20000, NULL, 0, 'Cash', NULL, '2025-02-13 15:00:33', '2025-02-13 15:00:33'),
(24, 'ppr-20250213-080045', 1, 12, NULL, NULL, 1, NULL, 700000, NULL, 0, 'Cash', NULL, '2025-02-13 15:00:45', '2025-02-13 15:00:45'),
(25, 'ppr-20250213-080057', 1, 15, NULL, NULL, 1, NULL, 5000, NULL, 0, 'Cash', NULL, '2025-02-13 15:00:57', '2025-02-13 15:00:57'),
(26, 'spr-20250214-054615', 1, NULL, 23, 8, 1, NULL, 72236, NULL, 0, 'Credit Card', NULL, '2025-02-14 12:46:15', '2025-02-14 12:46:15'),
(27, 'spr-20250214-054827', 1, NULL, 24, 8, 1, NULL, 50, NULL, 0, 'Credit Card', NULL, '2025-02-14 12:48:27', '2025-02-14 12:48:27'),
(28, 'spr-20250214-055509', 1, NULL, 25, 8, 1, NULL, 74164, NULL, 0, 'Credit Card', NULL, '2025-02-14 12:55:09', '2025-02-14 12:55:09'),
(29, 'spr-20250214-055941', 1, NULL, 26, 8, 1, NULL, 17670.52, NULL, 0, 'Cheque', NULL, '2025-02-14 12:59:41', '2025-02-14 12:59:41'),
(30, 'spr-20250214-060210', 1, NULL, 27, 8, 1, NULL, 50, NULL, 0, 'Credit Card', NULL, '2025-02-14 13:02:10', '2025-02-14 13:02:10'),
(31, 'spr-20250214-060242', 1, NULL, 28, 8, 1, NULL, 3276, NULL, 0, 'Cash', NULL, '2025-02-14 13:02:42', '2025-02-14 13:02:42'),
(32, 'spr-20250214-060523', 1, NULL, 29, 8, 1, NULL, 45, NULL, 0, 'Cash', NULL, '2025-02-14 13:05:23', '2025-02-14 13:05:23'),
(33, 'spr-20250215-041847', 1, NULL, 30, 8, 1, NULL, 85850, NULL, 0, 'Credit Card', NULL, '2025-02-15 11:18:47', '2025-02-15 11:18:47'),
(34, 'spr-20250217-093949', 1, NULL, 31, 8, 1, NULL, 38892, NULL, 0, 'Credit Card', NULL, '2025-02-17 04:39:49', '2025-02-17 04:39:49'),
(35, 'spr-20250217-094110', 1, NULL, 4, 8, 1, NULL, -19, NULL, 0, 'Cash', NULL, '2025-02-17 04:41:10', '2025-02-17 04:41:10'),
(36, 'spr-20250217-094110', 1, NULL, 23, 8, 1, NULL, -0.19999999999709, NULL, 0, 'Cash', NULL, '2025-02-17 04:41:10', '2025-02-17 04:41:10'),
(37, 'spr-20250217-094111', 1, NULL, 25, 8, 1, NULL, -0.39999999999418, NULL, 0, 'Cash', NULL, '2025-02-17 04:41:11', '2025-02-17 04:41:11'),
(38, 'spr-20250217-104259', 1, NULL, 32, 8, 1, NULL, 1449.08, NULL, 0, 'Credit Card', NULL, '2025-02-17 05:42:59', '2025-02-17 05:42:59'),
(39, 'spr-20250217-114351', 1, NULL, 33, 8, 1, NULL, 380130.29, NULL, 0, 'Credit Card', NULL, '2025-02-17 06:43:51', '2025-02-17 06:43:51'),
(40, 'spr-20250217-114937', 1, NULL, 34, 8, 1, NULL, 1610, NULL, 0, 'Cheque', NULL, '2025-02-17 06:49:37', '2025-02-17 06:49:37'),
(41, 'spr-20250217-120401', 1, NULL, 35, 8, 1, NULL, 1610, 6, 0, 'Points', NULL, '2025-02-17 07:04:01', '2025-02-17 07:04:01');

-- --------------------------------------------------------

--
-- Table structure for table `payment_with_cheque`
--

CREATE TABLE `payment_with_cheque` (
  `id` int(10) UNSIGNED NOT NULL,
  `payment_id` int(11) NOT NULL,
  `cheque_no` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payment_with_cheque`
--

INSERT INTO `payment_with_cheque` (`id`, `payment_id`, `cheque_no`, `created_at`, `updated_at`) VALUES
(1, 29, '44455211133366422', '2025-02-14 12:59:42', '2025-02-14 12:59:42'),
(2, 40, '44455211133366422', '2025-02-17 06:49:37', '2025-02-17 06:49:37');

-- --------------------------------------------------------

--
-- Table structure for table `payment_with_credit_card`
--

CREATE TABLE `payment_with_credit_card` (
  `id` int(10) UNSIGNED NOT NULL,
  `payment_id` int(11) NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `customer_stripe_id` varchar(191) DEFAULT NULL,
  `charge_id` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment_with_gift_card`
--

CREATE TABLE `payment_with_gift_card` (
  `id` int(10) UNSIGNED NOT NULL,
  `payment_id` int(11) NOT NULL,
  `gift_card_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment_with_paypal`
--

CREATE TABLE `payment_with_paypal` (
  `id` int(10) UNSIGNED NOT NULL,
  `payment_id` int(11) NOT NULL,
  `transaction_id` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payrolls`
--

CREATE TABLE `payrolls` (
  `id` int(10) UNSIGNED NOT NULL,
  `reference_no` varchar(191) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `amount` double NOT NULL,
  `paying_method` varchar(191) NOT NULL,
  `note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `guard_name` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(4, 'products-edit', 'web', '2018-06-03 01:00:09', '2018-06-03 01:00:09'),
(5, 'products-delete', 'web', '2018-06-03 22:54:22', '2018-06-03 22:54:22'),
(6, 'products-add', 'web', '2018-06-04 00:34:14', '2018-06-04 00:34:14'),
(7, 'products-index', 'web', '2018-06-04 03:34:27', '2018-06-04 03:34:27'),
(8, 'purchases-index', 'web', '2018-06-04 08:03:19', '2018-06-04 08:03:19'),
(9, 'purchases-add', 'web', '2018-06-04 08:12:25', '2018-06-04 08:12:25'),
(10, 'purchases-edit', 'web', '2018-06-04 09:47:36', '2018-06-04 09:47:36'),
(11, 'purchases-delete', 'web', '2018-06-04 09:47:36', '2018-06-04 09:47:36'),
(12, 'sales-index', 'web', '2018-06-04 10:49:08', '2018-06-04 10:49:08'),
(13, 'sales-add', 'web', '2018-06-04 10:49:52', '2018-06-04 10:49:52'),
(14, 'sales-edit', 'web', '2018-06-04 10:49:52', '2018-06-04 10:49:52'),
(15, 'sales-delete', 'web', '2018-06-04 10:49:53', '2018-06-04 10:49:53'),
(20, 'transfers-index', 'web', '2018-06-04 22:30:03', '2018-06-04 22:30:03'),
(21, 'transfers-add', 'web', '2018-06-04 22:30:03', '2018-06-04 22:30:03'),
(22, 'transfers-edit', 'web', '2018-06-04 22:30:03', '2018-06-04 22:30:03'),
(23, 'transfers-delete', 'web', '2018-06-04 22:30:03', '2018-06-04 22:30:03'),
(24, 'returns-index', 'web', '2018-06-04 22:50:24', '2018-06-04 22:50:24'),
(25, 'returns-add', 'web', '2018-06-04 22:50:24', '2018-06-04 22:50:24'),
(26, 'returns-edit', 'web', '2018-06-04 22:50:25', '2018-06-04 22:50:25'),
(27, 'returns-delete', 'web', '2018-06-04 22:50:25', '2018-06-04 22:50:25'),
(28, 'customers-index', 'web', '2018-06-04 23:15:54', '2018-06-04 23:15:54'),
(29, 'customers-add', 'web', '2018-06-04 23:15:55', '2018-06-04 23:15:55'),
(30, 'customers-edit', 'web', '2018-06-04 23:15:55', '2018-06-04 23:15:55'),
(31, 'customers-delete', 'web', '2018-06-04 23:15:55', '2018-06-04 23:15:55'),
(32, 'suppliers-index', 'web', '2018-06-04 23:40:12', '2018-06-04 23:40:12'),
(33, 'suppliers-add', 'web', '2018-06-04 23:40:12', '2018-06-04 23:40:12'),
(34, 'suppliers-edit', 'web', '2018-06-04 23:40:12', '2018-06-04 23:40:12'),
(35, 'suppliers-delete', 'web', '2018-06-04 23:40:12', '2018-06-04 23:40:12'),
(36, 'product-report', 'web', '2018-06-24 23:05:33', '2018-06-24 23:05:33'),
(37, 'purchase-report', 'web', '2018-06-24 23:24:56', '2018-06-24 23:24:56'),
(38, 'sale-report', 'web', '2018-06-24 23:33:13', '2018-06-24 23:33:13'),
(39, 'customer-report', 'web', '2018-06-24 23:36:51', '2018-06-24 23:36:51'),
(40, 'due-report', 'web', '2018-06-24 23:39:52', '2018-06-24 23:39:52'),
(41, 'users-index', 'web', '2018-06-25 00:00:10', '2018-06-25 00:00:10'),
(42, 'users-add', 'web', '2018-06-25 00:00:10', '2018-06-25 00:00:10'),
(43, 'users-edit', 'web', '2018-06-25 00:01:30', '2018-06-25 00:01:30'),
(44, 'users-delete', 'web', '2018-06-25 00:01:30', '2018-06-25 00:01:30'),
(45, 'profit-loss', 'web', '2018-07-14 21:50:05', '2018-07-14 21:50:05'),
(46, 'best-seller', 'web', '2018-07-14 22:01:38', '2018-07-14 22:01:38'),
(47, 'daily-sale', 'web', '2018-07-14 22:24:21', '2018-07-14 22:24:21'),
(48, 'monthly-sale', 'web', '2018-07-14 22:30:41', '2018-07-14 22:30:41'),
(49, 'daily-purchase', 'web', '2018-07-14 22:36:46', '2018-07-14 22:36:46'),
(50, 'monthly-purchase', 'web', '2018-07-14 22:48:17', '2018-07-14 22:48:17'),
(51, 'payment-report', 'web', '2018-07-14 23:10:41', '2018-07-14 23:10:41'),
(52, 'warehouse-stock-report', 'web', '2018-07-14 23:16:55', '2018-07-14 23:16:55'),
(53, 'product-qty-alert', 'web', '2018-07-14 23:33:21', '2018-07-14 23:33:21'),
(54, 'supplier-report', 'web', '2018-07-30 03:00:01', '2018-07-30 03:00:01'),
(55, 'expenses-index', 'web', '2018-09-05 01:07:10', '2018-09-05 01:07:10'),
(56, 'expenses-add', 'web', '2018-09-05 01:07:10', '2018-09-05 01:07:10'),
(57, 'expenses-edit', 'web', '2018-09-05 01:07:10', '2018-09-05 01:07:10'),
(58, 'expenses-delete', 'web', '2018-09-05 01:07:11', '2018-09-05 01:07:11'),
(59, 'general_setting', 'web', '2018-10-19 23:10:04', '2018-10-19 23:10:04'),
(60, 'mail_setting', 'web', '2018-10-19 23:10:04', '2018-10-19 23:10:04'),
(61, 'pos_setting', 'web', '2018-10-19 23:10:04', '2018-10-19 23:10:04'),
(62, 'hrm_setting', 'web', '2019-01-02 10:30:23', '2019-01-02 10:30:23'),
(63, 'purchase-return-index', 'web', '2019-01-02 21:45:14', '2019-01-02 21:45:14'),
(64, 'purchase-return-add', 'web', '2019-01-02 21:45:14', '2019-01-02 21:45:14'),
(65, 'purchase-return-edit', 'web', '2019-01-02 21:45:14', '2019-01-02 21:45:14'),
(66, 'purchase-return-delete', 'web', '2019-01-02 21:45:14', '2019-01-02 21:45:14'),
(67, 'account-index', 'web', '2019-01-02 22:06:13', '2019-01-02 22:06:13'),
(68, 'balance-sheet', 'web', '2019-01-02 22:06:14', '2019-01-02 22:06:14'),
(69, 'account-statement', 'web', '2019-01-02 22:06:14', '2019-01-02 22:06:14'),
(70, 'department', 'web', '2019-01-02 22:30:01', '2019-01-02 22:30:01'),
(71, 'attendance', 'web', '2019-01-02 22:30:01', '2019-01-02 22:30:01'),
(72, 'payroll', 'web', '2019-01-02 22:30:01', '2019-01-02 22:30:01'),
(73, 'employees-index', 'web', '2019-01-02 22:52:19', '2019-01-02 22:52:19'),
(74, 'employees-add', 'web', '2019-01-02 22:52:19', '2019-01-02 22:52:19'),
(75, 'employees-edit', 'web', '2019-01-02 22:52:19', '2019-01-02 22:52:19'),
(76, 'employees-delete', 'web', '2019-01-02 22:52:19', '2019-01-02 22:52:19'),
(77, 'user-report', 'web', '2019-01-16 06:48:18', '2019-01-16 06:48:18'),
(78, 'stock_count', 'web', '2019-02-17 10:32:01', '2019-02-17 10:32:01'),
(79, 'adjustment', 'web', '2019-02-17 10:32:02', '2019-02-17 10:32:02'),
(80, 'sms_setting', 'web', '2019-02-22 05:18:03', '2019-02-22 05:18:03'),
(81, 'create_sms', 'web', '2019-02-22 05:18:03', '2019-02-22 05:18:03'),
(82, 'print_barcode', 'web', '2019-03-07 05:02:19', '2019-03-07 05:02:19'),
(83, 'empty_database', 'web', '2019-03-07 05:02:19', '2019-03-07 05:02:19'),
(84, 'customer_group', 'web', '2019-03-07 05:37:15', '2019-03-07 05:37:15'),
(85, 'unit', 'web', '2019-03-07 05:37:15', '2019-03-07 05:37:15'),
(86, 'tax', 'web', '2019-03-07 05:37:15', '2019-03-07 05:37:15'),
(87, 'gift_card', 'web', '2019-03-07 06:29:38', '2019-03-07 06:29:38'),
(88, 'coupon', 'web', '2019-03-07 06:29:38', '2019-03-07 06:29:38'),
(89, 'holiday', 'web', '2019-10-19 08:57:15', '2019-10-19 08:57:15'),
(90, 'warehouse-report', 'web', '2019-10-22 06:00:23', '2019-10-22 06:00:23'),
(91, 'warehouse', 'web', '2020-02-26 06:47:32', '2020-02-26 06:47:32'),
(92, 'brand', 'web', '2020-02-26 06:59:59', '2020-02-26 06:59:59'),
(93, 'billers-index', 'web', '2020-02-26 07:11:15', '2020-02-26 07:11:15'),
(94, 'billers-add', 'web', '2020-02-26 07:11:15', '2020-02-26 07:11:15'),
(95, 'billers-edit', 'web', '2020-02-26 07:11:15', '2020-02-26 07:11:15'),
(96, 'billers-delete', 'web', '2020-02-26 07:11:15', '2020-02-26 07:11:15'),
(97, 'money-transfer', 'web', '2020-03-02 05:41:48', '2020-03-02 05:41:48'),
(98, 'category', 'web', '2020-07-13 12:13:16', '2020-07-13 12:13:16'),
(99, 'delivery', 'web', '2020-07-13 12:13:16', '2020-07-13 12:13:16'),
(100, 'send_notification', 'web', '2020-10-31 06:21:31', '2020-10-31 06:21:31'),
(101, 'today_sale', 'web', '2020-10-31 06:57:04', '2020-10-31 06:57:04'),
(102, 'today_profit', 'web', '2020-10-31 06:57:04', '2020-10-31 06:57:04'),
(103, 'currency', 'web', '2020-11-09 00:23:11', '2020-11-09 00:23:11'),
(104, 'backup_database', 'web', '2020-11-15 00:16:55', '2020-11-15 00:16:55'),
(105, 'reward_point_setting', 'web', '2021-06-27 04:34:42', '2021-06-27 04:34:42'),
(106, 'revenue_profit_summary', 'web', '2022-02-08 13:57:21', '2022-02-08 13:57:21'),
(107, 'cash_flow', 'web', '2022-02-08 13:57:22', '2022-02-08 13:57:22'),
(108, 'monthly_summary', 'web', '2022-02-08 13:57:22', '2022-02-08 13:57:22'),
(109, 'yearly_report', 'web', '2022-02-08 13:57:22', '2022-02-08 13:57:22'),
(110, 'discount_plan', 'web', '2022-02-16 09:12:26', '2022-02-16 09:12:26'),
(111, 'discount', 'web', '2022-02-16 09:12:38', '2022-02-16 09:12:38'),
(112, 'product-expiry-report', 'web', '2022-03-30 05:39:20', '2022-03-30 05:39:20'),
(113, 'purchase-payment-index', 'web', '2022-06-05 14:12:27', '2022-06-05 14:12:27'),
(114, 'purchase-payment-add', 'web', '2022-06-05 14:12:28', '2022-06-05 14:12:28'),
(115, 'purchase-payment-edit', 'web', '2022-06-05 14:12:28', '2022-06-05 14:12:28'),
(116, 'purchase-payment-delete', 'web', '2022-06-05 14:12:28', '2022-06-05 14:12:28'),
(117, 'sale-payment-index', 'web', '2022-06-05 14:12:28', '2022-06-05 14:12:28'),
(118, 'sale-payment-add', 'web', '2022-06-05 14:12:28', '2022-06-05 14:12:28'),
(119, 'sale-payment-edit', 'web', '2022-06-05 14:12:28', '2022-06-05 14:12:28'),
(120, 'sale-payment-delete', 'web', '2022-06-05 14:12:28', '2022-06-05 14:12:28'),
(121, 'all_notification', 'web', '2022-06-05 14:12:29', '2022-06-05 14:12:29'),
(122, 'sale-report-chart', 'web', '2022-06-05 14:12:29', '2022-06-05 14:12:29'),
(123, 'dso-report', 'web', '2022-06-05 14:12:29', '2022-06-05 14:12:29'),
(124, 'product_history', 'web', '2022-08-25 14:04:05', '2022-08-25 14:04:05'),
(125, 'supplier-due-report', 'web', '2022-08-31 09:46:33', '2022-08-31 09:46:33'),
(126, 'custom_field', 'web', '2023-05-02 07:41:35', '2023-05-02 07:41:35'),
(127, 'incomes-index', 'web', '2024-08-11 04:50:59', '2024-08-11 04:50:59'),
(128, 'incomes-add', 'web', '2024-08-11 04:50:59', '2024-08-11 04:50:59'),
(129, 'incomes-edit', 'web', '2024-08-11 04:50:59', '2024-08-11 04:50:59'),
(130, 'incomes-delete', 'web', '2024-08-11 04:50:59', '2024-08-11 04:50:59'),
(131, 'packing_slip_challan', 'web', '2024-08-11 04:51:00', '2024-08-11 04:51:00'),
(132, 'out_of_shift', 'web', '2024-11-14 05:57:28', NULL),
(133, 'zkteco_configuration', 'web', '2024-11-14 06:12:52', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `pos_setting`
--

CREATE TABLE `pos_setting` (
  `id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `biller_id` int(11) NOT NULL,
  `product_number` int(11) NOT NULL,
  `keybord_active` tinyint(1) NOT NULL,
  `is_table` tinyint(1) NOT NULL DEFAULT 0,
  `send_sms` tinyint(1) NOT NULL DEFAULT 0,
  `stripe_public_key` varchar(191) DEFAULT NULL,
  `stripe_secret_key` varchar(191) DEFAULT NULL,
  `paypal_live_api_username` varchar(191) DEFAULT NULL,
  `paypal_live_api_password` varchar(191) DEFAULT NULL,
  `paypal_live_api_secret` varchar(191) DEFAULT NULL,
  `payment_options` text DEFAULT NULL,
  `invoice_option` varchar(10) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pos_setting`
--

INSERT INTO `pos_setting` (`id`, `customer_id`, `warehouse_id`, `biller_id`, `product_number`, `keybord_active`, `is_table`, `send_sms`, `stripe_public_key`, `stripe_secret_key`, `paypal_live_api_username`, `paypal_live_api_password`, `paypal_live_api_secret`, `payment_options`, `invoice_option`, `created_at`, `updated_at`) VALUES
(1, 2, 1, 3, 3, 0, 0, 1, NULL, NULL, 'admin', 'admin', NULL, 'cash,card,cheque,deposit', 'thermal', '2018-09-02 03:17:04', '2024-12-12 10:51:03');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `code` varchar(191) NOT NULL,
  `type` varchar(191) NOT NULL,
  `barcode_symbology` varchar(191) NOT NULL,
  `brand_id` int(11) DEFAULT NULL,
  `category_id` int(11) NOT NULL,
  `unit_id` int(11) NOT NULL,
  `purchase_unit_id` int(11) NOT NULL,
  `sale_unit_id` int(11) NOT NULL,
  `cost` double NOT NULL,
  `price` double NOT NULL,
  `wholesale_price` double DEFAULT NULL,
  `qty` double DEFAULT NULL,
  `alert_quantity` double DEFAULT NULL,
  `daily_sale_objective` double DEFAULT NULL,
  `promotion` tinyint(4) DEFAULT NULL,
  `promotion_price` varchar(191) DEFAULT NULL,
  `starting_date` varchar(200) DEFAULT NULL,
  `last_date` date DEFAULT NULL,
  `tax_id` int(11) DEFAULT NULL,
  `tax_method` int(11) DEFAULT NULL,
  `image` longtext DEFAULT NULL,
  `file` varchar(191) DEFAULT NULL,
  `is_embeded` tinyint(1) DEFAULT NULL,
  `is_variant` tinyint(1) DEFAULT NULL,
  `is_batch` tinyint(1) DEFAULT NULL,
  `is_diffPrice` tinyint(1) DEFAULT NULL,
  `is_imei` tinyint(1) DEFAULT NULL,
  `featured` tinyint(4) DEFAULT NULL,
  `product_list` varchar(191) DEFAULT NULL,
  `variant_list` varchar(191) DEFAULT NULL,
  `qty_list` varchar(191) DEFAULT NULL,
  `price_list` varchar(191) DEFAULT NULL,
  `product_details` text DEFAULT NULL,
  `variant_option` text DEFAULT NULL,
  `variant_value` text DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `code`, `type`, `barcode_symbology`, `brand_id`, `category_id`, `unit_id`, `purchase_unit_id`, `sale_unit_id`, `cost`, `price`, `wholesale_price`, `qty`, `alert_quantity`, `daily_sale_objective`, `promotion`, `promotion_price`, `starting_date`, `last_date`, `tax_id`, `tax_method`, `image`, `file`, `is_embeded`, `is_variant`, `is_batch`, `is_diffPrice`, `is_imei`, `featured`, `product_list`, `variant_list`, `qty_list`, `price_list`, `product_details`, `variant_option`, `variant_value`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Burger', '1234457', 'standard', 'C128', 1, 1, 1, 1, 1, 50, 60, 50, 142, 10, 10, NULL, NULL, NULL, NULL, NULL, 1, '202409260726112.jpg,202409260726362.jpg,202409260727123.jpg', NULL, 1, NULL, NULL, 0, NULL, 1, NULL, NULL, NULL, NULL, '', NULL, NULL, 0, '2024-09-20 15:08:23', '2024-10-07 13:26:17'),
(2, 'Griffith Bright', '04028375', 'standard', 'C128', 1, 1, 1, 1, 1, 43, 59, 170, 10035, 899, 13, NULL, NULL, NULL, NULL, NULL, 1, '202409260725422.jpg', NULL, 0, NULL, 1, 0, 1, 1, NULL, NULL, NULL, NULL, '', NULL, NULL, 0, '2024-09-21 11:52:29', '2024-10-07 07:32:03'),
(21, 'demo', '38196001', 'standard', 'C128', NULL, 11, 1, 1, 1, 50, 60, 30, 497, 10, 10, NULL, NULL, NULL, NULL, NULL, 1, '202411170801182.png', NULL, 0, NULL, NULL, 0, NULL, 1, NULL, NULL, NULL, NULL, '', NULL, NULL, 0, '2024-11-17 18:50:08', '2024-11-18 11:35:03'),
(22, 'Greens &amp; Chicken', '87413239', 'standard', 'C128', NULL, 12, 1, 1, 1, 30, 50, 10, 9902, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '202502130437172.jpg', NULL, 0, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, '', NULL, NULL, 1, '2024-11-18 11:58:51', '2025-02-17 07:13:31'),
(24, 'Serv. Greens &amp; Chicken', '41257693', 'standard', 'C128', NULL, 12, 1, 1, 1, 1400, 1560, 1500, 303, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1, '2024-11-18 12:01:53', '2025-02-17 07:13:31'),
(25, 'Bora B.C', '30641240', 'standard', 'C128', NULL, 12, 1, 1, 1, 2200, 2460, 2400, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1, '2024-11-18 12:03:00', '2024-11-18 12:03:00'),
(26, 'Bora F.C', '12393986', 'standard', 'C128', NULL, 12, 1, 1, 1, 2300, 2500, 2400, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1, '2024-11-18 12:03:45', '2024-11-18 12:03:45'),
(27, 'Pumpkin B.C', '16650572', 'standard', 'C128', NULL, 12, 1, 1, 1, 2200, 2460, 2400, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1, '2024-11-18 12:04:36', '2024-11-18 12:04:36'),
(28, 'Pumpkin F.C', '14910733', 'standard', 'C128', NULL, 12, 1, 1, 1, 2300, 2500, 2400, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1, '2024-11-18 12:05:18', '2024-11-18 12:05:18'),
(29, 'Ochro B.C', '92073423', 'standard', 'C128', NULL, 12, 1, 1, 1, 2200, 2460, 2400, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1, '2024-11-18 12:06:13', '2024-11-18 12:06:13'),
(30, 'Ochro F.C', '05059217', 'standard', 'C128', NULL, 12, 1, 1, 1, 2300, 2500, 2400, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1, '2024-11-18 12:06:48', '2024-11-18 12:06:48'),
(31, 'Cabbage B.C', '88573492', 'standard', 'C128', NULL, 12, 1, 1, 1, 2200, 2460, 2400, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1, '2024-11-18 12:07:24', '2024-11-18 12:07:24'),
(32, 'Cabbage F.C', '23269931', 'standard', 'C128', NULL, 12, 1, 1, 1, 2300, 2500, 2400, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1, '2024-11-18 12:08:03', '2024-11-18 12:08:03'),
(33, 'Pc. Baked Chicken', '23706943', 'standard', 'C128', NULL, 12, 1, 1, 1, 700, 960, 900, -2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, '', NULL, NULL, 1, '2024-11-18 12:08:50', '2025-02-12 09:04:01'),
(34, 'Pc. Fried Chicken', '29201391', 'standard', 'C128', NULL, 12, 1, 1, 1, 800, 1000, 900, -1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, '', NULL, NULL, 1, '2024-11-18 12:11:23', '2025-02-12 09:04:55'),
(35, 'Corilla B.C', '19489549', 'standard', 'C128', NULL, 12, 1, 1, 1, 2200, 2460, 2400, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1, '2024-11-18 12:12:06', '2024-11-18 12:12:06'),
(36, 'Corilla F.C', '48130197', 'standard', 'C128', NULL, 12, 1, 1, 1, 2300, 2500, 2400, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1, '2024-11-18 12:12:38', '2024-11-18 12:12:38'),
(37, 'Pak-Choi B.C', '63293223', 'standard', 'C128', NULL, 12, 1, 1, 1, 2200, 2460, 2400, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1, '2024-11-18 12:13:11', '2024-11-18 12:13:11'),
(38, 'Pak-Choi F.C', '39200136', 'standard', 'C128', NULL, 12, 1, 1, 1, 2300, 2500, 2400, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1, '2024-11-18 12:13:41', '2024-11-18 12:13:41'),
(39, 'Calalu B.C', '42850141', 'standard', 'C128', NULL, 12, 1, 1, 1, 2300, 2460, 2400, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1, '2024-11-18 12:14:10', '2024-11-18 12:14:10'),
(40, 'Calalu F.C', '42653482', 'standard', 'C128', NULL, 12, 1, 1, 1, 2300, 2500, 2400, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1, '2024-11-18 12:14:46', '2024-11-18 12:14:46'),
(41, 'Serv. Chicken Nuggets', '50599820', 'standard', 'C128', NULL, 12, 1, 1, 1, 1000, 1200, 1100, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, '', NULL, NULL, 1, '2024-11-18 12:15:19', '2025-02-12 09:06:58'),
(42, 'Roti &amp; Curry Chicken', '79684483', 'standard', 'C128', NULL, 12, 1, 1, 1, 800, 1000, 900, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1, '2024-11-18 12:15:51', '2024-11-18 12:15:51'),
(43, 'Puri &amp; Curry Chicken', '50403922', 'standard', 'C128', NULL, 12, 1, 1, 1, 800, 1000, 900, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1, '2024-11-18 12:17:32', '2024-11-18 12:17:32'),
(44, 'Anyrice/ Curry Chicken', '81639021', 'standard', 'C128', NULL, 12, 1, 1, 1, 2000, 2220, 2100, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, 0, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, '', NULL, NULL, 1, '2024-11-18 12:18:02', '2024-11-18 12:18:29'),
(45, 'Curry Chicken', '10837238', 'standard', 'C128', NULL, 12, 1, 1, 1, 1300, 1560, 1460, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, '', NULL, NULL, 1, '2024-11-18 12:19:12', '2025-02-12 09:02:03'),
(46, 'Serv. Curry Chicken', '13629507', 'standard', 'C128', NULL, 12, 1, 1, 1, 700, 960, 860, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1, '2024-11-18 12:19:42', '2024-11-18 12:19:42'),
(47, 'Lasagna (Chicken)', '65438923', 'standard', 'C128', NULL, 12, 1, 1, 1, 800, 1000, 950, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, '', NULL, NULL, 1, '2024-11-18 12:20:16', '2025-02-12 09:02:33'),
(48, 'Raisin Rice-Baked Snapper', '52951272', 'standard', 'C128', NULL, 13, 1, 1, 1, 1900, 2160, 2100, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1, '2024-11-18 12:21:16', '2024-11-18 12:21:16'),
(49, 'Caribbean rice-Baked Snapper', '40939239', 'standard', 'C128', NULL, 13, 1, 1, 1, 1900, 2160, 2100, -2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1, '2024-11-18 12:21:46', '2024-11-28 13:44:08'),
(50, 'Pine Rice- Baked Snapper', '72411890', 'standard', 'C128', NULL, 13, 1, 1, 1, 1900, 2160, 2100, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1, '2024-11-18 12:22:18', '2024-11-18 12:22:18'),
(51, 'Fry Rice-Baked Snapper', '16731953', 'standard', 'C128', NULL, 13, 1, 1, 1, 1900, 2160, 2100, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1, '2024-11-18 12:22:45', '2024-11-18 12:22:45'),
(52, 'Cook-up- Baked Snapper', '13420429', 'standard', 'C128', NULL, 13, 1, 1, 1, 1900, 2160, 2100, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1, '2024-11-18 12:23:17', '2024-11-18 12:23:17'),
(53, 'Chowmein- Baked Snapper', '40855311', 'standard', 'C128', NULL, 13, 1, 1, 1, 1900, 2160, 2100, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1, '2024-11-18 12:23:48', '2024-11-18 12:23:48'),
(54, 'Raisin Rice-Fried Snapper', '28376708', 'standard', 'C128', NULL, 13, 1, 1, 1, 1900, 2160, 2100, -1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1, '2024-11-18 12:24:15', '2024-12-11 00:37:04'),
(55, 'Caribbean rice-Fried Snapper', '40468397', 'standard', 'C128', NULL, 13, 1, 1, 1, 1900, 2160, 2100, -1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1, '2024-11-18 12:24:40', '2024-12-11 00:37:04'),
(56, 'Pine Rice- Fried Snapper', '14612298', 'standard', 'C128', NULL, 13, 1, 1, 1, 1900, 2160, 2100, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1, '2024-11-18 12:25:06', '2024-11-18 12:25:06'),
(57, 'Fry Rice-Fried Snapper', '91546097', 'standard', 'C128', NULL, 13, 1, 1, 1, 1900, 2160, 2100, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1, '2024-11-18 12:25:35', '2024-11-18 12:25:35'),
(58, 'Cook-up- Fried Snapper', '29682301', 'standard', 'C128', NULL, 13, 1, 1, 1, 1900, 2160, 2100, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1, '2024-11-18 12:26:01', '2024-11-18 12:26:01'),
(59, 'Chowmein- Fried Snapper', '63569033', 'standard', 'C128', NULL, 13, 1, 1, 1, 1900, 2160, 2100, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1, '2024-11-18 12:26:31', '2024-11-18 12:26:31'),
(60, 'Curry-Snapper', '28351090', 'standard', 'C128', NULL, 13, 1, 1, 1, 1900, 2160, 2100, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1, '2024-11-18 12:27:05', '2024-11-18 12:27:05'),
(61, 'Stew Snapper', '92192231', 'standard', 'C128', NULL, 13, 1, 1, 1, 1900, 2160, 2100, -1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, '', NULL, NULL, 1, '2024-11-18 12:27:43', '2025-02-12 09:07:05'),
(62, 'Anyrice/ Stew Fish', '12360724', 'standard', 'C128', NULL, 13, 1, 1, 1, 1900, 2160, 2100, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1, '2024-11-18 12:28:07', '2024-11-18 12:28:07'),
(63, 'Anyrice/ Curry Fish', '45923032', 'standard', 'C128', NULL, 13, 1, 1, 1, 2800, 3060, 2960, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, '', NULL, NULL, 1, '2024-11-18 12:28:56', '2025-02-12 09:01:07'),
(64, 'Methem- Fried Snapper', '91742480', 'standard', 'C128', NULL, 13, 1, 1, 1, 2500, 2860, 2800, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1, '2024-11-18 12:29:53', '2024-11-18 12:29:53'),
(65, 'Bora- Fried Snapper', '58364329', 'standard', 'C128', NULL, 13, 1, 1, 1, 1800, 2160, 2100, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1, '2024-11-18 12:30:25', '2024-11-18 12:30:25'),
(66, 'Pumpkin-Fried Snapper', '15843771', 'standard', 'C128', NULL, 13, 1, 1, 1, 1800, 2160, 2100, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1, '2024-11-18 12:30:49', '2024-11-18 12:30:49'),
(67, 'Ochro- Fried Snapper', '67533892', 'standard', 'C128', NULL, 13, 1, 1, 1, 1800, 2160, 2100, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1, '2024-11-18 12:31:18', '2024-11-18 12:31:18'),
(68, 'Cabbage- Fried Snapper', '23441553', 'standard', 'C128', NULL, 13, 1, 1, 1, 1800, 2160, 2100, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1, '2024-11-18 12:31:46', '2024-11-18 12:31:46'),
(69, 'Corilla- Fried Snapper', '68239417', 'standard', 'C128', NULL, 13, 1, 1, 1, 1800, 2160, 2100, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1, '2024-11-18 12:32:20', '2024-11-18 12:32:20'),
(70, 'Calalu- Fried Snapper', '19620810', 'standard', 'C128', NULL, 13, 1, 1, 1, 1800, 2160, 2100, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1, '2024-11-18 12:32:47', '2024-11-18 12:32:47'),
(71, 'Pak Choi- Fried Snapper', '16332904', 'standard', 'C128', NULL, 13, 1, 1, 1, 1800, 2160, 2100, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1, '2024-11-18 12:33:11', '2024-11-18 12:33:11'),
(72, 'Serv. Curry Snapper', '69119389', 'standard', 'C128', NULL, 13, 1, 1, 1, 1500, 1800, 1750, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1, '2024-11-18 12:33:40', '2024-11-18 12:33:40'),
(73, 'Serv. Stew Snapper', '87294101', 'standard', 'C128', NULL, 13, 1, 1, 1, 1400, 1760, 1700, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1, '2024-11-18 12:34:07', '2024-11-18 12:34:07'),
(74, 'Serv. Fried Snapper', '23142482', 'standard', 'C128', NULL, 13, 1, 1, 1, 1400, 1760, 1700, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1, '2024-11-18 12:34:41', '2024-11-18 12:34:41'),
(75, 'Serv. Baked Snapper', '64109529', 'standard', 'C128', NULL, 13, 1, 1, 1, 1500, 1960, 1900, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, '', NULL, NULL, 1, '2024-11-18 12:35:15', '2025-02-12 09:06:54'),
(76, 'Roti &amp; Curry Snapper', '34051798', 'standard', 'C128', NULL, 13, 1, 1, 1, 1700, 2100, 2050, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1, '2024-11-18 12:35:43', '2024-11-18 12:35:43'),
(77, 'Roti &amp; Stew Snapper', '05989212', 'standard', 'C128', NULL, 13, 1, 1, 1, 1800, 2100, 2050, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1, '2024-11-18 12:36:20', '2024-11-18 12:36:20'),
(78, 'Salt Fish &amp; Potato', '08320762', 'standard', 'C128', NULL, 13, 1, 1, 1, 1300, 1860, 1800, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1, '2024-11-18 12:36:48', '2024-11-18 12:36:48'),
(79, 'Anyrice Oxtail', '88312147', 'standard', 'C128', NULL, 14, 1, 1, 1, 1400, 1960, 1900, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1, '2024-11-18 12:37:31', '2024-11-18 12:37:31'),
(80, 'Curry Beef', '06341131', 'standard', 'C128', NULL, 14, 1, 1, 1, 1200, 1860, 1800, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, '', NULL, NULL, 1, '2024-11-18 12:38:00', '2025-02-12 09:02:06'),
(81, 'Serv. Oxtail', '87612050', 'standard', 'C128', NULL, 14, 1, 1, 1, 1200, 1860, 1800, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1, '2024-11-18 12:38:27', '2024-11-18 12:38:27'),
(82, 'Pepper Pot', '98108604', 'standard', 'C128', NULL, 14, 1, 1, 1, 1200, 1860, 1800, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1, '2024-11-18 12:38:55', '2024-11-18 12:38:55'),
(83, 'Serv. P/Pot', '56397803', 'standard', 'C128', NULL, 14, 1, 1, 1, 1400, 2000, 1950, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1, '2024-11-18 12:39:22', '2024-11-18 12:39:22'),
(84, 'Greens Beef', '36691419', 'standard', 'C128', NULL, 14, 1, 1, 1, 1000, 1660, 1600, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1, '2024-11-18 12:39:56', '2024-11-18 12:39:56'),
(85, 'Serv. Curry Beef', '63983931', 'standard', 'C128', NULL, 14, 1, 1, 1, 700, 1160, 1100, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1, '2024-11-18 12:40:25', '2024-11-18 12:40:25'),
(86, 'Anyrice/ Curry Beef', '02942816', 'standard', 'C128', NULL, 14, 1, 1, 1, 1200, 1860, 1800, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1, '2024-11-18 12:40:59', '2024-11-18 12:40:59'),
(87, 'Roti &amp; Curry Beef', '75489514', 'standard', 'C128', NULL, 14, 1, 1, 1, 500, 1000, 950, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1, '2024-11-18 12:41:23', '2024-11-18 12:41:23'),
(88, 'Puri &amp; Curry Beef', '24840251', 'standard', 'C128', NULL, 14, 1, 1, 1, 500, 1000, 950, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1, '2024-11-18 12:41:49', '2024-11-18 12:41:49'),
(89, 'Veg. Rice', '82662190', 'standard', 'C128', NULL, 20, 1, 1, 1, 700, 1260, 1200, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1, '2024-11-18 12:42:32', '2024-11-18 12:42:32'),
(90, 'Veg. Chow', '52016893', 'standard', 'C128', NULL, 20, 1, 1, 1, 500, 1000, 950, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1, '2024-11-18 12:43:09', '2024-11-18 12:43:09'),
(91, 'Veg. Meal/Dholl', '42179395', 'standard', 'C128', NULL, 20, 1, 1, 1, 700, 1360, 1300, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1, '2024-11-18 12:43:36', '2024-11-18 12:43:36'),
(92, 'Veg. Methem', '73132821', 'standard', 'C128', NULL, 20, 1, 1, 1, 700, 1360, 1300, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1, '2024-11-18 12:44:03', '2024-11-18 12:44:03'),
(93, 'Serv. Plain Rice', '89806210', 'standard', 'C128', NULL, 20, 1, 1, 1, 150, 460, 400, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, '', NULL, NULL, 1, '2024-11-18 12:44:33', '2025-02-12 09:07:02'),
(94, 'Cup Dhal', '81739741', 'standard', 'C128', NULL, 20, 1, 1, 1, 100, 300, 250, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1, '2024-11-18 12:44:59', '2024-11-18 12:44:59'),
(95, 'Serv. Steam Greens', '53940867', 'standard', 'C128', NULL, 20, 1, 1, 1, 200, 760, 700, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1, '2024-11-18 12:45:24', '2024-11-18 12:45:24'),
(96, 'Serv. Cream Potato', '96221804', 'standard', 'C128', NULL, 20, 1, 1, 1, 150, 440, 400, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1, '2024-11-18 12:45:47', '2024-11-18 12:45:47'),
(97, 'Roti &amp; Greens', '23745230', 'standard', 'C128', NULL, 20, 1, 1, 1, 300, 880, 850, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1, '2024-11-18 12:46:11', '2024-11-18 12:46:11'),
(98, 'Puri &amp; Greens', '37561892', 'standard', 'C128', NULL, 20, 1, 1, 1, 200, 880, 850, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1, '2024-11-18 12:46:36', '2024-11-18 12:46:36'),
(99, 'Channa', '18170969', 'standard', 'C128', NULL, 20, 1, 1, 1, 50, 300, 250, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1, '2024-11-18 12:47:02', '2024-11-18 12:47:02'),
(100, 'Curry Mutton', '34223034', 'standard', 'C128', NULL, 16, 1, 1, 1, 1600, 2360, 2300, -2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1, '2024-11-18 12:47:39', '2024-11-28 09:36:35'),
(101, 'A/Rice Curry Mutton', '15206821', 'standard', 'C128', NULL, 16, 1, 1, 1, 1600, 2360, 2300, 28, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1, '2024-11-18 12:48:04', '2024-12-12 08:22:10'),
(102, 'Serv. Mutton', '13439642', 'standard', 'C128', NULL, 20, 1, 1, 1, 1600, 2360, 2300, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1, '2024-11-18 12:48:27', '2024-11-18 12:48:27'),
(103, 'Curry Duck', '43810715', 'standard', 'C128', NULL, 17, 1, 1, 1, 1600, 2360, 2300, -3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1, '2024-11-18 12:49:07', '2024-12-11 15:17:03'),
(104, 'A/Rice Curry Duck', '59208632', 'standard', 'C128', NULL, 17, 1, 1, 1, 1600, 2360, 2300, -1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1, '2024-11-18 12:49:34', '2024-11-28 09:37:17'),
(105, 'Serv. Curry Duck', '60790896', 'standard', 'C128', NULL, 17, 1, 1, 1, 1600, 2360, 2300, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1, '2024-11-18 12:50:01', '2024-11-18 12:50:01'),
(106, 'Meat Cook-up', '16103872', 'standard', 'C128', NULL, 21, 1, 1, 1, 900, 1500, 1450, -1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1, '2024-11-18 12:50:34', '2024-12-11 00:37:04'),
(107, 'Chicken Puff', '01009835', 'standard', 'C128', NULL, 22, 1, 1, 1, 200, 460, 400, -1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1, '2024-11-18 12:51:24', '2024-11-28 10:15:12'),
(108, 'Pine-tart', '64310028', 'standard', 'C128', NULL, 22, 1, 1, 1, 50, 300, 250, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png,202412110525202.jpg', NULL, 0, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, '', NULL, NULL, 1, '2024-11-18 12:51:54', '2024-12-11 04:25:21'),
(109, 'Dough Nut', '29511727', 'standard', 'C128', NULL, 22, 1, 1, 1, 50, 300, 250, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1, '2024-11-18 12:52:24', '2024-11-18 12:52:24'),
(110, 'Coconut Bun', '72696215', 'standard', 'C128', NULL, 22, 1, 1, 1, 50, 300, 250, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png,202412110523322.jpg', NULL, 0, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, '', NULL, NULL, 1, '2024-11-18 12:52:50', '2024-12-11 04:23:33'),
(111, 'Cheese Pie', '50779586', 'standard', 'C128', NULL, 22, 1, 1, 1, 50, 300, 250, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1, '2024-11-18 12:53:14', '2024-11-18 12:53:14'),
(112, 'Cheese Roll', '03766105', 'standard', 'C128', NULL, 22, 1, 1, 1, 50, 300, 250, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1, '2024-11-18 12:53:38', '2024-11-18 12:53:38'),
(113, 'Cheese Scone', '10374097', 'standard', 'C128', NULL, 22, 1, 1, 1, 50, 300, 250, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1, '2024-11-18 12:54:05', '2024-11-18 12:54:05'),
(114, 'Chicken Pattie', '79932280', 'standard', 'C128', NULL, 22, 1, 1, 1, 50, 300, 250, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png,202412110526092.jpg', NULL, 0, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, '', NULL, NULL, 1, '2024-11-18 12:54:29', '2024-12-11 04:26:10'),
(115, 'Beef Pattie', '22027316', 'standard', 'C128', NULL, 22, 1, 1, 1, 50, 300, 250, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png,202412110524282.jpg', NULL, 0, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, '', NULL, NULL, 1, '2024-11-18 12:54:56', '2024-12-11 04:24:29'),
(116, 'Veg. Pattie', '31365952', 'standard', 'C128', NULL, 22, 1, 1, 1, 50, 300, 250, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1, '2024-11-18 12:55:21', '2024-11-18 12:55:21'),
(117, 'Eclair', '16349290', 'standard', 'C128', NULL, 22, 1, 1, 1, 100, 460, 400, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1, '2024-11-18 12:55:47', '2024-11-18 12:55:47'),
(118, 'Cinnamon Roll', '95220890', 'standard', 'C128', NULL, 22, 1, 1, 1, 100, 500, 450, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1, '2024-11-18 12:56:12', '2024-11-18 12:56:12'),
(119, 'Salara', '18039941', 'standard', 'C128', NULL, 22, 1, 1, 1, 50, 380, 350, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1, '2024-11-18 12:56:37', '2024-11-18 12:56:37'),
(120, 'Baked Custard', '14059871', 'standard', 'C128', NULL, 23, 1, 1, 1, 100, 660, 600, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png,202412110528252.jpg', NULL, 0, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, '', NULL, NULL, 1, '2024-11-18 12:57:15', '2024-12-11 04:28:25'),
(121, 'Mac &amp; Cheese', '73961218', 'standard', 'C128', NULL, 23, 1, 1, 1, 100, 600, 550, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1, '2024-11-18 12:57:51', '2024-11-18 12:57:51'),
(122, 'Lg. Porridge', '46581059', 'standard', 'C128', NULL, 23, 1, 1, 1, 100, 400, 350, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1, '2024-11-18 12:58:17', '2024-11-18 12:58:17'),
(123, 'Serv. White Pudding', '04893119', 'standard', 'C128', NULL, 23, 1, 1, 1, 200, 960, 900, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1, '2024-11-18 12:58:42', '2024-11-18 12:58:42'),
(124, 'Pec Pudding', '66180274', 'standard', 'C128', NULL, 23, 1, 1, 1, 20, 160, 110, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1, '2024-11-18 12:59:09', '2024-11-18 12:59:09'),
(125, 'Bake &amp; Salt.Fish', '84405163', 'standard', 'C128', NULL, 23, 1, 1, 1, 100, 400, 380, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1, '2024-11-18 12:59:34', '2024-11-18 12:59:34'),
(126, 'Lg. Ches&amp;Pot bake', '85121303', 'standard', 'C128', NULL, 23, 1, 1, 1, 100, 400, 380, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1, '2024-11-18 13:00:00', '2024-11-18 13:00:00'),
(127, 'Cup cakes', '40282341', 'standard', 'C128', NULL, 23, 1, 1, 1, 50, 300, 280, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1, '2024-11-18 13:00:28', '2024-11-18 13:00:28'),
(128, 'Plain Roti', '89725390', 'standard', 'C128', NULL, 23, 1, 1, 1, 50, 300, 280, -1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, '', NULL, NULL, 1, '2024-11-18 13:01:30', '2025-02-12 09:05:32'),
(129, 'Plain Puri', '00265191', 'standard', 'C128', NULL, 23, 1, 1, 1, 50, 280, 250, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1, '2024-11-18 13:01:57', '2024-11-18 13:01:57'),
(130, 'Chicken Burger', '13759560', 'standard', 'C128', NULL, 23, 1, 1, 1, 100, 760, 700, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1, '2024-11-18 13:02:34', '2024-11-18 13:02:34'),
(131, 'Egg ball', '62042926', 'standard', 'C128', NULL, 23, 1, 1, 1, 50, 300, 280, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1, '2024-11-18 13:02:57', '2024-11-18 13:02:57'),
(132, 'Poulorie', '94485131', 'standard', 'C128', NULL, 23, 1, 1, 1, 50, 300, 280, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1, '2024-11-18 13:03:20', '2024-11-18 13:03:20'),
(133, 'Sub Sandwich (Turkey)', '33915271', 'standard', 'C128', NULL, 23, 1, 1, 1, 100, 760, 710, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1, '2024-11-18 13:03:52', '2024-11-18 13:03:52'),
(134, 'Sub Sandwich (Chicken)', '76013981', 'standard', 'C128', NULL, 23, 1, 1, 1, 100, 760, 710, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1, '2024-11-18 13:04:16', '2024-11-18 13:04:16'),
(135, 'Fudge', '28619149', 'standard', 'C128', NULL, 23, 1, 1, 1, 50, 300, 280, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1, '2024-11-18 13:04:44', '2024-11-18 13:04:44'),
(136, 'Grilled Cheese &amp; Turkey', '04350694', 'standard', 'C128', NULL, 23, 1, 1, 1, 100, 700, 650, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1, '2024-11-18 13:05:21', '2024-11-18 13:05:21'),
(137, 'Grilled Cheese &amp; Chicken', '91521047', 'standard', 'C128', NULL, 23, 1, 1, 1, 100, 500, 480, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1, '2024-11-18 13:05:49', '2024-11-18 13:05:49'),
(138, 'Cream Horn', '43970892', 'standard', 'C128', NULL, 23, 1, 1, 1, 100, 440, 400, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png,202412110422502.jpg', NULL, 0, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, '', NULL, NULL, 1, '2024-11-18 13:06:11', '2024-12-11 03:22:53'),
(139, 'Pin Wheel', '13192599', 'standard', 'C128', NULL, 23, 1, 1, 1, 100, 560, 500, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1, '2024-11-18 13:06:34', '2024-11-18 13:06:34'),
(140, 'Pizza', '96342187', 'standard', 'C128', NULL, 23, 1, 1, 1, 100, 400, 380, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1, '2024-11-18 13:07:34', '2024-11-18 13:07:34'),
(141, 'Sponge Cake', '38712764', 'standard', 'C128', NULL, 23, 1, 1, 1, 50, 360, 320, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1, '2024-11-18 13:07:59', '2024-11-18 13:07:59'),
(142, 'Fruit Cake', '38592026', 'standard', 'C128', NULL, 23, 1, 1, 1, 100, 460, 420, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1, '2024-11-18 13:08:24', '2024-11-18 13:08:24'),
(143, 'Curried Chicken Wrap', '02013917', 'standard', 'C128', NULL, 23, 1, 1, 1, 100, 600, 580, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1, '2024-11-18 13:08:51', '2024-11-18 13:08:51'),
(144, 'Curried Beef Wrap', '27812268', 'standard', 'C128', NULL, 23, 1, 1, 1, 100, 700, 680, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1, '2024-11-18 13:09:18', '2024-11-18 13:09:18'),
(145, 'Serv. Mac Salad', '31811297', 'standard', 'C128', NULL, 24, 1, 1, 1, 100, 440, 400, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1, '2024-11-18 13:10:01', '2024-11-18 13:10:01'),
(146, 'SV Bea Salad', '69564397', 'standard', 'C128', NULL, 24, 1, 1, 1, 100, 440, 400, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1, '2024-11-18 13:10:24', '2024-11-18 13:10:24'),
(147, 'Serv. Potatoe Salad', '90552697', 'standard', 'C128', NULL, 24, 1, 1, 1, 100, 440, 400, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1, '2024-11-18 13:10:46', '2024-11-18 13:10:46'),
(148, 'Garden Salad', '49678849', 'standard', 'C128', NULL, 24, 1, 1, 1, 100, 440, 400, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1, '2024-11-18 13:11:12', '2024-11-18 13:11:12'),
(149, 'T/Mist', '46032272', 'standard', 'C128', NULL, 25, 1, 1, 1, 50, 300, 280, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1, '2024-11-18 13:11:51', '2024-11-18 13:11:51'),
(150, 'Sm. Agua Mist', '96237143', 'standard', 'C128', NULL, 25, 1, 1, 1, 30, 200, 180, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1, '2024-11-18 13:12:18', '2024-11-18 13:12:18'),
(151, '12oz Drink', '15336021', 'standard', 'C128', NULL, 25, 1, 1, 1, 40, 240, 210, 494, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1, '2024-11-18 13:12:43', '2025-02-14 12:59:41'),
(152, '20oz Drink', '01738740', 'standard', 'C128', NULL, 25, 1, 1, 1, 50, 300, 280, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1, '2024-11-18 13:13:08', '2024-11-18 13:13:08'),
(153, '1 Lt. Drink', '00722164', 'service', 'C128', NULL, 25, 0, 0, 0, 0, 360, 320, 406, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, 0, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, '', NULL, NULL, 1, '2024-11-18 13:13:37', '2025-02-13 15:41:10'),
(154, 'Vita Malt', '11259683', 'standard', 'C128', NULL, 25, 1, 1, 1, 50, 360, 320, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1, '2024-11-18 13:14:14', '2024-11-18 13:14:14'),
(155, 'Smalta', '38310146', 'standard', 'C128', NULL, 25, 1, 1, 1, 50, 300, 280, -1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1, '2024-11-18 13:14:36', '2024-12-11 00:37:04'),
(156, 'Lg. Ginseng up', '74436912', 'standard', 'C128', NULL, 25, 1, 1, 1, 100, 500, 480, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1, '2024-11-18 13:15:03', '2024-11-18 13:15:03'),
(157, 'Sm. Blue Water', '49210713', 'standard', 'C128', NULL, 25, 1, 1, 1, 30, 140, 120, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1, '2024-11-18 13:15:25', '2024-11-18 13:15:25'),
(158, 'Mistic', '11793023', 'standard', 'C128', NULL, 25, 1, 1, 1, 50, 400, 380, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1, '2024-11-18 13:15:50', '2024-11-18 13:15:50'),
(159, 'Fruta Tin', '75136302', 'standard', 'C128', NULL, 25, 1, 1, 1, 50, 360, 320, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1, '2024-11-18 13:16:13', '2024-11-18 13:16:13'),
(160, 'LLB', '07719055', 'standard', 'C128', NULL, 25, 1, 1, 1, 50, 300, 280, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1, '2024-11-18 13:16:40', '2024-11-18 13:16:40'),
(161, 'Canada Dry', '64525898', 'standard', 'C128', NULL, 25, 1, 1, 1, 50, 300, 280, -1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1, '2024-11-18 13:17:01', '2024-12-11 00:37:04'),
(162, 'Xtra Energy', '10905843', 'standard', 'C128', NULL, 25, 1, 1, 1, 50, 360, 340, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1, '2024-11-18 13:17:32', '2024-11-18 13:17:32'),
(163, 'Cherry (J)', '32647593', 'standard', 'C128', NULL, 26, 1, 1, 1, 50, 460, 440, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1, '2024-11-18 13:18:01', '2024-11-18 13:18:01'),
(164, 'Passion (J)', '74918369', 'standard', 'C128', NULL, 26, 1, 1, 1, 50, 400, 380, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1, '2024-11-18 13:18:22', '2024-11-18 13:18:22'),
(165, 'Pine-apple (J)', '78604254', 'standard', 'C128', NULL, 26, 1, 1, 1, 50, 400, 380, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1, '2024-11-18 13:18:44', '2024-11-18 13:18:44'),
(166, 'Guava (J)', '81786949', 'standard', 'C128', NULL, 26, 1, 1, 1, 50, 400, 380, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1, '2024-11-18 13:19:10', '2024-11-18 13:19:10'),
(167, 'Cane (J)', '79318506', 'standard', 'C128', NULL, 26, 1, 1, 1, 50, 400, 380, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1, '2024-11-18 13:19:35', '2024-11-18 13:19:35'),
(168, 'G/Apple (j)', '10025217', 'standard', 'C128', NULL, 26, 1, 1, 1, 50, 400, 380, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1, '2024-11-18 13:19:57', '2024-11-18 13:19:57'),
(169, 'Tamarind (J)', '00304254', 'standard', 'C128', NULL, 26, 1, 1, 1, 50, 400, 380, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1, '2024-11-18 13:20:21', '2024-11-18 13:20:21'),
(170, 'Sorrel (J)', '38724200', 'standard', 'C128', NULL, 26, 1, 1, 1, 50, 400, 380, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1, '2024-11-18 13:21:04', '2024-11-18 13:21:04'),
(171, 'Ginger/Lime', '69542815', 'standard', 'C128', NULL, 26, 1, 1, 1, 50, 400, 380, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1, '2024-11-18 13:21:36', '2024-11-18 13:21:36'),
(172, 'Mango&amp;Carrot (J)', '02605712', 'standard', 'C128', NULL, 26, 1, 1, 1, 50, 400, 380, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1, '2024-11-18 13:22:02', '2024-11-18 13:22:02'),
(173, 'Fruit Punch (J)', '47030513', 'standard', 'C128', NULL, 26, 1, 1, 1, 50, 460, 440, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1, '2024-11-18 13:22:32', '2024-11-18 13:22:32'),
(174, '16 oz Cup', '31393802', 'standard', 'C128', NULL, 35, 1, 1, 1, 10, 100, 80, 500, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1, '2024-11-18 13:23:11', '2025-02-13 14:59:11'),
(175, '8 oz Cup', '93837261', 'standard', 'C128', NULL, 35, 1, 1, 1, 10, 60, 50, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1, '2024-11-18 13:23:36', '2024-11-18 13:23:36'),
(176, 'Compartment Box', '96623378', 'standard', 'C128', NULL, 40, 1, 1, 1, 10, 100, 90, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1, '2024-11-18 13:25:07', '2024-11-18 13:25:07'),
(177, 'Regular Box', '04532316', 'standard', 'C128', NULL, 40, 1, 1, 1, 5, 40, 35, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1, '2024-11-18 13:25:34', '2024-11-18 13:25:34'),
(178, 'Burger Box', '46841729', 'standard', 'C128', NULL, 40, 1, 1, 1, 5, 60, 55, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1, '2024-11-18 13:25:59', '2024-11-18 13:25:59'),
(179, '32 oz Bowl', '32036958', 'standard', 'C128', NULL, 41, 1, 1, 1, 10, 100, 95, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1, '2024-11-18 13:26:21', '2024-11-18 13:26:21'),
(180, '16 oz Bowl', '93034329', 'standard', 'C128', NULL, 41, 1, 1, 1, 5, 60, 55, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1, '2024-11-18 13:26:45', '2024-11-18 13:26:45'),
(181, 'Bernard Crane', '76524716', 'standard', 'C128', NULL, 24, 1, 1, 1, 50, 568, 416, 0, 38, 16, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, 1, NULL, 1, NULL, 1, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1, '2024-11-28 14:20:07', '2024-11-28 14:20:07'),
(183, 'Demo', '83419791', 'standard', 'C128', NULL, 12, 1, 1, 1, 39, 729, 650, 0, 651, 33, 1, '832', '1996-06-05', '1978-06-21', NULL, 1, 'zummXD2dvAtI.png', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1, '2024-11-28 14:22:26', '2024-11-28 14:22:26'),
(184, 'Melissa Pollard', '19806907', 'standard', 'UPCA', NULL, 12, 1, 1, 1, 8, 61, 801, 3, 69, 11, 1, '329', '1988-08-01', '1985-01-22', NULL, 1, 'zummXD2dvAtI.png', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1, '2024-11-28 14:23:21', '2024-11-28 14:23:21'),
(185, 'Another Demo', '25399438', 'standard', 'C128', NULL, 12, 1, 1, 1, 111, 1111, 111, 8, 1, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1, '2024-12-11 15:05:22', '2025-02-17 06:43:51'),
(187, 'demooooo2', '43826951', 'standard', 'C128', NULL, 16, 1, 1, 1, 222, 222222, 22222, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1, '2024-12-12 08:55:40', '2024-12-12 08:55:40');

-- --------------------------------------------------------

--
-- Table structure for table `product_adjustments`
--

CREATE TABLE `product_adjustments` (
  `id` int(10) UNSIGNED NOT NULL,
  `adjustment_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `variant_id` int(11) DEFAULT NULL,
  `unit_cost` double DEFAULT NULL,
  `qty` double NOT NULL,
  `action` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_adjustments`
--

INSERT INTO `product_adjustments` (`id`, `adjustment_id`, `product_id`, `variant_id`, `unit_cost`, `qty`, `action`, `created_at`, `updated_at`) VALUES
(1, 1, 153, NULL, 50, 1, '-', '2024-11-28 10:16:43', '2024-11-28 10:16:43');

-- --------------------------------------------------------

--
-- Table structure for table `product_batches`
--

CREATE TABLE `product_batches` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` int(11) NOT NULL,
  `batch_no` varchar(191) NOT NULL,
  `expired_date` date NOT NULL,
  `qty` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_batches`
--

INSERT INTO `product_batches` (`id`, `product_id`, `batch_no`, `expired_date`, `qty`, `created_at`, `updated_at`) VALUES
(1, 2, '12345', '2024-09-25', 35, '2024-09-21 16:31:30', '2024-09-23 08:13:12'),
(2, 2, '55555', '2024-10-26', 10000, '2024-10-03 06:43:07', '2024-10-03 06:43:07');

-- --------------------------------------------------------

--
-- Table structure for table `product_purchases`
--

CREATE TABLE `product_purchases` (
  `id` int(10) UNSIGNED NOT NULL,
  `purchase_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_batch_id` int(11) DEFAULT NULL,
  `variant_id` int(11) DEFAULT NULL,
  `imei_number` text DEFAULT NULL,
  `qty` double NOT NULL,
  `recieved` double NOT NULL,
  `purchase_unit_id` int(11) NOT NULL,
  `net_unit_cost` double NOT NULL,
  `discount` double NOT NULL,
  `tax_rate` double NOT NULL,
  `tax` double NOT NULL,
  `total` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_purchases`
--

INSERT INTO `product_purchases` (`id`, `purchase_id`, `product_id`, `product_batch_id`, `variant_id`, `imei_number`, `qty`, `recieved`, `purchase_unit_id`, `net_unit_cost`, `discount`, `tax_rate`, `tax`, `total`, `created_at`, `updated_at`) VALUES
(3, 2, 1, NULL, NULL, NULL, 200, 200, 1, 50, 0, 0, 0, 10000, '2024-09-21 07:29:38', '2024-09-21 07:29:38'),
(4, 3, 2, 1, NULL, NULL, 50, 50, 1, 43, 0, 0, 0, 2150, '2024-09-21 16:31:30', '2024-09-21 16:31:30'),
(5, 4, 1, NULL, NULL, NULL, 1, 1, 1, 50, 0, 0, 0, 50, '2024-10-02 19:20:58', '2024-10-02 19:20:58'),
(6, 5, 2, 2, NULL, NULL, 10000, 10000, 1, 43, 0, 0, 0, 430000, '2024-10-03 06:43:07', '2024-10-03 06:43:07'),
(7, 6, 5, NULL, NULL, NULL, 100, 100, 1, 50, 0, 0, 0, 5000, '2024-10-07 07:47:32', '2024-10-07 07:47:32'),
(8, 6, 17, NULL, NULL, NULL, 100, 100, 1, 50, 0, 0, 0, 5000, '2024-10-07 07:47:32', '2024-10-07 07:47:32'),
(9, 6, 16, NULL, NULL, NULL, 100, 100, 1, 50, 0, 0, 0, 5000, '2024-10-07 07:47:32', '2024-10-07 07:47:32'),
(10, 6, 14, NULL, NULL, NULL, 100, 100, 1, 50, 0, 0, 0, 5000, '2024-10-07 07:47:32', '2024-10-07 07:47:32'),
(11, 6, 13, NULL, NULL, NULL, 100, 100, 1, 50, 0, 0, 0, 5000, '2024-10-07 07:47:32', '2024-10-07 07:47:32'),
(12, 6, 11, NULL, NULL, NULL, 100, 100, 1, 50, 0, 0, 0, 5000, '2024-10-07 07:47:32', '2024-10-07 07:47:32'),
(13, 6, 15, NULL, NULL, NULL, 100, 100, 1, 50, 0, 0, 0, 5000, '2024-10-07 07:47:32', '2024-10-07 07:47:32'),
(14, 6, 10, NULL, NULL, NULL, 100, 100, 1, 50, 0, 0, 0, 5000, '2024-10-07 07:47:32', '2024-10-07 07:47:32'),
(15, 6, 9, NULL, NULL, NULL, 100, 100, 1, 50, 0, 0, 0, 5000, '2024-10-07 07:47:32', '2024-10-07 07:47:32'),
(16, 6, 8, NULL, NULL, NULL, 100, 100, 1, 50, 0, 0, 0, 5000, '2024-10-07 07:47:32', '2024-10-07 07:47:32'),
(17, 6, 4, NULL, NULL, NULL, 100, 100, 1, 50, 0, 0, 0, 5000, '2024-10-07 07:47:32', '2024-10-07 07:47:32'),
(18, 6, 12, NULL, NULL, NULL, 100, 100, 1, 50, 0, 0, 0, 5000, '2024-10-07 07:47:32', '2024-10-07 07:47:32'),
(19, 6, 3, NULL, NULL, NULL, 100, 100, 1, 50, 0, 0, 0, 5000, '2024-10-07 07:47:32', '2024-10-07 07:47:32'),
(20, 6, 7, NULL, NULL, NULL, 100, 100, 1, 50, 0, 0, 0, 5000, '2024-10-07 07:47:32', '2024-10-07 07:47:32'),
(21, 6, 6, NULL, NULL, NULL, 100, 100, 1, 50, 0, 0, 0, 5000, '2024-10-07 07:47:32', '2024-10-07 07:47:32'),
(23, 2, 18, NULL, NULL, NULL, 100, 100, 1, 11, 0, 0, 0, 1100, '2024-11-17 07:58:30', '2024-11-17 07:58:30'),
(24, 3, 21, NULL, NULL, NULL, 500, 500, 1, 50, 0, 0, 0, 25000, '2024-11-17 19:05:44', '2024-11-17 19:05:44'),
(25, 4, 182, NULL, NULL, NULL, 1, 1, 1, 63, 0, 0, 0, 63, '2024-11-28 14:21:25', '2024-11-28 14:21:25'),
(26, 5, 184, NULL, NULL, NULL, 3, 3, 1, 8, 0, 0, 0, 24, '2024-11-28 14:23:21', '2024-11-28 14:23:21'),
(27, 6, 185, NULL, NULL, NULL, 10, 10, 1, 111, 0, 0, 0, 1110, '2024-12-11 15:05:22', '2024-12-11 15:05:22'),
(28, 7, 186, NULL, NULL, NULL, 12, 12, 1, 11, 0, 0, 0, 132, '2024-12-11 15:25:23', '2024-12-11 15:25:23'),
(30, 8, 101, NULL, NULL, NULL, 10, 10, 1, 1600, 0, 0, 0, 16000, '2024-12-12 08:19:21', '2024-12-12 08:19:21'),
(32, 9, 101, NULL, NULL, NULL, 18, 18, 1, 1600, 0, 0, 0, 28800, '2024-12-12 08:22:10', '2024-12-12 08:22:10'),
(33, 10, 153, NULL, NULL, NULL, 500, 500, 1, 50, 0, 0, 0, 25000, '2024-12-12 16:11:03', '2024-12-12 16:11:03'),
(34, 11, 22, NULL, NULL, NULL, 10000, 10000, 1, 800, 0, 0, 0, 8000000, '2025-02-13 07:25:31', '2025-02-13 07:25:31'),
(35, 12, 24, NULL, NULL, NULL, 500, 500, 1, 1400, 0, 0, 0, 700000, '2025-02-13 13:37:47', '2025-02-13 13:37:47'),
(36, 13, 185, NULL, NULL, NULL, 500, 500, 1, 111, 0, 0, 0, 55500, '2025-02-13 14:56:46', '2025-02-13 14:56:46'),
(37, 14, 151, NULL, NULL, NULL, 500, 500, 1, 40, 0, 0, 0, 20000, '2025-02-13 14:58:41', '2025-02-13 14:58:41'),
(38, 15, 174, NULL, NULL, NULL, 500, 500, 1, 10, 0, 0, 0, 5000, '2025-02-13 14:59:11', '2025-02-13 14:59:11');

-- --------------------------------------------------------

--
-- Table structure for table `product_quotation`
--

CREATE TABLE `product_quotation` (
  `id` int(10) UNSIGNED NOT NULL,
  `quotation_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_batch_id` int(11) DEFAULT NULL,
  `variant_id` int(11) DEFAULT NULL,
  `qty` double NOT NULL,
  `sale_unit_id` int(11) NOT NULL,
  `net_unit_price` double NOT NULL,
  `discount` double NOT NULL,
  `tax_rate` double NOT NULL,
  `tax` double NOT NULL,
  `total` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_returns`
--

CREATE TABLE `product_returns` (
  `id` int(10) UNSIGNED NOT NULL,
  `return_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_batch_id` int(11) DEFAULT NULL,
  `variant_id` int(11) DEFAULT NULL,
  `imei_number` text DEFAULT NULL,
  `qty` double NOT NULL,
  `sale_unit_id` int(11) NOT NULL,
  `net_unit_price` double NOT NULL,
  `discount` double NOT NULL,
  `tax_rate` double NOT NULL,
  `tax` double NOT NULL,
  `total` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_returns`
--

INSERT INTO `product_returns` (`id`, `return_id`, `product_id`, `product_batch_id`, `variant_id`, `imei_number`, `qty`, `sale_unit_id`, `net_unit_price`, `discount`, `tax_rate`, `tax`, `total`, `created_at`, `updated_at`) VALUES
(6, 4, 22, NULL, NULL, NULL, 1, 1, 1000, 0, 0, 0, 1000, '2024-11-28 10:51:35', '2024-11-28 10:51:35');

-- --------------------------------------------------------

--
-- Table structure for table `product_sales`
--

CREATE TABLE `product_sales` (
  `id` int(10) UNSIGNED NOT NULL,
  `sale_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_batch_id` int(11) DEFAULT NULL,
  `variant_id` int(11) DEFAULT NULL,
  `imei_number` text DEFAULT NULL,
  `qty` double NOT NULL,
  `return_qty` double NOT NULL DEFAULT 0,
  `sale_unit_id` int(11) NOT NULL,
  `net_unit_price` double NOT NULL,
  `discount` double NOT NULL,
  `tax_rate` double NOT NULL,
  `tax` double NOT NULL,
  `total` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_delivered` tinyint(1) DEFAULT NULL,
  `is_packing` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_sales`
--

INSERT INTO `product_sales` (`id`, `sale_id`, `product_id`, `product_batch_id`, `variant_id`, `imei_number`, `qty`, `return_qty`, `sale_unit_id`, `net_unit_price`, `discount`, `tax_rate`, `tax`, `total`, `created_at`, `updated_at`, `is_delivered`, `is_packing`) VALUES
(1, 1, 153, NULL, NULL, NULL, 1, 0, 1, 360, 0, 0, 0, 360, '2024-12-12 16:20:05', '2024-12-12 16:20:05', NULL, NULL),
(2, 2, 153, NULL, NULL, NULL, 1, 0, 1, 360, 0, 0, 0, 360, '2024-12-12 16:36:30', '2024-12-12 16:36:30', NULL, NULL),
(3, 3, 153, NULL, NULL, NULL, 1, 0, 1, 360, 0, 0, 0, 360, '2024-12-12 16:38:59', '2024-12-12 16:38:59', NULL, NULL),
(4, 4, 153, NULL, NULL, NULL, 1, 0, 1, 360, 0, 0, 0, 360, '2024-12-12 19:13:41', '2024-12-12 19:13:41', NULL, NULL),
(5, 5, 153, NULL, NULL, NULL, 1, 0, 1, 360, 0, 0, 0, 360, '2025-01-26 18:08:27', '2025-01-26 18:08:27', NULL, NULL),
(6, 6, 153, NULL, NULL, NULL, 1, 0, 1, 360, 0, 0, 0, 360, '2025-01-26 18:08:45', '2025-01-26 18:08:45', NULL, NULL),
(7, 7, 153, NULL, NULL, NULL, 1, 0, 1, 360, 0, 0, 0, 360, '2025-01-26 18:10:53', '2025-01-26 18:10:53', NULL, NULL),
(8, 8, 153, NULL, NULL, NULL, 1, 0, 1, 360, 0, 0, 0, 360, '2025-01-26 18:13:47', '2025-01-26 18:13:47', NULL, NULL),
(9, 9, 153, NULL, NULL, NULL, 1, 0, 1, 360, 0, 0, 0, 360, '2025-01-27 03:26:29', '2025-01-27 03:26:29', NULL, NULL),
(10, 10, 153, NULL, NULL, NULL, 3, 0, 1, 360, 0, 0, 0, 1080, '2025-01-27 03:26:47', '2025-01-27 03:26:47', NULL, NULL),
(11, 11, 153, NULL, NULL, NULL, 10, 0, 1, 360, 0, 0, 0, 3600, '2025-01-27 03:27:38', '2025-01-27 03:27:38', NULL, NULL),
(12, 12, 153, NULL, NULL, NULL, 3, 0, 1, 360, 0, 0, 0, 1080, '2025-01-27 03:29:59', '2025-01-27 03:29:59', NULL, NULL),
(13, 13, 153, NULL, NULL, NULL, 3, 0, 1, 360, 0, 0, 0, 1080, '2025-01-27 03:31:26', '2025-01-27 03:31:26', NULL, NULL),
(14, 14, 153, NULL, NULL, NULL, 50, 0, 1, 360, 0, 0, 0, 18000, '2025-01-27 03:31:50', '2025-01-27 03:31:50', NULL, NULL),
(15, 15, 153, NULL, NULL, NULL, 1, 0, 1, 360, 0, 0, 0, 360, '2025-01-27 03:32:13', '2025-01-27 03:32:13', NULL, NULL),
(16, 16, 153, NULL, NULL, NULL, 10, 0, 1, 360, 0, 0, 0, 3600, '2025-01-27 03:32:17', '2025-01-27 03:32:17', NULL, NULL),
(17, 17, 153, NULL, NULL, NULL, 1, 0, 1, 360, 0, 0, 0, 360, '2025-01-27 05:02:38', '2025-01-27 05:02:38', NULL, NULL),
(18, 18, 153, NULL, NULL, NULL, 3, 0, 1, 360, 0, 0, 0, 1080, '2025-02-12 07:23:56', '2025-02-12 07:23:56', NULL, NULL),
(19, 19, 22, NULL, NULL, NULL, 1, 0, 1, 1000, 0, 0, 0, 1000, '2025-02-13 13:25:27', '2025-02-13 13:25:27', NULL, NULL),
(23, 23, 24, NULL, NULL, NULL, 50, 0, 1, 1560, 0, 0, 0, 78000, '2025-02-14 12:46:15', '2025-02-14 12:46:15', NULL, NULL),
(24, 24, 22, NULL, NULL, NULL, 1, 0, 1, 50, 0, 0, 0, 50, '2025-02-14 12:48:27', '2025-02-14 12:48:27', NULL, NULL),
(25, 25, 24, NULL, NULL, NULL, 50, 0, 1, 1560, 0, 0, 0, 78000, '2025-02-14 12:55:09', '2025-02-14 12:55:09', NULL, NULL),
(26, 25, 22, NULL, NULL, NULL, 10, 0, 1, 50, 0, 0, 0, 500, '2025-02-14 12:55:09', '2025-02-14 12:55:09', NULL, NULL),
(27, 26, 153, NULL, NULL, NULL, 50, 0, 0, 360, 0, 0, 0, 18000, '2025-02-14 12:59:41', '2025-02-14 12:59:41', NULL, NULL),
(28, 26, 151, NULL, NULL, NULL, 6, 0, 1, 240, 0, 0, 0, 1440, '2025-02-14 12:59:41', '2025-02-14 12:59:41', NULL, NULL),
(29, 27, 22, NULL, NULL, NULL, 1, 0, 1, 50, 0, 0, 0, 50, '2025-02-14 13:02:10', '2025-02-14 13:02:10', NULL, NULL),
(30, 28, 24, NULL, NULL, NULL, 2, 0, 1, 1560, 0, 0, 0, 3120, '2025-02-14 13:02:42', '2025-02-14 13:02:42', NULL, NULL),
(31, 29, 22, NULL, NULL, NULL, 1, 0, 1, 50, 0, 0, 0, 50, '2025-02-14 13:05:23', '2025-02-14 13:05:23', NULL, NULL),
(32, 30, 24, NULL, NULL, NULL, 55, 0, 1, 1560, 0, 0, 0, 85800, '2025-02-15 11:18:47', '2025-02-15 11:18:47', NULL, NULL),
(33, 30, 22, NULL, NULL, NULL, 1, 0, 1, 50, 0, 0, 0, 50, '2025-02-15 11:18:47', '2025-02-15 11:18:47', NULL, NULL),
(34, 31, 24, NULL, NULL, NULL, 30, 0, 1, 1510, 1500, 0, 0, 45300, '2025-02-17 04:39:49', '2025-02-17 04:39:49', NULL, NULL),
(35, 31, 22, NULL, NULL, NULL, 20, 0, 1, 50, 0, 0, 0, 1000, '2025-02-17 04:39:49', '2025-02-17 04:39:49', NULL, NULL),
(36, 32, 24, NULL, NULL, NULL, 1, 0, 1, 1560, 0, 0, 0, 1560, '2025-02-17 05:42:59', '2025-02-17 05:42:59', NULL, NULL),
(37, 32, 22, NULL, NULL, NULL, 1, 0, 1, 50, 0, 0, 0, 50, '2025-02-17 05:42:59', '2025-02-17 05:42:59', NULL, NULL),
(38, 33, 185, NULL, NULL, NULL, 502, 0, 1, 1111, 0, 0, 0, 557722, '2025-02-17 06:43:51', '2025-02-17 06:43:51', NULL, NULL),
(39, 33, 24, NULL, NULL, NULL, 5, 0, 1, 1540, 100, 5, 385, 8085, '2025-02-17 06:43:51', '2025-02-17 06:43:51', NULL, NULL),
(40, 33, 22, NULL, NULL, NULL, 59, 0, 1, 50, 0, 0, 0, 2950, '2025-02-17 06:43:51', '2025-02-17 06:43:51', NULL, NULL),
(41, 34, 24, NULL, NULL, NULL, 1, 0, 1, 1560, 0, 0, 0, 1560, '2025-02-17 06:49:37', '2025-02-17 06:49:37', NULL, NULL),
(42, 34, 22, NULL, NULL, NULL, 1, 0, 1, 50, 0, 0, 0, 50, '2025-02-17 06:49:37', '2025-02-17 06:49:37', NULL, NULL),
(43, 35, 24, NULL, NULL, NULL, 1, 0, 1, 1560, 0, 0, 0, 1560, '2025-02-17 07:04:01', '2025-02-17 07:04:01', NULL, NULL),
(44, 35, 22, NULL, NULL, NULL, 1, 0, 1, 50, 0, 0, 0, 50, '2025-02-17 07:04:01', '2025-02-17 07:04:01', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `product_transfer`
--

CREATE TABLE `product_transfer` (
  `id` int(10) UNSIGNED NOT NULL,
  `transfer_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_batch_id` int(11) DEFAULT NULL,
  `variant_id` int(11) DEFAULT NULL,
  `imei_number` text DEFAULT NULL,
  `qty` double NOT NULL,
  `purchase_unit_id` int(11) NOT NULL,
  `net_unit_cost` double NOT NULL,
  `tax_rate` double NOT NULL,
  `tax` double NOT NULL,
  `total` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_variants`
--

CREATE TABLE `product_variants` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_id` int(11) NOT NULL,
  `variant_id` int(11) NOT NULL,
  `position` int(11) NOT NULL,
  `item_code` varchar(191) NOT NULL,
  `additional_cost` double DEFAULT NULL,
  `additional_price` double DEFAULT NULL,
  `qty` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_warehouse`
--

CREATE TABLE `product_warehouse` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_id` varchar(191) NOT NULL,
  `product_batch_id` int(11) DEFAULT NULL,
  `variant_id` int(11) DEFAULT NULL,
  `imei_number` text DEFAULT NULL,
  `warehouse_id` int(11) NOT NULL,
  `qty` double NOT NULL,
  `price` double DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_warehouse`
--

INSERT INTO `product_warehouse` (`id`, `product_id`, `product_batch_id`, `variant_id`, `imei_number`, `warehouse_id`, `qty`, `price`, `created_at`, `updated_at`) VALUES
(1, '153', NULL, NULL, NULL, 1, 7, NULL, '2024-12-12 16:11:03', '2025-02-13 15:41:10'),
(2, '153', NULL, NULL, NULL, 3, 200, NULL, '2024-12-12 16:14:01', '2024-12-12 16:14:01'),
(3, '153', NULL, NULL, NULL, 4, 200, NULL, '2024-12-12 16:14:36', '2024-12-12 16:17:30'),
(4, '22', NULL, NULL, NULL, 1, 9903, NULL, '2025-02-13 07:25:31', '2025-02-17 07:13:31'),
(5, '24', NULL, NULL, NULL, 1, 305, 1560, '2025-02-13 13:37:47', '2025-02-17 07:13:31'),
(6, '185', NULL, NULL, NULL, 1, -2, 1111, '2025-02-13 14:56:46', '2025-02-17 06:43:51'),
(7, '151', NULL, NULL, NULL, 1, 494, 240, '2025-02-13 14:58:41', '2025-02-14 12:59:41'),
(8, '174', NULL, NULL, NULL, 1, 500, 100, '2025-02-13 14:59:11', '2025-02-13 14:59:11');

-- --------------------------------------------------------

--
-- Table structure for table `purchases`
--

CREATE TABLE `purchases` (
  `id` int(10) UNSIGNED NOT NULL,
  `reference_no` varchar(191) NOT NULL,
  `user_id` int(11) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `currency_id` int(11) DEFAULT NULL,
  `exchange_rate` double DEFAULT NULL,
  `item` int(11) NOT NULL,
  `total_qty` double NOT NULL,
  `total_discount` double NOT NULL,
  `total_tax` double NOT NULL,
  `total_cost` double NOT NULL,
  `order_tax_rate` double DEFAULT NULL,
  `order_tax` double DEFAULT NULL,
  `order_discount` double DEFAULT NULL,
  `shipping_cost` double DEFAULT NULL,
  `grand_total` double NOT NULL,
  `paid_amount` double NOT NULL,
  `status` int(11) NOT NULL,
  `payment_status` int(11) NOT NULL,
  `document` varchar(191) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `purchases`
--

INSERT INTO `purchases` (`id`, `reference_no`, `user_id`, `warehouse_id`, `supplier_id`, `currency_id`, `exchange_rate`, `item`, `total_qty`, `total_discount`, `total_tax`, `total_cost`, `order_tax_rate`, `order_tax`, `order_discount`, `shipping_cost`, `grand_total`, `paid_amount`, `status`, `payment_status`, `document`, `note`, `created_at`, `updated_at`) VALUES
(2, 'pr-20241117-125830', 1, 1, NULL, 1, 1, 1, 100, 0, 0, 1100, 0, 0, 0, 0, 1100, 1100, 1, 2, NULL, NULL, '2024-10-07 19:00:00', '2024-11-17 08:03:51'),
(3, 'pr-20241117-080544', 1, 1, 1, 1, 1, 1, 500, 0, 0, 25000, 0, 0, 0, 0, 25000, 2000, 1, 1, NULL, NULL, '2024-11-16 23:00:00', '2024-11-17 19:06:03'),
(4, 'pr-20241128-032125', 1, 2, NULL, NULL, NULL, 1, 1, 0, 0, 63, NULL, 0, NULL, NULL, 63, 63, 1, 2, NULL, NULL, '2024-11-28 14:21:25', '2024-11-28 14:21:25'),
(5, 'pr-20241128-032321', 1, 2, NULL, NULL, NULL, 1, 3, 0, 0, 24, NULL, 0, NULL, NULL, 24, 24, 1, 2, NULL, NULL, '2024-11-28 14:23:21', '2024-11-28 14:23:21'),
(6, 'pr-20241211-040522', 1, 1, NULL, NULL, NULL, 1, 10, 0, 0, 1110, NULL, 0, NULL, NULL, 1110, 1110, 1, 2, NULL, NULL, '2024-12-11 15:05:22', '2024-12-11 15:05:22'),
(7, 'pr-20241211-042523', 1, 3, NULL, NULL, NULL, 1, 12, 0, 0, 132, NULL, 0, NULL, NULL, 132, 132, 1, 2, NULL, NULL, '2024-12-11 15:25:23', '2024-12-11 15:25:23'),
(8, 'pr-20241212-091857', 1, 1, 1, 4, 1, 1, 10, 0, 0, 16000, 0, 0, 0, 0, 16000, 16000, 1, 2, NULL, NULL, '2024-12-11 23:00:00', '2024-12-12 08:19:38'),
(9, 'pr-20241212-092031', 1, 3, 1, 4, 1, 1, 18, 0, 0, 28800, 0, 0, 0, 0, 28800, 28800, 1, 2, NULL, NULL, '2024-12-11 23:00:00', '2024-12-12 08:22:21'),
(10, 'pr-20241212-051103', 1, 1, NULL, 4, 1, 1, 500, 0, 0, 25000, 0, 0, 0, 0, 25000, 25000, 1, 2, NULL, NULL, '2024-12-12 16:11:03', '2024-12-12 16:11:14'),
(11, 'pr-20250213-122531', 1, 1, 1, 4, 1, 1, 10000, 0, 0, 8000000, 0, 0, 0, 0, 8000000, 8000000, 1, 2, NULL, NULL, '2025-02-12 19:00:00', '2025-02-13 07:25:45'),
(12, 'pr-20250213-063747', 1, 1, 1, 4, 1, 1, 500, 0, 0, 700000, 0, 0, 0, 0, 700000, 700000, 1, 2, NULL, NULL, '2025-02-12 19:00:00', '2025-02-13 15:00:45'),
(13, 'pr-20250213-075646', 1, 1, 1, 4, 1, 1, 500, 0, 0, 55500, 0, 0, 0, 0, 55500, 0, 1, 1, NULL, NULL, '2025-02-19 19:00:00', '2025-02-13 14:56:46'),
(14, 'pr-20250213-075841', 1, 1, 1, 4, 1, 1, 500, 0, 0, 20000, 0, 0, 0, 0, 20000, 20000, 1, 2, NULL, NULL, '2025-02-13 14:58:41', '2025-02-13 15:00:33'),
(15, 'pr-20250213-075911', 1, 1, 1, 4, 1, 1, 500, 0, 0, 5000, 0, 0, 0, 0, 5000, 5000, 1, 2, NULL, NULL, '2025-02-12 19:00:00', '2025-02-13 15:00:57');

-- --------------------------------------------------------

--
-- Table structure for table `purchase_product_return`
--

CREATE TABLE `purchase_product_return` (
  `id` int(10) UNSIGNED NOT NULL,
  `return_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_batch_id` int(11) DEFAULT NULL,
  `variant_id` int(11) DEFAULT NULL,
  `imei_number` text DEFAULT NULL,
  `qty` double NOT NULL,
  `purchase_unit_id` int(11) NOT NULL,
  `net_unit_cost` double NOT NULL,
  `discount` double NOT NULL,
  `tax_rate` double NOT NULL,
  `tax` double NOT NULL,
  `total` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `quotations`
--

CREATE TABLE `quotations` (
  `id` int(10) UNSIGNED NOT NULL,
  `reference_no` varchar(191) NOT NULL,
  `user_id` int(11) NOT NULL,
  `biller_id` int(11) NOT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `customer_id` int(11) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `item` int(11) NOT NULL,
  `total_qty` double NOT NULL,
  `total_discount` double NOT NULL,
  `total_tax` double NOT NULL,
  `total_price` double NOT NULL,
  `order_tax_rate` double DEFAULT NULL,
  `order_tax` double DEFAULT NULL,
  `order_discount` double DEFAULT NULL,
  `shipping_cost` double DEFAULT NULL,
  `grand_total` double NOT NULL,
  `quotation_status` int(11) NOT NULL,
  `document` varchar(191) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `returns`
--

CREATE TABLE `returns` (
  `id` int(10) UNSIGNED NOT NULL,
  `reference_no` varchar(191) NOT NULL,
  `user_id` int(11) NOT NULL,
  `sale_id` int(11) DEFAULT NULL,
  `cash_register_id` int(11) DEFAULT NULL,
  `customer_id` int(11) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `biller_id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `currency_id` int(11) DEFAULT NULL,
  `exchange_rate` double DEFAULT NULL,
  `item` int(11) NOT NULL,
  `total_qty` double NOT NULL,
  `total_discount` double NOT NULL,
  `total_tax` double NOT NULL,
  `total_price` double NOT NULL,
  `order_tax_rate` double DEFAULT NULL,
  `order_tax` double DEFAULT NULL,
  `grand_total` double NOT NULL,
  `document` varchar(191) DEFAULT NULL,
  `return_note` text DEFAULT NULL,
  `staff_note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `returns`
--

INSERT INTO `returns` (`id`, `reference_no`, `user_id`, `sale_id`, `cash_register_id`, `customer_id`, `warehouse_id`, `biller_id`, `account_id`, `currency_id`, `exchange_rate`, `item`, `total_qty`, `total_discount`, `total_tax`, `total_price`, `order_tax_rate`, `order_tax`, `grand_total`, `document`, `return_note`, `staff_note`, `created_at`, `updated_at`) VALUES
(4, 'rr-20241128-115135', 11, 6, 3, 2, 1, 2, 1, 4, 1, 1, 1, 0, 0, 1000, 0, 0, 1000, NULL, NULL, NULL, '2024-11-28 10:51:35', '2024-11-28 10:51:35');

-- --------------------------------------------------------

--
-- Table structure for table `return_purchases`
--

CREATE TABLE `return_purchases` (
  `id` int(10) UNSIGNED NOT NULL,
  `reference_no` varchar(191) NOT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `warehouse_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `purchase_id` int(11) DEFAULT NULL,
  `account_id` int(11) NOT NULL,
  `currency_id` int(11) DEFAULT NULL,
  `exchange_rate` double DEFAULT NULL,
  `item` int(11) NOT NULL,
  `total_qty` double NOT NULL,
  `total_discount` double NOT NULL,
  `total_tax` double NOT NULL,
  `total_cost` double NOT NULL,
  `order_tax_rate` double DEFAULT NULL,
  `order_tax` double DEFAULT NULL,
  `grand_total` double NOT NULL,
  `document` varchar(191) DEFAULT NULL,
  `return_note` text DEFAULT NULL,
  `staff_note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reward_point_settings`
--

CREATE TABLE `reward_point_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `per_point_amount` double NOT NULL,
  `minimum_amount` double NOT NULL,
  `duration` int(11) DEFAULT NULL,
  `type` varchar(191) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `reward_point_settings`
--

INSERT INTO `reward_point_settings` (`id`, `per_point_amount`, `minimum_amount`, `duration`, `type`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 300, 1000, 1, 'Year', 1, '2021-06-08 15:40:15', '2021-06-27 05:20:55');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `description` text DEFAULT NULL,
  `guard_name` varchar(191) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `description`, `guard_name`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'admin can access all data...', 'web', 1, '2018-06-01 23:46:44', '2018-06-02 23:13:05'),
(2, 'Owner', 'Owner of shop', 'web', 1, '2018-10-22 02:38:13', '2024-10-03 06:44:57'),
(4, 'Cashier', 'Cashier has specific access', 'web', 1, '2018-06-02 00:05:27', '2024-10-03 06:45:15'),
(5, 'customer', NULL, 'web', 1, '2020-11-05 06:43:16', '2024-09-21 11:03:05'),
(6, 'Demo', NULL, 'web', 0, '2024-11-13 20:23:43', '2024-12-11 12:45:54'),
(7, 'demo2', NULL, 'web', 0, '2024-11-14 05:26:47', '2024-12-11 12:45:47'),
(8, 'demo3', NULL, 'web', 0, '2024-11-14 05:26:56', '2024-12-11 12:45:30');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(4, 1),
(4, 2),
(4, 7),
(4, 8),
(5, 1),
(5, 2),
(5, 7),
(5, 8),
(6, 1),
(6, 2),
(6, 4),
(6, 7),
(6, 8),
(7, 1),
(7, 2),
(7, 4),
(7, 6),
(7, 7),
(7, 8),
(8, 1),
(8, 2),
(8, 4),
(8, 7),
(8, 8),
(9, 1),
(9, 2),
(9, 4),
(9, 7),
(9, 8),
(10, 1),
(10, 2),
(10, 7),
(10, 8),
(11, 1),
(11, 2),
(11, 7),
(11, 8),
(12, 1),
(12, 2),
(12, 4),
(12, 7),
(12, 8),
(13, 1),
(13, 2),
(13, 4),
(13, 7),
(13, 8),
(14, 1),
(14, 2),
(14, 7),
(14, 8),
(15, 1),
(15, 2),
(15, 7),
(15, 8),
(16, 1),
(16, 2),
(16, 8),
(17, 1),
(17, 2),
(17, 8),
(18, 1),
(18, 2),
(18, 8),
(19, 1),
(19, 2),
(19, 8),
(20, 2),
(21, 2),
(22, 2),
(23, 2),
(24, 1),
(24, 2),
(24, 4),
(24, 7),
(24, 8),
(25, 1),
(25, 2),
(25, 4),
(25, 7),
(25, 8),
(26, 1),
(26, 2),
(26, 4),
(26, 7),
(26, 8),
(27, 1),
(27, 2),
(27, 7),
(27, 8),
(28, 1),
(28, 2),
(28, 4),
(28, 7),
(28, 8),
(29, 1),
(29, 2),
(29, 4),
(29, 7),
(29, 8),
(30, 1),
(30, 2),
(30, 7),
(30, 8),
(31, 1),
(31, 2),
(31, 7),
(31, 8),
(32, 1),
(32, 2),
(32, 7),
(32, 8),
(33, 1),
(33, 2),
(33, 7),
(33, 8),
(34, 1),
(34, 2),
(34, 7),
(34, 8),
(35, 1),
(35, 2),
(35, 7),
(35, 8),
(36, 1),
(36, 2),
(36, 7),
(36, 8),
(37, 1),
(37, 2),
(37, 7),
(37, 8),
(38, 1),
(38, 2),
(38, 7),
(38, 8),
(39, 1),
(39, 2),
(39, 7),
(39, 8),
(40, 1),
(40, 2),
(40, 7),
(40, 8),
(41, 1),
(41, 2),
(41, 7),
(41, 8),
(42, 1),
(42, 2),
(42, 7),
(42, 8),
(43, 1),
(43, 2),
(43, 7),
(43, 8),
(44, 1),
(44, 2),
(44, 7),
(44, 8),
(45, 1),
(45, 2),
(45, 7),
(45, 8),
(46, 1),
(46, 2),
(46, 7),
(46, 8),
(47, 1),
(47, 2),
(47, 7),
(47, 8),
(48, 1),
(48, 2),
(48, 7),
(48, 8),
(49, 1),
(49, 2),
(49, 7),
(49, 8),
(50, 1),
(50, 2),
(50, 7),
(50, 8),
(51, 1),
(51, 2),
(51, 7),
(51, 8),
(52, 1),
(52, 2),
(52, 7),
(52, 8),
(53, 1),
(53, 2),
(53, 7),
(53, 8),
(54, 1),
(54, 2),
(54, 7),
(54, 8),
(55, 1),
(55, 2),
(55, 7),
(55, 8),
(56, 1),
(56, 2),
(56, 7),
(56, 8),
(57, 1),
(57, 2),
(57, 7),
(57, 8),
(58, 1),
(58, 2),
(58, 7),
(58, 8),
(59, 1),
(59, 2),
(59, 7),
(59, 8),
(60, 1),
(60, 2),
(60, 7),
(60, 8),
(61, 1),
(61, 2),
(61, 7),
(61, 8),
(62, 1),
(62, 2),
(62, 7),
(62, 8),
(63, 1),
(63, 2),
(63, 7),
(63, 8),
(64, 1),
(64, 2),
(64, 7),
(64, 8),
(65, 1),
(65, 2),
(65, 7),
(65, 8),
(66, 1),
(66, 2),
(66, 7),
(66, 8),
(67, 1),
(67, 2),
(67, 7),
(67, 8),
(68, 1),
(68, 2),
(68, 7),
(68, 8),
(69, 1),
(69, 2),
(69, 7),
(69, 8),
(70, 1),
(70, 2),
(70, 7),
(70, 8),
(71, 1),
(71, 2),
(71, 7),
(71, 8),
(72, 1),
(72, 2),
(72, 7),
(72, 8),
(73, 1),
(73, 2),
(73, 7),
(73, 8),
(74, 1),
(74, 2),
(74, 7),
(74, 8),
(75, 1),
(75, 2),
(75, 7),
(75, 8),
(76, 1),
(76, 2),
(76, 7),
(76, 8),
(77, 1),
(77, 2),
(77, 7),
(77, 8),
(78, 1),
(78, 2),
(78, 7),
(78, 8),
(79, 1),
(79, 2),
(79, 7),
(79, 8),
(80, 1),
(80, 2),
(80, 7),
(80, 8),
(81, 1),
(81, 2),
(81, 7),
(81, 8),
(82, 1),
(82, 2),
(82, 7),
(82, 8),
(83, 2),
(83, 8),
(84, 1),
(84, 2),
(84, 7),
(84, 8),
(85, 1),
(85, 2),
(85, 7),
(85, 8),
(86, 1),
(86, 2),
(86, 7),
(86, 8),
(87, 1),
(87, 2),
(87, 8),
(88, 1),
(88, 2),
(88, 7),
(88, 8),
(89, 2),
(90, 1),
(90, 2),
(90, 7),
(90, 8),
(91, 1),
(91, 2),
(91, 7),
(91, 8),
(92, 1),
(92, 2),
(92, 7),
(92, 8),
(93, 1),
(93, 2),
(93, 7),
(93, 8),
(94, 1),
(94, 2),
(94, 7),
(94, 8),
(95, 1),
(95, 2),
(95, 7),
(95, 8),
(96, 1),
(96, 2),
(96, 7),
(96, 8),
(97, 1),
(97, 2),
(97, 7),
(97, 8),
(98, 1),
(98, 2),
(98, 7),
(98, 8),
(99, 1),
(99, 2),
(99, 7),
(99, 8),
(100, 1),
(100, 2),
(100, 7),
(100, 8),
(101, 1),
(101, 2),
(101, 7),
(101, 8),
(102, 1),
(102, 2),
(102, 7),
(102, 8),
(103, 1),
(103, 2),
(103, 7),
(103, 8),
(104, 1),
(104, 2),
(104, 7),
(104, 8),
(105, 1),
(105, 2),
(105, 7),
(105, 8),
(106, 1),
(106, 4),
(106, 7),
(106, 8),
(107, 1),
(107, 7),
(107, 8),
(108, 1),
(108, 7),
(108, 8),
(109, 1),
(109, 7),
(109, 8),
(110, 1),
(110, 7),
(110, 8),
(111, 1),
(111, 7),
(111, 8),
(112, 1),
(112, 7),
(112, 8),
(113, 1),
(113, 7),
(113, 8),
(114, 1),
(114, 7),
(114, 8),
(115, 1),
(115, 7),
(115, 8),
(116, 1),
(116, 7),
(116, 8),
(117, 1),
(117, 7),
(117, 8),
(118, 1),
(118, 7),
(118, 8),
(119, 1),
(119, 7),
(119, 8),
(120, 1),
(120, 7),
(120, 8),
(121, 1),
(121, 7),
(121, 8),
(122, 1),
(122, 7),
(122, 8),
(123, 1),
(123, 7),
(123, 8),
(124, 1),
(124, 7),
(124, 8),
(125, 1),
(125, 7),
(125, 8),
(126, 1),
(126, 7),
(126, 8),
(127, 1),
(127, 7),
(127, 8),
(128, 1),
(128, 7),
(128, 8),
(129, 1),
(129, 7),
(129, 8),
(130, 1),
(130, 7),
(130, 8),
(131, 1),
(131, 8),
(132, 1),
(133, 1);

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `id` int(10) UNSIGNED NOT NULL,
  `reference_no` varchar(191) NOT NULL,
  `user_id` int(11) NOT NULL,
  `cash_register_id` int(11) DEFAULT NULL,
  `table_id` int(11) DEFAULT NULL,
  `queue` int(11) DEFAULT NULL,
  `customer_id` int(11) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `biller_id` int(11) DEFAULT NULL,
  `item` int(11) NOT NULL,
  `total_qty` double NOT NULL,
  `total_discount` double NOT NULL,
  `total_tax` double NOT NULL,
  `total_price` double NOT NULL,
  `grand_total` double NOT NULL,
  `currency_id` int(11) DEFAULT NULL,
  `exchange_rate` double DEFAULT NULL,
  `order_tax_rate` double DEFAULT NULL,
  `order_tax` double DEFAULT NULL,
  `order_discount_type` varchar(191) DEFAULT NULL,
  `order_discount_value` double DEFAULT NULL,
  `order_discount` double DEFAULT NULL,
  `coupon_id` int(11) DEFAULT NULL,
  `coupon_discount` double DEFAULT NULL,
  `shipping_cost` double DEFAULT NULL,
  `sale_status` int(11) NOT NULL,
  `payment_status` int(11) NOT NULL,
  `document` varchar(191) DEFAULT NULL,
  `paid_amount` double DEFAULT NULL,
  `sale_note` text DEFAULT NULL,
  `staff_note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sales`
--

INSERT INTO `sales` (`id`, `reference_no`, `user_id`, `cash_register_id`, `table_id`, `queue`, `customer_id`, `warehouse_id`, `biller_id`, `item`, `total_qty`, `total_discount`, `total_tax`, `total_price`, `grand_total`, `currency_id`, `exchange_rate`, `order_tax_rate`, `order_tax`, `order_discount_type`, `order_discount_value`, `order_discount`, `coupon_id`, `coupon_discount`, `shipping_cost`, `sale_status`, `payment_status`, `document`, `paid_amount`, `sale_note`, `staff_note`, `created_at`, `updated_at`) VALUES
(1, 'posr-20241212-052005', 1, 8, NULL, NULL, 2, 1, 3, 1, 1, 0, 0, 360, 360, 4, 1, 0, 0, 'Flat', NULL, 0, NULL, NULL, 0, 1, 4, NULL, 360, NULL, NULL, '2024-12-12 16:20:05', '2024-12-12 16:20:05'),
(2, 'posr-20241212-053630', 1, 8, NULL, NULL, 2, 1, 3, 1, 1, 0, 0, 360, 360, 4, 1, 0, 0, 'Flat', NULL, 0, NULL, NULL, 0, 1, 4, NULL, 360, NULL, NULL, '2024-12-12 16:36:30', '2024-12-12 16:36:30'),
(3, 'posr-20241212-053859', 1, 8, NULL, NULL, 2, 1, 3, 1, 1, 0, 0, 360, 360, 4, 1, 0, 0, 'Flat', NULL, 0, NULL, NULL, 0, 1, 4, NULL, 360, NULL, NULL, '2024-12-12 16:38:59', '2024-12-12 16:38:59'),
(4, 'posr-20241212-081341', 1, 8, NULL, NULL, 2, 1, 3, 1, 1, 0, 0, 360, 360, 4, 1, 0, 0, 'Flat', NULL, 0, NULL, NULL, 0, 1, 4, NULL, 360, NULL, NULL, '2024-12-12 19:13:41', '2025-02-17 04:41:10'),
(5, 'posr-20250126-070827', 14, NULL, NULL, NULL, 2, 1, 3, 1, 1, 0, 0, 360, 360, 4, 1, 0, 0, 'Flat', NULL, 0, NULL, NULL, 0, 1, 4, NULL, 360, NULL, NULL, '2025-01-25 23:00:00', '2025-01-26 18:08:27'),
(6, 'posr-20250126-070845', 14, NULL, NULL, NULL, 2, 1, 3, 1, 1, 0, 0, 360, 360, 4, 1, 0, 0, 'Flat', NULL, 0, NULL, NULL, 0, 1, 4, NULL, 360, NULL, NULL, '2025-01-25 23:00:00', '2025-01-26 18:08:45'),
(7, 'posr-20250126-071053', 14, NULL, NULL, NULL, 2, 1, 3, 1, 1, 0, 0, 360, 360, 4, 1, 0, 0, 'Flat', NULL, 0, NULL, NULL, 0, 1, 4, NULL, 360, NULL, NULL, '2025-01-26 18:10:53', '2025-01-26 18:10:53'),
(8, 'posr-20250126-071347', 1, 8, NULL, NULL, 2, 1, 3, 1, 1, 0, 0, 360, 360, 4, 1, 0, 0, 'Flat', NULL, 0, NULL, NULL, 0, 1, 4, NULL, 360, NULL, NULL, '2025-01-26 18:13:47', '2025-01-26 18:13:47'),
(9, 'posr-20250127-042629', 1, 8, NULL, NULL, 2, 1, 3, 1, 1, 0, 0, 360, 360, 4, 1, 0, 0, 'Flat', NULL, 0, NULL, NULL, 0, 1, 4, NULL, 360, NULL, NULL, '2025-01-27 03:26:29', '2025-01-27 03:26:29'),
(10, 'posr-20250127-042647', 1, 8, NULL, NULL, 2, 1, 3, 1, 3, 0, 0, 1080, 1080, 4, 1, 0, 0, 'Flat', NULL, 0, NULL, NULL, 0, 1, 4, NULL, 1080, NULL, NULL, '2025-01-27 03:26:47', '2025-01-27 03:26:47'),
(11, 'posr-20250127-042738', 1, 8, NULL, NULL, 2, 1, 3, 1, 10, 0, 0, 3600, 3600, 4, 1, 0, 0, 'Flat', NULL, 0, NULL, NULL, 0, 1, 4, NULL, 3600, NULL, NULL, '2025-01-27 03:27:38', '2025-01-27 03:27:38'),
(12, 'posr-20250127-042959', 1, 8, NULL, NULL, 2, 1, 3, 1, 3, 0, 0, 1080, 1080, 4, 1, 0, 0, 'Flat', NULL, 0, NULL, NULL, 0, 1, 4, NULL, 1080, NULL, NULL, '2025-01-27 03:29:59', '2025-01-27 03:29:59'),
(13, 'posr-20250127-043126', 1, 8, NULL, NULL, 2, 1, 3, 1, 3, 0, 0, 1080, 1080, 4, 1, 0, 0, 'Flat', NULL, 0, NULL, NULL, 0, 1, 4, NULL, 1080, NULL, NULL, '2025-01-27 03:31:26', '2025-01-27 03:31:26'),
(14, 'posr-20250127-043150', 1, 8, NULL, NULL, 2, 1, 3, 1, 50, 0, 0, 18000, 18000, 4, 1, 0, 0, 'Flat', NULL, 0, NULL, NULL, 0, 1, 4, NULL, 18000, NULL, NULL, '2025-01-27 03:31:50', '2025-01-27 03:31:50'),
(15, 'posr-20250127-043213', 1, 8, NULL, NULL, 2, 1, 3, 1, 1, 0, 0, 360, 360, 4, 1, 0, 0, 'Flat', NULL, 0, NULL, NULL, 0, 1, 4, NULL, 360, NULL, NULL, '2025-01-27 03:32:13', '2025-01-27 03:32:13'),
(16, 'posr-20250127-043217', 1, 8, NULL, NULL, 2, 1, 3, 1, 10, 0, 0, 3600, 3600, 4, 1, 0, 0, 'Flat', NULL, 0, NULL, NULL, 0, 1, 4, NULL, 3600, NULL, NULL, '2025-01-27 03:32:17', '2025-01-27 03:32:17'),
(17, 'posr-20250127-060238', 14, NULL, NULL, NULL, 2, 1, 3, 1, 1, 0, 0, 360, 360, 4, 1, 0, 0, 'Flat', NULL, 0, NULL, NULL, 0, 1, 4, NULL, 360, NULL, NULL, '2025-01-27 05:02:38', '2025-01-27 05:02:38'),
(18, 'posr-20250212-122356', 1, 8, NULL, NULL, 2, 1, 3, 1, 3, 0, 0, 1080, 1080, 4, 1, 0, 0, 'Flat', NULL, 0, NULL, NULL, 0, 1, 4, NULL, 1080, NULL, NULL, '2025-02-12 07:23:56', '2025-02-12 07:23:56'),
(19, 'posr-20250213-062527', 1, 8, NULL, NULL, 2, 1, 3, 1, 1, 0, 0, 1000, 1000, 4, 1, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 1000, NULL, NULL, '2025-02-13 13:25:27', '2025-02-13 13:25:27'),
(23, 'posr-20250214-054615', 1, 8, NULL, NULL, 2, 1, 3, 1, 50, 0, 0, 78000, 72235.8, 4, 1, 5, 3822, 'Percentage', 2, 1560, 4, 8026.200000000001, NULL, 1, 4, NULL, 72235.8, NULL, NULL, '2025-02-14 12:46:15', '2025-02-17 04:41:11'),
(24, 'posr-20250214-054827', 1, 8, NULL, NULL, 2, 1, 3, 1, 1, 0, 0, 50, 50, 4, 1, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 50, NULL, NULL, '2025-02-14 12:48:27', '2025-02-14 12:48:27'),
(25, 'posr-20250214-055509', 1, 8, NULL, NULL, 2, 1, 3, 2, 60, 0, 0, 78500, 74163.6, 4, 1, 5, 3924, 'Flat', 20, 20, 4, 8240.4, NULL, 1, 4, NULL, 74163.6, NULL, NULL, '2025-02-14 12:55:09', '2025-02-17 04:41:11'),
(26, 'posr-20250214-055941', 1, 8, NULL, NULL, 2, 1, 3, 2, 56, 0, 0, 19440, 17670.52, 4, 1, 0, 0, 'Flat', NULL, 0, 4, 1769.477, NULL, 1, 4, NULL, 17670.52, NULL, NULL, '2025-02-14 12:59:41', '2025-02-14 12:59:41'),
(27, 'posr-20250214-060210', 1, 8, NULL, NULL, 2, 1, 3, 1, 1, 0, 0, 50, 50, 4, 1, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 50, NULL, NULL, '2025-02-14 13:02:10', '2025-02-14 13:02:10'),
(28, 'posr-20250214-060242', 1, 8, NULL, NULL, 2, 1, 3, 1, 2, 0, 0, 3120, 3276, 4, 1, 5, 156, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 3276, NULL, NULL, '2025-02-14 13:02:42', '2025-02-14 13:02:42'),
(29, 'posr-20250214-060523', 1, 8, NULL, NULL, 2, 1, 3, 1, 1, 0, 0, 50, 45, 4, 1, 0, 0, 'Flat', 5, 5, NULL, NULL, NULL, 1, 4, NULL, 45, NULL, NULL, '2025-02-14 13:05:23', '2025-02-14 13:05:23'),
(30, 'posr-20250215-041846', 1, 8, NULL, NULL, 2, 1, 3, 2, 56, 0, 0, 85850, 85850, 4, 1, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 85850, NULL, NULL, '2025-02-15 11:18:46', '2025-02-15 11:18:46'),
(31, 'posr-20250217-093948', 1, 8, NULL, NULL, 2, 1, 3, 2, 50, 1500, 0, 46300, 38892, 4, 1, 5, 1852, 'Percentage', 20, 9260, NULL, NULL, NULL, 1, 4, NULL, 38892, NULL, NULL, '2025-02-17 04:39:48', '2025-02-17 04:39:48'),
(32, 'posr-20250217-104259', 1, 8, NULL, NULL, 2, 1, 3, 2, 2, 0, 0, 1610, 1449.08, 4, 1, 0, 0, 'Percentage', NULL, 0, 4, 160.92200000000003, NULL, 1, 4, NULL, 1449.08, NULL, NULL, '2025-02-17 05:42:59', '2025-02-17 05:42:59'),
(33, 'posr-20250217-114351', 1, 8, NULL, NULL, 2, 1, 3, 3, 566, 100, 385, 568757, 380130.29, 4, 1, 5, 19906.5, 'Percentage', 30, 170627.1, 4, 37906.102000000006, NULL, 1, 4, NULL, 380130.29, NULL, NULL, '2025-02-17 06:43:51', '2025-02-17 06:43:51'),
(34, 'posr-20250217-114937', 1, 8, NULL, NULL, 2, 1, 3, 2, 2, 0, 0, 1610, 1610, 4, 1, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 1610, NULL, NULL, '2025-02-17 06:49:37', '2025-02-17 06:49:37'),
(35, 'posr-20250217-120401', 1, 8, NULL, NULL, 2, 1, 3, 2, 2, 0, 0, 1610, 1610, 4, 1, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 1610, NULL, NULL, '2025-02-17 07:04:01', '2025-02-17 07:04:01');

-- --------------------------------------------------------

--
-- Table structure for table `shift_days`
--

CREATE TABLE `shift_days` (
  `id` int(11) NOT NULL,
  `days` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `shift_days`
--

INSERT INTO `shift_days` (`id`, `days`, `created_at`, `updated_at`) VALUES
(1, 'Saturday', '2024-10-05 15:43:26', '2024-10-05 15:43:26'),
(2, 'Sunday', '2024-10-05 15:43:26', '2024-10-05 15:43:26'),
(3, 'Monday', '2024-10-05 15:43:26', '2024-10-05 15:43:26'),
(4, 'Tuesday', '2024-10-05 15:43:26', '2024-10-05 15:43:26'),
(5, 'Wednesday', '2024-10-05 15:43:26', '2024-10-05 15:43:26'),
(6, 'Thursday', '2024-10-05 15:43:26', '2024-10-05 15:43:26'),
(7, 'Friday', '2024-10-05 15:43:26', '2024-10-05 15:43:26');

-- --------------------------------------------------------

--
-- Table structure for table `sms_templates`
--

CREATE TABLE `sms_templates` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  `is_default_ecommerce` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sms_templates`
--

INSERT INTO `sms_templates` (`id`, `name`, `content`, `is_default`, `is_default_ecommerce`, `created_at`, `updated_at`) VALUES
(1, 'heeloo', 'helooooeooe', 1, 0, '2024-12-15 04:54:53', '2024-12-15 04:54:53');

-- --------------------------------------------------------

--
-- Table structure for table `stock_counts`
--

CREATE TABLE `stock_counts` (
  `id` int(10) UNSIGNED NOT NULL,
  `reference_no` varchar(191) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `category_id` varchar(191) DEFAULT NULL,
  `brand_id` varchar(191) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `type` varchar(191) NOT NULL,
  `initial_file` varchar(191) DEFAULT NULL,
  `final_file` varchar(191) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `is_adjusted` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `stock_counts`
--

INSERT INTO `stock_counts` (`id`, `reference_no`, `warehouse_id`, `category_id`, `brand_id`, `user_id`, `type`, `initial_file`, `final_file`, `note`, `is_adjusted`, `created_at`, `updated_at`) VALUES
(1, 'scr-20241212-091155', 1, NULL, NULL, 1, 'full', '20241212-091155.csv', NULL, NULL, 0, '2024-12-12 08:11:55', '2024-12-12 08:11:55'),
(2, 'scr-20241212-092332', 1, '16', NULL, 1, 'partial', '20241212-092332.csv', NULL, NULL, 0, '2024-12-12 08:23:32', '2024-12-12 08:23:32');

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

CREATE TABLE `suppliers` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `image` varchar(191) DEFAULT NULL,
  `company_name` varchar(191) NOT NULL,
  `vat_number` varchar(191) DEFAULT NULL,
  `email` varchar(191) NOT NULL,
  `phone_number` varchar(191) NOT NULL,
  `address` varchar(191) NOT NULL,
  `city` varchar(191) NOT NULL,
  `state` varchar(191) DEFAULT NULL,
  `postal_code` varchar(191) DEFAULT NULL,
  `country` varchar(191) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `suppliers`
--

INSERT INTO `suppliers` (`id`, `name`, `image`, `company_name`, `vat_number`, `email`, `phone_number`, `address`, `city`, `state`, `postal_code`, `country`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'supplier', 'BittenCourts.png', 'Bitten Courts', NULL, 'suplier@gmail.com', '000000000000', 'model colony', 'karachi', NULL, '75400', 'Pakistan', 1, '2024-11-17 19:04:31', '2024-11-17 19:04:43'),
(2, 'Guyana Beverages Inc.', NULL, 'Guyana Beverages Inc.', NULL, 'info@guyanabeverages.com', '592-216-1517', 'Plot 4A Area, AA1 Plantation', 'Great Diamond', 'East Bank Demerara', NULL, 'Guyana', 1, '2025-01-19 14:34:10', '2025-01-19 14:34:10');

-- --------------------------------------------------------

--
-- Table structure for table `tables`
--

CREATE TABLE `tables` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `number_of_person` int(11) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tables`
--

INSERT INTO `tables` (`id`, `name`, `number_of_person`, `description`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'abdullah', 1, NULL, 1, '2024-09-23 08:33:42', '2024-09-23 08:33:42');

-- --------------------------------------------------------

--
-- Table structure for table `taxes`
--

CREATE TABLE `taxes` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `rate` double NOT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `taxes`
--

INSERT INTO `taxes` (`id`, `name`, `rate`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Test', 5, 1, '2025-02-14 06:28:21', '2025-02-14 06:28:21');

-- --------------------------------------------------------

--
-- Table structure for table `transfers`
--

CREATE TABLE `transfers` (
  `id` int(10) UNSIGNED NOT NULL,
  `reference_no` varchar(191) NOT NULL,
  `user_id` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `from_warehouse_id` int(11) NOT NULL,
  `to_warehouse_id` int(11) NOT NULL,
  `item` int(11) NOT NULL,
  `total_qty` double NOT NULL,
  `total_tax` double NOT NULL,
  `total_cost` double NOT NULL,
  `shipping_cost` double DEFAULT NULL,
  `grand_total` double NOT NULL,
  `document` varchar(191) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `is_sent` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `units`
--

CREATE TABLE `units` (
  `id` int(10) UNSIGNED NOT NULL,
  `unit_code` varchar(191) NOT NULL,
  `unit_name` varchar(191) NOT NULL,
  `base_unit` int(11) DEFAULT NULL,
  `operator` varchar(191) DEFAULT NULL,
  `operation_value` double DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `units`
--

INSERT INTO `units` (`id`, `unit_code`, `unit_name`, `base_unit`, `operator`, `operation_value`, `is_active`, `created_at`, `updated_at`) VALUES
(1, '4521', 'piece', NULL, '*', 1, 1, '2024-09-20 15:07:36', '2024-10-07 07:35:57');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `password` varchar(191) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `phone` varchar(191) NOT NULL,
  `company_name` varchar(191) DEFAULT NULL,
  `role_id` int(11) NOT NULL,
  `biller_id` int(11) DEFAULT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_deleted` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `remember_token`, `phone`, `company_name`, `role_id`, `biller_id`, `warehouse_id`, `is_active`, `is_deleted`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'orders@bettencourtsfoods.com', '$2y$10$FMnyDVUtPSG0iXkkV1ntpektwmO8W/HwwVDSrTUON/PEwx6eX4oH.', NULL, '592-225-1008/592-688-9009', 'Bettencourt\'s Home Style Diner', 1, NULL, NULL, 1, 0, '2024-09-20 08:45:10', '2024-12-09 08:02:55'),
(3, 'sheikh', 'sheikh@gmail.com', '$2y$10$dppYtkR25swVvgGW16oVLuHaoZNFc/65johRve9bqPkeCUfFV5mDK', NULL, '12345', NULL, 4, 1, 1, 0, 1, '2024-09-21 11:06:27', '2024-10-07 13:26:52'),
(5, 'customer', 'customer@gmail.com', '$2y$10$PIB0DnI6eREotOP.qUT1u.YBlHlDhX/m6IzGiw7SeEb1/yf3TCXZC', NULL, '+447427028130', NULL, 5, NULL, NULL, 0, 1, '2024-09-21 11:22:12', '2024-10-07 13:26:52'),
(6, 'owner', 'owner@gmail.com', '$2y$10$6RoULpLPTqui9uaAzV.LxevVwFWgyljLDtu2lfbdxf.YK4kXReBbm', NULL, '111', NULL, 2, NULL, NULL, 0, 1, '2024-11-13 20:18:09', '2024-12-12 10:44:42'),
(7, 'cashier', 'cashier@gmail.com', '$2y$10$nK3CNnpawVpQug57.71uJ.gx.lXuGX7AB9zmZmKXndplsTCCm3Tey', NULL, '123', NULL, 6, NULL, NULL, 0, 1, '2024-11-13 20:19:15', '2024-12-12 10:44:42'),
(8, 'demo1', 'demo1@gmail.com', '$2y$10$rS5DAGbuCM9YMK4HPRw32uI9Vf/MgecgI25rBMBkDLZBGIVOBVg/q', NULL, '12345', NULL, 6, NULL, NULL, 0, 1, '2024-11-14 05:43:50', '2024-11-18 11:30:40'),
(9, 'demo2', 'demo2@gmail.com', '$2y$10$nKJZQy55Su4Hqvpu6mCJLOWZsnXAVH00Wo9AxnWZ6aGw5EujsSDES', NULL, '12345', NULL, 7, NULL, NULL, 0, 1, '2024-11-14 05:44:30', '2024-11-18 11:30:56'),
(10, 'demo3', 'demo3@gmail.com', '$2y$10$PzqG0GSNzTUK35dZpD/i4eRyA.EMJL7YcFz9Lqi3hyjX0r0D9J3kq', NULL, '12345', NULL, 8, NULL, NULL, 0, 1, '2024-11-14 05:45:05', '2024-11-18 11:31:04'),
(12, 'ab', 'abdullahsheikhmuhammad21@gmail.com', '$2y$10$Ob5428to0SmyGyPKkcluDeRskBlXzwxTS2Ce3cUwrApxmxMzt2bYq', NULL, '03092657113', 'POS', 1, NULL, NULL, 0, 1, '2024-11-28 13:45:45', '2024-11-28 13:48:35'),
(13, 'ab', 'abdullahsheikhmuhammad21@gmail.com', '$2y$10$O/oDHRPxDXIQfWQpaUogCu3BUIfogQ0GXLaQ1PMmTWr/.94lUyXkS', NULL, '03092657113', 'POS', 1, NULL, NULL, 0, 1, '2024-11-28 13:48:47', '2024-12-12 09:31:55'),
(14, 'Anna', 'anna@bettencourtsfoods.com', '$2y$10$8UcN1N2uB9iTVtwqKkzagu2NGz8.Tr.o4Wy8086JlkEdYQSzGhQ22', NULL, '592-225-1008/592-688-9009', 'Bettencourt\'s Home Style Diner', 4, 3, 1, 1, 0, '2024-12-12 10:36:02', '2025-02-09 05:09:19'),
(15, 'Renatta', 'renatta@bettencourtsfoods.com', '$2y$10$NjZuBWaX8zqcqzhWYl6QUe9dw85LYEhsG2p4/.z3JdWWp7KL/x8VS', NULL, '592-225-1008/592-688-9009', 'Bettencourt\'s Home Style Diner', 4, 4, 1, 1, 0, '2024-12-12 10:37:22', '2024-12-12 12:19:51'),
(16, 'Shakira', 'shakira@bettencourtsfoods.com', '$2y$10$nVo2jeaCbkCIFk/S7u4gVONi8wSGD6MjAFM5AXN4ogMvrjucY1QAm', NULL, '592-225-1008/592-688-9009', 'Bettencourt\'s Home Style Diner', 4, 5, 1, 1, 0, '2024-12-12 10:42:16', '2024-12-12 12:20:33'),
(17, 'Kiara', 'kiara@bettencourtsfoods.com', '$2y$10$KkXpxZYQXo3OLVoxmIlaZ.FcWbqmECqtj5NVVnULuVdVQ9iJIbece', NULL, '592-225-1008/592-688-9009', 'Bettencourt\'s Home Style Diner', 4, 6, 1, 1, 0, '2024-12-12 10:44:09', '2025-02-13 10:29:12'),
(18, 'testCashier', 'testCashier@gmail.com', '$2y$10$.iX/JOQzep6Fv9nSZVl6XO.FFG3gYXgUZwRw7mWkojdAOL0vSyg4e', NULL, '213213213', 'demo', 4, 6, 1, 1, 0, '2025-02-13 10:31:28', '2025-02-13 10:31:28');

-- --------------------------------------------------------

--
-- Table structure for table `variants`
--

CREATE TABLE `variants` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `warehouses`
--

CREATE TABLE `warehouses` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `phone` varchar(191) DEFAULT NULL,
  `email` varchar(191) DEFAULT NULL,
  `address` text NOT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `print_kitchen` tinyint(4) NOT NULL DEFAULT 1,
  `slip_description` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `warehouses`
--

INSERT INTO `warehouses` (`id`, `name`, `phone`, `email`, `address`, `is_active`, `print_kitchen`, `slip_description`, `image`, `created_at`, `updated_at`) VALUES
(1, 'Bettencourt\'s Home Style Diner', '592-225-1008/592-668-2777', 'orders@bettencourtsfoods.com', 'ZZ 22 Durban Street, Wortmanville, Georgetown\r\nGuyana', 1, 1, 'Thanks For Coming', '1734026650675b259a1d095.jpg', '2024-09-20 15:09:51', '2025-02-17 06:46:51'),
(2, 'Bettencourt\'s Home Style Diner22222', '592-225-1008/592-688-9009', 'orders@bettencourtsfoods.com', 'Branch1-Bettencourt\'s Home Style Diner', 0, 1, '', NULL, '2024-11-28 01:21:11', '2024-12-09 10:23:01'),
(3, 'Bettencourt\'s Quick Serve', '592-227-7895', 'orders@bettencourtsfoods.com', 'Stall # 51 Stelling View, Stabroek Market, Georgetown\r\nGuyana', 1, 0, 'Thanks For Coming', '1734026672675b25b0326f4.jpg', '2024-11-28 01:21:51', '2024-12-12 16:42:20'),
(4, 'Bettencourt\'s Meals on Wheels', '592-688-9009', 'orders@bettencourtsfoods.com', 'Bettencourt\'s Mobile Service', 1, 1, 'Thanks', '1734026690675b25c22cf17.jpg', '2024-12-09 10:30:19', '2024-12-12 16:42:30');

-- --------------------------------------------------------

--
-- Table structure for table `zkteco`
--

CREATE TABLE `zkteco` (
  `id` int(11) NOT NULL,
  `device_name` varchar(255) NOT NULL,
  `ip_address` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `adjustments`
--
ALTER TABLE `adjustments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `attendances`
--
ALTER TABLE `attendances`
  ADD PRIMARY KEY (`id`),
  ADD KEY `date_2` (`date`);

--
-- Indexes for table `billers`
--
ALTER TABLE `billers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cash_registers`
--
ALTER TABLE `cash_registers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `challans`
--
ALTER TABLE `challans`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `couriers`
--
ALTER TABLE `couriers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer_groups`
--
ALTER TABLE `customer_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `custom_fields`
--
ALTER TABLE `custom_fields`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `deliveries`
--
ALTER TABLE `deliveries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `deposits`
--
ALTER TABLE `deposits`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `discounts`
--
ALTER TABLE `discounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `discount_plans`
--
ALTER TABLE `discount_plans`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `discount_plan_customers`
--
ALTER TABLE `discount_plan_customers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `discount_plan_discounts`
--
ALTER TABLE `discount_plan_discounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dso_alerts`
--
ALTER TABLE `dso_alerts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `expenses`
--
ALTER TABLE `expenses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `expense_categories`
--
ALTER TABLE `expense_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `external_services`
--
ALTER TABLE `external_services`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `general_settings`
--
ALTER TABLE `general_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gift_cards`
--
ALTER TABLE `gift_cards`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gift_card_recharges`
--
ALTER TABLE `gift_card_recharges`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `holidays`
--
ALTER TABLE `holidays`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hrm_settings`
--
ALTER TABLE `hrm_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `incomes`
--
ALTER TABLE `incomes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `income_categories`
--
ALTER TABLE `income_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mail_settings`
--
ALTER TABLE `mail_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `money_transfers`
--
ALTER TABLE `money_transfers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`);

--
-- Indexes for table `out_of_shifts`
--
ALTER TABLE `out_of_shifts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `packing_slips`
--
ALTER TABLE `packing_slips`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `packing_slip_products`
--
ALTER TABLE `packing_slip_products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment_with_cheque`
--
ALTER TABLE `payment_with_cheque`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment_with_credit_card`
--
ALTER TABLE `payment_with_credit_card`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment_with_gift_card`
--
ALTER TABLE `payment_with_gift_card`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment_with_paypal`
--
ALTER TABLE `payment_with_paypal`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payrolls`
--
ALTER TABLE `payrolls`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pos_setting`
--
ALTER TABLE `pos_setting`
  ADD UNIQUE KEY `pos_setting_id_unique` (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_adjustments`
--
ALTER TABLE `product_adjustments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_batches`
--
ALTER TABLE `product_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_purchases`
--
ALTER TABLE `product_purchases`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_quotation`
--
ALTER TABLE `product_quotation`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_returns`
--
ALTER TABLE `product_returns`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_sales`
--
ALTER TABLE `product_sales`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_transfer`
--
ALTER TABLE `product_transfer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_variants`
--
ALTER TABLE `product_variants`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_warehouse`
--
ALTER TABLE `product_warehouse`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `purchases`
--
ALTER TABLE `purchases`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `purchase_product_return`
--
ALTER TABLE `purchase_product_return`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `quotations`
--
ALTER TABLE `quotations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `returns`
--
ALTER TABLE `returns`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `return_purchases`
--
ALTER TABLE `return_purchases`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reward_point_settings`
--
ALTER TABLE `reward_point_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shift_days`
--
ALTER TABLE `shift_days`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sms_templates`
--
ALTER TABLE `sms_templates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stock_counts`
--
ALTER TABLE `stock_counts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tables`
--
ALTER TABLE `tables`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `taxes`
--
ALTER TABLE `taxes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transfers`
--
ALTER TABLE `transfers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `units`
--
ALTER TABLE `units`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `variants`
--
ALTER TABLE `variants`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `warehouses`
--
ALTER TABLE `warehouses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zkteco`
--
ALTER TABLE `zkteco`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accounts`
--
ALTER TABLE `accounts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `adjustments`
--
ALTER TABLE `adjustments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `attendances`
--
ALTER TABLE `attendances`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `billers`
--
ALTER TABLE `billers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `cash_registers`
--
ALTER TABLE `cash_registers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `challans`
--
ALTER TABLE `challans`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `couriers`
--
ALTER TABLE `couriers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `currencies`
--
ALTER TABLE `currencies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `customer_groups`
--
ALTER TABLE `customer_groups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `custom_fields`
--
ALTER TABLE `custom_fields`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `deliveries`
--
ALTER TABLE `deliveries`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `deposits`
--
ALTER TABLE `deposits`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `discounts`
--
ALTER TABLE `discounts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `discount_plans`
--
ALTER TABLE `discount_plans`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `discount_plan_customers`
--
ALTER TABLE `discount_plan_customers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `discount_plan_discounts`
--
ALTER TABLE `discount_plan_discounts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `dso_alerts`
--
ALTER TABLE `dso_alerts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `expenses`
--
ALTER TABLE `expenses`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `expense_categories`
--
ALTER TABLE `expense_categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `external_services`
--
ALTER TABLE `external_services`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `general_settings`
--
ALTER TABLE `general_settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `gift_cards`
--
ALTER TABLE `gift_cards`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gift_card_recharges`
--
ALTER TABLE `gift_card_recharges`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `holidays`
--
ALTER TABLE `holidays`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hrm_settings`
--
ALTER TABLE `hrm_settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `incomes`
--
ALTER TABLE `incomes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `income_categories`
--
ALTER TABLE `income_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `mail_settings`
--
ALTER TABLE `mail_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=243;

--
-- AUTO_INCREMENT for table `money_transfers`
--
ALTER TABLE `money_transfers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `out_of_shifts`
--
ALTER TABLE `out_of_shifts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `packing_slips`
--
ALTER TABLE `packing_slips`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `packing_slip_products`
--
ALTER TABLE `packing_slip_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `payment_with_cheque`
--
ALTER TABLE `payment_with_cheque`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `payment_with_credit_card`
--
ALTER TABLE `payment_with_credit_card`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment_with_gift_card`
--
ALTER TABLE `payment_with_gift_card`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment_with_paypal`
--
ALTER TABLE `payment_with_paypal`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payrolls`
--
ALTER TABLE `payrolls`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=134;

--
-- AUTO_INCREMENT for table `pos_setting`
--
ALTER TABLE `pos_setting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=188;

--
-- AUTO_INCREMENT for table `product_adjustments`
--
ALTER TABLE `product_adjustments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `product_batches`
--
ALTER TABLE `product_batches`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `product_purchases`
--
ALTER TABLE `product_purchases`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `product_quotation`
--
ALTER TABLE `product_quotation`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_returns`
--
ALTER TABLE `product_returns`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `product_sales`
--
ALTER TABLE `product_sales`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `product_transfer`
--
ALTER TABLE `product_transfer`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_variants`
--
ALTER TABLE `product_variants`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_warehouse`
--
ALTER TABLE `product_warehouse`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `purchases`
--
ALTER TABLE `purchases`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `purchase_product_return`
--
ALTER TABLE `purchase_product_return`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `quotations`
--
ALTER TABLE `quotations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `returns`
--
ALTER TABLE `returns`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `return_purchases`
--
ALTER TABLE `return_purchases`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `reward_point_settings`
--
ALTER TABLE `reward_point_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `shift_days`
--
ALTER TABLE `shift_days`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `sms_templates`
--
ALTER TABLE `sms_templates`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `stock_counts`
--
ALTER TABLE `stock_counts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tables`
--
ALTER TABLE `tables`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `taxes`
--
ALTER TABLE `taxes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `transfers`
--
ALTER TABLE `transfers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `units`
--
ALTER TABLE `units`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `variants`
--
ALTER TABLE `variants`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `warehouses`
--
ALTER TABLE `warehouses`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `zkteco`
--
ALTER TABLE `zkteco`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
