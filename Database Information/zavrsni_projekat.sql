-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 11, 2022 at 11:33 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `zavrsni_projekat`
--

-- --------------------------------------------------------

--
-- Table structure for table `companies`
--

CREATE TABLE `companies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `adress` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `account_no` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `responsible_person` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `companies`
--

INSERT INTO `companies` (`id`, `name`, `adress`, `account_no`, `email`, `responsible_person`, `created_at`, `updated_at`) VALUES
(1, 'Kompanija 1', 'Adresa bb', 'ABC7366', 'email@email.com', 'Pero Perovic', '2022-09-03 17:17:05', '2022-09-11 12:46:09'),
(2, 'Sinopharm', 'Adresa bb', 'KK0876699', 'sinopharm@email.com', 'Janko Janković', '2022-09-09 16:48:13', '2022-09-09 16:48:13');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2022_08_22_115855_create_products_table', 1),
(6, '2022_08_22_120528_create_order_statuses_table', 1),
(7, '2022_08_22_120713_create_order_types_table', 1),
(8, '2022_08_22_120835_create_companies_table', 1),
(9, '2022_08_22_121059_create_orders_table', 2),
(10, '2022_08_22_121952_create_order_products_table', 3),
(11, '2022_08_22_122143_create_stocks_table', 4),
(12, '2022_08_22_122729_create_transactions_table', 5);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `total_price` decimal(20,2) NOT NULL,
  `order_type_id` bigint(20) UNSIGNED NOT NULL,
  `company_id` bigint(20) UNSIGNED NOT NULL,
  `order_status_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `date`, `total_price`, `order_type_id`, `company_id`, `order_status_id`, `created_at`, `updated_at`) VALUES
(1, '2022-09-07', '80.32', 2, 1, 1, '2022-09-07 19:03:35', '2022-09-07 19:39:28'),
(2, '2022-09-07', '9000.00', 1, 2, 1, '2022-09-07 19:39:49', '2022-09-09 18:59:14'),
(3, '2022-09-11', '0.00', 2, 2, 1, '2022-09-11 12:54:54', '2022-09-11 12:54:54'),
(4, '2022-09-11', '0.00', 2, 2, 1, '2022-09-11 12:55:24', '2022-09-11 12:55:24'),
(5, '2022-09-11', '44.00', 2, 2, 1, '2022-09-11 12:55:42', '2022-09-11 12:57:14');

-- --------------------------------------------------------

--
-- Table structure for table `order_product`
--

CREATE TABLE `order_product` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `amount` int(11) NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_product`
--

INSERT INTO `order_product` (`id`, `amount`, `product_id`, `order_id`, `created_at`, `updated_at`) VALUES
(2, 1, 4, 1, NULL, NULL),
(10, 100, 8, 2, NULL, NULL),
(11, 4, 11, 5, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `order_statuses`
--

CREATE TABLE `order_statuses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_statuses`
--

INSERT INTO `order_statuses` (`id`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Obrada', '2022-09-04 17:54:35', '2022-09-04 17:54:35'),
(2, 'Završeno', '2022-09-04 17:56:29', '2022-09-04 17:56:54'),
(3, 'Otkazano', '2022-09-11 11:51:43', '2022-09-11 11:51:43');

-- --------------------------------------------------------

--
-- Table structure for table `order_types`
--

CREATE TABLE `order_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_types`
--

INSERT INTO `order_types` (`id`, `type`, `created_at`, `updated_at`) VALUES
(1, 'Kupovina', NULL, NULL),
(2, 'Prodaja', NULL, '2022-09-04 18:10:16');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `manifacturer` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `certificate_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(5,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `manifacturer`, `certificate_number`, `price`, `created_at`, `updated_at`) VALUES
(1, 'Apple', 'Sinopharm', 'HSZ35', '12.00', '2022-08-25 17:18:19', '2022-08-25 17:18:19'),
(2, 'Apple', 'Sinopharm', 'HSZ35', '12.00', '2022-08-25 17:18:20', '2022-08-25 17:18:20'),
(3, 'Banana', 'Montefarm', 'OO039', '80.32', '2022-08-26 08:11:29', '2022-08-26 08:11:29'),
(4, 'Banana', 'Montefarm', 'OO039', '80.32', '2022-08-26 08:11:29', '2022-08-26 08:11:29'),
(5, 'nova proba2', 'neki proizvodjac', 'HSZ35', '11.00', '2022-08-26 08:16:05', '2022-08-26 08:16:05'),
(6, 'nova proba2', 'neki proizvodjac', 'HSZ35', '11.00', '2022-08-26 08:16:06', '2022-08-26 08:16:06'),
(7, 'Proba', 'Test', 'AA9488', '13.00', '2022-08-26 08:19:51', '2022-08-26 09:01:31'),
(8, 'Proba', 'Bla', 'HSZ35', '90.00', '2022-08-26 08:31:29', '2022-08-26 08:31:29'),
(11, 'Orange', 'ja', 'blabla43', '11.00', '2022-08-30 06:29:40', '2022-08-30 06:29:40'),
(12, 'nova proba2', 'Montefarm', 'HSZ35', '12.00', '2022-08-30 06:33:48', '2022-08-30 06:33:48'),
(13, 'nova proba', 'Montefarm', 'HSZ35', '12.74', '2022-08-30 06:34:56', '2022-08-30 07:00:28'),
(14, 'Najnoviji', 'KKji', '98764', '273.99', '2022-09-09 18:50:26', '2022-09-09 18:50:26');

