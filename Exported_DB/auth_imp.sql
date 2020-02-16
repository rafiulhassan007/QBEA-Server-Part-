-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 16, 2020 at 04:16 PM
-- Server version: 10.3.16-MariaDB
-- PHP Version: 7.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `auth_imp`
--

-- --------------------------------------------------------

--
-- Table structure for table `attendance`
--

CREATE TABLE `attendance` (
  `id` int(11) NOT NULL,
  `event_id` int(11) NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `datetime` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `attendance`
--

INSERT INTO `attendance` (`id`, `event_id`, `user_id`, `datetime`) VALUES
(5, 1, 4, '2019-07-27'),
(8, 6, 4, '2019-07-27'),
(9, 6, 4, '2019-07-26'),
(10, 6, 4, '2019-07-25'),
(13, 9, 4, '2019-07-28'),
(15, 11, 4, '2019-08-04');

-- --------------------------------------------------------

--
-- Table structure for table `enrolled`
--

CREATE TABLE `enrolled` (
  `id` int(11) NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `event_id` int(11) NOT NULL,
  `accepted` varchar(10) NOT NULL COMMENT 'true,false'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `enrolled`
--

INSERT INTO `enrolled` (`id`, `user_id`, `event_id`, `accepted`) VALUES
(1, 4, 1, 'true'),
(2, 6, 1, 'false'),
(3, 4, 6, 'false'),
(6, 4, 3, 'false'),
(7, 4, 2, 'true'),
(8, 7, 2, 'true'),
(9, 6, 6, 'true'),
(10, 4, 9, 'false'),
(11, 4, 11, 'false');

-- --------------------------------------------------------

--
-- Table structure for table `event`
--

CREATE TABLE `event` (
  `id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `code` varchar(20) NOT NULL,
  `status` varchar(10) NOT NULL,
  `description` varchar(200) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `user_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `event`
--

INSERT INTO `event` (`id`, `title`, `code`, `status`, `description`, `created_at`, `user_id`) VALUES
(1, 'Class 5', '123', 'inactive', 'Class 5 Students', '2019-07-26 18:21:56', 6),
(2, 'Data science', '12', 'inactive', 'event on data science', '2019-07-26 19:16:47', 4),
(3, 'Section a', 'a1', 'inactive', 'good event', '2019-07-26 21:00:00', 4),
(4, 'Section b', 'b1', 'inactive', 'nice event', '2019-07-26 21:04:26', 4),
(5, 'Section c', 'c1', 'inactive', 'i like this event', '2019-07-26 21:05:20', 4),
(6, 'Lecture On AI', '121', 'inactive', 'really good event', '2019-07-27 05:42:49', 4),
(7, 'Lecture On Machine Learning', '11111', 'inactive', 'eeeee', '2019-07-27 06:56:57', 4),
(8, 'About Robotics', '911', 'inactive', 'eeeee', '2019-07-27 06:57:42', 4),
(9, 'Android Workshop', '1234', 'active', 'ddd2', '2019-07-28 05:21:17', 6),
(10, 'my Event 1', '12345', 'inactive', 'event 1', '2019-07-28 05:25:16', 6),
(11, 'android workshop', '0123', 'inactive', '123', '2019-08-04 08:37:05', 6);

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
(3, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(4, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(5, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(6, '2016_06_01_000004_create_oauth_clients_table', 1),
(7, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('0869464c9f9e831d96f5f46c4a2ccfa6da675b74b7bcb30718e7c76ae442010b3ba8d0fb511c539d', 4, 1, 'authToken', '[]', 0, '2019-07-26 09:15:02', '2019-07-26 09:15:02', '2020-07-26 15:15:02'),
('0b2249c537e1072377514bcf6f787b089aa1f93cc409ad1ebd61755c466572aee86ecf8f5e7caddd', 4, 1, 'authToken', '[]', 0, '2019-07-27 23:13:10', '2019-07-27 23:13:10', '2020-07-28 05:13:10'),
('0c418f83dcc5f335260238a0da4c1fe4a732910c00f39f6d8b750cb00ecc0375bb0041008e407fd8', 6, 1, 'authToken', '[]', 0, '2019-07-27 22:42:10', '2019-07-27 22:42:10', '2020-07-28 04:42:10'),
('0d6c40012b11a2e6b19d5351156f23c08fc636628754fa6059b16a1326564ae659718cb3b22ba706', 6, 1, 'authToken', '[]', 0, '2019-07-26 08:05:09', '2019-07-26 08:05:09', '2020-07-26 14:05:09'),
('155b9ded326956102b99240ea43de25f0a5a9de9d0df6143c436bb6a0c22619d020a35d88a8b8e93', 4, 1, 'authToken', '[]', 0, '2019-07-27 22:37:34', '2019-07-27 22:37:34', '2020-07-28 04:37:34'),
('1af22a250fa31e34d217d1a8546bc6b34f0e978db52bfa5071a0da884ec55e29dc333685c1cc9e06', 4, 1, 'authToken', '[]', 0, '2019-07-26 06:11:04', '2019-07-26 06:11:04', '2020-07-26 12:11:04'),
('29f56f9f30d3271576d637d0cd2397e31c4cfc580fcb17e180ec4404719ff756ae7f459d89ee6841', 4, 1, 'authToken', '[]', 0, '2019-07-26 04:11:07', '2019-07-26 04:11:07', '2020-07-26 10:11:07'),
('2a92525a9df8e2936735c9a66141e8e4508386ef20cb0ab56cdd2d0ed66b3ef0e2643dc0833eef61', 4, 1, 'authToken', '[]', 0, '2019-07-26 06:03:21', '2019-07-26 06:03:21', '2020-07-26 12:03:21'),
('2b3b297db568d8599110cd0c3508e2c865010009b257f2aa18991bf3c77f4578d1eb8879d8cb02a3', 4, 1, 'authToken', '[]', 0, '2019-07-26 09:22:58', '2019-07-26 09:22:58', '2020-07-26 15:22:58'),
('2fc44064800131181c04326e0edfa824aa78a78450dc7a04f07f1c8ade34509b7a249dd9eb5fbadd', 7, 1, 'authToken', '[]', 0, '2019-07-26 08:08:14', '2019-07-26 08:08:14', '2020-07-26 14:08:14'),
('386870e55fee79a57489415ce6403138c20562c66f4edb2058ac23df3109e59625f8d5c7184cd88b', 10, 1, 'authToken', '[]', 0, '2019-07-26 08:11:46', '2019-07-26 08:11:46', '2020-07-26 14:11:46'),
('3d85404772cf26f8e33f8e1afa41add9abebe333bb133f62754ca644741a2c76659fe7e4b01514c4', 6, 1, 'authToken', '[]', 0, '2019-08-04 02:10:50', '2019-08-04 02:10:50', '2020-08-04 08:10:50'),
('447574689ac5fcd90ee56be1a249c3665f18a9120e9490af46bc818d9d88dae8dca8a28131c65f02', 4, 1, 'authToken', '[]', 0, '2019-07-27 15:24:57', '2019-07-27 15:24:57', '2020-07-27 21:24:57'),
('486f997744a76873d383826e17d81fa035356dfd43ebe570fb581fce15e0c652e12e83b04ee7cf42', 2, 1, 'authToken', '[]', 0, '2019-07-26 04:01:52', '2019-07-26 04:01:52', '2020-07-26 10:01:52'),
('4cf8856e01106746bf6646adf080396ef32f159ea6456d2e69bf87ce49d22e138476d1a33e56f64d', 4, 1, 'authToken', '[]', 0, '2019-07-27 04:07:45', '2019-07-27 04:07:45', '2020-07-27 10:07:45'),
('622fe78f4b81a8044005d7032889e555ce2fae185a2ca644ffab0f06a14fbc232d0a1cd53e56ab76', 9, 1, 'authToken', '[]', 0, '2019-07-26 08:10:06', '2019-07-26 08:10:06', '2020-07-26 14:10:06'),
('638b5018d6defe2612efa2b2b6d87d308c52cb2adc57608f2ff21582526c81ba2f9e0e4cd549dbd5', 4, 1, 'authToken', '[]', 0, '2019-07-27 22:37:34', '2019-07-27 22:37:34', '2020-07-28 04:37:34'),
('6b53930636752aed2d0d97ca87cf93dac7093619ea93c0cda85f3bec0cfc211b0ed2371afd37f42f', 4, 1, 'authToken', '[]', 0, '2019-07-27 00:23:50', '2019-07-27 00:23:50', '2020-07-27 06:23:50'),
('6d9558a680da5f9a4ce50801f9c82daa92a5081b14a5713f4245b6e57d554469bf01f3c62c4242bf', 7, 1, 'authToken', '[]', 0, '2019-07-27 14:57:15', '2019-07-27 14:57:15', '2020-07-27 20:57:15'),
('718608056d0dbfe513140ad55cc4fff624343ef64a0902f203c43d0692d81027b673cc7ca08448ca', 4, 1, 'authToken', '[]', 0, '2019-07-27 04:41:21', '2019-07-27 04:41:21', '2020-07-27 10:41:21'),
('798fa15b1575deea3d7305dc3f4112428369f2ffb3983422ddbe8c4d261478b23f4dfd66b0e93107', 4, 1, 'authToken', '[]', 0, '2019-07-26 06:11:09', '2019-07-26 06:11:09', '2020-07-26 12:11:09'),
('7e57c4889b5f3dd49f3119c0a44f2e3a90705c6c96f798b03f89ca2bde7f1da7f39a89136bb257af', 4, 1, 'authToken', '[]', 0, '2019-07-26 09:15:09', '2019-07-26 09:15:09', '2020-07-26 15:15:09'),
('85a5e54707ed8ae6ee8e839dfb2665a2fa5a14201655a565f45da6a082a46c8e8bc695b40394843e', 4, 1, 'authToken', '[]', 0, '2019-07-26 13:15:26', '2019-07-26 13:15:26', '2020-07-26 19:15:26'),
('8d0159f65c7fe3b85502a339b44ae342537cb333a879201e5334fab9ed858018779ce4b4cf00cd84', 6, 1, 'authToken', '[]', 0, '2019-07-27 23:34:53', '2019-07-27 23:34:53', '2020-07-28 05:34:53'),
('91bf3dd162583f90d3969f235e0cee5037696f7381d45def6d20f67e63117c1b4f44140ef9bce1ee', 4, 1, 'authToken', '[]', 0, '2019-07-27 23:35:26', '2019-07-27 23:35:26', '2020-07-28 05:35:26'),
('94551d681aac75001255391976fddc9f80b5751e2cac84cff613cdb4d3c0dadbf107266b788869d4', 4, 1, 'authToken', '[]', 0, '2019-07-26 09:27:31', '2019-07-26 09:27:31', '2020-07-26 15:27:31'),
('956b233d9383e65010b06db8d3463c8376fd6bdee26e2d3ed0bccc9f5c2c8cbc51688066aa919a05', 4, 1, 'authToken', '[]', 0, '2019-07-26 23:26:00', '2019-07-26 23:26:00', '2020-07-27 05:26:00'),
('9928f0f4d180b367dc7f4d87514631029377392f5b1ceb68b4af21362324b03247f04c09a24a701e', 4, 1, 'authToken', '[]', 0, '2019-07-26 04:11:25', '2019-07-26 04:11:25', '2020-07-26 10:11:25'),
('a0f45a995a81171e6a2575d6b13c9cea78dae40ff1dbcad6d39bac2ce87a730bf218d7f8788806e7', 4, 1, 'authToken', '[]', 0, '2019-08-19 18:10:42', '2019-08-19 18:10:42', '2020-08-20 00:10:42'),
('b286925d3f6ff7c6a19102441eb312d4f658e032539c9900d3c28f19cf626c020ab47f0602d4ff23', 4, 1, 'authToken', '[]', 0, '2019-07-26 23:41:04', '2019-07-26 23:41:04', '2020-07-27 05:41:04'),
('b2ae1751a93bf3eab32a215c5637a6289ed02cbfc5a598a1c095bc08b84eab992255f2a362e6296f', 8, 1, 'authToken', '[]', 0, '2019-07-26 08:08:53', '2019-07-26 08:08:53', '2020-07-26 14:08:53'),
('b9786c19f6233204c0d1b5290833ef75e0eb4af84e5b47bdb78548a874fa7e945621f1c5c1737759', 6, 1, 'authToken', '[]', 0, '2019-07-27 22:57:03', '2019-07-27 22:57:03', '2020-07-28 04:57:03'),
('c2279086d08f1687e1601674beec0508f6faa1a65054f44144d210fc5505bcf4b6e87485aa98c59a', 6, 1, 'authToken', '[]', 0, '2019-07-28 02:29:37', '2019-07-28 02:29:37', '2020-07-28 08:29:37'),
('c592219c0a61e4750980461f3ed61e91dda5771033c49b0d1b506b8d0587953108afa147f70cbf11', 6, 1, 'authToken', '[]', 0, '2019-07-27 23:22:12', '2019-07-27 23:22:12', '2020-07-28 05:22:12'),
('ca4715705c705704acdb095762fa6b2f7536ec0f885231bf24cbd66dce1526d67bff3e55da7da428', 4, 1, 'authToken', '[]', 0, '2019-07-28 06:50:30', '2019-07-28 06:50:30', '2020-07-28 12:50:30'),
('dd1b36ca2486ddbb80dc0fd5097f9d49caef30648b4127233353a2abf12ae7a5af13772c4cdade33', 3, 1, 'authToken', '[]', 0, '2019-07-26 04:04:41', '2019-07-26 04:04:41', '2020-07-26 10:04:41'),
('df5213bcfedf1b83da6977ce529e7d81440134d5568636956b53c599e0978c4711847a55ca1b5bf3', 4, 1, 'authToken', '[]', 0, '2019-07-26 09:29:21', '2019-07-26 09:29:21', '2020-07-26 15:29:21'),
('e8f6562d17d04a96ccf8be3ea67742a315d506e71931cec96528ad7072f808a066c4dfe9923f117c', 5, 1, 'authToken', '[]', 0, '2019-07-26 07:58:50', '2019-07-26 07:58:50', '2020-07-26 13:58:50'),
('ed4e6f296dee88d3bf64955849c3d57960c31866bd6d4b63f2cc25e0db318c32ba8a2fdd8bdf2e3c', 4, 1, 'authToken', '[]', 0, '2019-07-26 09:34:43', '2019-07-26 09:34:43', '2020-07-26 15:34:43'),
('ff3ea390cd289931cd6006c6eda5f549dfed5670b0651a3e23ee1b48d7e01db74abf970b340e2219', 4, 1, 'authToken', '[]', 0, '2019-07-26 23:42:36', '2019-07-26 23:42:36', '2020-07-27 05:42:36');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Laravel Personal Access Client', 'r7v9aaUWRqLDuOWX9TSQau12ypfmNUUvDPRCnIx7', 'http://localhost', 1, 0, 0, '2019-07-26 04:00:42', '2019-07-26 04:00:42'),
(2, NULL, 'Laravel Password Grant Client', '7CBVRegoSP7DTwJGDxyjV4mjaeoFMcm3pNubgVpy', 'http://localhost', 0, 1, 0, '2019-07-26 04:00:42', '2019-07-26 04:00:42');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2019-07-26 04:00:42', '2019-07-26 04:00:42');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
-- Table structure for table `qrdata`
--

CREATE TABLE `qrdata` (
  `id` int(11) NOT NULL,
  `event_id` int(11) NOT NULL,
  `data_1` varchar(100) NOT NULL,
  `data_2` varchar(100) NOT NULL,
  `datetime` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `qrdata`
--

INSERT INTO `qrdata` (`id`, `event_id`, `data_1`, `data_2`, `datetime`) VALUES
(1, 1, '', '', '2019-08-04 08:27:00'),
(2, 8, '', '', '2019-08-19 23:54:25'),
(3, 7, '', '', '2019-07-27 08:08:34'),
(4, 6, '', '', '2019-07-28 05:11:54'),
(5, 1, '', '', '2019-07-27 08:28:21'),
(6, 2, '', '', '2019-07-28 12:46:01'),
(7, 3, '', '', '2019-07-27 08:28:33'),
(8, 4, '', '', '2019-07-27 08:28:38'),
(9, 5, '', '', '2019-08-19 23:53:38'),
(10, 9, 'khEhrnjz70', 'not Assigned', '2019-08-04 08:27:17'),
(11, 10, '', '', '2019-07-28 05:25:16'),
(12, 11, '', '', '2019-08-04 08:39:23');

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
(4, 'Rafiul-1', 'rafiulhassan007@gmail.com', NULL, '$2y$10$TnI/9DXgIL0SplLgT5tKs.Nh8Uar4gInRgbQlVyQxw4aXy.mgzl5W', NULL, '2019-07-26 04:11:06', '2019-07-26 04:11:06'),
(5, 'qqqqqq', 'hajaai@gmail.com', NULL, '$2y$10$T6mFNp886cb9rLeAuTR.VO3ZRPq9pVdQgFGeM5tO6OPqwg0mwNJfO', NULL, '2019-07-26 07:58:50', '2019-07-26 07:58:50'),
(6, 'Rafiul-2', 'rafiulhassan006@gmail.com', NULL, '$2y$10$32b2dfi7tmNg3wpkjy8/w.bbZ8OI33bCqYVdcRjJUaPtR8IZqYzJy', NULL, '2019-07-26 08:05:09', '2019-07-26 08:05:09'),
(7, 'rafiul', 'rafi007@gmail.com', NULL, '$2y$10$WGi/eReEwTIQjQHFR4bQaOwoFDULFFb7P/CeBlJ2HoQZ1aVCCvlSK', NULL, '2019-07-26 08:08:13', '2019-07-26 08:08:13'),
(8, 'rafiul-3', 'rafi0034@gmail.com', NULL, '$2y$10$jTb1TY0Vea45j06UsW/Fdue5DWhDsG3aA/XYhCamTqHgwFlTyD5l.', NULL, '2019-07-26 08:08:53', '2019-07-26 08:08:53'),
(9, 'yyyyy', 'ffttyy@gmail.com', NULL, '$2y$10$3dgzTSIBHBlgRjVvk9JL2ueXhixvy9xlRn4QerGSjMRF0MQ56Crl.', NULL, '2019-07-26 08:10:06', '2019-07-26 08:10:06'),
(10, 'rrrt', 'rafi0071@gmail.com', NULL, '$2y$10$TubLNZgmrOJqyN4KwVj.PeUyjMtWTF6dSDIWDjli9YPQ.uvo2YEa.', NULL, '2019-07-26 08:11:46', '2019-07-26 08:11:46');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `attendance`
--
ALTER TABLE `attendance`
  ADD PRIMARY KEY (`id`),
  ADD KEY `event_id` (`event_id`,`user_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `enrolled`
--
ALTER TABLE `enrolled`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`,`event_id`),
  ADD KEY `event_id` (`event_id`);

--
-- Indexes for table `event`
--
ALTER TABLE `event`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_personal_access_clients_client_id_index` (`client_id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `qrdata`
--
ALTER TABLE `qrdata`
  ADD PRIMARY KEY (`id`),
  ADD KEY `event_id` (`event_id`);

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
-- AUTO_INCREMENT for table `attendance`
--
ALTER TABLE `attendance`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `enrolled`
--
ALTER TABLE `enrolled`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `event`
--
ALTER TABLE `event`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `qrdata`
--
ALTER TABLE `qrdata`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `attendance`
--
ALTER TABLE `attendance`
  ADD CONSTRAINT `attendance_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `attendance_ibfk_2` FOREIGN KEY (`event_id`) REFERENCES `event` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `enrolled`
--
ALTER TABLE `enrolled`
  ADD CONSTRAINT `enrolled_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `enrolled_ibfk_2` FOREIGN KEY (`event_id`) REFERENCES `event` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `event`
--
ALTER TABLE `event`
  ADD CONSTRAINT `event_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `qrdata`
--
ALTER TABLE `qrdata`
  ADD CONSTRAINT `qrdata_ibfk_1` FOREIGN KEY (`event_id`) REFERENCES `event` (`id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
