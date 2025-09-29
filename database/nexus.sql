-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Máy chủ: localhost
-- Thời gian đã tạo: Th9 29, 2025 lúc 07:38 PM
-- Phiên bản máy phục vụ: 12.0.2-MariaDB
-- Phiên bản PHP: 8.4.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `nexus`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `site_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `image_json` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`image_json`)),
  `video` varchar(255) DEFAULT NULL,
  `video_json` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`video_json`)),
  `description` text DEFAULT NULL,
  `parent_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `category_product`
--

CREATE TABLE `category_product` (
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `failed_jobs`
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
-- Cấu trúc bảng cho bảng `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2025_09_29_000002_create_sites_table', 2),
(6, '2025_09_29_154856_create_categories_table', 2),
(7, '2025_09_29_162025_create_products_table', 2),
(8, '2025_09_29_162214_create_product_variants_table', 2),
(9, '2025_09_29_162336_create_category_product_table', 2),
(10, '2025_09_29_162422_create_product_tags_table', 2),
(11, '2025_09_29_162637_create_product_attributes_table', 2);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 1, 'auth_token', 'd480f2755647e75fefabb27c937aadb9be924375d2cd7f492aea1fb0ccd38944', '[\"*\"]', NULL, NULL, '2025-09-29 08:09:45', '2025-09-29 08:09:45'),
(2, 'App\\Models\\User', 1, 'auth_token', '56dd160fdae10344918bcbca33b4d7be5af980b4f1d252baa39727ebabaa617b', '[\"*\"]', NULL, NULL, '2025-09-29 08:09:46', '2025-09-29 08:09:46'),
(3, 'App\\Models\\User', 1, 'auth_token', 'e74be0e92075a5ac67750648c13b14ce9e2c106e73fe5494bdea617c38e31f49', '[\"*\"]', NULL, NULL, '2025-09-29 08:09:48', '2025-09-29 08:09:48'),
(4, 'App\\Models\\User', 1, 'auth_token', '6e8bebd98fec15a2f7e133db86ea3a80814fd6f5ddb65dd5d3cfdf03b8a1ba5e', '[\"*\"]', NULL, NULL, '2025-09-29 08:09:49', '2025-09-29 08:09:49'),
(5, 'App\\Models\\User', 1, 'auth_token', 'f51f2bdb02bf84545e3d0e68419466d8903f35f9ef04ee21b7fa609b66269441', '[\"*\"]', NULL, NULL, '2025-09-29 08:09:59', '2025-09-29 08:09:59'),
(6, 'App\\Models\\User', 1, 'auth_token', '54c8faec82230b3eaf39850134bd13808e6e1be435f90e9751f6fcc9fea33472', '[\"*\"]', NULL, NULL, '2025-09-29 08:10:00', '2025-09-29 08:10:00'),
(7, 'App\\Models\\User', 1, 'auth_token', 'b784328be6eaf10c9842f19878d4fc84f82d8e33a75dfacae211a1e2f253bcd0', '[\"*\"]', NULL, NULL, '2025-09-29 08:10:01', '2025-09-29 08:10:01'),
(8, 'App\\Models\\User', 1, 'auth_token', 'e4b3db040d0c83f89c5f98818ed932d00b52cb2512a1ab419a6390241bda0a6f', '[\"*\"]', NULL, NULL, '2025-09-29 08:10:03', '2025-09-29 08:10:03'),
(9, 'App\\Models\\User', 1, 'auth_token', '0994dd57a752057521746f9dc9ee15f6d4a94eef2f90e9bf1e1ebbe02a57236e', '[\"*\"]', NULL, NULL, '2025-09-29 08:11:31', '2025-09-29 08:11:31'),
(10, 'App\\Models\\User', 1, 'auth_token', '4bdd23a484faf70bcc0c260872cd3ece0284eb8d1344d4c22d20485a1e117d7a', '[\"*\"]', NULL, NULL, '2025-09-29 08:11:32', '2025-09-29 08:11:32'),
(11, 'App\\Models\\User', 1, 'auth_token', 'd957e057fada1dde282b8b6a59e8288348e3e3e0bd947ed4c939bfe9e0403c5f', '[\"*\"]', NULL, NULL, '2025-09-29 08:11:34', '2025-09-29 08:11:34'),
(12, 'App\\Models\\User', 1, 'auth_token', 'eb2caf99b97d4a62076fc2b9e19fce58fb17e78914d1eef9199f0dcf2fe15744', '[\"*\"]', NULL, NULL, '2025-09-29 08:11:35', '2025-09-29 08:11:35'),
(13, 'App\\Models\\User', 1, 'auth_token', '4e88e99966550fbb4ee1a484ffd2190976756c8863398b4be4bf4fd288fa966b', '[\"*\"]', NULL, NULL, '2025-09-29 08:11:36', '2025-09-29 08:11:36'),
(14, 'App\\Models\\User', 1, 'auth_token', '7e850a970961681ee79bf0efe02566dbe0909724f305c88a0dc81bd453bdf458', '[\"*\"]', NULL, NULL, '2025-09-29 08:13:10', '2025-09-29 08:13:10'),
(15, 'App\\Models\\User', 1, 'auth_token', '940bdddef9482fb31bf81f2897e5fdc1c464f4f241b0eaf8fa71444d7b14cf72', '[\"*\"]', NULL, NULL, '2025-09-29 08:13:11', '2025-09-29 08:13:11'),
(16, 'App\\Models\\User', 1, 'auth_token', '44b5849a6f0491d9ebb6f406ef16a0e543ac5de3486fdca9b0763decd2daddcb', '[\"*\"]', NULL, NULL, '2025-09-29 08:13:13', '2025-09-29 08:13:13'),
(17, 'App\\Models\\User', 1, 'auth_token', 'cdfd8717e6f2d6865bf5eacfd662e0a6fab4b5fc9b3d750be6f4ede42c3038fa', '[\"*\"]', NULL, NULL, '2025-09-29 08:13:14', '2025-09-29 08:13:14'),
(18, 'App\\Models\\User', 1, 'auth_token', '8e5de6c32797c0441d8a26407fd3137205d82a67a5a7a1b2e52e99ac69778b46', '[\"*\"]', NULL, NULL, '2025-09-29 08:15:59', '2025-09-29 08:15:59'),
(19, 'App\\Models\\User', 1, 'auth_token', '17e9b83f1f026e1734f7ae8607f8086e27875aee20e6f2025c2e89642a7c33c8', '[\"*\"]', NULL, NULL, '2025-09-29 08:16:01', '2025-09-29 08:16:01'),
(20, 'App\\Models\\User', 1, 'auth_token', '34b4266512ee2d433649c28f39eb6b71e9125a9a6a9d40bd22c69c49ff1475c2', '[\"*\"]', NULL, NULL, '2025-09-29 08:16:02', '2025-09-29 08:16:02'),
(21, 'App\\Models\\User', 1, 'auth_token', 'e7d7f47c00b43737e0f823aeebb10e0b917176bf549c3dfe5272805b92e12532', '[\"*\"]', NULL, NULL, '2025-09-29 08:16:03', '2025-09-29 08:16:03'),
(22, 'App\\Models\\User', 1, 'auth_token', '0b742d689422d61707e9e7ef30f4ec3f93f9f6aa571ff8d66a83edafeded8509', '[\"*\"]', NULL, NULL, '2025-09-29 08:18:26', '2025-09-29 08:18:26'),
(23, 'App\\Models\\User', 1, 'auth_token', 'b8968dee51179d9c6a28f1619bf062e3f25c42b04ac05ce5c49ed4224e9329d9', '[\"*\"]', NULL, NULL, '2025-09-29 08:18:27', '2025-09-29 08:18:27'),
(24, 'App\\Models\\User', 1, 'auth_token', 'f040ddc5fc12b6a20164897479b6250de46215479fab7ecee8e6a0440ab8e248', '[\"*\"]', NULL, NULL, '2025-09-29 08:18:29', '2025-09-29 08:18:29'),
(25, 'App\\Models\\User', 1, 'auth_token', 'e88f87b11cba598cecce4da57fdd6e69cd1b715aae7d7f6f0e9b0f0a6b554c25', '[\"*\"]', NULL, NULL, '2025-09-29 08:18:30', '2025-09-29 08:18:30'),
(26, 'App\\Models\\User', 1, 'auth_token', '9642095114c247f19ac263d31c04b924133b39d9918cf721c2daa7c243e226ce', '[\"*\"]', NULL, NULL, '2025-09-29 08:18:31', '2025-09-29 08:18:31'),
(28, 'App\\Models\\User', 1, 'auth_token', '0d9fd9f43074b7ff3eda7c35e3eb58cd8ec5638635a87e8cc14366746036a1e1', '[\"*\"]', NULL, NULL, '2025-09-29 08:18:53', '2025-09-29 08:18:53'),
(29, 'App\\Models\\User', 1, 'auth_token', 'c31f66c28fd0d9fec2b017528be8e55ddecad307dedb3c0ed776e54f0ec4bfb4', '[\"*\"]', NULL, NULL, '2025-09-29 08:22:52', '2025-09-29 08:22:52'),
(30, 'App\\Models\\User', 1, 'auth_token', 'b933133bcf00fbb8e15b0b9eca24991a0fe1397f681ff3262ddbe07964c11fe6', '[\"*\"]', NULL, NULL, '2025-09-29 08:22:54', '2025-09-29 08:22:54'),
(31, 'App\\Models\\User', 1, 'auth_token', '6baa5635da38ecd75fdb69b2a94ba09c5e3a74c90d5ce1e981c4e31eb7873a10', '[\"*\"]', NULL, NULL, '2025-09-29 08:22:58', '2025-09-29 08:22:58'),
(32, 'App\\Models\\User', 1, 'auth_token', '71368eb88838e5f5c16b9b36f15e8414895d51afb77fdda0ebc1bdff56cdeb0a', '[\"*\"]', NULL, NULL, '2025-09-29 08:23:20', '2025-09-29 08:23:20'),
(33, 'App\\Models\\User', 1, 'auth_token', '60724d35ad561c3be8d3b0e255db3aa98aaddab4dfc26d24a36c28755632bb05', '[\"*\"]', NULL, NULL, '2025-09-29 08:23:21', '2025-09-29 08:23:21'),
(34, 'App\\Models\\User', 1, 'auth_token', '186882a3c68a1f233a8f0cedca062b5be5435d79f7bce0c633c574a9da9b1b1e', '[\"*\"]', NULL, NULL, '2025-09-29 08:23:22', '2025-09-29 08:23:22'),
(35, 'App\\Models\\User', 1, 'auth_token', 'e386093cdd02001ce6e03edcd95b17ee7a0a15f136d1a9904eaaa49441c17afe', '[\"*\"]', NULL, NULL, '2025-09-29 08:23:23', '2025-09-29 08:23:23'),
(36, 'App\\Models\\User', 1, 'auth_token', 'f8282829141f3362f12a2505ac3b7b22c3cc500c9294a7b1d3d62d227902af17', '[\"*\"]', NULL, NULL, '2025-09-29 08:23:25', '2025-09-29 08:23:25'),
(37, 'App\\Models\\User', 1, 'auth_token', '536cda913b6b30c8d3020787ca29040f5571207c178dda9507423ab5af85fe8b', '[\"*\"]', NULL, NULL, '2025-09-29 08:23:26', '2025-09-29 08:23:26'),
(38, 'App\\Models\\User', 1, 'auth_token', '4d08f8b10b38b399f847bbd66d1fa4f40e6344f178b96319e5e11470f076facc', '[\"*\"]', NULL, NULL, '2025-09-29 08:23:28', '2025-09-29 08:23:28'),
(40, 'App\\Models\\User', 1, 'auth_token', '3281e6b8d2aad1af988846069aa78288029672bd210a6410b87ce36b0ca175ec', '[\"*\"]', NULL, NULL, '2025-09-29 08:31:08', '2025-09-29 08:31:08'),
(41, 'App\\Models\\User', 1, 'auth_token', '0e30dad620a54ac471801d92ae3e8d78b27de6d616a2b41f7cab9d32361a77b7', '[\"*\"]', NULL, NULL, '2025-09-29 08:31:09', '2025-09-29 08:31:09'),
(42, 'App\\Models\\User', 1, 'auth_token', '51332cd57232ef975685b85a1cb0d9761231a4c7ac67e27a7020d75635d2dc3c', '[\"*\"]', NULL, NULL, '2025-09-29 08:31:10', '2025-09-29 08:31:10'),
(43, 'App\\Models\\User', 1, 'auth_token', 'd20694beed1460d26116a2c508d6b4febedd4cf7c902c3d7e54255a704f79895', '[\"*\"]', NULL, NULL, '2025-09-29 08:31:11', '2025-09-29 08:31:11'),
(44, 'App\\Models\\User', 1, 'auth_token', '2f808f79c3bb36e2d22ac522c06d507c2983dbf7d660b146864713f5ae991898', '[\"*\"]', NULL, NULL, '2025-09-29 08:34:59', '2025-09-29 08:34:59'),
(45, 'App\\Models\\User', 1, 'auth_token', 'd9b595051b9651f5ee65eb85c4b8cfba2cb806dd7a18b7252eaafa8de65d048e', '[\"*\"]', NULL, NULL, '2025-09-29 08:35:00', '2025-09-29 08:35:00'),
(46, 'App\\Models\\User', 1, 'auth_token', '65080c13c835c47bbe43604d03a363448f0143ba7aa1e54bf3727443aeb5b16e', '[\"*\"]', NULL, NULL, '2025-09-29 11:10:16', '2025-09-29 11:10:16'),
(47, 'App\\Models\\User', 1, 'auth_token', '1b7f0dc4987b0915ecf0e30fdfc83a6bd556e19c3016e85b564b47b6d9404a56', '[\"*\"]', NULL, NULL, '2025-09-29 11:10:19', '2025-09-29 11:10:19'),
(48, 'App\\Models\\User', 1, 'auth_token', '96707c7af9321ec0e257ea0fe4d91f7fb658cad413bcfe52b4640904494950ee', '[\"*\"]', NULL, NULL, '2025-09-29 11:10:21', '2025-09-29 11:10:21'),
(49, 'App\\Models\\User', 1, 'auth_token', '0389969965a7863d02c8f50f061233d17f641737882c9fad8ba8e86d31007306', '[\"*\"]', NULL, NULL, '2025-09-29 11:10:47', '2025-09-29 11:10:47'),
(50, 'App\\Models\\User', 1, 'auth_token', 'f3c6651fa92216e4bc628634045dbc7d4db6dd17dc2c6d60b0e24d56bce2592c', '[\"*\"]', NULL, NULL, '2025-09-29 11:10:48', '2025-09-29 11:10:48'),
(51, 'App\\Models\\User', 1, 'auth_token', '82bc7641f88639a93c44d0f0f81fda7230f26bc1e8f2813223dbe3a83c641ee5', '[\"*\"]', NULL, NULL, '2025-09-29 11:10:50', '2025-09-29 11:10:50'),
(52, 'App\\Models\\User', 1, 'auth_token', 'fa704a14e98d1fe7024b8d948ee8303d3636f3f815864b911e0b0fac870c2bca', '[\"*\"]', NULL, NULL, '2025-09-29 11:10:59', '2025-09-29 11:10:59'),
(53, 'App\\Models\\User', 1, 'auth_token', 'd5ef38b100802c1b90ad6313be94d44634316b4a2f2a1b6ecc6ec508073068f5', '[\"*\"]', NULL, NULL, '2025-09-29 11:11:00', '2025-09-29 11:11:00'),
(54, 'App\\Models\\User', 1, 'auth_token', '1a619cf4bcc3493bf10e8bf8131dc793e5dfc70ecf9e5ee5fbddb5f5bb61bbb8', '[\"*\"]', NULL, NULL, '2025-09-29 11:11:02', '2025-09-29 11:11:02'),
(55, 'App\\Models\\User', 1, 'auth_token', 'ea783de2b667b1253e080c8957ba6b155ebf5e47ed024c4f9c25e65ed817fd71', '[\"*\"]', NULL, NULL, '2025-09-29 11:11:03', '2025-09-29 11:11:03'),
(56, 'App\\Models\\User', 1, 'auth_token', '309eba5c8001ba295201ea73b4c7d2fe2d3ad5f86aa7212a6ed05e4a4a7349c0', '[\"*\"]', NULL, NULL, '2025-09-29 11:11:04', '2025-09-29 11:11:04'),
(57, 'App\\Models\\User', 1, 'auth_token', '9ebc2f147058961aff616274a3cbdec286c1b996616287c6b88a195b6b099f3a', '[\"*\"]', NULL, NULL, '2025-09-29 11:12:09', '2025-09-29 11:12:09'),
(58, 'App\\Models\\User', 1, 'auth_token', 'e0f81571ecf4d90e5e744f891d6ee486c1eeb656238498af2d970ea770c8bd58', '[\"*\"]', NULL, NULL, '2025-09-29 11:12:10', '2025-09-29 11:12:10'),
(59, 'App\\Models\\User', 1, 'auth_token', '3e6482df6f291695eb0ad30812e706e9ee8f2a21f7b1c8dbb3dd6f38f88ef6f8', '[\"*\"]', NULL, NULL, '2025-09-29 11:12:13', '2025-09-29 11:12:13'),
(60, 'App\\Models\\User', 1, 'auth_token', '5b25ab56c7167515920ddcdcf8beb67d2a494b685edd475a851285038f840c35', '[\"*\"]', NULL, NULL, '2025-09-29 11:12:15', '2025-09-29 11:12:15'),
(61, 'App\\Models\\User', 1, 'auth_token', '2139bbc2de98f7f32bc84de36b5474553198c3c97a76ed390038429c6db200e0', '[\"*\"]', NULL, NULL, '2025-09-29 11:12:16', '2025-09-29 11:12:16'),
(62, 'App\\Models\\User', 1, 'auth_token', '4f9540c357e04969a00db7cdf49e6ee52ba9e3cd6f59ae0f839119e2eaa0b9c6', '[\"*\"]', NULL, NULL, '2025-09-29 11:12:28', '2025-09-29 11:12:28'),
(63, 'App\\Models\\User', 1, 'auth_token', '8ad3eb89819cb67dc22dc87f38efc2dd54c1bcee38bca473aa2bdeedc734de4a', '[\"*\"]', NULL, NULL, '2025-09-29 11:13:25', '2025-09-29 11:13:25'),
(64, 'App\\Models\\User', 1, 'auth_token', 'fbbd14911df27a6e6251e62385847b0d11f77c6664007c91f6df60901a85ea17', '[\"*\"]', NULL, NULL, '2025-09-29 11:13:28', '2025-09-29 11:13:28'),
(65, 'App\\Models\\User', 1, 'auth_token', '3a09ee1d993fbc580a4366880a535a187c4089e952196b5e641211f8ff56f7cb', '[\"*\"]', NULL, NULL, '2025-09-29 11:14:44', '2025-09-29 11:14:44'),
(66, 'App\\Models\\User', 1, 'auth_token', 'aeb261d8d7479b7033caf739ce6aca0374aa3de6918efdf8990ebca20a18f6bd', '[\"*\"]', NULL, NULL, '2025-09-29 11:15:06', '2025-09-29 11:15:06'),
(67, 'App\\Models\\User', 1, 'auth_token', 'f01f0c3e0f1b08b7c7770c5bec7224e9f5d202739b17042285fe6a77070db93c', '[\"*\"]', NULL, NULL, '2025-09-29 11:15:09', '2025-09-29 11:15:09'),
(68, 'App\\Models\\User', 1, 'auth_token', '6f18295165dec4ff7f08a3e57543b7a3c149779c808f7ac8ff83fcb9f27d36ae', '[\"*\"]', NULL, NULL, '2025-09-29 11:15:44', '2025-09-29 11:15:44'),
(69, 'App\\Models\\User', 1, 'auth_token', 'fa83e1d430df3fe2c53ab109eadf5c717256726ae8310e5d179680c60c75b099', '[\"*\"]', NULL, NULL, '2025-09-29 11:17:31', '2025-09-29 11:17:31'),
(70, 'App\\Models\\User', 1, 'auth_token', '8f6ad07606a1bab89b5e4d46651ae9988dcf96a2290012394de1e16d3f0ca70e', '[\"*\"]', NULL, NULL, '2025-09-29 11:18:21', '2025-09-29 11:18:21'),
(71, 'App\\Models\\User', 1, 'auth_token', '79769d427f75bad017a98b46060b1a7489329e569883920186eabc858433efcc', '[\"*\"]', NULL, NULL, '2025-09-29 11:18:40', '2025-09-29 11:18:40'),
(72, 'App\\Models\\User', 1, 'auth_token', 'a588e795e1e1ec6c65bb30e31f603413f2cc1c919896620c79b55be38c8048a3', '[\"*\"]', NULL, NULL, '2025-09-29 11:19:04', '2025-09-29 11:19:04'),
(73, 'App\\Models\\User', 1, 'auth_token', '6bb71a6a1c571e45ea9e265168c75667c3cbab51650c06ff57e7a68c16b72f6f', '[\"*\"]', NULL, NULL, '2025-09-29 11:20:15', '2025-09-29 11:20:15'),
(74, 'App\\Models\\User', 1, 'auth_token', '4f1166d3fdb6e304a90c8858c629c2cf7147a9d218615773e54fb5f67a2d21eb', '[\"*\"]', NULL, NULL, '2025-09-29 11:21:05', '2025-09-29 11:21:05'),
(75, 'App\\Models\\User', 1, 'auth_token', '58cd583ffa8edf2ac5fdf3db2c4c7e5de0b219e959c07fe21a6ad9c54160650d', '[\"*\"]', NULL, NULL, '2025-09-29 11:21:40', '2025-09-29 11:21:40'),
(76, 'App\\Models\\User', 1, 'auth_token', '0e816a49fda0f0a404b39691c3b3490ddc6156b9cd5d1dbb9ffda8ec814b4f94', '[\"*\"]', NULL, NULL, '2025-09-29 11:21:42', '2025-09-29 11:21:42'),
(77, 'App\\Models\\User', 1, 'auth_token', '4fbf216982f8b9efbdb27fafc5c76e06bf16bbaf1586a956af4ce51ff5c37408', '[\"*\"]', NULL, NULL, '2025-09-29 11:24:00', '2025-09-29 11:24:00'),
(78, 'App\\Models\\User', 1, 'auth_token', 'eb2322aec84ebff82cd802e3da042a411a96fb95400560f962c8b4944daae1db', '[\"*\"]', NULL, NULL, '2025-09-29 11:24:01', '2025-09-29 11:24:01'),
(79, 'App\\Models\\User', 1, 'auth_token', '543a2e2de5be31609722b1d252ef21c6566186518ecb5b4969ac5196de1e5389', '[\"*\"]', NULL, NULL, '2025-09-29 11:24:03', '2025-09-29 11:24:03'),
(80, 'App\\Models\\User', 1, 'auth_token', '9484ce85a3c06c08ef8d85f5ef97e4efb403d267ecf7673666471a62c6a9c076', '[\"*\"]', NULL, NULL, '2025-09-29 11:24:20', '2025-09-29 11:24:20'),
(81, 'App\\Models\\User', 1, 'auth_token', '211acc41b6a995ca15a3f1fd552b2dbf05067de2ec4070fbb56712a2366bb4ac', '[\"*\"]', NULL, NULL, '2025-09-29 11:24:22', '2025-09-29 11:24:22'),
(82, 'App\\Models\\User', 1, 'auth_token', '31100d5a0af080dbbe0c7d33e23475cf1505550e2d43af62d0379ec39e3eda3a', '[\"*\"]', NULL, NULL, '2025-09-29 11:24:23', '2025-09-29 11:24:23'),
(83, 'App\\Models\\User', 1, 'auth_token', 'cbbcd3255d14d04e212a53f3fe5f0afe3062f482ec516a904c242e55d967879b', '[\"*\"]', NULL, NULL, '2025-09-29 11:24:24', '2025-09-29 11:24:24');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `site_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `image_json` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`image_json`)),
  `video` varchar(255) DEFAULT NULL,
  `video_json` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`video_json`)),
  `description` text DEFAULT NULL,
  `sku` varchar(255) DEFAULT NULL,
  `price` decimal(12,2) NOT NULL DEFAULT 0.00,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_attributes`
--

CREATE TABLE `product_attributes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `value` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_tag`
--

CREATE TABLE `product_tag` (
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `tag_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_variants`
--

CREATE TABLE `product_variants` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `sku` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `price` decimal(12,2) DEFAULT NULL,
  `stock` int(11) NOT NULL DEFAULT 0,
  `attributes` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`attributes`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sites`