-- --------------------------------------------------------

--
-- Table structure for table `stocks`
--

CREATE TABLE `stocks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `amount` int(11) NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `stocks`
--

INSERT INTO `stocks` (`id`, `amount`, `product_id`, `created_at`, `updated_at`) VALUES
(1, 100, 14, '2022-09-10 13:17:15', '2022-09-10 13:17:15'),
(2, 156, 14, '2022-09-10 13:17:49', '2022-09-10 13:17:49'),
(3, -56, 14, '2022-09-10 13:18:12', '2022-09-10 13:48:05'),
(4, 266, 11, '2022-09-11 10:50:31', '2022-09-11 10:50:31'),
(5, 488, 2, '2022-09-11 10:50:39', '2022-09-11 10:50:39');

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `amount` decimal(20,2) NOT NULL,
  `company_id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `date`, `amount`, `company_id`, `order_id`, `created_at`, `updated_at`) VALUES
(1, '2022-09-08', '156.98', 1, 1, '2022-09-08 13:27:56', '2022-09-09 17:53:38'),
(2, '2022-09-11', '100.00', 2, 2, '2022-09-11 08:32:00', '2022-09-11 08:32:00');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Demo', 'demo@demo.com', NULL, '$2y$10$8m2/OBiiQ7vRn7erM0hRxOsqSPBdmj.8/n10D3nzvwcRqnJ8SkDCe', NULL, '2022-08-22 17:40:02', '2022-09-11 12:42:39');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `companies`
--
ALTER TABLE `companies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_order_type_id_foreign` (`order_type_id`),
  ADD KEY `orders_company_id_foreign` (`company_id`),
  ADD KEY `orders_order_status_id_foreign` (`order_status_id`);

--
-- Indexes for table `order_product`
--
ALTER TABLE `order_product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_products_product_id_foreign` (`product_id`),
  ADD KEY `order_products_order_id_foreign` (`order_id`);

--
-- Indexes for table `order_statuses`
--
ALTER TABLE `order_statuses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_types`
--
ALTER TABLE `order_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stocks`
--
ALTER TABLE `stocks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `stocks_product_id_foreign` (`product_id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transactions_company_id_foreign` (`company_id`),
  ADD KEY `transactions_order_id_foreign` (`order_id`);

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
-- AUTO_INCREMENT for table `companies`
--
ALTER TABLE `companies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `order_product`
--
ALTER TABLE `order_product`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `order_statuses`
--
ALTER TABLE `order_statuses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `order_types`
--
ALTER TABLE `order_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `stocks`
--
ALTER TABLE `stocks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`),
  ADD CONSTRAINT `orders_order_status_id_foreign` FOREIGN KEY (`order_status_id`) REFERENCES `order_statuses` (`id`),
  ADD CONSTRAINT `orders_order_type_id_foreign` FOREIGN KEY (`order_type_id`) REFERENCES `order_types` (`id`);

--
-- Constraints for table `order_product`
--
ALTER TABLE `order_product`
  ADD CONSTRAINT `order_products_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  ADD CONSTRAINT `order_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `stocks`
--
ALTER TABLE `stocks`
  ADD CONSTRAINT `stocks_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `transactions_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`),
  ADD CONSTRAINT `transactions_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