--

CREATE TABLE `sites` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `owner_id` bigint(20) UNSIGNED NOT NULL,
  `domain` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `logo_url` varchar(255) DEFAULT NULL,
  `settings` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`settings`)),
  `language` varchar(10) NOT NULL DEFAULT 'vn',
  `timezone` varchar(50) NOT NULL DEFAULT 'UTC',
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tags`
--

CREATE TABLE `tags` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
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
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Tran Minh Anh', 'test@example.com', NULL, '$2y$12$C3m/YP27yNZqsoiDIsy2n.ehX.BFJy79VVAmmlUsJvNBVbCEXmYYe', NULL, '2025-09-29 07:44:48', '2025-09-29 07:44:48');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_site_id_slug_unique` (`site_id`,`slug`),
  ADD KEY `categories_parent_id_foreign` (`parent_id`);

--
-- Chỉ mục cho bảng `category_product`
--
ALTER TABLE `category_product`
  ADD PRIMARY KEY (`product_id`,`category_id`),
  ADD KEY `category_product_category_id_foreign` (`category_id`);

--
-- Chỉ mục cho bảng `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Chỉ mục cho bảng `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Chỉ mục cho bảng `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `products_slug_unique` (`slug`),
  ADD KEY `products_site_id_foreign` (`site_id`);

--
-- Chỉ mục cho bảng `product_attributes`
--
ALTER TABLE `product_attributes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_attributes_product_id_foreign` (`product_id`);

--
-- Chỉ mục cho bảng `product_tag`
--
ALTER TABLE `product_tag`
  ADD PRIMARY KEY (`product_id`,`tag_id`),
  ADD KEY `product_tag_tag_id_foreign` (`tag_id`);

--
-- Chỉ mục cho bảng `product_variants`
--
ALTER TABLE `product_variants`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `product_variants_sku_unique` (`sku`),
  ADD KEY `product_variants_product_id_foreign` (`product_id`);

--
-- Chỉ mục cho bảng `sites`
--
ALTER TABLE `sites`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sites_owner_id_foreign` (`owner_id`);

--
-- Chỉ mục cho bảng `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tags_name_unique` (`name`),
  ADD UNIQUE KEY `tags_slug_unique` (`slug`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT cho bảng `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=84;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `product_attributes`
--
ALTER TABLE `product_attributes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `product_variants`
--
ALTER TABLE `product_variants`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `sites`
--
ALTER TABLE `sites`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `tags`
--
ALTER TABLE `tags`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Ràng buộc đối với các bảng kết xuất
--

--
-- Ràng buộc cho bảng `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `categories_site_id_foreign` FOREIGN KEY (`site_id`) REFERENCES `sites` (`id`) ON DELETE CASCADE;

--
-- Ràng buộc cho bảng `category_product`
--
ALTER TABLE `category_product`
  ADD CONSTRAINT `category_product_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `category_product_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Ràng buộc cho bảng `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_site_id_foreign` FOREIGN KEY (`site_id`) REFERENCES `sites` (`id`) ON DELETE CASCADE;

--
-- Ràng buộc cho bảng `product_attributes`
--
ALTER TABLE `product_attributes`
  ADD CONSTRAINT `product_attributes_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Ràng buộc cho bảng `product_tag`
--
ALTER TABLE `product_tag`
  ADD CONSTRAINT `product_tag_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_tag_tag_id_foreign` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`) ON DELETE CASCADE;

--
-- Ràng buộc cho bảng `product_variants`
--
ALTER TABLE `product_variants`
  ADD CONSTRAINT `product_variants_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Ràng buộc cho bảng `sites`
--
ALTER TABLE `sites`
  ADD CONSTRAINT `sites_owner_id_foreign` FOREIGN KEY (`owner_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
