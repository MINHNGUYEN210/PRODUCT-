-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: localhost:3306
-- Thời gian đã tạo: Th6 07, 2024 lúc 12:32 PM
-- Phiên bản máy phục vụ: 10.6.17-MariaDB-cll-lve
-- Phiên bản PHP: 8.1.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `dichvur5_api`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `affiliates`
--

CREATE TABLE `affiliates` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL COMMENT 'NGƯỜI NHẬN ',
  `user_id_nap` int(11) NOT NULL,
  `user_name` varchar(255) DEFAULT NULL COMMENT 'NGƯỜI nhận ',
  `order_code` varchar(255) NOT NULL,
  `ref_id` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `ip` varchar(255) DEFAULT NULL,
  `module` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL COMMENT 'purchase, renew',
  `percent` double DEFAULT NULL,
  `fixed` double DEFAULT NULL,
  `currency_id` int(11) DEFAULT NULL,
  `currency_code` varchar(50) DEFAULT NULL,
  `order_price` double DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `seri_the` varchar(50) DEFAULT NULL,
  `status` varchar(50) NOT NULL DEFAULT 'xuly' COMMENT 'xuly, hoantat, huy',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chargings`
--

CREATE TABLE `chargings` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `code` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL COMMENT 'Mã nạp',
  `serial` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL COMMENT 'Serial',
  `telco` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL COMMENT 'Nhà mạng',
  `post_value` double DEFAULT NULL COMMENT 'Mệnh giá khách khai báo',
  `real_value` double DEFAULT NULL COMMENT 'Mệnh giá thực',
  `fees` double DEFAULT NULL,
  `penalty` double DEFAULT NULL,
  `provider_amount` double(22,0) DEFAULT NULL,
  `amount` double DEFAULT NULL COMMENT 'Số tiền sẽ nhận về',
  `profit` double(22,0) DEFAULT 0,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `method` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL COMMENT 'Cách gửi dữ liệu: WEB or API',
  `request_id` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL COMMENT 'Merchant request_id',
  `partner_id` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL COMMENT 'Merchant partner_id',
  `provider` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `provider_trans_id` varchar(100) DEFAULT NULL,
  `description` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `admin_note` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `ipaddress` varchar(255) DEFAULT NULL,
  `callback` varchar(255) DEFAULT NULL,
  `callback_try` tinyint(4) DEFAULT NULL COMMENT 'Số lần gọi',
  `return_code` varchar(50) DEFAULT NULL,
  `client_info` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chargings_log`
--

CREATE TABLE `chargings_log` (
  `id` int(11) NOT NULL,
  `charging_id` int(11) DEFAULT NULL,
  `provider_logs` mediumtext DEFAULT NULL,
  `merchant_logs` mediumtext DEFAULT NULL,
  `merchant_response` mediumtext DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `chargings_log`
--

INSERT INTO `chargings_log` (`id`, `charging_id`, `provider_logs`, `merchant_logs`, `merchant_response`, `updated_at`, `created_at`) VALUES
(1, 1, ' {\n    \"status\": \"100\",\n    \"message\": \"Api key khu00f4ng hu1ee3p lu1ec7\"\n}______', '', NULL, NULL, '2024-05-10 09:52:27'),
(2, 2, ' {\"status\":102,\"message\":\"MERCHANT_NOT_EXISTED_OR_OFF\"}______', '', NULL, NULL, '2024-06-05 10:42:06'),
(3, 3, ' {\"status\":102,\"message\":\"MERCHANT_NOT_EXISTED_OR_OFF\"}______', '', NULL, NULL, '2024-06-05 10:42:07'),
(4, 4, ' {\"status\":102,\"message\":\"MERCHANT_NOT_EXISTED_OR_OFF\"}______', '', NULL, NULL, '2024-06-05 10:43:38'),
(5, 5, ' {\"status\":102,\"message\":\"MERCHANT_NOT_EXISTED_OR_OFF\"}______', '', NULL, NULL, '2024-06-05 10:43:39');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chiet_khau`
--

CREATE TABLE `chiet_khau` (
  `id` int(11) NOT NULL,
  `telco` varchar(255) DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `value` int(11) NOT NULL DEFAULT 0,
  `nhom_ck_1` float NOT NULL DEFAULT 0,
  `lai_nhom_ck_1` float NOT NULL DEFAULT 0,
  `nhom_ck_2` float NOT NULL DEFAULT 0,
  `lai_nhom_ck_2` float NOT NULL DEFAULT 0,
  `nhom_ck_3` float NOT NULL DEFAULT 0,
  `lai_nhom_ck_3` float NOT NULL DEFAULT 0,
  `nhom_ck_4` float DEFAULT NULL,
  `lai_nhom_ck_4` float NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Đang đổ dữ liệu cho bảng `chiet_khau`
--

INSERT INTO `chiet_khau` (`id`, `telco`, `name`, `value`, `nhom_ck_1`, `lai_nhom_ck_1`, `nhom_ck_2`, `lai_nhom_ck_2`, `nhom_ck_3`, `lai_nhom_ck_3`, `nhom_ck_4`, `lai_nhom_ck_4`) VALUES
(1, 'VIETTEL', 'Viettel', 10000, 12, 0.7, 11.8, 0.5, 12.3, 0.2, 11.3, 0),
(2, 'VIETTEL', '', 20000, 12, 0.7, 11.8, 0.5, 11.5, 0.2, 11.3, 0),
(3, 'VIETTEL', '', 30000, 12, 0.7, 11.8, 0.5, 11.5, 0.2, 11.3, 0),
(4, 'VIETTEL', '', 50000, 10, 0.7, 9.8, 0.5, 9.5, 0.2, 9.3, 0),
(5, 'VIETTEL', '', 100000, 10, 0.7, 9.8, 0.5, 9.5, 0.2, 9.3, 0),
(6, 'VIETTEL', '', 200000, 11, 0.7, 10.8, 0.5, 10.5, 0.2, 10.3, 0),
(7, 'VIETTEL', '', 300000, 11, 0.7, 10.8, 0.5, 10.5, 0.2, 10.3, 0),
(8, 'VIETTEL', '', 500000, 12, 0.7, 11.8, 0.5, 11.5, 0.2, 11.3, 0),
(9, 'VIETTEL', '', 1000000, 12, 0.7, 11.8, 0.5, 11.5, 0.2, 11.3, 0),
(10, 'VINAPHONE', 'Vinaphone', 10000, 11, 0.7, 10.8, 0.5, 10.5, 0.2, 10.3, 0),
(11, 'VINAPHONE', '', 20000, 11, 0.7, 10.8, 0.5, 10.5, 0.2, 10.3, 0),
(12, 'VINAPHONE', '', 30000, 11, 0.7, 10.8, 0.5, 10.5, 0.2, 10.3, 0),
(13, 'VINAPHONE', '', 50000, 11, 0.7, 10.8, 0.5, 10.5, 0.2, 10.3, 0),
(14, 'VINAPHONE', '', 100000, 11, 0.7, 10.8, 0.5, 10.5, 0.2, 10.3, 0),
(15, 'VINAPHONE', '', 200000, 11, 0.7, 10.8, 0.5, 10.5, 0.2, 10.3, 0),
(16, 'VINAPHONE', '', 300000, 11, 0.7, 10.8, 0.5, 10.5, 0.2, 10.3, 0),
(17, 'VINAPHONE', '', 500000, 11.5, 0.7, 11.3, 0.5, 11, 0.2, 10.8, 0),
(19, 'MOBIFONE', 'Mobifone', 10000, 20.5, 1.2, 19.8, 0.5, 19.5, 0.2, 19.3, 0),
(20, 'MOBIFONE', '', 20000, 20.5, 1.2, 19.8, 0.5, 19.5, 0.2, 19.3, 0),
(21, 'MOBIFONE', '', 30000, 20.5, 1.2, 19.8, 0.5, 19.5, 0.2, 19.3, 0),
(22, 'MOBIFONE', '', 50000, 20.5, 1.2, 19.8, 0.5, 19.5, 0.2, 19.3, 0),
(23, 'MOBIFONE', '', 100000, 19, 1.2, 18.3, 0.5, 18, 0.2, 17.8, 0),
(24, 'MOBIFONE', '', 200000, 19, 1.2, 18.3, 0.5, 18, 0.2, 17.8, 0),
(25, 'MOBIFONE', '', 300000, 19, 1.2, 18.3, 0.5, 18, 0.2, 17.8, 0),
(26, 'MOBIFONE', '', 500000, 19.5, 1.2, 18.8, 0.5, 18.5, 0.2, 18.3, 0),
(28, 'VIETNAMOBILE', 'Vietnamobile', 10000, 15.5, 1.2, 14.8, 0.5, 14.5, 0.2, 14.3, 0),
(29, 'VIETNAMOBILE', '', 20000, 15.5, 1.2, 14.8, 0.5, 14.5, 0.2, 14.3, 0),
(30, 'VIETNAMOBILE', '', 30000, 15.5, 1.2, 14.8, 0.5, 14.5, 0.2, 14.3, 0),
(31, 'VIETNAMOBILE', '', 50000, 15.5, 1.2, 14.8, 0.5, 14.5, 0.2, 14.3, 0),
(32, 'VIETNAMOBILE', '', 100000, 15.5, 1.2, 14.8, 0.5, 14.5, 0.2, 14.3, 0),
(33, 'VIETNAMOBILE', '', 200000, 15.5, 1.2, 14.8, 0.5, 14.5, 0.2, 14.3, 0),
(34, 'VIETNAMOBILE', '', 300000, 15.5, 1.2, 14.8, 0.5, 14.5, 0.2, 14.3, 0),
(35, 'VIETNAMOBILE', '', 500000, 16, 1.2, 15.3, 0.5, 15, 0.2, 14.8, 0),
(36, 'ZING', 'Zing', 10000, 11.5, 1.2, 10.8, 0.5, 10.5, 0.2, 10.3, 0),
(37, 'ZING', '', 20000, 11.5, 1.2, 10.8, 0.5, 10.5, 0.2, 10.3, 0),
(38, 'ZING', '', 30000, 11.5, 1.2, 10.8, 0.5, 10.5, 0.2, 10.3, 0),
(39, 'ZING', '', 50000, 11.5, 1.2, 10.8, 0.5, 10.5, 0.2, 10.3, 0),
(40, 'ZING', '', 100000, 11.5, 1.2, 10.8, 0.5, 10.5, 0.2, 10.3, 0),
(41, 'ZING', '', 200000, 11.5, 1.2, 10.8, 0.5, 10.5, 0.2, 10.3, 0),
(42, 'ZING', '', 300000, 11.5, 1.2, 10.8, 0.5, 10.5, 0.2, 10.3, 0),
(43, 'ZING', '', 500000, 12, 1.2, 11.3, 0.5, 11, 0.2, 10.8, 0),
(44, 'ZING', '', 1000000, 12, 1.2, 11.3, 0.5, 11, 0.2, 10.8, 0),
(45, 'GATE', 'Gate', 10000, 19.2, 1.2, 18.5, 0.5, 18.2, 0.2, 18, 0),
(46, 'GATE', '', 20000, 19.2, 1.2, 18.5, 0.5, 18.2, 0.2, 18, 0),
(47, 'GATE', '', 30000, 101.2, 1.2, 100.5, 0.5, 100.2, 0.2, 100, 0),
(48, 'GATE', '', 50000, 19.2, 1.2, 18.5, 0.5, 18.2, 0.2, 18, 0),
(49, 'GATE', '', 100000, 20.2, 1.2, 19.5, 0.5, 19.2, 0.2, 19, 0),
(50, 'GATE', '', 200000, 20.2, 1.2, 19.5, 0.5, 19.2, 0.2, 19, 0),
(51, 'GATE', '', 300000, 101.2, 1.2, 100.5, 0.5, 100.2, 0.2, 100, 0),
(52, 'GATE', '', 500000, 20.2, 1.2, 19.5, 0.5, 19.2, 0.2, 19, 0),
(53, 'GATE', '', 1000000, 20.2, 1.2, 19.5, 0.5, 19.2, 0.2, 19, 0),
(57, 'GARENA', 'Garena', 20000, 21.2, 1.2, 20.5, 0.5, 20.2, 0.2, 20, 0),
(58, 'GARENA', '', 50000, 21.2, 1.2, 20.5, 0.5, 20.2, 0.2, 20, 0),
(59, 'GARENA', '', 100000, 15.2, 1.2, 14.5, 0.5, 14.2, 0.2, 14, 0),
(60, 'GARENA', '', 200000, 15.2, 1.2, 14.5, 0.5, 14.2, 0.2, 14, 0),
(61, 'GARENA', '', 500000, 15.2, 1.2, 14.5, 0.5, 14.2, 0.2, 14, 0),
(62, 'VCOIN', 'Vcoin', 10000, 13.2, 1.2, 13, 1, 12.2, 0.2, 12, 0),
(63, 'VCOIN', '', 20000, 13.2, 1.2, 12.5, 0.5, 12.2, 0.2, 12, 0),
(64, 'VCOIN', '', 50000, 13.2, 1.2, 12.5, 0.5, 12.2, 0.2, 12, 0),
(65, 'VCOIN', '', 100000, 13.2, 1.2, 12.5, 0.5, 12.2, 0.2, 12, 0),
(66, 'VCOIN', '', 200000, 13.2, 1.2, 12.5, 0.5, 12.2, 0.2, 12, 0),
(67, 'VCOIN', '', 300000, 13.2, 1.2, 12.5, 0.5, 12.2, 0.2, 12, 0),
(68, 'VCOIN', '', 500000, 13.2, 1.2, 12.5, 0.5, 12.2, 0.2, 12, 0),
(69, 'VCOIN', '', 1000000, 13.2, 1.2, 12.5, 0.5, 12.2, 0.2, 12, 0),
(70, 'VCOIN', '', 2000000, 13.2, 1.2, 12.5, 0.5, 12.2, 0.2, 12, 0),
(71, 'VCOIN', '', 5000000, 13.2, 1.2, 12.5, 0.5, 12.2, 0.2, 12, 0),
(72, 'VCOIN', '', 10000000, 13.2, 1.2, 12.5, 0.5, 12.2, 0.2, 12, 0),
(54, 'GATE', '', 2000000, 101.2, 1.2, 100.5, 0.5, 100.2, 0.2, 100, 0),
(55, 'GATE', '', 5000000, 101.2, 1.2, 100.5, 0.5, 100.2, 0.2, 100, 0),
(56, 'GATE', '', 10000000, 101.2, 1.2, 100.5, 0.5, 100.2, 0.2, 100, 0),
(0, 'APPOTA', 'APPOTA', 20000, 20, 0, 20, 0, 20, 0, NULL, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `danhmuc`
--

CREATE TABLE `danhmuc` (
  `id` int(11) NOT NULL,
  `nick_slug` text NOT NULL,
  `name` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `image` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `daban` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '0',
  `status` varchar(255) NOT NULL DEFAULT 'ON'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Đang đổ dữ liệu cho bảng `danhmuc`
--

INSERT INTO `danhmuc` (`id`, `nick_slug`, `name`, `image`, `daban`, `status`) VALUES
(2, 'lien-quan-mobile', 'Liên Quân Mobile Vip', '/assets/storage/images/image_EB281.png', '2', 'ON'),
(3, 'free-fire', 'Free Fire Rẻ', '/assets/storage/images/image_GWXKQ.png', '2', 'ON');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `localbanks_user`
--

CREATE TABLE `localbanks_user` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `paygate_code` varchar(50) DEFAULT NULL,
  `account_num` varchar(50) NOT NULL,
  `account_name` varchar(50) NOT NULL,
  `branch` varchar(50) DEFAULT NULL,
  `card_num` varchar(100) DEFAULT NULL,
  `hash` varchar(255) DEFAULT NULL,
  `account_username` text DEFAULT NULL,
  `account_password` text DEFAULT NULL,
  `approved` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `logs`
--

CREATE TABLE `logs` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `ip` varchar(255) DEFAULT NULL,
  `device` varchar(255) DEFAULT NULL,
  `createdate` datetime NOT NULL DEFAULT current_timestamp(),
  `action` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `logs`
--

INSERT INTO `logs` (`id`, `user_id`, `ip`, `device`, `createdate`, `action`) VALUES
(1, 1, '14.191.8.152', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-09 01:24:13', 'Đăng ký tài khoản thành công'),
(2, 1, '14.191.8.152', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-09 08:28:08', 'Thực hiện login vào admin web'),
(3, 1, '2001:ee0:4a60:9d60:cca4:c091:4872:a00a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36', '2024-05-04 16:34:17', 'Thực hiện login vào admin web'),
(4, 1, '2001:ee0:4a60:9d60:cca4:c091:4872:a00a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36', '2024-05-04 16:35:55', 'Đăng nhập tài khoản'),
(5, 2, '2402:800:63e0:dd51:1136:f5d1:798a:479e', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Mobile Safari/537.36', '2024-05-04 17:12:44', 'Đăng ký tài khoản thành công'),
(6, 2, '2402:800:63e0:dd51:1136:f5d1:798a:479e', 'Mozilla/5.0 (Linux; Android 11; RMX2103 Build/RKQ1.201217.002; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/124.0.6367.123 Mobile Safari/537.36', '2024-05-04 17:16:03', 'Đăng nhập tài khoản'),
(7, 2, '2402:800:63e0:dd51:1136:f5d1:798a:479e', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Mobile Safari/537.36', '2024-05-04 17:23:46', 'Đăng nhập tài khoản'),
(8, 1, '2001:ee0:4a60:9d60:44c3:caa9:680b:a15c', 'Mozilla/5.0 (iPhone; CPU iPhone OS 17_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/17.3.1 Mobile/15E148 Safari/604.1', '2024-05-04 17:50:19', 'Đăng nhập tài khoản'),
(9, 1, '2001:ee0:4a60:9d60:cca4:c091:4872:a00a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36', '2024-05-04 18:53:34', 'Đăng nhập tài khoản'),
(10, 1, '2001:ee0:4a60:9d60:cca4:c091:4872:a00a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36', '2024-05-04 19:15:34', 'Đăng nhập tài khoản'),
(11, 1, '2001:ee0:4a60:9d60:cca4:c091:4872:a00a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36', '2024-05-04 19:35:24', 'Đăng nhập tài khoản'),
(12, 1, '2001:ee0:4a60:9d60:cca4:c091:4872:a00a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36', '2024-05-04 19:40:53', 'Đăng nhập tài khoản'),
(13, 1, '2001:ee0:4a60:9d60:dd35:f9f1:dd46:cf7', 'Mozilla/5.0 (iPhone; CPU iPhone OS 17_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/17.3.1 Mobile/15E148 Safari/604.1', '2024-05-04 21:57:03', 'Đăng nhập tài khoản'),
(14, 3, '14.251.190.192', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Mobile Safari/537.36', '2024-05-04 22:55:10', 'Đăng ký tài khoản thành công'),
(15, 1, '2001:ee0:4a60:9d60:cca4:c091:4872:a00a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36', '2024-05-05 10:41:50', 'Đăng nhập tài khoản'),
(16, 1, '2001:ee0:4a60:9d60:cca4:c091:4872:a00a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36', '2024-05-05 11:52:27', 'Đăng nhập tài khoản'),
(17, 2, '2402:800:63e0:dd51:1136:f5d1:798a:479e', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Mobile Safari/537.36', '2024-05-05 12:25:46', 'Đăng nhập tài khoản'),
(18, 2, '2402:800:63e0:dd51:1136:f5d1:798a:479e', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Mobile Safari/537.36', '2024-05-05 16:14:06', 'Đăng nhập tài khoản'),
(19, 1, '2001:ee0:4a60:9d60:8538:4833:d9b4:b6ba', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36', '2024-05-05 17:27:37', 'Đăng nhập tài khoản'),
(20, 2, '2402:800:63e0:dd51:1136:f5d1:798a:479e', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Mobile Safari/537.36', '2024-05-05 18:43:51', 'Đăng nhập tài khoản'),
(21, 4, '2402:800:623e:e819:6c0d:e25f:5564:b734', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36', '2024-05-06 15:28:26', 'Đăng ký tài khoản thành công'),
(22, 1, '2001:ee0:4a63:5670:f043:1a8c:a531:8e94', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36', '2024-05-06 15:38:52', 'Đăng nhập tài khoản'),
(23, 1, '2001:ee0:4a63:5670:f043:1a8c:a531:8e94', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36', '2024-05-06 16:12:38', 'Đăng nhập tài khoản'),
(24, 1, '2001:ee0:4a63:5670:f043:1a8c:a531:8e94', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36', '2024-05-06 17:53:53', 'Thực hiện login vào admin web'),
(25, 1, '2001:ee0:4a63:5670:f043:1a8c:a531:8e94', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36', '2024-05-06 18:25:58', 'Đăng nhập tài khoản'),
(26, 1, '2001:ee0:4a63:5670:f043:1a8c:a531:8e94', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36', '2024-05-06 19:30:44', 'Đăng nhập tài khoản'),
(27, 1, '2001:ee0:4a63:5670:f043:1a8c:a531:8e94', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36', '2024-05-06 19:31:10', 'Đăng nhập tài khoản'),
(28, 4, '2402:800:623e:e819:d8c7:c782:ed59:7665', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36', '2024-05-06 20:51:52', 'Đăng nhập tài khoản'),
(29, 1, '2001:ee0:4a63:5670:f043:1a8c:a531:8e94', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36', '2024-05-06 22:12:23', 'Thực hiện login vào admin web'),
(30, 1, '2001:ee0:4a63:5670:f043:1a8c:a531:8e94', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36', '2024-05-06 22:19:20', 'Thực hiện login vào admin web'),
(31, 1, '14.191.9.29', 'Mozilla/5.0 (iPhone; CPU iPhone OS 17_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/17.3.1 Mobile/15E148 Safari/604.1', '2024-05-06 23:48:31', 'Đăng nhập tài khoản'),
(32, 2, '2402:800:63e0:dd51:f8fc:6d17:9621:1827', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Mobile Safari/537.36', '2024-05-07 14:05:29', 'Đăng nhập tài khoản'),
(33, 1, '2401:d800:e90:a0bf:4845:8b:ecb:9891', 'Mozilla/5.0 (iPhone; CPU iPhone OS 17_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/17.3.1 Mobile/15E148 Safari/604.1', '2024-05-07 14:05:44', 'Đăng nhập tài khoản'),
(34, 1, '2001:ee0:4a63:5670:b0e2:eafc:ee2a:7492', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36', '2024-05-08 11:15:58', 'Đăng nhập tài khoản'),
(35, 1, '2001:ee0:4a63:5670:b0e2:eafc:ee2a:7492', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Mobile Safari/537.36', '2024-05-08 11:28:26', 'Đăng nhập tài khoản'),
(36, 1, '2001:ee0:4a63:5670:b0e2:eafc:ee2a:7492', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36', '2024-05-08 11:29:45', 'Đăng nhập tài khoản'),
(37, 1, '2001:ee0:4a62:bd00:5831:7efe:8eb4:eb35', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36', '2024-05-08 15:53:55', 'Thực hiện login vào admin web'),
(38, 1, '2001:ee0:4a62:2230:c95e:1b1d:2edc:426b', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36', '2024-05-09 18:26:54', 'Đăng nhập tài khoản'),
(39, 1, '2001:ee0:4a62:2230:d566:84ee:eb0b:cb90', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36', '2024-05-10 15:21:32', 'Đăng nhập tài khoản'),
(40, 1, '2001:ee0:4a62:2230:d566:84ee:eb0b:cb90', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36', '2024-05-10 20:15:37', 'Đăng nhập tài khoản'),
(41, 1, '2001:ee0:4a62:2230:cdda:dd00:8a8e:b924', 'Mozilla/5.0 (iPhone; CPU iPhone OS 17_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/17.3.1 Mobile/15E148 Safari/604.1', '2024-05-10 20:32:57', 'Đăng nhập tài khoản'),
(42, 5, '171.251.233.58', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/17.4.1 Safari/605.1.15', '2024-05-10 21:12:34', 'Đăng ký tài khoản thành công'),
(43, 1, '2001:ee0:4a62:2230:6d60:52f2:bcc1:85c5', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36', '2024-05-10 21:17:21', 'Đăng nhập tài khoản'),
(44, 1, '2402:800:623e:ff3b:c71:9d18:7a5e:de41', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36', '2024-05-11 12:10:25', 'Đăng nhập tài khoản'),
(45, 6, '14.185.140.117', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36', '2024-05-11 15:06:35', 'Đăng ký tài khoản thành công'),
(46, 1, '2001:ee0:4a62:2230:6d60:52f2:bcc1:85c5', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36', '2024-05-11 16:27:08', 'Đăng nhập tài khoản'),
(47, 1, '2001:ee0:4a62:2230:6d60:52f2:bcc1:85c5', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36', '2024-05-11 16:30:45', 'Đăng nhập tài khoản'),
(48, 1, '2001:ee0:4a62:2230:6d60:52f2:bcc1:85c5', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36', '2024-05-11 16:36:57', 'Thực hiện login vào admin web'),
(49, 1, '2001:ee0:4a62:2230:6d60:52f2:bcc1:85c5', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36', '2024-05-11 18:29:29', 'Thực hiện login vào admin web'),
(50, 7, '2001:ee0:276:7eb2:9cd9:62aa:114d:1003', 'Mozilla/5.0 (iPhone; CPU iPhone OS 17_5 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/124.0.6367.111 Mobile/15E148 Safari/604.1', '2024-05-18 12:10:21', 'Đăng ký tài khoản thành công'),
(51, 1, '2001:ee0:4a62:cfa0:e10b:c81f:6bd4:bdfd', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36', '2024-05-18 16:20:40', 'Đăng nhập tài khoản'),
(52, 1, '2001:ee0:4a62:cfa0:e10b:c81f:6bd4:bdfd', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36', '2024-05-18 16:20:49', 'Thực hiện login vào admin web'),
(53, 8, '2001:ee0:4b6e:30b0:b406:c8a7:92b:4952', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', '2024-05-18 18:32:22', 'Đăng ký tài khoản thành công'),
(54, 1, '2001:ee0:4a62:cfa0:d47b:fa7:2f57:813f', 'Mozilla/5.0 (iPhone; CPU iPhone OS 17_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/17.3.1 Mobile/15E148 Safari/604.1', '2024-05-18 21:57:15', 'Đăng nhập tài khoản'),
(55, 1, '2001:ee0:4a62:cfa0:29ae:29f9:25b:4c67', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36', '2024-05-18 22:03:33', 'Đăng nhập tài khoản'),
(56, 1, '2001:ee0:4a62:cfa0:d47b:fa7:2f57:813f', 'Mozilla/5.0 (iPhone; CPU iPhone OS 17_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/17.3.1 Mobile/15E148 Safari/604.1', '2024-05-18 22:15:59', 'Đăng nhập tài khoản'),
(57, 1, '171.255.113.184', 'Mozilla/5.0 (iPhone; CPU iPhone OS 17_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/17.3.1 Mobile/15E148 Safari/604.1', '2024-05-19 01:29:55', 'Đăng nhập tài khoản'),
(58, 2, '2402:800:63e0:dfc1:1cb:96fc:d24b:fd2e', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Mobile Safari/537.36', '2024-05-19 06:05:16', 'Đăng nhập tài khoản'),
(59, 1, '14.191.8.229', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36', '2024-05-19 09:13:06', 'Đăng nhập tài khoản'),
(60, 2, '2402:800:63e0:dfc1:1cb:96fc:d24b:fd2e', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Mobile Safari/537.36', '2024-05-19 09:38:53', 'Đăng nhập tài khoản'),
(61, 1, '2001:ee0:4a63:2840:fcbd:a3:fbcc:4250', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36', '2024-05-19 10:21:14', 'Đăng nhập tài khoản'),
(62, 2, '2402:800:63e0:dfc1:1cb:96fc:d24b:fd2e', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Mobile Safari/537.36', '2024-05-19 13:35:48', 'Đăng nhập tài khoản'),
(63, 2, '2402:800:63e0:dfc1:1cb:96fc:d24b:fd2e', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Mobile Safari/537.36', '2024-05-19 14:44:39', 'Đăng nhập tài khoản'),
(64, 1, '2001:ee0:4a60:a690:d935:e7a:dd61:9e92', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36', '2024-05-19 15:10:21', 'Đăng nhập tài khoản'),
(65, 1, '2401:d800:532d:e219:cc77:12f2:2022:ab39', 'Mozilla/5.0 (iPhone; CPU iPhone OS 17_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/17.3.1 Mobile/15E148 Safari/604.1', '2024-05-19 16:20:59', 'Đăng nhập tài khoản'),
(66, 1, '2001:ee0:4a60:a690:d935:e7a:dd61:9e92', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36', '2024-05-19 16:23:19', 'Đăng nhập tài khoản'),
(67, 1, '2401:d800:532d:e219:cc77:12f2:2022:ab39', 'Mozilla/5.0 (iPhone; CPU iPhone OS 17_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/17.3.1 Mobile/15E148 Safari/604.1', '2024-05-19 16:24:48', 'Đăng nhập tài khoản'),
(68, 1, '2001:ee0:4a60:a690:d935:e7a:dd61:9e92', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36', '2024-05-19 16:30:42', 'Đăng nhập tài khoản'),
(69, 1, '2001:ee0:4a60:a690:d935:e7a:dd61:9e92', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36', '2024-05-19 16:30:59', 'Thực hiện login vào admin web'),
(70, 2, '2402:800:63e0:dfc1:1cb:96fc:d24b:fd2e', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Mobile Safari/537.36', '2024-05-19 16:42:43', 'Đăng nhập tài khoản'),
(71, 1, '2001:ee0:4a62:4170:cde3:94fb:83c5:1190', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36', '2024-05-19 18:34:52', 'Mua thẻ cào S6649E3DB20BC9'),
(72, 1, '2001:ee0:4a62:4170:cde3:94fb:83c5:1190', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36', '2024-05-19 18:36:02', 'Mua thẻ cào S6649E3FBB0C23'),
(73, 1, '2001:ee0:4a62:4170:cde3:94fb:83c5:1190', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36', '2024-05-19 18:37:29', 'Mua thẻ cào S6649E468E1456'),
(74, 1, '2001:ee0:4a62:4170:cde3:94fb:83c5:1190', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36', '2024-05-19 18:38:15', 'Mua thẻ cào S6649E4A0E3702'),
(75, 1, '2001:ee0:4a62:4170:cde3:94fb:83c5:1190', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36', '2024-05-19 18:38:51', 'Mua thẻ cào S6649E4C2AB452'),
(76, 1, '2001:ee0:4a62:4170:cde3:94fb:83c5:1190', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36', '2024-05-19 18:42:24', 'Mua thẻ cào S6649E593B3193'),
(77, 1, '2001:ee0:4a62:4170:cde3:94fb:83c5:1190', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36', '2024-05-19 18:47:18', 'Mua thẻ cào S6649E6B6A45C7'),
(78, 2, '2402:800:63e0:dfc1:1cb:96fc:d24b:fd2e', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Mobile Safari/537.36', '2024-05-19 19:11:37', 'Đăng nhập tài khoản'),
(79, 1, '2001:ee0:4a62:4170:cde3:94fb:83c5:1190', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36', '2024-05-19 19:14:24', 'Tạo đơn rút tiền thành công: Ruttien 1'),
(80, 1, '2001:ee0:4a62:4170:cde3:94fb:83c5:1190', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36', '2024-05-19 20:07:00', 'Mua thẻ cào S6649F96A008EA'),
(81, 1, '2001:ee0:4a62:4170:cde3:94fb:83c5:1190', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36', '2024-05-19 20:08:14', 'Mua thẻ cào S6649F9A5B092F'),
(82, 1, '2001:ee0:4a62:4170:cde3:94fb:83c5:1190', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36', '2024-05-19 20:10:31', 'Cập nhật mkc2'),
(83, 1, '2001:ee0:4a62:4170:cde3:94fb:83c5:1190', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36', '2024-05-19 20:25:40', 'Mua thẻ cào S6649FDBF67AD8'),
(84, 1, '2401:d800:532d:e219:cc77:12f2:2022:ab39', 'Mozilla/5.0 (iPhone; CPU iPhone OS 17_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/17.3.1 Mobile/15E148 Safari/604.1', '2024-05-19 20:33:44', 'Đăng nhập tài khoản'),
(85, 1, '2001:ee0:4a62:89a0:c7b:aabf:f1c6:a66b', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36', '2024-05-20 07:36:41', 'Đăng nhập tài khoản'),
(86, 1, '2001:ee0:4a62:89a0:c7b:aabf:f1c6:a66b', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Mobile Safari/537.36', '2024-05-20 07:42:46', 'Mua thẻ cào S664A9C2241D15'),
(87, 1, '2001:ee0:4a62:89a0:c7b:aabf:f1c6:a66b', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36', '2024-05-20 07:43:55', 'Mua thẻ cào S664A9CC7C1C15'),
(88, 1, '2001:ee0:4a62:89a0:c7b:aabf:f1c6:a66b', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36', '2024-05-20 07:46:06', 'Mua thẻ cào S664A9D4AC0DC3'),
(89, 1, '2001:ee0:4a62:89a0:c7b:aabf:f1c6:a66b', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Mobile Safari/537.36', '2024-05-20 07:49:13', 'Mua thẻ cào S664A9DFBCE0EC'),
(90, 1, '2001:ee0:4a62:89a0:c7b:aabf:f1c6:a66b', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36', '2024-05-20 07:55:34', 'Thực hiện login vào admin web'),
(91, 1, '2001:ee0:4a62:89a0:c7b:aabf:f1c6:a66b', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36', '2024-05-20 07:55:55', 'Mua thẻ cào S664A9F97BDF5A'),
(92, 1, '2001:ee0:4a62:89a0:c7b:aabf:f1c6:a66b', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36', '2024-05-20 07:56:10', 'Mua thẻ cào S664A9FA053C6A'),
(93, 1, '2001:ee0:4a62:89a0:c7b:aabf:f1c6:a66b', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36', '2024-05-20 08:07:06', 'Mua thẻ cào S664AA2368BD45'),
(94, 1, '2001:ee0:4a62:89a0:c7b:aabf:f1c6:a66b', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36', '2024-05-20 08:19:33', 'Mua thẻ cào S664AA51631A42'),
(95, 1, '2001:ee0:4a62:89a0:c7b:aabf:f1c6:a66b', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36', '2024-05-20 08:22:55', 'Mua thẻ cào S664AA5E40FEC8'),
(96, 1, '2001:ee0:4a62:89a0:c7b:aabf:f1c6:a66b', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36', '2024-05-20 08:28:37', 'Mua thẻ cào S664AA739E7E29'),
(97, 1, '2001:ee0:4a62:89a0:c7b:aabf:f1c6:a66b', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36', '2024-05-20 08:28:54', 'Thực hiện login vào admin web'),
(98, 1, '2001:ee0:4a62:89a0:c7b:aabf:f1c6:a66b', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36', '2024-05-20 08:44:42', 'Mua thẻ cào S664AAAEE463B2'),
(99, 1, '2001:ee0:4a62:89a0:c7b:aabf:f1c6:a66b', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36', '2024-05-20 08:56:58', 'Mua thẻ cào S664AADC4C2ADD'),
(100, 1, '2001:ee0:4a62:89a0:c7b:aabf:f1c6:a66b', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36', '2024-05-20 09:03:09', 'Mua thẻ cào S664AAF3201C1C'),
(101, 1, '2001:ee0:4a62:89a0:c7b:aabf:f1c6:a66b', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36', '2024-05-20 09:12:58', 'Mua thẻ cào S664AB19DDA3DA'),
(102, 1, '2001:ee0:4a62:89a0:c7b:aabf:f1c6:a66b', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Mobile Safari/537.36', '2024-05-20 11:25:19', 'Thực hiện login vào admin web'),
(103, 1, '2001:ee0:4a62:89a0:c7b:aabf:f1c6:a66b', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Mobile Safari/537.36', '2024-05-20 11:27:21', 'Thực hiện login vào admin web'),
(104, 1, '2001:ee0:4a62:89a0:d0e2:95da:f8c2:1cb8', 'Mozilla/5.0 (iPhone; CPU iPhone OS 17_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/17.3.1 Mobile/15E148 Safari/604.1', '2024-05-20 11:31:23', 'Thực hiện login vào admin web'),
(105, 1, '2001:ee0:4a62:89a0:c7b:aabf:f1c6:a66b', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36', '2024-05-20 11:36:30', 'Thực hiện login vào admin web'),
(106, 1, '2001:ee0:4a62:89a0:d0e2:95da:f8c2:1cb8', 'Mozilla/5.0 (iPhone; CPU iPhone OS 17_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/17.3.1 Mobile/15E148 Safari/604.1', '2024-05-20 11:41:37', 'Thực hiện login vào admin web'),
(107, 1, '2001:ee0:4a62:89a0:c7b:aabf:f1c6:a66b', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36', '2024-05-20 11:41:53', 'Thực hiện login vào admin web'),
(108, 1, '2001:ee0:4a62:89a0:c7b:aabf:f1c6:a66b', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36', '2024-05-20 11:43:20', 'Thực hiện login vào admin web'),
(109, 1, '2001:ee0:4a62:89a0:c7b:aabf:f1c6:a66b', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36', '2024-05-20 11:55:13', 'Đăng nhập tài khoản'),
(110, 1, '2001:ee0:4a62:89a0:c7b:aabf:f1c6:a66b', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36', '2024-05-20 11:55:21', 'Thực hiện login vào admin web'),
(111, 1, '2001:ee0:4a62:89a0:c7b:aabf:f1c6:a66b', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36', '2024-05-20 11:56:24', 'Đăng nhập tài khoản'),
(112, 1, '2001:ee0:4a62:89a0:c7b:aabf:f1c6:a66b', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36', '2024-05-20 11:56:34', 'Thực hiện login vào admin web'),
(113, 2, '2402:800:63e0:dfc1:1cb:96fc:d24b:fd2e', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Mobile Safari/537.36', '2024-05-20 12:17:39', 'Đăng nhập tài khoản'),
(114, 9, '2001:ee0:4206:cf40:5dfb:6841:899a:d905', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Mobile Safari/537.36', '2024-05-20 13:43:44', 'Đăng ký tài khoản thành công'),
(115, 10, '2402:9d80:3d1:7178:75dd:7cae:5fec:3416', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Mobile Safari/537.36', '2024-05-20 13:46:21', 'Đăng ký tài khoản thành công'),
(116, 1, '2001:ee0:4a62:89a0:1c04:bd78:928e:fce1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 17_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/17.3.1 Mobile/15E148 Safari/604.1', '2024-05-20 19:04:21', 'Đăng nhập tài khoản'),
(117, 1, '2001:ee0:4a62:89a0:14e5:7774:8d25:d0f8', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36', '2024-05-20 19:28:29', 'Đăng nhập tài khoản'),
(118, 1, '2001:ee0:4a62:89a0:14e5:7774:8d25:d0f8', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36', '2024-05-20 19:28:34', 'Thực hiện login vào admin web'),
(119, 1, '2001:ee0:4a62:89a0:14e5:7774:8d25:d0f8', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', '2024-05-20 19:34:33', 'Thực hiện login vào admin web'),
(120, 1, '2001:ee0:4a62:89a0:14e5:7774:8d25:d0f8', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', '2024-05-20 19:38:03', 'Thực hiện login vào admin web'),
(121, 1, '2001:ee0:4a62:89a0:14e5:7774:8d25:d0f8', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', '2024-05-20 19:38:35', 'Thực hiện login vào admin web'),
(122, 1, '2001:ee0:4a62:89a0:14e5:7774:8d25:d0f8', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', '2024-05-20 19:40:08', 'Thực hiện login vào admin web'),
(123, 1, '2001:ee0:4a62:89a0:14e5:7774:8d25:d0f8', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36', '2024-05-20 19:40:18', 'Đăng nhập tài khoản'),
(124, 9, '14.251.190.44', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Mobile Safari/537.36', '2024-05-20 22:29:37', 'Đăng nhập tài khoản'),
(125, 1, '2001:ee0:4a62:89a0:14e5:7774:8d25:d0f8', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36', '2024-05-21 06:57:00', 'Thực hiện login vào admin web'),
(126, 11, '2001:ee0:4a62:89a0:14e5:7774:8d25:d0f8', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36', '2024-05-21 08:40:14', 'Đăng ký tài khoản thành công'),
(127, 1, '2001:ee0:4a62:89a0:14e5:7774:8d25:d0f8', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36', '2024-05-21 08:45:29', 'Đăng nhập tài khoản'),
(128, 11, '2001:ee0:4a62:89a0:14e5:7774:8d25:d0f8', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36', '2024-05-21 08:54:57', 'Đăng nhập tài khoản'),
(129, 1, '2001:ee0:4a62:89a0:14e5:7774:8d25:d0f8', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36', '2024-05-21 08:59:17', 'Đăng nhập tài khoản'),
(130, 1, '2001:ee0:4a62:89a0:14e5:7774:8d25:d0f8', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36', '2024-05-21 08:59:43', 'Thực hiện login vào admin web'),
(131, 11, '2001:ee0:4a62:89a0:14e5:7774:8d25:d0f8', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36', '2024-05-21 09:02:28', 'Đăng nhập tài khoản'),
(132, 1, '2001:ee0:4a62:89a0:14e5:7774:8d25:d0f8', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36', '2024-05-21 09:03:13', 'Đăng nhập tài khoản'),
(133, 1, '2001:ee0:4a62:89a0:14e5:7774:8d25:d0f8', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36', '2024-05-21 09:03:17', 'Thực hiện login vào admin web'),
(134, 1, '2001:ee0:4a62:89a0:14e5:7774:8d25:d0f8', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36', '2024-05-21 09:17:31', 'Đăng nhập tài khoản'),
(135, 1, '2001:ee0:4a62:89a0:14e5:7774:8d25:d0f8', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36', '2024-05-21 09:27:41', 'Bật mật khẩu cấp 2 thành công'),
(136, 1, '2001:ee0:4a62:89a0:14e5:7774:8d25:d0f8', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36', '2024-05-21 09:35:46', 'Tắt bảo mật mật khẩu cấp 2'),
(137, 9, '14.251.190.44', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Mobile Safari/537.36', '2024-05-21 21:21:10', 'Đăng nhập tài khoản'),
(138, 1, '2001:ee0:4a62:89a0:c519:975e:1c2:b8fb', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36', '2024-05-22 08:33:59', 'Đăng nhập tài khoản'),
(139, 1, '2001:ee0:4a62:89a0:c519:975e:1c2:b8fb', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36', '2024-05-22 08:34:09', 'Thực hiện login vào admin web'),
(140, 1, '2001:ee0:4a62:89a0:3c63:891e:d361:3051', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36', '2024-05-22 17:54:58', 'Mua thẻ cào S664DCEFDE9F3E'),
(141, 1, '2001:ee0:4a62:89a0:3c63:891e:d361:3051', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36', '2024-05-22 17:55:19', 'Thực hiện login vào admin web'),
(142, 1, '2001:ee0:4a62:89a0:3c63:891e:d361:3051', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36', '2024-05-23 07:54:14', 'Thực hiện login vào admin web'),
(143, 9, '14.251.190.44', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Mobile Safari/537.36', '2024-05-24 00:44:58', 'Đăng nhập tài khoản'),
(144, 9, '14.251.190.44', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Mobile Safari/537.36', '2024-05-24 00:45:07', 'Đăng nhập tài khoản'),
(145, 2, '2402:800:63e0:f7da:3935:936a:9bcb:acf8', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Mobile Safari/537.36', '2024-05-24 03:02:14', 'Đăng nhập tài khoản'),
(146, 1, '2001:ee0:4a62:89a0:658b:4c86:c60c:3d3d', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', '2024-05-24 08:11:57', 'Thực hiện login vào admin web'),
(147, 1, '2001:ee0:4a62:89a0:e0f3:7343:c1b1:8da4', 'Mozilla/5.0 (iPhone; CPU iPhone OS 17_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/17.3.1 Mobile/15E148 Safari/604.1', '2024-05-24 10:20:09', 'Đăng nhập tài khoản'),
(148, 12, '2001:ee0:4875:b880:50d1:2070:f7dc:4f43', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Mobile Safari/537.36', '2024-05-24 10:35:40', 'Đăng ký tài khoản thành công'),
(149, 1, '2001:ee0:4a62:89a0:658b:4c86:c60c:3d3d', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', '2024-05-24 16:21:28', 'Đăng nhập tài khoản'),
(150, 1, '2001:ee0:4a62:89a0:6b7c:8f4f:da16:63fe', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', '2024-05-24 18:53:11', 'Đăng nhập tài khoản'),
(151, 1, '2001:ee0:4a62:89a0:6b7c:8f4f:da16:63fe', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', '2024-05-24 19:02:08', 'Thực hiện login vào admin web'),
(152, 1, '2001:ee0:4a62:89a0:6b7c:8f4f:da16:63fe', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', '2024-05-24 19:03:07', 'Mua thẻ cào S665081F76C93B'),
(153, 1, '2001:ee0:4a62:89a0:6b7c:8f4f:da16:63fe', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', '2024-05-24 19:04:57', 'Mua thẻ cào S66508241C0108'),
(154, 9, '14.255.28.217', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Mobile Safari/537.36', '2024-05-25 00:51:42', 'Đăng nhập tài khoản'),
(155, 9, '14.255.28.217', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Mobile Safari/537.36', '2024-05-25 00:51:54', 'Đăng nhập tài khoản'),
(156, 1, '2001:ee0:4a62:89a0:6b7c:8f4f:da16:63fe', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', '2024-05-25 08:07:50', 'Đăng nhập tài khoản'),
(157, 1, '2001:ee0:4a62:89a0:6b7c:8f4f:da16:63fe', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', '2024-05-25 08:09:52', 'Đăng nhập tài khoản'),
(158, 1, '2001:ee0:4a62:89a0:6b7c:8f4f:da16:63fe', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', '2024-05-25 08:22:08', 'Đăng nhập tài khoản'),
(159, 1, '2001:ee0:4a62:89a0:6b7c:8f4f:da16:63fe', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', '2024-05-25 08:26:49', 'Đăng nhập tài khoản'),
(160, 1, '2001:ee0:4a62:89a0:6b7c:8f4f:da16:63fe', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', '2024-05-25 08:35:10', 'Đăng nhập tài khoản'),
(161, 1, '2001:ee0:4a62:89a0:6b7c:8f4f:da16:63fe', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', '2024-05-25 11:26:23', 'Đăng nhập tài khoản'),
(162, 1, '2001:ee0:4a62:89a0:6b7c:8f4f:da16:63fe', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', '2024-05-25 11:26:33', 'Thực hiện login vào admin web'),
(163, 1, '2001:ee0:4a62:89a0:6b7c:8f4f:da16:63fe', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', '2024-05-25 11:46:34', 'Đăng nhập tài khoản'),
(164, 1, '2001:ee0:4a62:89a0:6b7c:8f4f:da16:63fe', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', '2024-05-25 11:47:03', 'Thực hiện login vào admin web'),
(165, 1, '2001:ee0:4a62:89a0:6b7c:8f4f:da16:63fe', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Mobile Safari/537.36', '2024-05-25 15:42:58', 'Đăng nhập tài khoản'),
(166, 1, '2001:ee0:4a62:89a0:6b7c:8f4f:da16:63fe', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Mobile Safari/537.36', '2024-05-25 15:43:28', 'Đăng nhập tài khoản'),
(167, 1, '2001:ee0:4a62:89a0:6b7c:8f4f:da16:63fe', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', '2024-05-25 15:59:06', 'Thực hiện login vào admin web'),
(168, 13, '2001:ee0:4a62:89a0:6b7c:8f4f:da16:63fe', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', '2024-05-25 16:00:25', 'Đăng ký tài khoản thành công'),
(169, 1, '2001:ee0:4a62:89a0:6b7c:8f4f:da16:63fe', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', '2024-05-25 20:27:22', 'Thực hiện login vào admin web'),
(170, 13, '2001:ee0:4a62:89a0:6b7c:8f4f:da16:63fe', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', '2024-05-25 20:37:12', 'Đăng nhập tài khoản'),
(171, 14, '2405:4802:463d:6a10:78a7:34a0:d967:6a55', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36', '2024-05-25 21:25:47', 'Đăng ký tài khoản thành công'),
(172, 2, '171.251.235.11', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Mobile Safari/537.36', '2024-05-25 23:33:16', 'Đăng nhập tài khoản'),
(173, 1, '64.137.90.23', 'Mozilla/5.0 (iPhone; CPU iPhone OS 17_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/17.3.1 Mobile/15E148 Safari/604.1', '2024-05-25 23:34:26', 'Đăng nhập tài khoản'),
(174, 2, '171.251.235.11', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Mobile Safari/537.36', '2024-05-25 23:35:40', 'Đăng nhập tài khoản'),
(175, 1, '2001:ee0:4276:5900:79d5:408f:4ff2:380f', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', '2024-05-26 10:01:22', 'Thực hiện login vào admin web'),
(176, 13, '2001:ee0:4276:5900:79d5:408f:4ff2:380f', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', '2024-05-26 10:03:43', 'Đăng nhập tài khoản'),
(177, 1, '2001:ee0:4276:9ed0:64fe:a1c7:305e:9c3e', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', '2024-05-26 12:14:55', 'Thực hiện login vào admin web'),
(178, 1, '2001:ee0:4276:9ed0:64fe:a1c7:305e:9c3e', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', '2024-05-26 16:09:04', 'Thực hiện login vào admin web'),
(179, 1, '2001:ee0:4276:9ed0:64fe:a1c7:305e:9c3e', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', '2024-05-26 16:58:02', 'Đăng nhập tài khoản'),
(180, 1, '2001:ee0:4276:9ed0:64fe:a1c7:305e:9c3e', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', '2024-05-26 16:58:04', 'Thực hiện login vào admin web'),
(181, 1, '2001:ee0:4276:9ed0:64fe:a1c7:305e:9c3e', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', '2024-05-26 17:49:54', 'Thực hiện login vào admin web'),
(182, 13, '2001:ee0:4276:9ed0:64fe:a1c7:305e:9c3e', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', '2024-05-26 17:52:50', 'Đăng nhập tài khoản'),
(183, 1, '2001:ee0:4276:9ed0:64fe:a1c7:305e:9c3e', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', '2024-05-26 17:55:15', 'Thực hiện login vào admin web'),
(184, 2, '2402:800:63e0:f7da:d158:aa2e:8739:c7f1', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Mobile Safari/537.36', '2024-05-26 19:47:10', 'Đăng nhập tài khoản'),
(185, 13, '2001:ee0:4276:9ed0:64fe:a1c7:305e:9c3e', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', '2024-05-26 20:22:21', 'Đăng nhập tài khoản'),
(186, 15, '2001:ee0:4276:9ed0:f1ca:679b:6b21:3c15', 'Mozilla/5.0 (iPhone; CPU iPhone OS 17_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/17.3.1 Mobile/15E148 Safari/604.1', '2024-05-26 21:27:05', 'Đăng ký tài khoản thành công'),
(187, 16, '2001:ee0:4276:9ed0:64fe:a1c7:305e:9c3e', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', '2024-05-26 21:29:49', 'Đăng ký tài khoản thành công'),
(188, 1, '2001:ee0:4276:9ed0:64fe:a1c7:305e:9c3e', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', '2024-05-27 07:54:35', 'Thực hiện login vào admin web'),
(189, 1, '2001:ee0:4276:9ed0:64fe:a1c7:305e:9c3e', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', '2024-05-27 07:59:38', 'Kích hoạt thành công googleauth'),
(190, 1, '2001:ee0:4276:9ed0:64fe:a1c7:305e:9c3e', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', '2024-05-27 08:00:05', 'Tắt 2FA thành công'),
(191, 1, '2001:ee0:4276:9ed0:64fe:a1c7:305e:9c3e', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', '2024-05-27 10:37:02', 'Thực hiện login vào admin web'),
(192, 13, '64.137.90.23', 'Mozilla/5.0 (iPhone; CPU iPhone OS 17_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/17.3.1 Mobile/15E148 Safari/604.1', '2024-05-27 10:52:21', 'Đăng nhập tài khoản'),
(193, 1, '2001:ee0:4276:9ed0:64fe:a1c7:305e:9c3e', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', '2024-05-27 11:06:19', 'Kích hoạt thành công googleauth'),
(194, 1, '2001:ee0:4276:9ed0:64fe:a1c7:305e:9c3e', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', '2024-05-27 11:07:24', 'Tắt 2FA thành công'),
(195, 9, '2001:ee0:4204:8e00:5dfb:6841:899a:d905', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Mobile Safari/537.36', '2024-05-27 11:24:12', 'Đăng nhập tài khoản'),
(196, 9, '2001:ee0:4204:8e00:5dfb:6841:899a:d905', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Mobile Safari/537.36', '2024-05-27 17:22:04', 'Đăng nhập tài khoản'),
(197, 17, '103.249.22.192', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Mobile Safari/537.36', '2024-05-27 18:43:32', 'Đăng ký tài khoản thành công'),
(198, 9, '2001:ee0:4204:8e00:5dfb:6841:899a:d905', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Mobile Safari/537.36', '2024-05-27 21:30:52', 'Đăng nhập tài khoản'),
(199, 1, '2001:ee0:4276:9ed0:6408:93bd:4d6c:739', 'Mozilla/5.0 (iPhone; CPU iPhone OS 17_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/17.3.1 Mobile/15E148 Safari/604.1', '2024-05-27 22:11:10', 'Đăng nhập tài khoản'),
(200, 18, '14.191.175.80', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', '2024-05-27 23:36:17', 'Đăng ký tài khoản thành công'),
(201, 1, '2001:ee0:4277:9840:51f7:ce62:8460:509b', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', '2024-05-28 17:03:48', 'Thực hiện login vào admin web'),
(202, 1, '2001:ee0:4277:9840:51f7:ce62:8460:509b', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', '2024-05-29 08:25:46', 'Thực hiện login vào admin web'),
(203, 1, '2001:ee0:4277:9840:b1e7:f868:f0cc:cdc8', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', '2024-05-29 10:42:10', 'Thực hiện login vào admin web'),
(204, 9, '2001:ee0:4205:ea70:5dfb:6841:899a:d905', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Mobile Safari/537.36', '2024-05-29 11:42:12', 'Đăng nhập tài khoản'),
(205, 1, '2001:ee0:4277:9840:b1e7:f868:f0cc:cdc8', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', '2024-05-29 13:23:55', 'Thực hiện login vào admin web'),
(206, 9, '123.18.64.29', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Mobile Safari/537.36', '2024-05-29 18:31:15', 'Đăng nhập tài khoản'),
(207, 2, '2402:800:63e0:88a0:a1b6:6cba:e41b:c0fe', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Mobile Safari/537.36', '2024-05-30 04:52:40', 'Đăng nhập tài khoản'),
(208, 1, '2001:ee0:4277:9840:b1e7:f868:f0cc:cdc8', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', '2024-05-30 07:33:17', 'Thực hiện login vào admin web'),
(209, 1, '2001:ee0:4277:9840:399a:1242:aff7:ac9f', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Mobile Safari/537.36', '2024-05-30 09:35:56', 'Mua thẻ cào S6657E5FFA6575'),
(210, 9, '123.18.64.29', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Mobile Safari/537.36', '2024-05-30 12:37:11', 'Đăng nhập tài khoản'),
(211, 1, '2001:ee0:4a60:4dd0:bc13:9775:c804:658', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Mobile Safari/537.36', '2024-05-30 20:28:54', 'Nạp Topup HTVAQ3FWE2C5O'),
(212, 1, '2001:ee0:4a60:4dd0:bc13:9775:c804:658', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', '2024-05-30 20:39:12', 'Nạp Topup P8SDW2LZT7AKR'),
(213, 1, '2001:ee0:4a60:4dd0:bc13:9775:c804:658', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', '2024-05-30 21:17:44', 'Nạp Topup LIDW045NFHVAU'),
(214, 1, '2001:ee0:4a60:4dd0:bc13:9775:c804:658', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', '2024-05-30 21:21:12', 'Nạp Topup X4J8DO5Y0TB97'),
(215, 1, '2001:ee0:4a60:4dd0:bc13:9775:c804:658', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', '2024-05-30 21:23:51', 'Nạp Topup 13GC09FOSY4LW'),
(216, 1, '2001:ee0:4a60:4dd0:bc13:9775:c804:658', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', '2024-05-30 21:28:49', 'Nạp Topup DFIJA597LXGK3'),
(217, 1, '2001:ee0:4a60:4dd0:bc13:9775:c804:658', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', '2024-05-30 21:29:49', 'Nạp Topup UZM8JFPNS62YE'),
(218, 1, '2401:d800:185:6b24:7121:2d30:ca03:173b', 'Mozilla/5.0 (iPhone; CPU iPhone OS 17_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/17.3.1 Mobile/15E148 Safari/604.1', '2024-05-30 22:36:03', 'Đăng nhập tài khoản'),
(219, 9, '14.188.13.144', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Mobile Safari/537.36', '2024-05-30 23:26:57', 'Đăng nhập tài khoản'),
(220, 2, '2402:800:63e0:88a0:a1b6:6cba:e41b:c0fe', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Mobile Safari/537.36', '2024-05-31 00:44:38', 'Đăng nhập tài khoản'),
(221, 1, '2001:ee0:4a61:e10:e940:e0d8:8852:fd43', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', '2024-05-31 07:48:35', 'Đăng nhập tài khoản'),
(222, 9, '14.188.13.144', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Mobile Safari/537.36', '2024-05-31 07:54:15', 'Đăng nhập tài khoản'),
(223, 19, '2402:800:63f2:e99f:41c3:e7c8:116d:706d', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Mobile Safari/537.36', '2024-05-31 10:40:15', 'Đăng ký tài khoản thành công'),
(224, 1, '2001:ee0:4a61:e10:e940:e0d8:8852:fd43', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', '2024-05-31 12:14:33', 'Đăng nhập tài khoản'),
(225, 1, '2001:ee0:4a61:e10:e940:e0d8:8852:fd43', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', '2024-05-31 12:55:06', 'Thực hiện login vào admin web'),
(226, 1, '2001:ee0:4a63:8920:1030:4024:9d87:7e69', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', '2024-05-31 15:47:15', 'Thực hiện login vào admin web'),
(227, 1, '2001:ee0:4a63:8920:1030:4024:9d87:7e69', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', '2024-05-31 16:16:39', 'Yêu cầu gửi otp xác thực email'),
(228, 1, '2001:ee0:4a63:8920:1030:4024:9d87:7e69', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', '2024-05-31 16:24:12', 'Yêu cầu gửi otp xác thực email'),
(229, 1, '2001:ee0:4a63:8920:1030:4024:9d87:7e69', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', '2024-05-31 16:39:01', 'Yêu cầu gửi otp xác thực email'),
(230, 18, '14.191.175.36', 'Mozilla/5.0 (iPhone; CPU iPhone OS 17_4_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/17.4.1 Mobile/15E148 Safari/604.1', '2024-05-31 17:00:19', 'Đăng nhập tài khoản');
INSERT INTO `logs` (`id`, `user_id`, `ip`, `device`, `createdate`, `action`) VALUES
(231, 1, '2001:ee0:4a63:8920:1030:4024:9d87:7e69', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', '2024-05-31 17:04:32', 'Yêu cầu gửi otp xác thực email'),
(232, 1, '2001:ee0:4a63:8920:1030:4024:9d87:7e69', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', '2024-05-31 17:09:22', 'Yêu cầu gửi otp xác thực email'),
(233, 1, '2001:ee0:4a63:8920:1030:4024:9d87:7e69', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', '2024-05-31 17:11:01', 'Yêu cầu gửi otp xác thực email'),
(234, 18, '14.191.175.36', 'Mozilla/5.0 (iPhone; CPU iPhone OS 15_8_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.6.6 Mobile/15E148 Safari/604.1', '2024-05-31 18:06:44', 'Đăng nhập tài khoản'),
(235, 1, '2001:ee0:4a63:8920:1030:4024:9d87:7e69', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', '2024-05-31 18:33:10', 'Thực hiện login vào admin web'),
(236, 9, '14.188.13.144', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Mobile Safari/537.36', '2024-05-31 22:05:45', 'Đăng nhập tài khoản'),
(237, 1, '2001:ee0:4a63:8920:1030:4024:9d87:7e69', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', '2024-06-01 08:32:57', 'Thực hiện login vào admin web'),
(238, 1, '2001:ee0:4a63:8920:1030:4024:9d87:7e69', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', '2024-06-01 08:33:32', 'Mua thẻ cào S665A7A6A403E0'),
(239, 1, '2001:ee0:4a63:8920:1030:4024:9d87:7e69', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', '2024-06-01 10:35:56', 'Thực hiện login vào admin web'),
(240, 1, '2001:ee0:4a63:8920:1030:4024:9d87:7e69', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', '2024-06-01 10:39:53', 'Thực hiện login vào admin web'),
(241, 9, '14.188.13.144', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Mobile Safari/537.36', '2024-06-01 10:41:19', 'Đăng nhập tài khoản'),
(242, 1, '2001:ee0:4a63:8920:1030:4024:9d87:7e69', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', '2024-06-01 10:42:13', 'Thực hiện login vào admin web'),
(243, 1, '2001:ee0:4a63:8920:69e3:c2ea:f58d:3eb5', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', '2024-06-01 15:49:26', 'Thực hiện login vào admin web'),
(244, 1, '2001:ee0:4a63:8920:69e3:c2ea:f58d:3eb5', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', '2024-06-01 16:07:39', 'Yêu cầu gửi otp xác thực email'),
(245, 1, '2402:800:623e:a93e:64e1:d90b:3077:b5b4', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', '2024-06-01 16:54:48', 'Đăng nhập tài khoản'),
(246, 1, '2402:800:623e:a93e:64e1:d90b:3077:b5b4', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', '2024-06-01 16:55:34', 'Thực hiện login vào admin web'),
(247, 1, '2001:ee0:4a63:8920:69e3:c2ea:f58d:3eb5', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', '2024-06-01 16:59:31', 'Đăng nhập tài khoản'),
(248, 1, '2001:ee0:4a63:8920:69e3:c2ea:f58d:3eb5', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', '2024-06-01 17:23:09', 'Thực hiện login vào admin web'),
(249, 1, '2001:ee0:4a63:8920:69e3:c2ea:f58d:3eb5', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', '2024-06-01 18:19:23', 'Thực hiện login vào admin web'),
(250, 9, '123.18.64.29', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Mobile Safari/537.36', '2024-06-01 23:18:21', 'Đăng nhập tài khoản'),
(251, 2, '2402:800:63e0:6c3f:ad36:2402:97d4:1920', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Mobile Safari/537.36', '2024-06-02 10:52:03', 'Đăng nhập tài khoản'),
(252, 9, '123.18.64.29', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Mobile Safari/537.36', '2024-06-02 23:42:58', 'Đăng nhập tài khoản'),
(253, 1, '2001:ee0:4a63:8920:c5e5:de9f:863e:20a5', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', '2024-06-03 07:54:08', 'Đăng nhập tài khoản'),
(254, 1, '2001:ee0:4a63:8920:c5e5:de9f:863e:20a5', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', '2024-06-03 07:55:12', 'Thực hiện login vào admin web'),
(255, 1, '2001:ee0:4a63:8920:15:7e8a:ebc9:4642', 'Mozilla/5.0 (iPhone; CPU iPhone OS 17_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/17.3.1 Mobile/15E148 Safari/604.1', '2024-06-03 11:27:19', 'Thực hiện login vào admin web'),
(256, 1, '2001:ee0:4a63:8920:19bd:7a9a:8a24:2aab', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', '2024-06-03 13:39:23', 'Đăng nhập tài khoản'),
(257, 1, '2001:ee0:4a63:8920:19bd:7a9a:8a24:2aab', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', '2024-06-03 13:39:40', 'Thực hiện login vào admin web'),
(258, 1, '2001:ee0:4a63:8920:e85f:4e1a:9541:385a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', '2024-06-03 15:57:25', 'Thực hiện login vào admin web'),
(259, 1, '2001:ee0:4a63:8920:e85f:4e1a:9541:385a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', '2024-06-03 17:06:44', 'Thực hiện login vào admin web'),
(260, 1, '2001:ee0:4a63:8920:e85f:4e1a:9541:385a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', '2024-06-03 19:04:46', 'Thực hiện login vào admin web'),
(261, 9, '14.188.13.144', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Mobile Safari/537.36', '2024-06-03 19:38:38', 'Đăng nhập tài khoản'),
(262, 1, '2001:ee0:4a61:2fe0:187f:3c34:9daf:9781', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', '2024-06-04 08:32:15', 'Thực hiện login vào admin web'),
(263, 1, '2001:ee0:4a61:2fe0:6d78:81d6:e160:9b3e', 'Mozilla/5.0 (iPhone; CPU iPhone OS 17_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/17.3.1 Mobile/15E148 Safari/604.1', '2024-06-04 10:05:11', 'Đăng nhập tài khoản'),
(264, 1, '2001:ee0:4a61:2fe0:6d78:81d6:e160:9b3e', 'Mozilla/5.0 (iPhone; CPU iPhone OS 17_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/17.3.1 Mobile/15E148 Safari/604.1', '2024-06-04 10:05:43', 'Thực hiện login vào admin web'),
(265, 9, '14.188.13.144', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Mobile Safari/537.36', '2024-06-04 11:09:04', 'Đăng nhập tài khoản'),
(266, 1, '2001:ee0:4a61:1f30:1d5:1bd7:b9a:d4f7', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', '2024-06-04 16:01:27', 'Thực hiện login vào admin web'),
(267, 1, '2001:ee0:4a61:1f30:1d5:1bd7:b9a:d4f7', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', '2024-06-04 20:36:47', 'Thực hiện login vào admin web'),
(268, 1, '2001:ee0:4a61:1f30:1d5:1bd7:b9a:d4f7', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', '2024-06-04 21:57:49', 'Nạp Topup GFC1B63NLUV2H'),
(269, 1, '2001:ee0:4a61:1f30:589e:8f0:7f66:3523', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', '2024-06-05 07:32:21', 'Thực hiện login vào admin web'),
(270, 1, '2001:ee0:4a61:1f30:589e:8f0:7f66:3523', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', '2024-06-05 09:34:12', 'Thực hiện login vào admin web'),
(271, 1, '2001:ee0:4a63:42b0:69da:8fdd:7ce6:a00c', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', '2024-06-05 17:00:55', 'Thực hiện login vào admin web'),
(272, 1, '2001:ee0:4a63:42b0:69da:8fdd:7ce6:a00c', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', '2024-06-05 20:22:04', 'Thực hiện login vào admin web'),
(273, 20, '2001:ee0:d704:d2b0:e8d3:5d57:7e05:c829', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36 Edg/125.0.0.0', '2024-06-06 07:58:53', 'Đăng ký tài khoản thành công'),
(274, 1, '2001:ee0:4a63:42b0:c9be:5bc3:4f7:6efe', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', '2024-06-06 09:13:51', 'Đăng nhập tài khoản'),
(275, 1, '2001:ee0:4a63:42b0:c9be:5bc3:4f7:6efe', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', '2024-06-06 09:13:57', 'Thực hiện login vào admin web'),
(276, 1, '2001:ee0:4a63:42b0:c9be:5bc3:4f7:6efe', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', '2024-06-06 09:15:52', ' Lấy otp đặt lại mật khẩu qua email'),
(277, 1, '2001:ee0:4a63:42b0:c9be:5bc3:4f7:6efe', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', '2024-06-06 09:36:46', 'Đăng nhập tài khoản'),
(278, 1, '2001:ee0:4a63:42b0:c9be:5bc3:4f7:6efe', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', '2024-06-06 10:05:02', 'Tạo đơn rút tiền thành công: Ruttien 2'),
(279, 1, '2001:ee0:4a63:42b0:c9be:5bc3:4f7:6efe', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', '2024-06-06 11:29:47', 'Thực hiện login vào admin web'),
(280, 21, '14.187.95.88', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', '2024-06-06 13:25:11', 'Đăng ký tài khoản thành công'),
(281, 1, '2001:ee0:4a63:42b0:d059:fbb5:3cb9:dc77', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', '2024-06-06 15:51:36', 'Thực hiện login vào admin web'),
(282, 1, '2001:ee0:4a63:42b0:d059:fbb5:3cb9:dc77', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', '2024-06-06 15:53:05', 'Tạo đơn rút tiền thành công: Ruttien 3'),
(283, 1, '2001:ee0:4a63:42b0:d059:fbb5:3cb9:dc77', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', '2024-06-06 16:12:03', 'Tạo đơn rút tiền thành công: Ruttien 4'),
(284, 1, '2001:ee0:4a63:42b0:d059:fbb5:3cb9:dc77', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', '2024-06-06 16:12:24', 'Thông Báo Đơn Hàng Của Bạn Đã Thành Công'),
(285, 21, '14.187.95.88', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', '2024-06-06 16:14:54', 'Đăng nhập tài khoản'),
(286, 1, '2001:ee0:4a63:42b0:d059:fbb5:3cb9:dc77', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', '2024-06-06 16:16:54', 'Tạo đơn rút tiền thành công: Ruttien 5'),
(287, 1, '2001:ee0:4a63:42b0:d059:fbb5:3cb9:dc77', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', '2024-06-06 16:17:10', 'Thông Báo Đơn Hàng Của Bạn Đã Thành Công'),
(288, 1, '2001:ee0:4a63:42b0:d059:fbb5:3cb9:dc77', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', '2024-06-06 16:17:58', 'Tạo đơn rút tiền thành công: Ruttien 6'),
(289, 1, '2001:ee0:4a63:42b0:d059:fbb5:3cb9:dc77', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', '2024-06-06 16:18:16', 'cskh.dichvuright@gmail.com'),
(290, 1, '2001:ee0:4a63:42b0:d059:fbb5:3cb9:dc77', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', '2024-06-06 16:22:18', 'Tạo đơn rút tiền thành công: Ruttien 7'),
(291, 1, '2001:ee0:4a63:42b0:d059:fbb5:3cb9:dc77', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', '2024-06-06 16:22:37', 'Thông Báo Đơn Hàng Của sếp Đã Thành Công'),
(292, 1, '2001:ee0:4a63:42b0:d059:fbb5:3cb9:dc77', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', '2024-06-06 16:31:13', 'Tạo đơn rút tiền thành công: Ruttien 8'),
(293, 1, '2001:ee0:4a63:42b0:d059:fbb5:3cb9:dc77', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', '2024-06-06 16:31:57', 'Thông Báo Đơn Hàng Của sếp Đã Thành Công'),
(294, 1, '2001:ee0:4a63:42b0:7881:1861:b1e:1970', 'Mozilla/5.0 (iPhone; CPU iPhone OS 17_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/17.3.1 Mobile/15E148 Safari/604.1', '2024-06-06 17:14:29', 'Đăng nhập tài khoản'),
(295, 1, '2001:ee0:4a63:42b0:7881:1861:b1e:1970', 'Mozilla/5.0 (iPhone; CPU iPhone OS 17_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/17.3.1 Mobile/15E148 Safari/604.1', '2024-06-06 17:14:35', 'Thực hiện login vào admin web'),
(296, 1, '2001:ee0:4a63:42b0:8f7:dcbc:9e52:342d', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', '2024-06-06 17:26:06', 'Đăng nhập tài khoản'),
(297, 1, '2001:ee0:4a63:42b0:8f7:dcbc:9e52:342d', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', '2024-06-06 17:26:15', 'Thực hiện login vào admin web'),
(298, 1, '2001:ee0:4a63:42b0:8f7:dcbc:9e52:342d', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', '2024-06-06 17:30:25', 'Nạp Topup YMXTUNH251ORC'),
(299, 1, '2001:ee0:4a63:42b0:8f7:dcbc:9e52:342d', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', '2024-06-06 17:31:55', 'Nạp Topup 8451PQ9KWLMFJ'),
(300, 1, '2402:800:6345:d8b3:6851:894:96e7:5e46', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/17.5 Safari/605.1.15', '2024-06-06 17:36:12', 'Thực hiện login vào admin web'),
(301, 20, '2001:ee0:d704:d2b0:e8d3:5d57:7e05:c829', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36 Edg/125.0.0.0', '2024-06-06 17:52:00', 'Đăng nhập tài khoản'),
(302, 1, '2401:d800:5730:e60:7c8e:b906:c976:18ce', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/17.5 Safari/605.1.15', '2024-06-06 17:56:31', 'Thực hiện login vào admin web'),
(303, 1, '2001:ee0:4a63:42b0:59be:1642:6327:b499', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', '2024-06-06 18:20:21', 'Đăng nhập tài khoản'),
(304, 1, '2001:ee0:4a63:42b0:59be:1642:6327:b499', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', '2024-06-06 18:20:23', 'Thực hiện login vào admin web'),
(305, 1, '171.234.10.54', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', '2024-06-06 21:13:56', 'Thực hiện login vào admin web'),
(306, 1, '2001:ee0:4a63:42b0:f505:9db0:8508:d134', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', '2024-06-06 21:25:08', 'Đăng nhập tài khoản'),
(307, 1, '2401:d800:5730:e60:7c8e:b906:c976:18ce', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/17.5 Safari/605.1.15', '2024-06-06 21:37:36', 'Thực hiện login vào admin web'),
(308, 1, '2001:ee0:4a63:42b0:f505:9db0:8508:d134', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', '2024-06-06 21:44:32', 'Thực hiện login vào admin web'),
(309, 1, '2001:ee0:4a63:42b0:f505:9db0:8508:d134', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', '2024-06-06 21:45:04', 'Nạp Topup QMI5E8ZLRWB12'),
(310, 1, '2001:ee0:4a63:42b0:7881:1861:b1e:1970', 'Mozilla/5.0 (iPhone; CPU iPhone OS 17_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/17.3.1 Mobile/15E148 Safari/604.1', '2024-06-06 22:18:32', 'Đăng nhập tài khoản'),
(311, 9, '171.244.72.23', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Mobile Safari/537.36', '2024-06-06 23:45:05', 'Đăng nhập tài khoản'),
(312, 1, '2001:ee0:4a63:42b0:f505:9db0:8508:d134', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', '2024-06-07 07:24:50', 'Thực hiện login vào admin web'),
(313, 1, '2001:ee0:4a63:42b0:f505:9db0:8508:d134', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', '2024-06-07 07:24:55', 'Thực hiện login vào admin web'),
(314, 1, '2001:ee0:4a63:42b0:f505:9db0:8508:d134', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', '2024-06-07 07:24:57', 'Thực hiện login vào admin web'),
(315, 9, '2001:ee0:4704:b3f0:9082:93c5:8c2e:1a89', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Mobile Safari/537.36', '2024-06-07 09:04:34', 'Đăng nhập tài khoản'),
(316, 1, '2001:ee0:4a63:42b0:f505:9db0:8508:d134', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', '2024-06-07 09:48:57', 'Kích hoạt thành công googleauth'),
(317, 22, '171.251.234.214', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Mobile Safari/537.36', '2024-06-07 09:55:57', 'Đăng ký tài khoản thành công'),
(318, 1, '2001:ee0:4a63:42b0:f505:9db0:8508:d134', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', '2024-06-07 11:21:04', 'Mua thẻ cào S66628A9557A9B'),
(319, 1, '2001:ee0:4a63:42b0:f505:9db0:8508:d134', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', '2024-06-07 11:21:36', 'Tắt 2FA thành công'),
(320, 1, '2001:ee0:4a63:42b0:f505:9db0:8508:d134', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', '2024-06-07 11:24:59', 'Bật mật khẩu cấp 2 thành công'),
(321, 1, '2001:ee0:4a63:42b0:f505:9db0:8508:d134', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', '2024-06-07 11:52:45', 'Mua thẻ cào S66628D435E775'),
(322, 1, '2001:ee0:4a63:42b0:f505:9db0:8508:d134', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', '2024-06-07 12:01:54', 'Thực hiện login vào admin web'),
(323, 1, '2001:ee0:4a63:42b0:f505:9db0:8508:d134', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', '2024-06-07 12:21:48', 'Đăng ký tài khoản thành công'),
(324, 1, '2001:ee0:4a63:42b0:f505:9db0:8508:d134', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', '2024-06-07 12:21:55', 'Thực hiện login vào admin web');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `menu`
--

CREATE TABLE `menu` (
  `id` int(11) NOT NULL,
  `ten` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL DEFAULT '#',
  `trangthai` varchar(255) NOT NULL DEFAULT 'ON',
  `id_menu_cha` varchar(255) DEFAULT '0',
  `level` varchar(255) DEFAULT NULL,
  `menu_type` varchar(255) DEFAULT NULL,
  `stt` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `menu`
--

INSERT INTO `menu` (`id`, `ten`, `url`, `trangthai`, `id_menu_cha`, `level`, `menu_type`, `stt`) VALUES
(20, 'NẠP TIỀN', 'wallet/deposit/vnd', 'ON', '0', 'con', 'header', 2),
(21, 'RÚT QUỸ', 'wallet/withdraw/vnd', 'ON', '0', 'con', 'header', 3),
(22, 'CHUYỂN TIỀN', 'wallet/transfer', 'ON', '0', 'con', 'header', 4),
(36, 'KẾT NỐI API', 'merchant/list', 'ON', '0', 'con', 'header', 6),
(37, 'BẢO MẬT', 'security/list', 'ON', '0', 'con', 'header', 7),
(39, 'THÔNG TIN', '#', 'ON', '0', 'cha', 'footer', 1),
(40, 'ĐỐI TÁC', '#', 'ON', '0', 'cha', 'footer', 1),
(46, 'ĐỔI THẺ', 'doithecao', 'ON', '0', 'con', 'header', 0),
(48, 'MUA THẺ', 'card', 'ON', '0', 'con', 'header', 0),
(54, 'TẠO WEBSITE CON', 'webcon', 'ON', '0', 'con', 'header', 10),
(55, 'LỊCH SỬ', '#', 'ON', '0', 'cha', 'header', 5),
(56, 'LỊCH SỬ GIAO DỊCH', 'wallet/history/vnd', 'ON', '0', '55', 'header', 1),
(57, 'DichVuRight JSC', 'https://dichvuright.com', 'ON', '0', '40', 'footer', 1),
(58, 'LỊCH SỬ ĐỔI THẺ', 'doithecao', 'ON', '0', '55', 'header', 2),
(59, 'LỊCH SỬ MUA THẺ', 'card', 'ON', '0', '55', 'header', 3),
(60, 'MUA NICK GAME', '#', 'ON', '0', 'cha', 'header', 9),
(61, 'MUA NICK GAME', 'nick', 'ON', '0', '60', 'header', 1),
(62, 'ĐĂNG KÝ BÁN NICK', 'nick-game/create', 'ON', '0', '60', 'header', 2),
(63, 'LỊCH SỬ MUA NICK', 'nick-game/history', 'ON', '0', '60', 'header', 3),
(64, 'LỊCH SỬ BÁN NICK', 'nick-game/my-nick', 'ON', '0', '60', 'header', 4),
(65, 'NẠP TIỀN DT', 'recharge/nap-tien-dien-thoai', 'ON', '0', 'con', 'header', 8);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `merchants`
--

CREATE TABLE `merchants` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `partner_id` varchar(255) NOT NULL,
  `partner_key` varchar(255) NOT NULL,
  `wallet_num` varchar(100) NOT NULL,
  `ips` varchar(255) DEFAULT NULL,
  `callback` varchar(255) DEFAULT NULL,
  `callback_type` varchar(255) DEFAULT 'POST',
  `callback_post_type` varchar(50) DEFAULT NULL,
  `module` varchar(50) DEFAULT 'Charging',
  `checksign` int(11) DEFAULT 1 COMMENT 'check chữ kly, 1 là có ',
  `description` text DEFAULT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `merchants`
--

INSERT INTO `merchants` (`id`, `user_id`, `name`, `partner_id`, `partner_key`, `wallet_num`, `ips`, `callback`, `callback_type`, `callback_post_type`, `module`, `checksign`, `description`, `status`, `created_at`, `updated_at`) VALUES
(6, 9, 'API', '7056475972', 'b11451046b51440e092c82416fb91595', '87887424', '', 'Test', 'GET', 'Json', 'Charging', 1, NULL, 1, '2024-06-04 04:09:33', '2024-06-04 04:09:33'),
(7, 1, 'API', '5200546674', 'f0261711ef32536066e01adcc6f22f47', '1215541853', '', 'https://khanhapi.me/api/card.php', 'POST', 'Json', 'Recharge', 1, NULL, 1, '2024-06-06 11:24:54', '2024-06-06 11:24:54'),
(8, 22, 'API', '6513949611', '878dbb1c11ec2057e0b2f603a193d442', '5027428957', '', '', 'GET', 'Json', 'Charging', 1, NULL, 1, '2024-06-07 02:56:23', '2024-06-07 02:56:23');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `news`
--

CREATE TABLE `news` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `news_slug` varchar(255) NOT NULL,
  `meta` text DEFAULT NULL,
  `short_description` text DEFAULT NULL,
  `description` text NOT NULL,
  `author` varchar(50) DEFAULT NULL,
  `author_email` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `language` varchar(9) DEFAULT NULL,
  `custom_layout` tinyint(4) DEFAULT NULL,
  `view_count` int(11) DEFAULT 0,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `cats` int(11) DEFAULT NULL,
  `publish_date` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status_home` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `news`
--

INSERT INTO `news` (`id`, `title`, `news_slug`, `meta`, `short_description`, `description`, `author`, `author_email`, `image`, `language`, `custom_layout`, `view_count`, `status`, `cats`, `publish_date`, `created_at`, `updated_at`, `status_home`) VALUES
(1, 'DichVuRight JSC', 'dichvuright-jsc', NULL, 'b2s=', 'PHA+TXVhIEliIDsgQGRpY2h2dXJpZ2h0PC9wPg0K', NULL, NULL, '/assets/storage/images/image_C26G0.png', NULL, NULL, 10021, 1, NULL, NULL, '2024-05-21 00:07:34', NULL, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `nick_game`
--

CREATE TABLE `nick_game` (
  `id` int(11) NOT NULL,
  `tennguoimua` text CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `tennguoiban` text NOT NULL,
  `ngaymua` text DEFAULT NULL,
  `loai` text NOT NULL,
  `taikhoan` text CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `matkhau` text DEFAULT NULL,
  `loai_acc` text CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `thongtin_acc` text CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `key2fa` text CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `chi_tiet` text CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `img` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `list_img` text CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `gia` int(32) DEFAULT NULL,
  `status` text CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci NOT NULL DEFAULT 'chuaban',
  `date` date NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `options`
--

CREATE TABLE `options` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `value` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_vietnamese_ci ROW_FORMAT=DYNAMIC;

--
-- Đang đổ dữ liệu cho bảng `options`
--

INSERT INTO `options` (`id`, `name`, `value`) VALUES
(1, 'title', 'DichVuRight'),
(2, 'description', 'DichVuRight'),
(3, 'keyword', 'DOITHE,MUATHE'),
(4, 'author', 'DichVuRight'),
(6, 'image', 'assets/storage/images/image_2UT4V.png'),
(7, 'keyword', 'TỪ KHÓA '),
(8, 'favicon', 'assets/storage/images/image_URDZG.png'),
(9, 'theme_color', '#2371f7'),
(355, 'hotline', ''),
(356, 'email', ''),
(357, 'time_session_login', '300000'),
(358, 'status', 'ON'),
(362, 'status_muathe', 'ON'),
(363, 'partner_key_muathe', ''),
(364, 'partner_id_muathe', ''),
(376, 'anti_card_web_thatbai', '20'),
(377, 'anti_card_web_xuly', '20'),
(378, 'anti_card_api_thatbai', '30'),
(379, 'anti_card_api_xuly', '10'),
(380, 'time_check_spam_card', '300'),
(381, 'status_chuyentien', 'ON'),
(382, 'rank_mac_dinh', 'nhom_ck_1'),
(384, 'ten_nhom_ck_1', 'Thành viên'),
(385, 'ten_nhom_ck_2', 'Đại lý'),
(386, 'ten_nhom_ck_3', 'Đối tác'),
(398, 'status_doithe', 'ON'),
(400, 'logo', 'assets/storage/images/image_XG3CV.png'),
(401, 'hien_thi_nhom_ck_1', 'ON'),
(402, 'hien_thi_nhom_ck_2', 'ON'),
(403, 'hien_thi_nhom_ck_3', 'OFF'),
(406, 'status_cron_ck_nhom_1', 'ON'),
(407, 'status_cron_ck_nhom_2', 'ON'),
(408, 'status_cron_ck_nhom_3', 'ON'),
(410, 'partner_id_doithe', ''),
(411, 'partner_key_doithe', ''),
(412, 'copyright', 'Copyright © DichVuRight '),
(413, 'tencongty', 'Đổi Thẻ Cào Thành Tiền Mặt Tự Động Chiết Khấu Tốt Nhất Việt Nam'),
(414, 'linhvuc', 'Hệ thống đổi thẻ cào sang tiền mặt , momo, đổi thẻ cào sang thẻ game, xử lý thẻ, rút tiền tự động trong vài giây , phí tốt nhất thị trường - tự động xử lý thẻ cực nhanh chóng !'),
(415, 'diachi', 'Vietnam'),
(416, 'facebook', ''),
(417, 'notice_popup', '<p style=\"text-align:center\"><strong>WEBTHE</strong></p>\r\n'),
(418, 'notice_ref', ''),
(419, 'thongbao', 'PGRpdiBjbGFzcz0iY29udGFpbmVyIHRkLWNvbnRlbnQiIHN0eWxlPSJ0ZXh0LWFsaWduOmNlbnRlciI+PHN0cm9uZz5XRUJUSEU8L3N0cm9uZz48L2Rpdj4NCg=='),
(420, 'max_rut_auto_atm', '100000000'),
(422, 'max_rut_auto_momo', '500000'),
(424, 'notice_ruttien', 'PHVsPg0KCTxsaT48c3Ryb25nPlRy4bqhbmcgdGgmYWFjdXRlO2kmbmJzcDs8c3BhbiBzdHlsZT0iY29sb3I6I2YxYzQwZiI+xJBBTkcgVFJFTzwvc3Bhbj4mbmJzcDtsJmFncmF2ZTsgZG8gbmcmYWNpcmM7biBoJmFncmF2ZTtuZywgbW9tbyBs4buXaSZuYnNwO2LhuqFuIHZ1aSBsJm9ncmF2ZTtuZyBjaOG7nSBo4buHIHRo4buRbmcgeOG7rSBsJnlhY3V0ZTsgbOG6oWkgdHJvbmcgdGjhu51pIGdpYW4gc+G7m20gbmjhuqV0PC9zdHJvbmc+PC9saT4NCgk8bGk+PHNwYW4gc3R5bGU9ImNvbG9yOiNjMDM5MmIiPjxzdHJvbmc+UiZ1YWN1dGU7dCB0aeG7gW4geOG7rSBsJnlhY3V0ZTsgY+G7sWMgbmhhbmggMS0xNXMvxJHGoW48L3N0cm9uZz48L3NwYW4+PC9saT4NCgk8bGk+PHN0cm9uZz5SJnVhY3V0ZTt0IGzhu5dpIHZ1aSBsJm9ncmF2ZTtuZyBiJmFhY3V0ZTtvIGFkbWluIMSR4buDIMSRxrDhu6NjIGjhu5cgdHLhu6MgbmhhbmggbmjhuqV0Ljwvc3Ryb25nPjwvbGk+DQo8L3VsPg0K'),
(425, 'notice_naptien', 'PHA+PHN0cm9uZz5MxrB1ICZ5YWN1dGU7Ojwvc3Ryb25nPjwvcD4NCg0KPHA+LSBOZ2hpJmVjaXJjO20gY+G6pW0gbuG6oXAgaCZhZ3JhdmU7bmggdmkgZCZ1Z3JhdmU7bmcgc3RrIHdlYiDEkWkgc2NhbSwgxJHhu5VpIHRp4buBbiwgcuG7rWEgdGnhu4FuLCBu4bqhcCB4b25nIHImdWFjdXRlO3QmbmJzcDtraCZvYWN1dGU7YSB2xKluaCB2aeG7hW4uPC9wPg0KDQo8cD4tIENo4buJIGNobyBwaCZlYWN1dGU7cCBO4bqhcCB0aeG7gW4gYuG6sW5nPHN0cm9uZz4mbmJzcDtBVE0vTU9NTzwvc3Ryb25nPiZuYnNwO2Phu6dhIGNoJmlhY3V0ZTtuaCBi4bqhbi4gTOG6pXkmbmJzcDs8c3Ryb25nPkFUTS9NT01PPC9zdHJvbmc+Jm5ic3A7Y+G7p2EgbmfGsOG7nWkga2gmYWFjdXRlO2MmbmJzcDtu4bqhcCB0aeG7gW4gdiZhZ3JhdmU7byB3ZWIgc+G6vSBi4buLIGtoJm9hY3V0ZTthIHbEqW5oIHZp4buFbiB2JmFncmF2ZTsga2gmb2NpcmM7bmcgaG8mYWdyYXZlO24gc+G7kSBkxrAuPC9wPg0KDQo8cD4tIFRo4budaSBnaWFuIMSR4bujaSB0aGFuaCB0byZhYWN1dGU7biDEkeG7kWkgxJFhPHN0cm9uZz4mbmJzcDsxNSBwaCZ1YWN1dGU7dDwvc3Ryb25nPi4mbmJzcDtI4buHIHRo4buRbmcgdOG7sSDEkeG7mW5nIGPhu5luZyB0aeG7gW4gMjQvMjQuIFZ1aSBsJm9ncmF2ZTtuZyBnaGkgxJEmdWFjdXRlO25nJm5ic3A7PHN0cm9uZz5TVEssIG7hu5lpIGR1bmc8L3N0cm9uZz4mbmJzcDtjaHV54buDbiBraG/huqNuLjwvcD4NCg0KPHA+LSBTYWkgc+G7kSB0aeG7gW4sIG7hu5lpIGR1bmcgc+G6vSBi4buLIHRy4burPHN0cm9uZz4gMTAlIHPhu5EgdGnhu4FuLjwvc3Ryb25nPjwvcD4NCg=='),
(426, 'javascript_header', ''),
(427, 'javascript_footer', ''),
(428, 'notice_chuyen', ''),
(429, 'status_ref', 'ON'),
(431, 'ref_ck', '0.4'),
(438, 'notice_muathe', NULL),
(439, 'telegram', ''),
(445, 'notice_baomat', 'PHA+xJDhu4MgYuG6o28gduG7hyBz4buRIGTGsCB0JmFncmF2ZTtpIGtob+G6o24sIGLhuqFuIG4mZWNpcmM7biBjJmFncmF2ZTtpIMSR4bq3dCBt4buZdCBwaMawxqFuZyBwaCZhYWN1dGU7cCBi4bqjbyBt4bqtdCBiJmVjaXJjO24gZMaw4bubaS4gTG/huqFpIGLhuq10IHbhu4cgdOG7kXQgbmjhuqV0IGwmYWdyYXZlOyBHb29nbGUgQXV0aGVudGljYXRvci4gRCZ1Z3JhdmU7bmcgbeG6rXQga2jhuql1IGPhuqVwIDIgYyZvYWN1dGU7IMSR4buZIGLhuqNvIG3huq10IHRo4bqlcCwgYuG6oW4gbiZlY2lyYztuIGMmYWNpcmM7biBuaOG6r2MuJm5ic3A7PC9wPg0K'),
(446, 'sovi_webme', ''),
(447, 'smtp_email', ''),
(448, 'smtp_password', ''),
(450, 'recaptcha_secret', ''),
(451, 'recaptcha_key', ''),
(452, 'limit_muathe', '10'),
(453, 'noi_dung_rut_tien', 'Ruttien'),
(454, 'noi_dung_nap_tien', 'Naptien'),
(455, 'keywords', 'doithecao , gạch thẻ , gạch card , đổi thẻ cào ra tiền mặt , gạch thẻ cào , đổi thẻ cào thành tiền mặt, gạch thẻ cào, Gạch thẻ cào , thenap1s, Thenap1s ,THENAP1S , doithe cao, web doithe, doithe nhanh, web doi the, thenhanh1s, tn1s, napthe1s,nt1s,...'),
(456, 'time_off_modal', '10000'),
(457, 'thanh_toan_don_loi', 'ON'),
(458, 'check_time_cron_rut_momo_loi', '1683966690'),
(459, 'so_lan_thanh_toan_that_bai_momo', '5'),
(460, 'title_doithecao', 'ĐỔI THẺ CÀO TỰ ĐỘNG'),
(461, 'title_muathecao', 'MUA THẺ CÀO, THẺ GAME GIÁ RẺ'),
(462, 'theme_color_2', '#2371f7'),
(463, 'mota', 'WEB THẺ'),
(464, 'ten_nhom_ck_4', 'Admin'),
(465, 'slide_color', '#2371f7'),
(466, 'globalpopup', 'ON'),
(467, 'hien_thi_nhom_ck_4', 'OFF'),
(468, 'telegram_token', ''),
(469, 'telegram_chat_id', ''),
(470, 'notice_merchant', ''),
(474, 'deposit_expiration', '900'),
(475, 'login_failed', '5'),
(476, 'status_cron_ck_nhom_4', 'ON'),
(477, 'time_cron', '1717736242'),
(478, 'note_duong', 'VXBkYXRlIFBoacOqbiBC4bqjbiBN4bubaSBC4bufaSBEaWNoVnVSaWdodC5jb20='),
(479, 'pass_cron', '56446545456546'),
(480, 'note_cron', 'cron'),
(481, 'limit_cron_withdrawMomoFaid', '1717736241'),
(482, 'limit_cron_depositVcb', '1717736241'),
(483, 'limit_cron_depositMomo', '1717736242'),
(484, 'limit_cron_depositMb', '1717736242'),
(485, 'limit_cron_laitudong', '1717736242'),
(488, 'penalty_charging', '50'),
(489, 'tien_tao_webcon', ''),
(490, 'ns1', ''),
(491, 'ns2', ''),
(492, 'thongbaowebcon', '<p style=\"text-align:center\"><strong>WEBTHE</strong></p>\r\n'),
(493, 'tien_nang_cap', '10000'),
(494, 'tb_ctv', 'PHA+PHN0cm9uZz4tJm5ic3A7ROG7i2NoIHbhu6UgxJHEg25nIGImYWFjdXRlO24gTklDSyBobyZhZ3JhdmU7biB0byZhZ3JhdmU7biBtaeG7hW4gcGgmaWFjdXRlOzwvc3Ryb25nPjwvcD4NCg0KPGgyPjxzdHJvbmc+LSZuYnNwO0Thu4tjaCB24bulIMSRxINuZyBiJmFhY3V0ZTtuIE5JQ0sgaG8mYWdyYXZlO24gdG8mYWdyYXZlO24gbWnhu4VuIHBoJmlhY3V0ZTssIGR1eeG7h3QgYWNjIGwmZWNpcmM7biB3ZWIgdnVpIGwmb2dyYXZlO25nIGfhu61pIHQmZWNpcmM7biB0JmFncmF2ZTtpIGtob+G6o24gcXVhIERpY2hWdVJpZ2h0PC9zdHJvbmc+PC9oMj4NCg=='),
(495, 'tb_nick', 'PHA+PHN0cm9uZz4tJm5ic3A7ROG7i2NoIHbhu6UgxJHEg25nIGImYWFjdXRlO24gTklDSyBobyZhZ3JhdmU7biB0byZhZ3JhdmU7biBtaeG7hW4gcGgmaWFjdXRlOzwvc3Ryb25nPjwvcD4NCg0KPGgyPjxzdHJvbmc+LSZuYnNwO0Thu4tjaCB24bulIMSRxINuZyBiJmFhY3V0ZTtuIE5JQ0sgaG8mYWdyYXZlO24gdG8mYWdyYXZlO24gbWnhu4VuIHBoJmlhY3V0ZTssIGR1eeG7h3QgYWNjIGwmZWNpcmM7biB3ZWIgdnVpIGwmb2dyYXZlO25nIGfhu61pIHQmZWNpcmM7biB0JmFncmF2ZTtpIGtob+G6o24gcXVhIERpY2hWdVJpZ2h0PC9zdHJvbmc+PC9oMj4NCg=='),
(496, 'partner_id_rechargews', '34520207996'),
(497, 'partner_key_rechargews', '24d32be4ee33855d5ac018630a5fc6bd'),
(498, 'loai_recharge', 'tay'),
(500, 'sodu_topup', '1800'),
(501, 'apikeycfl', ''),
(502, 'gmailcfl', ''),
(503, 'ip_host', ''),
(505, 'ten_mien_chinh', '');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `paygates`
--

CREATE TABLE `paygates` (
  `id` int(11) NOT NULL,
  `currency_id` int(11) NOT NULL,
  `currency_code` varchar(10) NOT NULL,
  `code` varchar(255) NOT NULL,
  `paygate` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `balance` float DEFAULT NULL,
  `balance_max` float DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `withdraw` tinyint(4) NOT NULL DEFAULT 0,
  `withdrawField` text DEFAULT NULL,
  `deposit` tinyint(4) NOT NULL DEFAULT 0,
  `payment` tinyint(4) NOT NULL DEFAULT 0,
  `instant` tinyint(4) DEFAULT 0,
  `verify` tinyint(4) DEFAULT 0,
  `convert` tinyint(4) DEFAULT 0,
  `redirect` tinyint(4) DEFAULT 1,
  `round` tinyint(4) DEFAULT 0,
  `description` text DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `configs` text DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `mid_bank` varchar(50) DEFAULT NULL,
  `qr_bank` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `w_fixed_fees` varchar(255) DEFAULT NULL,
  `w_percent_fees` varchar(255) DEFAULT NULL,
  `w_daily_limit` varchar(255) DEFAULT NULL,
  `w_country_block` varchar(255) DEFAULT NULL,
  `w_min` varchar(255) DEFAULT NULL,
  `w_max` varchar(255) DEFAULT NULL,
  `w_nofees` varchar(255) DEFAULT NULL,
  `w_vendor_fixed_fees` varchar(255) DEFAULT NULL,
  `w_vendor_percent_fees` varchar(255) DEFAULT NULL,
  `d_fixed_fees` varchar(255) DEFAULT NULL,
  `d_percent_fees` varchar(255) DEFAULT NULL,
  `d_daily_limit` varchar(255) DEFAULT NULL,
  `d_country_block` varchar(255) DEFAULT NULL,
  `d_min` varchar(255) DEFAULT NULL,
  `d_max` varchar(255) DEFAULT NULL,
  `d_nofees` varchar(255) DEFAULT NULL,
  `d_vendor_fixed_fees` varchar(255) DEFAULT NULL,
  `d_vendor_percent_fees` varchar(255) DEFAULT NULL,
  `p_fixed_fees` varchar(255) DEFAULT NULL,
  `p_percent_fees` varchar(255) DEFAULT NULL,
  `p_daily_limit` varchar(255) DEFAULT NULL,
  `p_country_block` varchar(255) DEFAULT NULL,
  `p_min` varchar(255) DEFAULT NULL,
  `p_max` varchar(255) DEFAULT NULL,
  `p_nofees` varchar(255) DEFAULT NULL,
  `p_vendor_fixed_fees` varchar(255) DEFAULT NULL,
  `p_vendor_percent_fees` varchar(255) DEFAULT NULL,
  `t_fixed_fees` varchar(255) DEFAULT NULL,
  `t_percent_fees` varchar(255) DEFAULT NULL,
  `t_daily_limit` varchar(255) DEFAULT NULL,
  `t_country_block` varchar(255) DEFAULT NULL,
  `t_min` varchar(255) DEFAULT NULL,
  `t_max` varchar(255) DEFAULT NULL,
  `t_nofees` varchar(255) DEFAULT NULL,
  `allow_groups` varchar(255) DEFAULT NULL,
  `deposit_paygate` text DEFAULT NULL,
  `withdraw_paygate` text DEFAULT NULL,
  `total_withdraw_today` text DEFAULT NULL,
  `withdraw_vendor` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `deposit_vendor` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `sort` int(11) DEFAULT 0,
  `canceltime` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Đang đổ dữ liệu cho bảng `paygates`
--

INSERT INTO `paygates` (`id`, `currency_id`, `currency_code`, `code`, `paygate`, `name`, `balance`, `balance_max`, `type`, `withdraw`, `withdrawField`, `deposit`, `payment`, `instant`, `verify`, `convert`, `redirect`, `round`, `description`, `avatar`, `url`, `configs`, `status`, `mid_bank`, `qr_bank`, `w_fixed_fees`, `w_percent_fees`, `w_daily_limit`, `w_country_block`, `w_min`, `w_max`, `w_nofees`, `w_vendor_fixed_fees`, `w_vendor_percent_fees`, `d_fixed_fees`, `d_percent_fees`, `d_daily_limit`, `d_country_block`, `d_min`, `d_max`, `d_nofees`, `d_vendor_fixed_fees`, `d_vendor_percent_fees`, `p_fixed_fees`, `p_percent_fees`, `p_daily_limit`, `p_country_block`, `p_min`, `p_max`, `p_nofees`, `p_vendor_fixed_fees`, `p_vendor_percent_fees`, `t_fixed_fees`, `t_percent_fees`, `t_daily_limit`, `t_country_block`, `t_min`, `t_max`, `t_nofees`, `allow_groups`, `deposit_paygate`, `withdraw_paygate`, `total_withdraw_today`, `withdraw_vendor`, `deposit_vendor`, `sort`, `canceltime`, `created_at`, `updated_at`) VALUES
(1, 1, 'VND', 'Localbank_VCB', 'Localbank', 'VIETCOMBANK TỰ ĐỘNG', 0, 0, 'localbank', 1, 'account_num,account_name', 1, 0, 0, 0, 0, 0, 0, NULL, NULL, 'http://103.109.43.170/api/', '{\"bank_name\":\"\",\"account_name\":\"\",\"account_num\":\"\",\"account_password\":\"\"}', 1, '970436', NULL, '{\"nhom_ck_1\":\"\",\"nhom_ck_2\":\"\",\"nhom_ck_3\":\"\",\"nhom_ck_4\":\"\"}', '{\"nhom_ck_1\":\"\",\"nhom_ck_2\":\"\",\"nhom_ck_3\":\"\",\"nhom_ck_4\":\"\"}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', NULL, '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"nhom_ck_1\":\"\",\"nhom_ck_2\":\"\",\"nhom_ck_3\":\"\",\"nhom_ck_4\":\"\"}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"nhom_ck_1\":\"\",\"nhom_ck_2\":\"\",\"nhom_ck_3\":\"\",\"nhom_ck_4\":\"\"}', '{\"nhom_ck_1\":\"\",\"nhom_ck_2\":\"\",\"nhom_ck_3\":\"\",\"nhom_ck_4\":\"\"}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', NULL, '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"nhom_ck_1\":\"\",\"nhom_ck_2\":\"\",\"nhom_ck_3\":\"\",\"nhom_ck_4\":\"\"}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', NULL, '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[\"nhom_ck_1\",\"nhom_ck_2\",\"nhom_ck_3\",\"nhom_ck_4\"]', NULL, NULL, NULL, 'ApiWebme', '', 0, 15, '2020-10-06 03:36:39', '2023-07-07 10:07:46'),
(2, 1, 'VND', 'Localbank_BIDV', 'Localbank', 'BIDV TỰ ĐỘNG', 0, 0, 'localbank', 1, 'account_num,account_name', 0, 0, 1, 0, 0, 0, 0, NULL, NULL, 'http://103.109.43.170/api/', '{\"bank_name\":\"\",\"account_name\":\"\",\"account_num\":\"\",\"account_password\":\"\"}', 1, '970418', NULL, '{\"nhom_ck_1\":\"\",\"nhom_ck_2\":\"\",\"nhom_ck_3\":\"\",\"nhom_ck_4\":\"\"}', '{\"nhom_ck_1\":\"\",\"nhom_ck_2\":\"\",\"nhom_ck_3\":\"\",\"nhom_ck_4\":\"\"}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', NULL, '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"nhom_ck_1\":\"\",\"nhom_ck_2\":\"\",\"nhom_ck_3\":\"\",\"nhom_ck_4\":\"\"}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"nhom_ck_1\":\"\",\"nhom_ck_2\":\"\",\"nhom_ck_3\":\"\",\"nhom_ck_4\":\"\"}', '{\"nhom_ck_1\":\"\",\"nhom_ck_2\":\"\",\"nhom_ck_3\":\"\",\"nhom_ck_4\":\"\"}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', NULL, '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"nhom_ck_1\":\"\",\"nhom_ck_2\":\"\",\"nhom_ck_3\":\"\",\"nhom_ck_4\":\"\"}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', NULL, '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[\"nhom_ck_1\",\"nhom_ck_2\",\"nhom_ck_3\",\"nhom_ck_4\"]', NULL, NULL, NULL, 'ApiWebme', '', 0, 15, '2022-06-25 07:21:06', '2023-06-14 10:52:46'),
(3, 1, 'VND', 'Localbank_VTB', 'Localbank', 'VIETINBANK TỰ ĐỘNG', 0, 0, 'localbank', 1, 'account_num,account_name', 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 'http://103.109.43.170/api/', '{\"bank_name\":\"\",\"account_name\":\"\",\"account_num\":\"\",\"account_password\":\"\"}', 1, '970415', NULL, '{\"nhom_ck_1\":\"\",\"nhom_ck_2\":\"\",\"nhom_ck_3\":\"\",\"nhom_ck_4\":\"\"}', '{\"nhom_ck_1\":\"\",\"nhom_ck_2\":\"\",\"nhom_ck_3\":\"\",\"nhom_ck_4\":\"\"}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', NULL, '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"nhom_ck_1\":\"\",\"nhom_ck_2\":\"\",\"nhom_ck_3\":\"\",\"nhom_ck_4\":\"\"}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"nhom_ck_1\":\"\",\"nhom_ck_2\":\"\",\"nhom_ck_3\":\"\",\"nhom_ck_4\":\"\"}', '{\"nhom_ck_1\":\"\",\"nhom_ck_2\":\"\",\"nhom_ck_3\":\"\",\"nhom_ck_4\":\"\"}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', NULL, '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"nhom_ck_1\":\"\",\"nhom_ck_2\":\"\",\"nhom_ck_3\":\"\",\"nhom_ck_4\":\"\"}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', NULL, '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[\"nhom_ck_1\",\"nhom_ck_2\",\"nhom_ck_3\",\"nhom_ck_4\"]', NULL, NULL, NULL, 'ApiWebme', '', 0, 15, '2022-01-27 14:17:02', '2023-06-14 10:52:46'),
(4, 1, 'VND', 'Localbank_AGR', 'Localbank', 'AGRIBANK  - HAY LỖI CÓ THỂ RÚT SẼ CHẬM', 0, 0, 'localbank', 1, 'account_num,account_name', 0, 0, 1, 0, 0, 0, 0, NULL, NULL, 'http://103.109.43.170/api/', '{\"bank_name\":\"\",\"account_name\":\"\",\"account_num\":\"\",\"account_password\":\"\"}', 1, '970405', NULL, '{\"nhom_ck_1\":\"\",\"nhom_ck_2\":\"\",\"nhom_ck_3\":\"\",\"nhom_ck_4\":\"\"}', '{\"nhom_ck_1\":\"\",\"nhom_ck_2\":\"\",\"nhom_ck_3\":\"\",\"nhom_ck_4\":\"\"}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', NULL, '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"nhom_ck_1\":\"\",\"nhom_ck_2\":\"\",\"nhom_ck_3\":\"\",\"nhom_ck_4\":\"\"}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"nhom_ck_1\":\"\",\"nhom_ck_2\":\"\",\"nhom_ck_3\":\"\",\"nhom_ck_4\":\"\"}', '{\"nhom_ck_1\":\"\",\"nhom_ck_2\":\"\",\"nhom_ck_3\":\"\",\"nhom_ck_4\":\"\"}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', NULL, '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"nhom_ck_1\":\"\",\"nhom_ck_2\":\"\",\"nhom_ck_3\":\"\",\"nhom_ck_4\":\"\"}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', NULL, '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[\"nhom_ck_1\",\"nhom_ck_2\",\"nhom_ck_3\",\"nhom_ck_4\"]', NULL, NULL, NULL, 'ApiWebme', '', 0, 15, '2022-06-24 06:18:29', '2023-06-14 14:12:38'),
(5, 1, 'VND', 'Localbank_SAC', 'Localbank', 'SACOMBANK TỰ ĐỘNG', 0, 0, 'localbank', 1, 'account_num,account_name', 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 'http://103.109.43.170/api/', '{\"bank_name\":\"\",\"account_name\":\"\",\"account_num\":\"\",\"account_password\":\"\"}', 1, '970403', NULL, '{\"nhom_ck_1\":\"\",\"nhom_ck_2\":\"\",\"nhom_ck_3\":\"\",\"nhom_ck_4\":\"\"}', '{\"nhom_ck_1\":\"\",\"nhom_ck_2\":\"\",\"nhom_ck_3\":\"\",\"nhom_ck_4\":\"\"}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', NULL, '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"nhom_ck_1\":\"\",\"nhom_ck_2\":\"\",\"nhom_ck_3\":\"\",\"nhom_ck_4\":\"\"}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"nhom_ck_1\":\"\",\"nhom_ck_2\":\"\",\"nhom_ck_3\":\"\",\"nhom_ck_4\":\"\"}', '{\"nhom_ck_1\":\"\",\"nhom_ck_2\":\"\",\"nhom_ck_3\":\"\",\"nhom_ck_4\":\"\"}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', NULL, '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"nhom_ck_1\":\"\",\"nhom_ck_2\":\"\",\"nhom_ck_3\":\"\",\"nhom_ck_4\":\"\"}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', NULL, '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[\"nhom_ck_1\",\"nhom_ck_2\",\"nhom_ck_3\",\"nhom_ck_4\"]', NULL, NULL, NULL, 'ApiWebme', '', 0, 15, '2022-01-27 14:18:44', '2023-06-14 10:52:46'),
(6, 1, 'VND', 'Localbank_DAB', 'Localbank', 'DONGABANK TỰ ĐỘNG', 0, 0, 'localbank', 1, 'account_num,account_name', 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 'http://103.109.43.170/api/', '{\"bank_name\":\"\",\"account_name\":\"\",\"account_num\":\"\",\"account_password\":\"\"}', 1, '970406', NULL, '{\"nhom_ck_1\":\"\",\"nhom_ck_2\":\"\",\"nhom_ck_3\":\"\",\"nhom_ck_4\":\"\"}', '{\"nhom_ck_1\":\"\",\"nhom_ck_2\":\"\",\"nhom_ck_3\":\"\",\"nhom_ck_4\":\"\"}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', NULL, '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"nhom_ck_1\":\"\",\"nhom_ck_2\":\"\",\"nhom_ck_3\":\"\",\"nhom_ck_4\":\"\"}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"nhom_ck_1\":\"\",\"nhom_ck_2\":\"\",\"nhom_ck_3\":\"\",\"nhom_ck_4\":\"\"}', '{\"nhom_ck_1\":\"\",\"nhom_ck_2\":\"\",\"nhom_ck_3\":\"\",\"nhom_ck_4\":\"\"}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', NULL, '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"nhom_ck_1\":\"\",\"nhom_ck_2\":\"\",\"nhom_ck_3\":\"\",\"nhom_ck_4\":\"\"}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', NULL, '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[\"nhom_ck_1\",\"nhom_ck_2\",\"nhom_ck_3\",\"nhom_ck_4\"]', NULL, NULL, NULL, 'ApiWebme', '', 0, 15, '2022-01-27 14:17:18', '2023-06-14 10:52:46'),
(7, 1, 'VND', 'Localbank_VPBANK', 'Localbank', 'VPBANK TỰ ĐỘNG', 0, 0, 'localbank', 1, 'account_num,account_name', 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 'http://103.109.43.170/api/', '{\"bank_name\":\"\",\"account_name\":\"\",\"account_num\":\"\",\"account_password\":\"\"}', 1, '970432', NULL, '{\"nhom_ck_1\":\"\",\"nhom_ck_2\":\"\",\"nhom_ck_3\":\"\",\"nhom_ck_4\":\"\"}', '{\"nhom_ck_1\":\"\",\"nhom_ck_2\":\"\",\"nhom_ck_3\":\"\",\"nhom_ck_4\":\"\"}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', NULL, '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"nhom_ck_1\":\"\",\"nhom_ck_2\":\"\",\"nhom_ck_3\":\"\",\"nhom_ck_4\":\"\"}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"nhom_ck_1\":\"\",\"nhom_ck_2\":\"\",\"nhom_ck_3\":\"\",\"nhom_ck_4\":\"\"}', '{\"nhom_ck_1\":\"\",\"nhom_ck_2\":\"\",\"nhom_ck_3\":\"\",\"nhom_ck_4\":\"\"}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', NULL, '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"nhom_ck_1\":\"\",\"nhom_ck_2\":\"\",\"nhom_ck_3\":\"\",\"nhom_ck_4\":\"\"}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', NULL, '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[\"nhom_ck_1\",\"nhom_ck_2\",\"nhom_ck_3\",\"nhom_ck_4\"]', NULL, NULL, NULL, 'ApiWebme', '', 0, 15, '2022-01-27 14:19:21', '2023-06-14 10:52:46'),
(8, 1, 'VND', 'Localbank_TPBANK', 'Localbank', 'TPBANK TỰ ĐỘNG', 0, 0, 'localbank', 1, 'account_num,account_name', 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 'http://103.109.43.170/api/', '{\"bank_name\":\"\",\"account_name\":\"\",\"account_num\":\"\",\"account_password\":\"\"}', 1, '970423', NULL, '{\"nhom_ck_1\":\"\",\"nhom_ck_2\":\"\",\"nhom_ck_3\":\"\",\"nhom_ck_4\":\"\"}', '{\"nhom_ck_1\":\"\",\"nhom_ck_2\":\"\",\"nhom_ck_3\":\"\",\"nhom_ck_4\":\"\"}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', NULL, '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"nhom_ck_1\":\"\",\"nhom_ck_2\":\"\",\"nhom_ck_3\":\"\",\"nhom_ck_4\":\"\"}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"nhom_ck_1\":\"\",\"nhom_ck_2\":\"\",\"nhom_ck_3\":\"\",\"nhom_ck_4\":\"\"}', '{\"nhom_ck_1\":\"\",\"nhom_ck_2\":\"\",\"nhom_ck_3\":\"\",\"nhom_ck_4\":\"\"}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', NULL, '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"nhom_ck_1\":\"\",\"nhom_ck_2\":\"\",\"nhom_ck_3\":\"\",\"nhom_ck_4\":\"\"}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', NULL, '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[\"nhom_ck_1\",\"nhom_ck_2\",\"nhom_ck_3\",\"nhom_ck_4\"]', NULL, NULL, NULL, 'ApiWebme', '', 0, 15, '2022-01-27 14:19:07', '2023-06-14 10:52:47'),
(9, 1, 'VND', 'Localbank_MB', 'Localbank', 'MB BANK - HAY LỖI CÓ THỂ RÚT SẼ CHẬM', 0, 0, 'localbank', 1, 'account_num,account_name', 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 'http://103.109.43.170/api/', '{\"bank_name\":\"\",\"account_name\":\"\",\"account_num\":\"\",\"account_password\":\"\"}', 1, '970422', NULL, '{\"nhom_ck_1\":\"\",\"nhom_ck_2\":\"\",\"nhom_ck_3\":\"\",\"nhom_ck_4\":\"\"}', '{\"nhom_ck_1\":\"\",\"nhom_ck_2\":\"\",\"nhom_ck_3\":\"\",\"nhom_ck_4\":\"\"}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', NULL, '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"nhom_ck_1\":\"\",\"nhom_ck_2\":\"\",\"nhom_ck_3\":\"\",\"nhom_ck_4\":\"\"}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"nhom_ck_1\":\"\",\"nhom_ck_2\":\"\",\"nhom_ck_3\":\"\",\"nhom_ck_4\":\"\"}', '{\"nhom_ck_1\":\"\",\"nhom_ck_2\":\"\",\"nhom_ck_3\":\"\",\"nhom_ck_4\":\"\"}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', NULL, '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"nhom_ck_1\":\"\",\"nhom_ck_2\":\"\",\"nhom_ck_3\":\"\",\"nhom_ck_4\":\"\"}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', NULL, '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[\"nhom_ck_1\",\"nhom_ck_2\",\"nhom_ck_3\",\"nhom_ck_4\"]', NULL, NULL, NULL, 'ApiWebme', '', 3, 15, '2022-01-27 14:18:09', '2023-06-14 14:12:27'),
(10, 1, 'VND', 'Localbank_LVPB', 'Localbank', 'LIENVIETPOSTBANK TỰ ĐỘNG', 0, 0, 'Localbank', 1, 'account_num,account_name', 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, '{\"bank_name\":\"\",\"account_name\":\"\",\"account_num\":\"\",\"account_password\":\"\"}', 1, '', NULL, '{\"nhom_ck_1\":\"\",\"nhom_ck_2\":\"\",\"nhom_ck_3\":\"\",\"nhom_ck_4\":\"\"}', '{\"nhom_ck_1\":\"\",\"nhom_ck_2\":\"\",\"nhom_ck_3\":\"\",\"nhom_ck_4\":\"\"}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', NULL, '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"nhom_ck_1\":\"\",\"nhom_ck_2\":\"\",\"nhom_ck_3\":\"\",\"nhom_ck_4\":\"\"}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"nhom_ck_1\":\"\",\"nhom_ck_2\":\"\",\"nhom_ck_3\":\"\",\"nhom_ck_4\":\"\"}', '{\"nhom_ck_1\":\"\",\"nhom_ck_2\":\"\",\"nhom_ck_3\":\"\",\"nhom_ck_4\":\"\"}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', NULL, '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"nhom_ck_1\":\"\",\"nhom_ck_2\":\"\",\"nhom_ck_3\":\"\",\"nhom_ck_4\":\"\"}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', NULL, '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[\"nhom_ck_1\",\"nhom_ck_2\",\"nhom_ck_3\",\"nhom_ck_4\"]', NULL, NULL, NULL, 'ApiWebme', NULL, 0, 15, '2023-12-19 07:54:40', NULL),
(11, 1, 'VND', 'Localbank_SEAB', 'Localbank', 'SEABANK TỰ ĐỘNG', 0, 0, 'Localbank', 1, 'account_num,account_name', 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, '{\"bank_name\":\"\",\"account_name\":\"\",\"account_num\":\"\",\"account_password\":\"\"}', 1, '', NULL, '{\"nhom_ck_1\":\"\",\"nhom_ck_2\":\"\",\"nhom_ck_3\":\"\",\"nhom_ck_4\":\"\"}', '{\"nhom_ck_1\":\"\",\"nhom_ck_2\":\"\",\"nhom_ck_3\":\"\",\"nhom_ck_4\":\"\"}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', NULL, '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"nhom_ck_1\":\"\",\"nhom_ck_2\":\"\",\"nhom_ck_3\":\"\",\"nhom_ck_4\":\"\"}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"nhom_ck_1\":\"\",\"nhom_ck_2\":\"\",\"nhom_ck_3\":\"\",\"nhom_ck_4\":\"\"}', '{\"nhom_ck_1\":\"\",\"nhom_ck_2\":\"\",\"nhom_ck_3\":\"\",\"nhom_ck_4\":\"\"}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', NULL, '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"nhom_ck_1\":\"\",\"nhom_ck_2\":\"\",\"nhom_ck_3\":\"\",\"nhom_ck_4\":\"\"}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', NULL, '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[\"nhom_ck_1\",\"nhom_ck_2\",\"nhom_ck_3\",\"nhom_ck_4\"]', NULL, NULL, NULL, 'ApiWebme', NULL, 0, 15, '2023-12-19 07:54:40', NULL),
(12, 1, 'VND', 'Localbank_KLB', 'Localbank', 'KIENLONGBANK TỰ ĐỘNG', 0, 0, 'localbank', 0, 'account_num,account_name', 0, 0, 1, 0, 0, 0, 0, NULL, NULL, 'http://103.109.43.170/api/', '{\"bank_name\":\"\",\"account_name\":\"\",\"account_num\":\"\",\"account_password\":\"\"}', 1, '970452	', NULL, '{\"nhom_ck_1\":\"\",\"nhom_ck_2\":\"\",\"nhom_ck_3\":\"\",\"nhom_ck_4\":\"\"}', '{\"nhom_ck_1\":\"\",\"nhom_ck_2\":\"\",\"nhom_ck_3\":\"\",\"nhom_ck_4\":\"\"}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', NULL, '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"nhom_ck_1\":\"\",\"nhom_ck_2\":\"\",\"nhom_ck_3\":\"\",\"nhom_ck_4\":\"\"}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"nhom_ck_1\":\"\",\"nhom_ck_2\":\"\",\"nhom_ck_3\":\"\",\"nhom_ck_4\":\"\"}', '{\"nhom_ck_1\":\"\",\"nhom_ck_2\":\"\",\"nhom_ck_3\":\"\",\"nhom_ck_4\":\"\"}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', NULL, '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"nhom_ck_1\":\"\",\"nhom_ck_2\":\"\",\"nhom_ck_3\":\"\",\"nhom_ck_4\":\"\"}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', NULL, '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[\"nhom_ck_1\",\"nhom_ck_2\",\"nhom_ck_3\",\"nhom_ck_4\"]', NULL, NULL, NULL, 'ApiWebme', '', 0, 15, '2022-03-17 14:15:45', '2023-06-14 10:52:47'),
(13, 1, 'VND', 'Localbank_TCB', 'Localbank', 'TECHCOMBANK TỰ ĐỘNG', 0, 0, 'localbank', 1, 'account_num,account_name', 1, 0, 0, 0, 0, 0, 0, NULL, NULL, 'http://103.109.43.170/api/3', '{\"bank_name\":\"Techcombank\",\"account_name\":\"\",\"account_num\":\"\",\"account_password\":\"\"}', 1, '970407', NULL, '{\"nhom_ck_1\":\"\",\"nhom_ck_2\":\"\",\"nhom_ck_3\":\"\",\"nhom_ck_4\":\"\"}', '{\"nhom_ck_1\":\"\",\"nhom_ck_2\":\"\",\"nhom_ck_3\":\"\",\"nhom_ck_4\":\"\"}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', NULL, '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"nhom_ck_1\":\"\",\"nhom_ck_2\":\"\",\"nhom_ck_3\":\"\",\"nhom_ck_4\":\"\"}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"nhom_ck_1\":\"\",\"nhom_ck_2\":\"\",\"nhom_ck_3\":\"\",\"nhom_ck_4\":\"\"}', '{\"nhom_ck_1\":\"\",\"nhom_ck_2\":\"\",\"nhom_ck_3\":\"\",\"nhom_ck_4\":\"\"}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', NULL, '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"nhom_ck_1\":\"\",\"nhom_ck_2\":\"\",\"nhom_ck_3\":\"\",\"nhom_ck_4\":\"\"}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', NULL, '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[\"nhom_ck_1\",\"nhom_ck_2\",\"nhom_ck_3\",\"nhom_ck_4\"]', NULL, NULL, NULL, 'ApiWebme', '', 0, 15, '2021-02-23 02:34:28', '2023-06-14 10:52:47'),
(14, 1, 'VND', 'Localbank_NAMA', 'Localbank', 'NAMABANK TỰ ĐỘNG', 0, 0, 'localbank', 1, 'account_num,account_name', 0, 0, 1, 0, 0, 0, 0, NULL, NULL, 'http://103.109.43.170/api/', '{\"bank_name\":\"\",\"account_name\":\"\",\"account_num\":\"\",\"account_password\":\"\"}', 1, '970400', NULL, '{\"nhom_ck_1\":\"\",\"nhom_ck_2\":\"\",\"nhom_ck_3\":\"\",\"nhom_ck_4\":\"\"}', '{\"nhom_ck_1\":\"\",\"nhom_ck_2\":\"\",\"nhom_ck_3\":\"\",\"nhom_ck_4\":\"\"}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', NULL, '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"nhom_ck_1\":\"\",\"nhom_ck_2\":\"\",\"nhom_ck_3\":\"\",\"nhom_ck_4\":\"\"}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"nhom_ck_1\":\"\",\"nhom_ck_2\":\"\",\"nhom_ck_3\":\"\",\"nhom_ck_4\":\"\"}', '{\"nhom_ck_1\":\"\",\"nhom_ck_2\":\"\",\"nhom_ck_3\":\"\",\"nhom_ck_4\":\"\"}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', NULL, '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"nhom_ck_1\":\"\",\"nhom_ck_2\":\"\",\"nhom_ck_3\":\"\",\"nhom_ck_4\":\"\"}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', NULL, '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[\"nhom_ck_1\",\"nhom_ck_2\",\"nhom_ck_3\",\"nhom_ck_4\"]', NULL, NULL, NULL, 'ApiWebme', '', 0, 15, '2022-01-27 14:18:27', '2023-06-14 10:52:47'),
(15, 1, 'VND', 'Localbank_SGB', 'Localbank', 'SAIGONBANK TỰ ĐỘNG', 0, 0, 'localbank', 1, 'account_num,account_name', 0, 0, 1, 0, 0, 0, 0, NULL, NULL, 'http://103.109.43.170/api/', '{\"bank_name\":\"\",\"account_name\":\"\",\"account_num\":\"\",\"account_password\":\"\"}', 1, '970400', NULL, '{\"nhom_ck_1\":\"\",\"nhom_ck_2\":\"\",\"nhom_ck_3\":\"\",\"nhom_ck_4\":\"\"}', '{\"nhom_ck_1\":\"\",\"nhom_ck_2\":\"\",\"nhom_ck_3\":\"\",\"nhom_ck_4\":\"\"}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', NULL, '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"nhom_ck_1\":\"\",\"nhom_ck_2\":\"\",\"nhom_ck_3\":\"\",\"nhom_ck_4\":\"\"}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"nhom_ck_1\":\"\",\"nhom_ck_2\":\"\",\"nhom_ck_3\":\"\",\"nhom_ck_4\":\"\"}', '{\"nhom_ck_1\":\"\",\"nhom_ck_2\":\"\",\"nhom_ck_3\":\"\",\"nhom_ck_4\":\"\"}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', NULL, '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"nhom_ck_1\":\"\",\"nhom_ck_2\":\"\",\"nhom_ck_3\":\"\",\"nhom_ck_4\":\"\"}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', NULL, '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[\"nhom_ck_1\",\"nhom_ck_2\",\"nhom_ck_3\",\"nhom_ck_4\"]', NULL, NULL, NULL, 'ApiWebme', '', 0, 15, '2022-01-27 14:18:27', '2023-06-14 10:52:47'),
(17, 1, 'VND', 'Localbank_MSB', 'Localbank', 'MSB TỰ ĐỘNG', 0, 0, 'localbank', 1, 'account_num,account_name', 1, 0, 1, 0, 0, 0, 0, NULL, NULL, 'http://103.109.43.170/api/', '{\"bank_name\":\"\",\"account_name\":\"\",\"account_num\":\"\",\"account_password\":\"\"}', 1, '970426', NULL, '{\"nhom_ck_1\":\"\",\"nhom_ck_2\":\"\",\"nhom_ck_3\":\"\",\"nhom_ck_4\":\"\"}', '{\"nhom_ck_1\":\"\",\"nhom_ck_2\":\"\",\"nhom_ck_3\":\"\",\"nhom_ck_4\":\"\"}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', NULL, '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"nhom_ck_1\":\"\",\"nhom_ck_2\":\"\",\"nhom_ck_3\":\"\",\"nhom_ck_4\":\"\"}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"nhom_ck_1\":\"\",\"nhom_ck_2\":\"\",\"nhom_ck_3\":\"\",\"nhom_ck_4\":\"\"}', '{\"nhom_ck_1\":\"\",\"nhom_ck_2\":\"\",\"nhom_ck_3\":\"\",\"nhom_ck_4\":\"\"}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', NULL, '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"nhom_ck_1\":\"\",\"nhom_ck_2\":\"\",\"nhom_ck_3\":\"\",\"nhom_ck_4\":\"\"}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', NULL, '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[\"nhom_ck_1\",\"nhom_ck_2\",\"nhom_ck_3\",\"nhom_ck_4\"]', NULL, NULL, NULL, 'ApiWebme', '', 0, 15, '2022-06-10 10:34:01', '2023-06-14 10:52:47'),
(19, 1, 'VND', 'Localbank_VAB', 'Localbank', 'VIETABANK TỰ ĐỘNG', 0, 0, 'localbank', 1, 'account_num,account_name', 1, 0, 0, 0, 0, 0, 0, NULL, NULL, 'http://103.109.43.170/api/', '{\"bank_name\":\"\",\"account_name\":\"\",\"account_num\":\"\",\"account_password\":\"\"}', 1, '970427', NULL, '{\"nhom_ck_1\":\"\",\"nhom_ck_2\":\"\",\"nhom_ck_3\":\"\",\"nhom_ck_4\":\"\"}', '{\"nhom_ck_1\":\"\",\"nhom_ck_2\":\"\",\"nhom_ck_3\":\"\",\"nhom_ck_4\":\"\"}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', NULL, '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"nhom_ck_1\":\"\",\"nhom_ck_2\":\"\",\"nhom_ck_3\":\"\",\"nhom_ck_4\":\"\"}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"nhom_ck_1\":\"\",\"nhom_ck_2\":\"\",\"nhom_ck_3\":\"\",\"nhom_ck_4\":\"\"}', '{\"nhom_ck_1\":\"\",\"nhom_ck_2\":\"\",\"nhom_ck_3\":\"\",\"nhom_ck_4\":\"\"}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', NULL, '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"nhom_ck_1\":\"\",\"nhom_ck_2\":\"\",\"nhom_ck_3\":\"\",\"nhom_ck_4\":\"\"}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', NULL, '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[\"nhom_ck_1\",\"nhom_ck_2\",\"nhom_ck_3\",\"nhom_ck_4\"]', NULL, NULL, NULL, 'ApiWebme', '', 0, 15, '2022-06-10 10:38:40', '2023-06-14 10:52:47'),
(20, 1, 'VND', 'Localbank_VIB', 'Localbank', 'VIB TỰ ĐỘNG', 0, 0, 'localbank', 1, 'account_num,account_name', 1, 0, 1, 0, 0, 0, 0, NULL, NULL, 'http://103.109.43.170/api/', '{\"bank_name\":\"\",\"account_name\":\"\",\"account_num\":\"\",\"account_password\":\"\"}', 1, '970441', NULL, '{\"nhom_ck_1\":\"\",\"nhom_ck_2\":\"\",\"nhom_ck_3\":\"\",\"nhom_ck_4\":\"\"}', '{\"nhom_ck_1\":\"\",\"nhom_ck_2\":\"\",\"nhom_ck_3\":\"\",\"nhom_ck_4\":\"\"}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', NULL, '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"nhom_ck_1\":\"\",\"nhom_ck_2\":\"\",\"nhom_ck_3\":\"\",\"nhom_ck_4\":\"\"}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"nhom_ck_1\":\"\",\"nhom_ck_2\":\"\",\"nhom_ck_3\":\"\",\"nhom_ck_4\":\"\"}', '{\"nhom_ck_1\":\"\",\"nhom_ck_2\":\"\",\"nhom_ck_3\":\"\",\"nhom_ck_4\":\"\"}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', NULL, '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"nhom_ck_1\":\"\",\"nhom_ck_2\":\"\",\"nhom_ck_3\":\"\",\"nhom_ck_4\":\"\"}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', NULL, '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[\"nhom_ck_1\",\"nhom_ck_2\",\"nhom_ck_3\",\"nhom_ck_4\"]', NULL, NULL, NULL, 'ApiWebme', '', 0, 15, '2022-06-10 10:39:59', '2023-06-14 10:52:47'),
(21, 1, 'VND', 'Localbank_SCB', 'Localbank', 'SCB TỰ ĐỘNG', 0, 0, 'localbank', 1, 'account_num,account_name', 1, 0, 1, 0, 0, 0, 0, NULL, NULL, 'http://103.109.43.170/api/', '{\"bank_name\":\"\",\"account_name\":\"\",\"account_num\":\"\",\"account_password\":\"\"}', 1, '970429', NULL, '{\"nhom_ck_1\":\"\",\"nhom_ck_2\":\"\",\"nhom_ck_3\":\"\",\"nhom_ck_4\":\"\"}', '{\"nhom_ck_1\":\"\",\"nhom_ck_2\":\"\",\"nhom_ck_3\":\"\",\"nhom_ck_4\":\"\"}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', NULL, '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"nhom_ck_1\":\"\",\"nhom_ck_2\":\"\",\"nhom_ck_3\":\"\",\"nhom_ck_4\":\"\"}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"nhom_ck_1\":\"\",\"nhom_ck_2\":\"\",\"nhom_ck_3\":\"\",\"nhom_ck_4\":\"\"}', '{\"nhom_ck_1\":\"\",\"nhom_ck_2\":\"\",\"nhom_ck_3\":\"\",\"nhom_ck_4\":\"\"}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', NULL, '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"nhom_ck_1\":\"\",\"nhom_ck_2\":\"\",\"nhom_ck_3\":\"\",\"nhom_ck_4\":\"\"}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', NULL, '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[\"nhom_ck_1\",\"nhom_ck_2\",\"nhom_ck_3\",\"nhom_ck_4\"]', NULL, NULL, NULL, 'ApiWebme', '', 0, 15, '2022-06-23 04:46:53', '2023-06-14 10:52:47'),
(27, 1, 'VND', 'Localbank_BVB', 'Localbank', 'BAOVIETBANK TỰ ĐỘNG', 0, 0, 'localbank', 1, 'account_num,account_name', 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 'http://103.109.43.170/api/', '{\"bank_name\":\"\",\"account_name\":\"\",\"account_num\":\"\",\"account_password\":\"\"}', 1, '970438', NULL, '{\"nhom_ck_1\":\"\",\"nhom_ck_2\":\"\",\"nhom_ck_3\":\"\",\"nhom_ck_4\":\"\"}', '{\"nhom_ck_1\":\"\",\"nhom_ck_2\":\"\",\"nhom_ck_3\":\"\",\"nhom_ck_4\":\"\"}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', NULL, '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"nhom_ck_1\":\"\",\"nhom_ck_2\":\"\",\"nhom_ck_3\":\"\",\"nhom_ck_4\":\"\"}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"nhom_ck_1\":\"\",\"nhom_ck_2\":\"\",\"nhom_ck_3\":\"\",\"nhom_ck_4\":\"\"}', '{\"nhom_ck_1\":\"\",\"nhom_ck_2\":\"\",\"nhom_ck_3\":\"\",\"nhom_ck_4\":\"\"}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', NULL, '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"nhom_ck_1\":\"\",\"nhom_ck_2\":\"\",\"nhom_ck_3\":\"\",\"nhom_ck_4\":\"\"}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', NULL, '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[\"nhom_ck_1\",\"nhom_ck_2\",\"nhom_ck_3\",\"nhom_ck_4\"]', NULL, NULL, NULL, 'ApiWebme', '', 0, 15, '2022-06-25 07:42:56', '2023-06-14 10:52:47'),
(29, 1, 'VND', 'Localbank_PVCOM', 'Localbank', 'PVCOMBANK TỰ ĐỘNG', 0, 0, 'localbank', 1, 'account_num,account_name', 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 'http://103.109.43.170/api/', '{\"bank_name\":\"\",\"account_name\":\"\",\"account_num\":\"\",\"account_password\":\"\"}', 1, '970412', NULL, '{\"nhom_ck_1\":\"\",\"nhom_ck_2\":\"\",\"nhom_ck_3\":\"\",\"nhom_ck_4\":\"\"}', '{\"nhom_ck_1\":\"\",\"nhom_ck_2\":\"\",\"nhom_ck_3\":\"\",\"nhom_ck_4\":\"\"}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', NULL, '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"nhom_ck_1\":\"\",\"nhom_ck_2\":\"\",\"nhom_ck_3\":\"\",\"nhom_ck_4\":\"\"}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"nhom_ck_1\":\"\",\"nhom_ck_2\":\"\",\"nhom_ck_3\":\"\",\"nhom_ck_4\":\"\"}', '{\"nhom_ck_1\":\"\",\"nhom_ck_2\":\"\",\"nhom_ck_3\":\"\",\"nhom_ck_4\":\"\"}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', NULL, '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"nhom_ck_1\":\"\",\"nhom_ck_2\":\"\",\"nhom_ck_3\":\"\",\"nhom_ck_4\":\"\"}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', NULL, '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[\"nhom_ck_1\",\"nhom_ck_2\",\"nhom_ck_3\",\"nhom_ck_4\"]', NULL, NULL, NULL, 'ApiWebme', '', 0, 15, '2022-06-25 07:43:56', '2023-06-14 10:52:47'),
(30, 1, 'VND', 'Localbank_OCB', 'Localbank', 'OCEANBANK TỰ ĐỘNG', 0, 0, 'localbank', 1, 'account_num,account_name', 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 'http://103.109.43.170/api/', '{\"bank_name\":\"\",\"account_name\":\"\",\"account_num\":\"\",\"account_password\":\"\"}', 1, '970414', NULL, '{\"nhom_ck_1\":\"\",\"nhom_ck_2\":\"\",\"nhom_ck_3\":\"\",\"nhom_ck_4\":\"\"}', '{\"nhom_ck_1\":\"\",\"nhom_ck_2\":\"\",\"nhom_ck_3\":\"\",\"nhom_ck_4\":\"\"}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', NULL, '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"nhom_ck_1\":\"\",\"nhom_ck_2\":\"\",\"nhom_ck_3\":\"\",\"nhom_ck_4\":\"\"}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"nhom_ck_1\":\"\",\"nhom_ck_2\":\"\",\"nhom_ck_3\":\"\",\"nhom_ck_4\":\"\"}', '{\"nhom_ck_1\":\"\",\"nhom_ck_2\":\"\",\"nhom_ck_3\":\"\",\"nhom_ck_4\":\"\"}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', NULL, '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"nhom_ck_1\":\"\",\"nhom_ck_2\":\"\",\"nhom_ck_3\":\"\",\"nhom_ck_4\":\"\"}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', NULL, '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[\"nhom_ck_1\",\"nhom_ck_2\",\"nhom_ck_3\",\"nhom_ck_4\"]', NULL, NULL, NULL, 'ApiWebme', '', 0, 15, '2022-06-25 07:44:23', '2023-06-14 10:52:47'),
(32, 1, 'VND', 'Localbank_NAB', 'Localbank', 'NAMABANK TỰ ĐỘNG', 0, 0, 'localbank', 1, 'account_num,account_name', 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 'http://103.109.43.170/api/', '{\"bank_name\":\"\",\"account_name\":\"\",\"account_num\":\"\",\"account_password\":\"\"}', 1, '970428', NULL, '{\"nhom_ck_1\":\"\",\"nhom_ck_2\":\"\",\"nhom_ck_3\":\"\",\"nhom_ck_4\":\"\"}', '{\"nhom_ck_1\":\"\",\"nhom_ck_2\":\"\",\"nhom_ck_3\":\"\",\"nhom_ck_4\":\"\"}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', NULL, '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"nhom_ck_1\":\"\",\"nhom_ck_2\":\"\",\"nhom_ck_3\":\"\",\"nhom_ck_4\":\"\"}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"nhom_ck_1\":\"\",\"nhom_ck_2\":\"\",\"nhom_ck_3\":\"\",\"nhom_ck_4\":\"\"}', '{\"nhom_ck_1\":\"\",\"nhom_ck_2\":\"\",\"nhom_ck_3\":\"\",\"nhom_ck_4\":\"\"}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', NULL, '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"nhom_ck_1\":\"\",\"nhom_ck_2\":\"\",\"nhom_ck_3\":\"\",\"nhom_ck_4\":\"\"}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', NULL, '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[\"nhom_ck_1\",\"nhom_ck_2\",\"nhom_ck_3\",\"nhom_ck_4\"]', NULL, NULL, NULL, 'ApiWebme', '', 0, 15, '2022-06-25 07:45:42', '2023-06-14 10:52:47'),
(33, 1, 'VND', 'Localbank_HDB', 'Localbank', 'HDBANK TỰ ĐỘNG', 0, 0, 'localbank', 1, 'account_num,account_name', 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 'http://103.109.43.170/api/', '{\"bank_name\":\"\",\"account_name\":\"\",\"account_num\":\"\",\"account_password\":\"\"}', 1, '970437', NULL, '{\"nhom_ck_1\":\"\",\"nhom_ck_2\":\"\",\"nhom_ck_3\":\"\",\"nhom_ck_4\":\"\"}', '{\"nhom_ck_1\":\"\",\"nhom_ck_2\":\"\",\"nhom_ck_3\":\"\",\"nhom_ck_4\":\"\"}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', NULL, '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"nhom_ck_1\":\"\",\"nhom_ck_2\":\"\",\"nhom_ck_3\":\"\",\"nhom_ck_4\":\"\"}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"nhom_ck_1\":\"\",\"nhom_ck_2\":\"\",\"nhom_ck_3\":\"\",\"nhom_ck_4\":\"\"}', '{\"nhom_ck_1\":\"\",\"nhom_ck_2\":\"\",\"nhom_ck_3\":\"\",\"nhom_ck_4\":\"\"}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', NULL, '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"nhom_ck_1\":\"\",\"nhom_ck_2\":\"\",\"nhom_ck_3\":\"\",\"nhom_ck_4\":\"\"}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', NULL, '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[\"nhom_ck_1\",\"nhom_ck_2\",\"nhom_ck_3\",\"nhom_ck_4\"]', NULL, NULL, NULL, 'ApiWebme', '', 0, 15, '2022-06-25 07:46:13', '2023-06-14 10:52:47'),
(95, 1, 'VND', 'Wallet_VND', 'Wallet', 'SỐ DƯ VÍ ĐỔI THẺ CÀO', 0, 0, 'ewallet', 0, 'wallet_num', 0, 1, 1, 0, 0, 0, 0, NULL, '/storage/userfiles/images/paygates/ewallet.png', NULL, '{\"purse\":null}', 1, 'Wallet_VND', NULL, '{\"1\":null,\"2\":\"300\",\"3\":\"100\",\"4\":\"100\"}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"nhom_ck_1\":\"\",\"nhom_ck_2\":\"\",\"nhom_ck_3\":\"\",\"nhom_ck_4\":\"\"}', NULL, '{\"nhom_ck_1\":\"10000\",\"nhom_ck_2\":\"10000\",\"nhom_ck_3\":\"10000\",\"nhom_ck_4\":\"10000\"}', '{\"nhom_ck_1\":\"\",\"nhom_ck_2\":\"\",\"nhom_ck_3\":\"\",\"nhom_ck_4\":\"\"}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"nhom_ck_1\":\"\",\"nhom_ck_2\":\"\",\"nhom_ck_3\":\"\",\"nhom_ck_4\":\"\"}', NULL, '{\"nhom_ck_1\":\"10000\",\"nhom_ck_2\":\"10000\",\"nhom_ck_3\":\"10000\",\"nhom_ck_4\":\"10000\"}', '{\"nhom_ck_1\":\"\",\"nhom_ck_2\":\"\",\"nhom_ck_3\":\"\",\"nhom_ck_4\":\"\"}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":\"0\",\"2\":\"0\",\"3\":null,\"4\":null}', '{\"1\":\"0\",\"2\":\"0\",\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', NULL, '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":\"0\",\"2\":\"0\",\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"nhom_ck_1\":\"\",\"nhom_ck_2\":\"\",\"nhom_ck_3\":\"\",\"nhom_ck_4\":\"\"}', '{\"nhom_ck_1\":\"\",\"nhom_ck_2\":\"\",\"nhom_ck_3\":\"\",\"nhom_ck_4\":\"\"}', '{\"nhom_ck_1\":\"\",\"nhom_ck_2\":\"\",\"nhom_ck_3\":\"\",\"nhom_ck_4\":\"\"}', NULL, '{\"nhom_ck_1\":\"10000\",\"nhom_ck_2\":\"10000\",\"nhom_ck_3\":\"10000\",\"nhom_ck_4\":\"10000\"}', '{\"nhom_ck_1\":\"\",\"nhom_ck_2\":\"\",\"nhom_ck_3\":\"\",\"nhom_ck_4\":\"\"}', '{\"nhom_ck_1\":\"\",\"nhom_ck_2\":\"\",\"nhom_ck_3\":\"\",\"nhom_ck_4\":\"\"}', '[\"nhom_ck_1\",\"nhom_ck_2\",\"nhom_ck_3\",\"nhom_ck_4\"]', '[\"Momo\"]', '[\"Localbank_VCB\",\"Localbank_BIDV\",\"Localbank_VTB\",\"Localbank_AGR\",\"Localbank_SAC\",\"Localbank_DAB\",\"Localbank_VPBANK\",\"Localbank_TPBANK\",\"Localbank_MB\",\"Localbank_LVPB\",\"Localbank_SEAB\",\"Localbank_KLB\",\"Localbank_TCB\",\"Localbank_NAMA\",\"Localbank_SGB\",\"Localbank_MSB\",\"Localbank_VAB\",\"Localbank_VIB\",\"Localbank_SCB\",\"Localbank_BVB\",\"Localbank_PVCOM\",\"Localbank_OCB\",\"Localbank_NAB\",\"Localbank_HDB\",\"Localbank_ACB\",\"Momo\" ]', NULL, NULL, NULL, 15, 15, '2019-12-14 01:07:45', '2023-06-14 11:25:06');
INSERT INTO `paygates` (`id`, `currency_id`, `currency_code`, `code`, `paygate`, `name`, `balance`, `balance_max`, `type`, `withdraw`, `withdrawField`, `deposit`, `payment`, `instant`, `verify`, `convert`, `redirect`, `round`, `description`, `avatar`, `url`, `configs`, `status`, `mid_bank`, `qr_bank`, `w_fixed_fees`, `w_percent_fees`, `w_daily_limit`, `w_country_block`, `w_min`, `w_max`, `w_nofees`, `w_vendor_fixed_fees`, `w_vendor_percent_fees`, `d_fixed_fees`, `d_percent_fees`, `d_daily_limit`, `d_country_block`, `d_min`, `d_max`, `d_nofees`, `d_vendor_fixed_fees`, `d_vendor_percent_fees`, `p_fixed_fees`, `p_percent_fees`, `p_daily_limit`, `p_country_block`, `p_min`, `p_max`, `p_nofees`, `p_vendor_fixed_fees`, `p_vendor_percent_fees`, `t_fixed_fees`, `t_percent_fees`, `t_daily_limit`, `t_country_block`, `t_min`, `t_max`, `t_nofees`, `allow_groups`, `deposit_paygate`, `withdraw_paygate`, `total_withdraw_today`, `withdraw_vendor`, `deposit_vendor`, `sort`, `canceltime`, `created_at`, `updated_at`) VALUES
(96, 1, 'VND', 'Localbank_ACB', 'Localbank', 'ACB TỰ ĐỘNG', 0, 0, 'localbank', 1, 'account_num,account_name', 0, 1, 1, 0, 0, 0, 0, NULL, NULL, 'https://apiapp.acb.com.vn/mb', '{\"bank_name\":\"Ng\\u00e2n h\\u00e0ng ACB\",\"account_name\":\"\",\"account_num\":\"\",\"account_password\":\"\"}', 1, 'ACB', 'ACB', '{\"nhom_ck_1\":\"\",\"nhom_ck_2\":\"\",\"nhom_ck_3\":\"\",\"nhom_ck_4\":\"\"}', '{\"nhom_ck_1\":\"\",\"nhom_ck_2\":\"\",\"nhom_ck_3\":\"\",\"nhom_ck_4\":\"\"}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', NULL, '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"nhom_ck_1\":\"\",\"nhom_ck_2\":\"\",\"nhom_ck_3\":\"\",\"nhom_ck_4\":\"\"}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"nhom_ck_1\":\"\",\"nhom_ck_2\":\"\",\"nhom_ck_3\":\"\",\"nhom_ck_4\":\"\"}', '{\"nhom_ck_1\":\"\",\"nhom_ck_2\":\"\",\"nhom_ck_3\":\"\",\"nhom_ck_4\":\"\"}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', NULL, '{\"1\":\"20000\",\"2\":\"20000\",\"3\":\"20000\",\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"nhom_ck_1\":\"\",\"nhom_ck_2\":\"\",\"nhom_ck_3\":\"\",\"nhom_ck_4\":\"\"}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', NULL, '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[\"nhom_ck_1\",\"nhom_ck_2\",\"nhom_ck_3\",\"nhom_ck_4\"]', NULL, NULL, NULL, 'ApiWebme', '', 0, 15, '2022-02-18 09:47:24', '2023-07-11 04:49:08'),
(99, 1, 'VND', 'Momo', 'Momo', 'MOMO(ĐANG HỖ TRỢ RÚT TỐI ĐA 500.000VND /LỆNH )', 0, 0, 'localbank', 1, '', 1, 1, 1, 0, 0, 0, 0, NULL, NULL, 'https://vncheckout.com/api/momo', '{\"bank_name\":\"\",\"account_name\":\"\",\"account_num\":\"\",\"account_password\":\"\"}', 1, NULL, NULL, '{\"nhom_ck_1\":\"\",\"nhom_ck_2\":\"\",\"nhom_ck_3\":\"\",\"nhom_ck_4\":\"\"}', '{\"nhom_ck_1\":\"\",\"nhom_ck_2\":\"\",\"nhom_ck_3\":\"\",\"nhom_ck_4\":\"\"}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', NULL, '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":\"200000\",\"3\":\"200000\",\"4\":null}', '{\"nhom_ck_1\":\"\",\"nhom_ck_2\":\"\",\"nhom_ck_3\":\"\",\"nhom_ck_4\":\"\"}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"nhom_ck_1\":\"\",\"nhom_ck_2\":\"\",\"nhom_ck_3\":\"\",\"nhom_ck_4\":\"\"}', '{\"nhom_ck_1\":\"\",\"nhom_ck_2\":\"\",\"nhom_ck_3\":\"\",\"nhom_ck_4\":\"\"}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', NULL, '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"nhom_ck_1\":\"\",\"nhom_ck_2\":\"\",\"nhom_ck_3\":\"\",\"nhom_ck_4\":\"\"}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', NULL, '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', '{\"1\":null,\"2\":null,\"3\":null,\"4\":null}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[\"nhom_ck_1\",\"nhom_ck_2\",\"nhom_ck_3\",\"nhom_ck_4\"]', NULL, NULL, NULL, 'ApiWebme', '', 1, 15, '2022-05-30 04:24:22', '2023-07-11 04:50:02');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `paygates_logs`
--

CREATE TABLE `paygates_logs` (
  `id` int(11) NOT NULL,
  `order_code` varchar(50) DEFAULT NULL,
  `user` int(11) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `net_amount` double DEFAULT NULL,
  `fees` double DEFAULT 0,
  `pay_amount` double NOT NULL,
  `currency_id` tinyint(4) DEFAULT NULL,
  `currency_code` varchar(50) DEFAULT NULL,
  `provider` varchar(50) DEFAULT NULL,
  `bank_code` varchar(50) DEFAULT NULL,
  `post_logs` text DEFAULT NULL,
  `payment_logs` text DEFAULT NULL,
  `callback_logs` text DEFAULT NULL,
  `ip` varchar(50) DEFAULT NULL,
  `country` varchar(50) DEFAULT NULL,
  `checksum` varchar(255) DEFAULT NULL,
  `account_num` varchar(255) DEFAULT NULL,
  `account_name` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `noidung` text DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `time` varchar(50) DEFAULT NULL COMMENT 'time in interger',
  `payment_trans_id` varchar(255) DEFAULT NULL,
  `account_receiver` varchar(250) DEFAULT NULL,
  `trans_date` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `paygates_payout`
--

CREATE TABLE `paygates_payout` (
  `id` int(11) NOT NULL,
  `order_code` varchar(100) NOT NULL,
  `paygate_code` varchar(100) NOT NULL,
  `code` varchar(100) DEFAULT NULL,
  `vendor` varchar(100) DEFAULT NULL,
  `amount` float NOT NULL,
  `description` text DEFAULT NULL,
  `response` text DEFAULT NULL,
  `info` text DEFAULT NULL,
  `trans_id` varchar(250) DEFAULT NULL,
  `status` varchar(255) DEFAULT 'pending',
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci COMMENT='Log ghi lại lịch sử pay cho khách hàng';

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `paygate_vendors`
--

CREATE TABLE `paygate_vendors` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `code` varchar(100) DEFAULT NULL,
  `configs` mediumtext DEFAULT NULL,
  `allow_ip` varchar(100) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `installed` tinyint(4) NOT NULL DEFAULT 0,
  `support_deposit` varchar(255) DEFAULT NULL,
  `support_withdraw` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Đang đổ dữ liệu cho bảng `paygate_vendors`
--

INSERT INTO `paygate_vendors` (`id`, `name`, `code`, `configs`, `allow_ip`, `status`, `installed`, `support_deposit`, `support_withdraw`) VALUES
(29, 'NCC api.web2m.com  (uy tín )', 'ApiWeb2m', '{\"token\":\"\",\"token_deposit_mbbank\":\"\",\"token_deposit_vietcombank\":\"\",\"token_deposit_momo\":\"\"}', NULL, 1, 1, 'MOMO,VIETCOMBANK,MBBANK', 'MOMO'),
(30, 'NCC apiv3.web2m.com (uy tín )', 'ApiV3Web2m', '{\"token\":\"token\",\"token_deposit_momo\":\"\"}', NULL, 1, 1, 'MOMO', 'MOMO'),
(31, 'NCC api.sieuthicode.net  (không rõ uy tín không)', 'ApiSieuthicode', '{\"token\":\"token\",\"token_deposit_mbbank\":\"\",\"token_deposit_vietcombank\":\"\",\"token_deposit_momo\":\"\"}', NULL, 1, 1, 'MOMO,VIETCOMBANK,MBBANK', 'MOMO'),
(32, 'NCC api.dichvudark.vn (không rõ uy tín không)', 'ApiDichvudark', '{\"token\":\"token\",\"token_deposit_mbbank\":\"\",\"token_deposit_vietcombank\":\"\",\"token_deposit_momo\":\"\"}', NULL, 0, 1, 'MOMO,VIETCOMBANK,MBBANK', 'MOMO'),
(36, 'NCC web mẹ (web mẹ xử lý đơn rút )', 'ApiWebme', '{\"token\":\"6b0b873e88f877ac525d552c68257630 \"}', NULL, 0, 1, 'KHÔNG', 'TẤT CẢ NGÂN HÀNG /MOMO CÓ GIỚI HẠN');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `rechargews_cat`
--

CREATE TABLE `rechargews_cat` (
  `id` int(11) NOT NULL,
  `name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `rechargews_slug` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `image` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `status` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_update` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Đang đổ dữ liệu cho bảng `rechargews_cat`
--

INSERT INTO `rechargews_cat` (`id`, `name`, `rechargews_slug`, `image`, `status`, `created_at`, `created_update`) VALUES
(1, 'Nạp tiền điện thoại\r\n', 'nap-tien-dien-thoai\r\n', 'assets/storage/images/upload_HEO0DBP8CZI6.png\r\n', '1', '2024-06-01 10:01:49', '2024-06-01 10:01:49');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `rechargews_items`
--

CREATE TABLE `rechargews_items` (
  `id` int(11) NOT NULL,
  `rechargews_id` int(11) NOT NULL,
  `service_code` varchar(50) NOT NULL,
  `name` varchar(255) NOT NULL,
  `value` double NOT NULL,
  `price` text DEFAULT NULL,
  `discount` float NOT NULL DEFAULT 1,
  `status` tinyint(4) DEFAULT 1,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `rechargews_items`
--

INSERT INTO `rechargews_items` (`id`, `rechargews_id`, `service_code`, `name`, `value`, `price`, `discount`, `status`, `created_at`, `updated_at`) VALUES
(19, 24, 'vinatt', 'Vinaphone trả trước 10.000đ', 10000, '{\"VND\":\"10000\"}', 2, 1, '2018-08-19 22:08:03', '2022-07-31 08:17:06'),
(20, 24, 'vinatt', 'Vinaphone trả trước 20.000đ', 20000, '{\"VND\":\"20000\"}', 2, 1, '2018-08-19 22:08:03', '2022-07-31 08:17:12'),
(26, 24, 'vinatt', 'Vinaphone trả trước 30.000đ', 30000, '{\"VND\":\"30000\"}', 2, 1, '2018-08-26 15:00:43', '2022-07-31 08:17:16'),
(27, 24, 'vinatt', 'Vinaphone trả trước 50.000đ', 50000, '{\"VND\":\"50000\"}', 2, 1, '2018-08-26 15:00:43', '2022-07-31 08:17:19'),
(28, 24, 'vinatt', 'Vinaphone trả trước 100.000đ', 100000, '{\"VND\":\"100000\"}', 2, 1, '2018-08-26 15:00:43', '2022-07-31 08:17:22'),
(29, 24, 'vinatt', 'Vinaphone trả trước 200.000đ', 200000, '{\"VND\":\"200000\"}', 2, 1, '2018-08-26 15:00:43', '2022-07-31 08:17:26'),
(31, 24, 'vinatt', 'Vinaphone trả trước 500.000đ', 500000, '{\"VND\":\"500000\"}', 2, 1, '2018-08-26 15:00:43', '2022-07-31 08:17:32'),
(33, 23, 'vietteltt', ' Viettel trả trước 20.000đ', 20000, '{\"VND\":\"20000\"}', 8, 1, '2018-08-19 22:08:03', '2022-07-31 08:06:14'),
(35, 23, 'vietteltt', ' Viettel trả trước 50.000đ', 50000, '{\"VND\":\"50000\"}', 8, 1, '2018-08-26 15:00:43', '2022-07-31 08:06:20'),
(36, 23, 'vietteltt', ' Viettel trả trước 100.000đ', 100000, '{\"VND\":\"100000\"}', 8, 1, '2018-08-26 15:00:43', '2022-07-31 08:06:24'),
(37, 23, 'vietteltt', ' Viettel trả trước 200.000đ', 200000, '{\"VND\":\"200000\"}', 8, 1, '2018-08-26 15:00:43', '2022-07-31 08:06:28'),
(39, 23, 'vietteltt', 'Viettel trả trước 500.000đ', 500000, '{\"VND\":\"500000\"}', 8, 1, '2018-08-26 15:00:43', '2022-07-31 08:06:02'),
(42, 25, 'viettelts', 'Viettel trả sau 20.000đ', 20000, '{\"VND\":\"20000\"}', 2, 1, '2018-08-19 22:08:03', '2022-07-31 08:16:30'),
(44, 25, 'viettelts', 'Viettel trả sau 50.000đ', 50000, '{\"VND\":\"50000\"}', 2, 1, '2018-08-26 15:00:43', '2022-07-31 08:16:36'),
(45, 25, 'viettelts', 'Viettel trả sau 100.000đ', 100000, '{\"VND\":\"100000\"}', 2, 1, '2018-08-26 15:00:43', '2022-07-31 08:16:40'),
(46, 25, 'viettelts', 'Viettel trả sau 200.000đ', 200000, '{\"VND\":\"200000\"}', 2, 1, '2018-08-26 15:00:43', '2022-07-31 08:16:45'),
(48, 25, 'viettelts', 'Viettel trả sau 500.000đ', 500000, '{\"VND\":\"500000\"}', 2, 1, '2018-08-26 15:00:43', '2022-07-31 08:16:56');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `rechargews_log`
--

CREATE TABLE `rechargews_log` (
  `id` int(11) NOT NULL,
  `request_id` varchar(255) NOT NULL,
  `log` text NOT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `rechargews_order`
--

CREATE TABLE `rechargews_order` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `service_code` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `value` double NOT NULL,
  `total_value` double NOT NULL,
  `phone` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `client_note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `discount` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `price` double NOT NULL,
  `total_price` double NOT NULL,
  `qty` int(11) NOT NULL,
  `order_code` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `status` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `request_id` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sliders`
--

CREATE TABLE `sliders` (
  `id` int(11) NOT NULL,
  `slider_name` varchar(255) NOT NULL,
  `slider_image` varchar(255) NOT NULL,
  `slider_text` text DEFAULT NULL,
  `slider_url` varchar(255) DEFAULT NULL,
  `slider_btn_text` varchar(255) DEFAULT NULL,
  `slider_btn_url` varchar(255) DEFAULT NULL,
  `sort_order` int(11) DEFAULT 0,
  `status` tinyint(4) DEFAULT 1,
  `app` tinyint(4) DEFAULT 1,
  `lang` varchar(50) DEFAULT 'vi',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `softcards_orders`
--

CREATE TABLE `softcards_orders` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `id_items` int(11) NOT NULL,
  `service_code` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `value` double NOT NULL,
  `total_value` double NOT NULL,
  `qty` double DEFAULT NULL COMMENT 'so luong ',
  `discount` varchar(255) NOT NULL,
  `price` double DEFAULT NULL,
  `total_price` float NOT NULL,
  `status` varchar(50) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `client_note` varchar(255) DEFAULT NULL,
  `order_code` varchar(255) DEFAULT NULL,
  `provider_order_code` varchar(255) DEFAULT NULL,
  `provider_total_price` text DEFAULT NULL,
  `profit` double(22,0) DEFAULT NULL,
  `method` varchar(255) DEFAULT NULL,
  `logs` mediumtext DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `softcard_items`
--

CREATE TABLE `softcard_items` (
  `id` int(11) NOT NULL,
  `softcard_id` int(11) NOT NULL,
  `service_code` varchar(50) NOT NULL,
  `name` varchar(255) NOT NULL,
  `value` double NOT NULL,
  `price` text DEFAULT NULL,
  `discount` float NOT NULL DEFAULT 1,
  `provider` varchar(50) DEFAULT NULL COMMENT 'Nhà cung cấp 1',
  `checksum` varchar(50) DEFAULT NULL COMMENT 'md5(service_code + value)',
  `status` tinyint(4) DEFAULT 1,
  `sort` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `softcard_items`
--

INSERT INTO `softcard_items` (`id`, `softcard_id`, `service_code`, `name`, `value`, `price`, `discount`, `provider`, `checksum`, `status`, `sort`, `created_at`, `updated_at`) VALUES
(19, 24, 'Vina', 'Vinaphone 10.000đ', 10000, '{\"VND\":\"10000\"}', 2, '32', 'd1da4e5c180e156f5ff14eebfe61a2a6', 1, 1, '2018-08-19 22:08:03', '2022-07-31 08:17:06'),
(20, 24, 'Vina', 'Vinaphone 20.000đ', 20000, '{\"VND\":\"20000\"}', 2, '32', 'cba35669378efac46940a63a1ac52bb6', 1, 2, '2018-08-19 22:08:03', '2022-07-31 08:17:12'),
(26, 24, 'Vina', 'Vinaphone 30.000đ', 30000, '{\"VND\":\"30000\"}', 2, '32', 'fb91848f379f058168e7ffd8e017c46d', 1, 3, '2018-08-26 15:00:43', '2022-07-31 08:17:16'),
(27, 24, 'Vina', 'Vinaphone 50.000đ', 50000, '{\"VND\":\"50000\"}', 2, '32', '88d3b542cf34519f30a81551bff42929', 1, 4, '2018-08-26 15:00:43', '2022-07-31 08:17:19'),
(28, 24, 'Vina', 'Vinaphone 100.000đ', 100000, '{\"VND\":\"100000\"}', 2, '32', '25bc28e98f24621ffd9ac76025a3df4d', 1, 5, '2018-08-26 15:00:43', '2022-07-31 08:17:22'),
(29, 24, 'Vina', 'Vinaphone 200.000đ', 200000, '{\"VND\":\"200000\"}', 2, '32', '12cf368dfffded89bd5a3dc1d419f424', 1, 6, '2018-08-26 15:00:43', '2022-07-31 08:17:26'),
(30, 24, 'Vina', 'Vinaphone 300.000đ', 300000, '{\"VND\":\"300000\"}', 2, '32', 'ac183ad5104208359a190d1992c204cb', 1, 7, '2018-08-26 15:00:43', '2022-07-31 08:17:29'),
(31, 24, 'Vina', 'Vinaphone 500.000đ', 500000, '{\"VND\":\"500000\"}', 2, '32', 'ae06b7b0e2de13d3f300e227761a4aa5', 1, 8, '2018-08-26 15:00:43', '2022-07-31 08:17:32'),
(32, 23, 'Viettel', 'Viettel 10.000đ', 10000, '{\"VND\":\"10000\"}', 2, '32', '6bdceaece7bae0584745593ce348ef8b', 1, 0, '2018-08-19 22:08:03', '2022-07-31 08:06:10'),
(33, 23, 'Viettel', 'Viettel 20.000đ', 20000, '{\"VND\":\"20000\"}', 2, '32', '15fbc9a9d1e8ec343fc9b3cb22da8714', 1, 0, '2018-08-19 22:08:03', '2022-07-31 08:06:14'),
(34, 23, 'Viettel', 'Viettel 30.000đ', 30000, '{\"VND\":\"30000\"}', 2, '32', '7bfc7170624cabd7542a3d99986a7b63', 1, 0, '2018-08-26 15:00:43', '2022-07-31 08:06:17'),
(35, 23, 'Viettel', 'Viettel 50.000đ', 50000, '{\"VND\":\"50000\"}', 2, '32', 'bd69680794059857698e332d467c220d', 1, 0, '2018-08-26 15:00:43', '2022-07-31 08:06:20'),
(36, 23, 'Viettel', 'Viettel 100.000đ', 100000, '{\"VND\":\"100000\"}', 2, '32', 'dfea3dd6ae23387c8de013e51f3e90ca', 1, 0, '2018-08-26 15:00:43', '2022-07-31 08:06:24'),
(37, 23, 'Viettel', 'Viettel 200.000đ', 200000, '{\"VND\":\"200000\"}', 2, '32', 'abc222e4fd236871053f2fbb7de8caac', 1, 0, '2018-08-26 15:00:43', '2022-07-31 08:06:28'),
(38, 23, 'Viettel', 'Viettel 300.000đ', 300000, '{\"VND\":\"300000\"}', 2, '32', '3ba46daca81fbea80f4cae0a93087202', 1, 0, '2018-08-26 15:00:43', '2022-07-31 08:06:06'),
(39, 23, 'Viettel', 'Viettel 500.000đ', 500000, '{\"VND\":\"500000\"}', 2, '32', '43d7b78c67c54dbb75081e54c3da21bb', 1, 0, '2018-08-26 15:00:43', '2022-07-31 08:06:02'),
(40, 23, 'Viettel', 'Viettel 1.000.000đ', 1000000, '{\"VND\":\"1000000\"}', 2, '32', 'f2c7328d009065eb77d8ef23707c9104', 1, 0, '2018-08-26 15:00:43', '2022-07-31 08:05:58'),
(41, 25, 'Mobi', 'Mobifone 10.000đ', 10000, '{\"VND\":\"10000\"}', 2, '32', '37fb57888bc5a760839f742d1d9667b9', 1, 0, '2018-08-19 22:08:03', '2023-03-29 08:26:56'),
(42, 25, 'Mobi', 'Mobifone 20.000đ', 20000, '{\"VND\":\"20000\"}', 2, '32', '7f8cddcb312540b6916bf3ef8f11b1d7', 1, 0, '2018-08-19 22:08:03', '2022-07-31 08:16:30'),
(43, 25, 'Mobi', 'Mobifone 30.000đ', 30000, '{\"VND\":\"30000\"}', 2, '32', '87df441fd02f781d819640ec73f93b6e', 1, 0, '2018-08-26 15:00:43', '2022-07-31 08:16:32'),
(44, 25, 'Mobi', 'Mobifone 50.000đ', 50000, '{\"VND\":\"50000\"}', 2, '32', '4876c43b10451cf19de62f0761c94613', 1, 0, '2018-08-26 15:00:43', '2022-07-31 08:16:36'),
(45, 25, 'Mobi', 'Mobifone 100.000đ', 100000, '{\"VND\":\"100000\"}', 2, '32', '213889b7bcec30ea7cb9412c7983df11', 1, 0, '2018-08-26 15:00:43', '2022-07-31 08:16:40'),
(46, 25, 'Mobi', 'Mobifone 200.000đ', 200000, '{\"VND\":\"200000\"}', 2, '32', '74133c60716f18de98f11b01b3d8c370', 1, 0, '2018-08-26 15:00:43', '2022-07-31 08:16:45'),
(47, 25, 'Mobi', 'Mobifone 300.000đ', 300000, '{\"VND\":\"300000\"}', 2, '32', '6e3d94b5c5608a5616aced06fb737974', 1, 0, '2018-08-26 15:00:43', '2022-07-31 08:16:54'),
(48, 25, 'Mobi', 'Mobifone 500.000đ', 500000, '{\"VND\":\"500000\"}', 2, '32', 'e5cec20ec4ea8a310acb9d478c14d71c', 1, 0, '2018-08-26 15:00:43', '2022-07-31 08:16:56'),
(49, 26, 'Vnmobile', 'Vietnamobile 10.000đ', 10000, '{\"VND\":\"10000\"}', 2, '32', '5dcd077eda2f3fc19c19d9325f96a348', 1, 0, '2018-08-19 22:08:03', '2022-07-31 08:15:56'),
(50, 26, 'Vnmobile', 'Vietnamobile 20.000đ', 20000, '{\"VND\":\"20000\"}', 2, '32', 'a70a1c653cd9d3d707aacb6062f2c000', 1, 0, '2018-08-19 22:08:03', '2022-07-31 08:15:59'),
(52, 26, 'Vnmobile', 'Vietnamobile 50.000đ', 50000, '{\"VND\":\"50000\"}', 2, '32', '19b898e9aaff2a4b4082969fe4244b89', 1, 0, '2018-08-26 15:00:43', '2022-07-31 08:16:02'),
(53, 26, 'Vnmobile', 'Vietnamobile 100.000đ', 100000, '{\"VND\":\"100000\"}', 2, '32', 'af48a27183cff07358a347dad3e00dae', 1, 0, '2018-08-26 15:00:43', '2022-07-31 08:16:05'),
(54, 26, 'Vnmobile', 'Vietnamobile 200.000đ', 200000, '{\"VND\":\"200000\"}', 2, '32', '3eef57956e9b2658cdd2a180728161bc', 1, 0, '2018-08-26 15:00:43', '2022-07-31 08:16:09'),
(55, 26, 'Vnmobile', 'Vietnamobile 300.000đ', 300000, '{\"VND\":\"300000\"}', 2, '32', '0ccfd79caaae3ac4367f1f03ad40465d', 1, 0, '2018-08-26 15:00:43', '2022-07-31 08:16:17'),
(56, 26, 'Vnmobile', 'Vietnamobile 500.000đ', 500000, '{\"VND\":\"500000\"}', 2, '32', 'a1a595fc51776b6d505d44261491771b', 1, 0, '2018-08-26 15:00:43', '2022-07-31 08:16:20'),
(66, 28, 'Garena', 'Garena 20.000đ', 20000, '{\"VND\":\"20000\"}', 2, '32', 'a682ea2b54f79eb4d916225c885d3659', 1, 0, '2018-08-19 22:08:03', '2022-07-31 08:15:29'),
(68, 28, 'Garena', 'Garena 50.000đ', 50000, '{\"VND\":\"50000\"}', 2, '32', 'afa3d52a10d2ed035dc91631df92ee60', 1, 0, '2018-08-26 15:00:43', '2022-09-01 17:13:03'),
(69, 28, 'Garena', 'Garena 100.000đ', 100000, '{\"VND\":\"100000\"}', 2, '32', 'a396086dc02de19e704f53561e4c4af9', 1, 0, '2018-08-26 15:00:43', '2022-09-01 17:12:43'),
(70, 28, 'Garena', 'Garena 200.000đ', 200000, '{\"VND\":\"200000\"}', 2, '32', '708d24427994f132b99def2551f81cae', 1, 0, '2018-08-26 15:00:43', '2022-09-01 17:12:58'),
(72, 28, 'Garena', 'Garena 500.000đ', 500000, '{\"VND\":\"500000\"}', 2, '32', '562f7f1bc2827000b4a3dcb58304e628', 1, 0, '2018-08-26 15:00:43', '2022-09-01 17:12:53'),
(76, 29, 'Appota', 'Appota 50.000đ', 50000, '{\"VND\":\"50000\"}', 2, '32', 'a806cd8b6348d908e44de98625caf576', 1, 0, '2018-08-26 15:00:43', '2022-07-31 08:14:47'),
(77, 29, 'Appota', 'Appota 100.000đ', 100000, '{\"VND\":\"100000\"}', 2, '32', '7d647a28284540887a67a99c5b1f3b0f', 1, 0, '2018-08-26 15:00:43', '2022-07-31 08:14:50'),
(78, 29, 'Appota', 'Appota 200.000đ', 200000, '{\"VND\":\"200000\"}', 2, '32', 'de06f6aa3a0104dcb63660892526efd3', 1, 0, '2018-08-26 15:00:43', '2022-07-31 08:14:54'),
(79, 29, 'Appota', 'Appota 300.000đ', 300000, '{\"VND\":\"300000\"}', 2, '32', '1439c97ae4d0048416b5e19c7fa3bc99', 1, 0, '2018-08-26 15:00:43', '2022-07-31 08:14:57'),
(80, 29, 'Appota', 'Appota 500.000đ', 500000, '{\"VND\":\"500000\"}', 2, '32', '718047ec924f6e5b2c83d0f68da63f62', 1, 0, '2018-08-26 15:00:43', '2022-07-31 08:15:01'),
(81, 29, 'Appota', 'Appota 1.000.000đ', 1000000, '{\"VND\":\"1000000\"}', 2, '32', '1cc6fd190da5cd4dc4ae29919e6ef99a', 1, 0, '2018-08-26 15:00:43', '2022-07-31 08:15:05'),
(82, 29, 'Appota', 'Appota 2.000.000đ', 2000000, '{\"VND\":\"2000000\"}', 2, '32', '625f768f0271845708cdc415403b26b9', 1, 0, '2018-08-26 15:00:43', '2022-07-31 08:15:08'),
(83, 29, 'Appota', 'Appota 3.000.000đ', 3000000, '{\"VND\":\"3000000\"}', 2, '32', '77f1eb9acbac5fa8ff43009f91f3ae05', 1, 0, '2018-08-26 15:00:43', '2022-07-31 08:15:14'),
(84, 29, 'Appota', 'Appota 5.000.000đ', 5000000, '{\"VND\":\"5000000\"}', 2, '32', '41782b33c9fc1460c157c9a4d57f7b5f', 1, 0, '2018-08-26 15:00:43', '2022-07-31 08:15:19'),
(85, 31, 'Vcoin', 'Vcoin 10.000đ', 10000, '{\"VND\":\"10000\"}', 2, '32', '6c63834fc7b1d5890cd9e653d777ff8e', 1, 0, '2018-08-19 22:08:03', '2022-07-31 08:13:39'),
(86, 31, 'Vcoin', 'Vcoin 20.000đ', 20000, '{\"VND\":\"20000\"}', 2, '32', '4b1303e26713936b8debe0202cb1eaca', 1, 0, '2018-08-19 22:08:03', '2022-07-31 08:13:42'),
(88, 31, 'Vcoin', 'Vcoin 50.000đ', 50000, '{\"VND\":\"50000\"}', 2, '32', '2c47f38cfd337fb12fa145e5fac395ea', 1, 0, '2018-08-26 15:00:43', '2022-07-31 08:13:45'),
(89, 31, 'Vcoin', 'Vcoin 100.000đ', 100000, '{\"VND\":\"100000\"}', 2, '32', '55f7fc815124848c04ad7ad2039a3eb0', 1, 0, '2018-08-26 15:00:43', '2022-07-31 08:13:48'),
(90, 31, 'Vcoin', 'Vcoin 200.000đ', 200000, '{\"VND\":\"200000\"}', 2, '32', 'ccc1e029b14dded5a7e13497d91dea45', 1, 0, '2018-08-26 15:00:43', '2022-07-31 08:13:52'),
(91, 31, 'Vcoin', 'Vcoin 300.000đ', 300000, '{\"VND\":\"300000\"}', 2, '32', '34302fb3b15f627aebb3095c0863a93a', 1, 0, '2018-08-26 15:00:43', '2022-07-31 08:13:55'),
(92, 31, 'Vcoin', 'Vcoin 500.000đ', 500000, '{\"VND\":\"500000\"}', 2, '32', '8748488c68e0553fbab4bb1d2f106b62', 1, 0, '2018-08-26 15:00:43', '2022-07-31 08:13:59'),
(93, 31, 'Vcoin', 'Vcoin 1.000.000đ', 1000000, '{\"VND\":\"1000000\"}', 2, '32', '6c63834fc7b1d5890cd9e653d777ff8e', 1, 0, '2018-08-26 15:00:43', '2022-07-31 08:14:02'),
(94, 31, 'Vcoin', 'Vcoin 2.000.000đ', 2000000, '{\"VND\":\"2000000\"}', 2, '32', '3f5eb1cfba29fadded2cd089c0a8688b', 0, 0, '2018-08-26 15:00:43', '2022-07-31 08:14:05'),
(95, 31, 'Vcoin', 'Vcoin 3.000.000đ', 3000000, '{\"VND\":\"3000000\"}', 2, '32', 'dfe2077f3b9a4fb17a3b04d98f7c5730', 0, 0, '2018-08-26 15:00:43', '2022-07-31 08:14:09'),
(96, 31, 'Vcoin', 'Vcoin 5.000.000đ', 5000000, '{\"VND\":\"5000000\"}', 2, '32', 'd3c461a8a3e4f5f92c826c0e06a64633', 0, 0, '2018-08-26 15:00:43', '2022-07-31 08:14:12'),
(97, 32, 'Gate', 'Gate 10.000đ', 10000, '{\"VND\":\"10000\"}', 2, '32', '4a3a38866eaec43a2e852d1581162eb7', 1, 0, '2018-08-19 22:08:03', '2022-07-31 08:12:40'),
(98, 32, 'Gate', 'Gate 20.000đ', 20000, '{\"VND\":\"20000\"}', 2, '32', 'c21646aeb66d2accdff7909881925539', 1, 0, '2018-08-19 22:08:03', '2022-07-31 08:12:43'),
(100, 32, 'Gate', 'Gate 50.000đ', 50000, '{\"VND\":\"50000\"}', 2, '32', '0174344b81cf432f2a65907f56282984', 1, 0, '2018-08-26 15:00:43', '2022-07-31 08:12:46'),
(101, 32, 'Gate', 'Gate 100.000đ', 100000, '{\"VND\":\"100000\"}', 2, '32', '9c20b61f483db704c2acb37b33fce7db', 1, 0, '2018-08-26 15:00:43', '2022-07-31 08:12:53'),
(102, 32, 'Gate', 'Gate 200.000đ', 200000, '{\"VND\":\"200000\"}', 2, '32', '1781bb853f2bb846fce489cfbf5a200d', 1, 0, '2018-08-26 15:00:43', '2022-07-31 08:12:56'),
(104, 32, 'Gate', 'Gate 500.000đ', 500000, '{\"VND\":\"500000\"}', 2, '32', '81bc5220e0e5b29113bdd99fa768e5d7', 1, 0, '2018-08-26 15:00:43', '2022-07-31 08:13:00'),
(105, 32, 'Gate', 'Gate 1.000.000đ', 1000000, '{\"VND\":\"1000000\"}', 2, '32', '4acc2be313377b186e1265da5c46a64b', 1, 0, '2018-08-26 15:00:43', '2022-07-31 08:13:08'),
(106, 32, 'Gate', 'Gate 2.000.000đ', 2000000, '{\"VND\":\"2000000\"}', 2, '32', '3b9a6f5b93bf64191c1e9f5fcd48c8e2', 1, 0, '2018-08-26 15:00:43', '2022-07-31 08:13:11'),
(107, 32, 'Gate', 'Gate 3.000.000đ', 3000000, '{\"VND\":\"3000000\"}', 2, '32', 'a45cc2cf89c25331dfc8d02507b65186', 1, 0, '2018-08-26 15:00:43', '2022-07-31 08:13:16'),
(108, 32, 'Gate', 'Gate 5.000.000đ', 5000000, '{\"VND\":\"5000000\"}', 2, '32', '034af40a148a196f026cc054057f0dde', 1, 0, '2018-08-26 15:00:43', '2022-07-31 08:13:19'),
(125, 30, 'Zing', 'Zing 10.000đ', 10000, '{\"VND\":\"10000\"}', 2, '32', 'fba7f1fe1932850886981c8ea818c58f', 1, 0, '2018-08-19 22:08:03', '2022-07-31 08:14:20'),
(126, 30, 'Zing', 'Zing 20.000đ', 20000, '{\"VND\":\"20000\"}', 2, '32', '270419b3d3918a532260983cd1de6e8c', 1, 0, '2018-08-19 22:08:03', '2022-07-31 08:14:23'),
(128, 30, 'Zing', 'Zing 50.000đ', 50000, '{\"VND\":\"50000\"}', 2, '32', '71de55a3690562263b037419bbd0a38e', 1, 0, '2018-08-26 15:00:43', '2022-07-31 08:14:26'),
(129, 30, 'Zing', 'Zing 100.000đ', 100000, '{\"VND\":\"100000\"}', 2, '32', '3392b24036e0324dcae3513868a9285b', 1, 0, '2018-08-26 15:00:43', '2022-07-31 08:14:30'),
(130, 30, 'Zing', 'Zing 200.000đ', 200000, '{\"VND\":\"200000\"}', 2, '32', 'bfee7ac6c7c34d9029f002a5ba0ad367', 1, 0, '2018-08-26 15:00:43', '2022-07-31 08:14:35'),
(132, 30, 'Zing', 'Zing 500.000đ', 500000, '{\"VND\":\"500000\"}', 2, '32', 'aa1058e3b2d7034b4d1e1110cae0210d', 1, 0, '2018-08-26 15:00:43', '2022-07-31 08:14:39'),
(133, 30, 'Zing', 'Zing 1.000.000đ', 1000000, '{\"VND\":\"1000000\"}', 2, '32', '2acbc3b7f9dcef6ea08368efbed8618f', 1, 0, '2018-08-26 15:00:43', '2022-07-31 08:14:41'),
(134, 38, 'Funcard', 'Thẻ funcard 10.000đ', 10000, '{\"VND\":\"10000\"}', 2, '32', 'fd5dfa22ddf5a8ba19142b8e2efe8f0b', 1, 1, '2019-01-23 21:21:23', '2022-05-31 10:24:40'),
(135, 38, 'Funcard', 'Thẻ funcard 20.000đ', 20000, '{\"VND\":\"20000\"}', 2, '32', '2214744824055fcefdcba8764ed6953f', 1, 2, '2019-01-23 21:21:23', '2022-05-31 10:24:53'),
(137, 38, 'Funcard', 'Thẻ funcard 50.000đ', 50000, '{\"VND\":\"50000\"}', 2, '32', 'f8499f287a55addcd64601f2a216b2a9', 1, 4, '2019-01-23 22:34:06', '2022-07-31 08:11:44'),
(138, 38, 'Funcard', 'Thẻ funcard 100.000đ', 100000, '{\"VND\":\"100000\"}', 2, '32', 'd99615d74fcd2390de0d5507cb30e42f', 1, 5, '2019-01-23 22:34:06', '2022-05-31 10:25:12'),
(139, 38, 'Funcard', 'Thẻ funcard 200.000đ', 200000, '{\"VND\":\"200000\"}', 2, '32', '11bdf320ae208692689b6ba2145ceb15', 1, 6, '2019-01-23 22:34:06', '2022-05-31 10:25:18'),
(140, 38, 'Funcard', 'Thẻ funcard 500.000đ', 500000, '{\"VND\":\"500000\"}', 2, '32', '4567b566a61e07207c52b7dd4e8915e0', 1, 7, '2019-01-23 22:34:06', '2022-05-31 10:25:25'),
(141, 38, 'Funcard', 'Thẻ funcard 1.000.000đ', 1000000, '{\"VND\":\"1000000\"}', 2, '32', 'aaa18496ac3eb305ac8c4462218f3a0b', 1, 8, '2019-01-23 22:34:06', '2022-05-31 10:25:31'),
(161, 37, 'Carot', 'Carot 100.000d', 100000, '{\"VND\":\"100000\"}', 2, '32', NULL, 1, NULL, '2022-02-20 13:30:29', '2022-07-31 08:12:08'),
(162, 37, 'Carot', 'Carot 200.000 d', 200000, '{\"VND\":\"200000\"}', 2, '32', NULL, 1, NULL, '2022-02-20 13:32:50', '2022-07-31 08:12:13'),
(163, 37, 'Carot', 'Carot 500.000d', 500000, '{\"VND\":\"500000\"}', 2, '32', NULL, 1, NULL, '2022-02-20 13:33:41', '2022-07-31 08:12:16'),
(244, 48, 'Kis', 'Kaspersky Internet Security 1 thiết bị', 300000, '{\"VND\":\"300000\"}', 2, '32', NULL, 1, 1, '2022-08-31 09:10:55', '2023-03-14 05:28:12'),
(252, 48, 'Kis', 'Kaspersky Internet Security 3 thiết bị', 650000, '{\"VND\":\"650000\"}', 2, '32', NULL, 1, 2, '2022-08-31 09:10:55', '2023-03-14 05:28:12'),
(253, 49, 'Scoin', 'Scoin 10000', 10000, NULL, 2, '32', NULL, 1, NULL, '2023-03-14 05:30:11', '2023-03-14 05:35:24'),
(254, 49, 'Scoin', 'Scoin 20000', 20000, NULL, 2, '32', NULL, 1, NULL, '2023-03-14 05:30:11', '2023-03-14 05:35:24'),
(255, 49, 'Scoin', 'Scoin 50000', 50000, NULL, 2, '32', NULL, 1, NULL, '2023-03-14 05:30:11', '2023-03-14 05:35:24'),
(256, 49, 'Scoin', 'Scoin 100000', 100000, NULL, 2, '32', NULL, 1, NULL, '2023-03-14 05:30:11', '2023-03-14 05:35:24'),
(257, 49, 'Scoin', 'Scoin 200000', 200000, NULL, 2, '32', NULL, 1, NULL, '2023-03-14 05:30:11', '2023-03-14 05:35:24'),
(258, 49, 'Scoin', 'Scoin 500000', 500000, NULL, 2, '32', NULL, 1, NULL, '2023-03-14 05:30:11', '2023-03-14 05:35:24'),
(259, 49, 'Scoin', 'Scoin 1000000', 1000000, NULL, 2, '32', NULL, 1, NULL, '2023-03-14 05:30:11', '2023-03-14 05:35:24'),
(260, 49, 'Scoin', 'Scoin 2000000', 2000000, NULL, 2, '32', NULL, 1, NULL, '2023-03-14 05:30:11', '2023-03-14 05:35:24'),
(261, 49, 'Scoin', 'Scoin 5000000', 5000000, NULL, 2, '32', NULL, 1, NULL, '2023-03-14 05:30:11', '2023-03-14 05:35:24'),
(262, 50, 'Gosu', 'Gosu 10000', 10000, NULL, 2, '32', NULL, 1, NULL, '2023-03-14 05:36:55', '2023-03-14 05:37:14'),
(263, 50, 'Gosu', 'Gosu 20000', 20000, NULL, 2, '32', NULL, 1, NULL, '2023-03-14 05:36:55', '2023-03-14 05:37:14'),
(264, 50, 'Gosu', 'Gosu 50000', 50000, NULL, 2, '32', NULL, 1, NULL, '2023-03-14 05:36:55', '2023-03-14 05:37:14'),
(265, 50, 'Gosu', 'Gosu 100000', 100000, NULL, 2, '32', NULL, 1, NULL, '2023-03-14 05:36:55', '2023-03-14 05:37:14'),
(266, 50, 'Gosu', 'Gosu 200000', 200000, NULL, 2, '32', NULL, 1, NULL, '2023-03-14 05:36:55', '2023-03-14 05:37:14'),
(267, 50, 'Gosu', 'Gosu 500000', 500000, NULL, 2, '32', NULL, 1, NULL, '2023-03-14 05:36:55', '2023-03-14 05:37:14'),
(268, 50, 'Gosu', 'Gosu 1000000', 1000000, NULL, 2, '32', NULL, 1, NULL, '2023-03-14 05:36:55', '2023-03-14 05:37:14'),
(269, 51, 'Kul', 'Kul 10000', 10000, NULL, 2, '32', NULL, 1, NULL, '2023-03-14 05:38:37', '2023-03-14 05:39:02'),
(270, 51, 'Kul', 'Kul 20000', 20000, NULL, 2, '32', NULL, 1, NULL, '2023-03-14 05:38:37', '2023-03-14 05:39:02'),
(271, 51, 'Kul', 'Kul 50000', 50000, NULL, 2, '32', NULL, 1, NULL, '2023-03-14 05:38:37', '2023-03-14 05:39:02'),
(272, 51, 'Kul', 'Kul 100000', 100000, NULL, 2, '32', NULL, 1, NULL, '2023-03-14 05:38:37', '2023-03-14 05:39:02'),
(273, 51, 'Kul', 'Kul 200000', 200000, NULL, 2, '32', NULL, 1, NULL, '2023-03-14 05:38:37', '2023-03-14 05:39:02'),
(274, 51, 'Kul', 'Kul 500000', 500000, NULL, 2, '32', NULL, 1, NULL, '2023-03-14 05:38:37', '2023-03-14 05:39:02'),
(275, 51, 'Kul', 'Kul 1000000', 1000000, NULL, 2, '32', NULL, 1, NULL, '2023-03-14 05:38:37', '2023-03-14 05:39:02'),
(276, 51, 'Kul', 'Kul 2000000', 2000000, NULL, 2, '32', NULL, 1, NULL, '2023-03-14 05:38:37', '2023-03-14 05:39:02'),
(284, 53, 'Oncash', 'Oncash 20000', 20000, NULL, 2, '32', NULL, 1, NULL, '2023-03-14 05:42:56', '2023-03-14 05:43:11'),
(285, 53, 'Oncash', 'Oncash 50000', 50000, NULL, 2, '32', NULL, 1, NULL, '2023-03-14 05:42:56', '2023-03-14 05:43:11'),
(286, 53, 'Oncash', 'Oncash 100000', 100000, NULL, 2, '32', NULL, 1, NULL, '2023-03-14 05:42:56', '2023-03-14 05:43:11'),
(287, 53, 'Oncash', 'Oncash 200000', 200000, NULL, 2, '32', NULL, 1, NULL, '2023-03-14 05:42:56', '2023-03-14 05:43:11'),
(288, 53, 'Oncash', 'Oncash 500000', 500000, NULL, 2, '32', NULL, 1, NULL, '2023-03-14 05:42:56', '2023-03-14 05:43:11'),
(289, 54, 'Sohacoin', 'Sohacoin 10000', 10000, NULL, 2, '32', NULL, 1, NULL, '2023-03-14 05:44:38', '2023-03-14 05:45:06'),
(290, 54, 'Sohacoin', 'Sohacoin 20000', 20000, NULL, 2, '32', NULL, 1, NULL, '2023-03-14 05:44:38', '2023-03-14 05:45:06'),
(291, 54, 'Sohacoin', 'Sohacoin 30000', 30000, NULL, 2, '32', NULL, 1, NULL, '2023-03-14 05:44:38', '2023-03-14 05:45:06'),
(292, 54, 'Sohacoin', 'Sohacoin 50000', 50000, NULL, 2, '32', NULL, 1, NULL, '2023-03-14 05:44:38', '2023-03-14 05:45:06'),
(293, 54, 'Sohacoin', 'Sohacoin 100000', 100000, NULL, 2, '32', NULL, 1, NULL, '2023-03-14 05:44:38', '2023-03-14 05:45:06'),
(294, 54, 'Sohacoin', 'Sohacoin 200000', 200000, NULL, 2, '32', NULL, 1, NULL, '2023-03-14 05:44:38', '2023-03-14 05:45:06'),
(295, 54, 'Sohacoin', 'Sohacoin 300000', 300000, NULL, 2, '32', NULL, 1, NULL, '2023-03-14 05:44:38', '2023-03-14 05:45:06'),
(296, 54, 'Sohacoin', 'Sohacoin 500000', 500000, NULL, 2, '32', NULL, 1, NULL, '2023-03-14 05:44:38', '2023-03-14 05:45:06'),
(297, 54, 'Sohacoin', 'Sohacoin 1000000', 1000000, NULL, 2, '32', NULL, 1, NULL, '2023-03-14 05:44:38', '2023-03-14 05:45:06'),
(298, 55, 'Vega', 'Vega 10000', 10000, NULL, 2, '32', NULL, 1, NULL, '2023-03-14 05:46:41', '2023-03-14 05:46:56'),
(299, 55, 'Vega', 'Vega 20000', 20000, NULL, 2, '32', NULL, 1, NULL, '2023-03-14 05:46:41', '2023-03-14 05:46:56'),
(300, 55, 'Vega', 'Vega 50000', 50000, NULL, 2, '32', NULL, 1, NULL, '2023-03-14 05:46:41', '2023-03-14 05:46:56'),
(301, 55, 'Vega', 'Vega 100000', 100000, NULL, 2, '32', NULL, 1, NULL, '2023-03-14 05:46:41', '2023-03-14 05:46:56'),
(302, 55, 'Vega', 'Vega 200000', 200000, NULL, 2, '32', NULL, 1, NULL, '2023-03-14 05:46:41', '2023-03-14 05:46:56'),
(303, 55, 'Vega', 'Vega 500000', 500000, NULL, 2, '32', NULL, 1, NULL, '2023-03-14 05:46:41', '2023-03-14 05:46:56'),
(304, 55, 'Vega', 'Vega 1000000', 1000000, NULL, 2, '32', NULL, 1, NULL, '2023-03-14 05:46:41', '2023-03-14 05:46:56'),
(305, 55, 'Vega', 'Vega 2000000', 2000000, NULL, 2, '32', NULL, 1, NULL, '2023-03-14 05:46:41', '2023-03-14 05:46:56'),
(313, 57, 'BITVN', 'BIT 50.000đ', 50000, '{\"VND\":\"50000\"}', 2, '32', 'bb0d82716a5b4fe81cb6aea7fd06716b', 1, 0, '2023-03-14 05:58:20', '2023-03-30 10:13:23'),
(314, 57, 'BITVN', 'BIT 100.000đ', 100000, '{\"VND\":\"100000\"}', 2, '32', '7eb1e309ae7ff768c90656b2fc8d41fd', 1, 1, '2023-03-14 05:58:20', '2023-03-30 10:13:23'),
(315, 57, 'BITVN', 'BIT 200.000đ', 200000, '{\"VND\":\"200000\"}', 2, '32', '36e1b9ba90df1f4575fd7bdd1514db57', 1, 2, '2023-03-14 05:58:20', '2023-03-30 10:13:23'),
(316, 57, 'BITVN', 'BIT 500.000đ', 500000, '{\"VND\":\"500000\"}', 2, '32', 'ad175cd12e85ecf1c69e1c4257eff213', 1, 3, '2023-03-14 05:58:20', '2023-03-30 10:13:23'),
(317, 57, 'BITVN', 'BIT 1.000.000đ', 1000000, '{\"VND\":\"1000000\"}', 2, '32', 'bafde7bee125bcecfd0ea9768a21c3b9', 1, 4, '2023-03-14 05:58:20', '2023-03-30 10:13:23'),
(318, 57, 'BITVN', 'BIT 2.000.000đ', 2000000, '{\"VND\":\"2000000\"}', 2, '32', 'ed63ab244dff5573a2452ea899122c3f', 1, 5, '2023-03-14 05:58:20', '2023-03-30 10:13:23'),
(319, 57, 'BITVN', 'BIT 5.000.000đ', 5000000, '{\"VND\":\"5000000\"}', 2, '32', 'bde15dfc9b7d2638c632a46be142aa7d', 1, 6, '2023-03-14 05:58:20', '2023-03-30 10:13:23');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `softcard_products`
--

CREATE TABLE `softcard_products` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `meta` text DEFAULT NULL,
  `service_code` varchar(255) NOT NULL,
  `cat_id` int(11) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `item_value` varchar(255) DEFAULT NULL,
  `short_description` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `country_code` varchar(50) DEFAULT 'VN',
  `status` varchar(255) NOT NULL DEFAULT 'ON',
  `allowsell` tinyint(4) NOT NULL DEFAULT 1,
  `sort` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `softcard_products`
--

INSERT INTO `softcard_products` (`id`, `name`, `slug`, `meta`, `service_code`, `cat_id`, `image`, `item_value`, `short_description`, `description`, `country_code`, `status`, `allowsell`, `sort`, `created_at`, `updated_at`) VALUES
(23, 'Thẻ Viettel', 'the-viettel', '{\"title\":\"Th\\u1ebb Viettel\",\"description\":\"the viettel ,\",\"keyword\":\"the viettel\"}', 'Viettel', 1, 'assets/storage/userfiles/images/thecao/the-viettel.png', '10000,20000,30000,50000,100000,200000,300000,500000,1000000', 'the viettel', '<p>Hướng dẫn cách nạp thẻ Viettel trả trước bằng thẻ cào<br />\r\nBước 1: Bạn có thể tới các cửa hàng đại lí có cung cấp thẻ cào viettel, sau đó mua thẻ điện thoại giấy gồm có số seri, mã thẻ, và lớp tráng bạc. Hoặc nếu muốn nhanh chóng hơn bạn cũng có thể nạp thẻ viettel trả trước tại các website cung cấp dịch vụ hoặc mua thẻ bằng tin nhắn SMS.<br />\r\nBước 2: Cạo lớp bạc để lấy dãy số sau đó nhấn mã: *100*Mã số thẻ cào# và bấm phím Gọi<br />\r\nNhà mạng viettel còn cung cấp dịch vụ nạp tiền cho thuê bao trả trước khác bằng thẻ cào giấy, để nạp tiền viettel bạn cần nhấn *103*Số điện thoại nhận*Mã số thẻ cào# &nbsp;và bấm phím Gọi, phí nạp cho thuê bao khác là 1000đ/ lần &nbsp;sẽ bị trừ vào tài khoản gốc của thuê bap nạp hộ.</p>', 'VN', 'ON', 1, 1, '2018-08-08 13:50:45', '2023-03-14 05:52:14'),
(24, 'Thẻ Vinaphone', 'the-vinaphone', NULL, 'Vina', 1, 'assets/storage/userfiles/images/thecao/the-vinaphone.jpeg', NULL, NULL, NULL, 'VN', 'ON', 1, 1, '2018-08-19 22:08:03', '2019-01-23 21:14:48'),
(25, 'Thẻ Mobifone', 'the-mobifone', NULL, 'Mobi', 1, 'assets/storage/userfiles/images/thecao/the-mobifone.jpeg', NULL, NULL, NULL, 'VN', 'ON', 1, 1, '2018-08-26 14:41:21', '2019-01-23 21:14:23'),
(26, 'Thẻ Vietnamobile', 'the-vietnamobile', NULL, 'Vnmobile', 1, 'assets/storage/userfiles/images/thecao/the-vietnamobile.jpeg', NULL, NULL, NULL, 'VN', 'ON', 1, 1, '2018-08-26 14:47:58', '2019-01-23 21:14:10'),
(28, 'Thẻ Garena', 'the-garena', '{\"title\":null,\"description\":null,\"keyword\":null}', 'Garena', 2, 'assets/storage/images/upload_VYA2M0P7W1C8.png', NULL, NULL, NULL, 'VN', 'ON', 1, 1, '2018-08-26 15:20:01', '2023-03-14 05:21:01'),
(29, 'Thẻ Appota', 'the-appota', NULL, 'Appota', 2, 'assets/storage/userfiles/images/thecao/the-appota.png', NULL, NULL, NULL, 'VN', 'ON', 1, 1, '2018-08-26 15:20:28', '2019-01-23 21:13:13'),
(30, 'Thẻ Zing', 'the-zing', NULL, 'Zing', 2, 'assets/storage/userfiles/images/thecao/the-zing.png', NULL, NULL, NULL, 'VN', 'ON', 1, 1, '2018-08-26 15:20:47', '2019-01-23 21:12:57'),
(31, 'Thẻ Vcoin', 'the-vcoin', NULL, 'Vcoin', 2, 'assets/storage/userfiles/images/thecao/the-vcoin.png', NULL, NULL, NULL, 'VN', 'ON', 1, 1, '2018-08-26 15:21:08', '2019-01-23 21:12:36'),
(32, 'Thẻ Gate', 'the-gate', NULL, 'Gate', 2, 'assets/storage/userfiles/images/thecao/the-gate.png', NULL, NULL, NULL, 'VN', 'ON', 1, 1, '2018-08-26 15:21:36', '2019-01-23 21:12:13'),
(37, 'Thẻ Carot', 'the-ca-rot', '{\"title\":null,\"description\":null,\"keyword\":null}', 'Carot', 2, 'assets/storage/userfiles/images/thecao/the-ca-rot.jpg', '500000', 'Thẻ carot', '<p>Thẻ carot</p>', 'VN', 'ON', 1, 1, '2018-12-19 11:59:34', '2022-02-20 13:33:41'),
(38, 'Thẻ Funcard', 'the-funcard', '{\"title\":\"VIPCARD1S.COM - \\u0110\\u1ed4I TH\\u1eba C\\u00c0O NHANH CH\\u00d3NG UY T\\u00cdN H\\u00c0NG \\u0110\\u1ea4U\",\"description\":null,\"keyword\":\"sieudoithe, sieuthecao, doithe ck, doithecao online\"}', 'Funcard', 2, 'assets/storage/userfiles/images/thecao/the-funcard.jpg', NULL, NULL, NULL, 'VN', 'ON', 1, 1, '2019-01-23 21:21:23', '2022-05-31 10:24:06'),
(48, 'Thẻ Kaspersky Internet Security', 'kaspersky-internet-security', '{\"title\":\"Kaspersky Internet Security\\u00a0\",\"description\":\"Kaspersky Internet Security\\u00a0\",\"keyword\":\"Kaspersky Internet Security\\u00a0\"}', 'Kis', 2, 'assets/storage/userfiles/images/thecao/kis.png', '300000,650000', 'Kaspersky Internet Security', '<p><strong>Kaspersky Internet Security&nbsp;</strong></p>', 'VN', 'ON', 1, 0, '2022-08-31 09:08:26', '2023-03-14 05:52:39'),
(49, 'Thẻ Scoin', 'the-scoin', '{\"title\":\"VIPCARD1S.COM - \\u0110\\u1ed4I TH\\u1eba UY T\\u00cdN H\\u00c0NG \\u0110\\u1ea6U VI\\u1ec6T NAM, CHI\\u1ebeT KH\\u1ea4U T\\u1ed0T NH\\u1ea4T TH\\u1eca TR\\u01af\\u1edcNG VN\",\"description\":\"Mua Th\\u1ebb Scoin\",\"keyword\":\"sieudoithe, sieuthecao, doithe ck, doithecao online,DoiThe1SVN ,VIPCARD1S.COM , thecaore1s.vn ,th\\u1ebb c\\u00e0o r\\u1ebb 1s, thecaouytin,doithe1s.com ,web doi the chiet khau, C\\u00c1CH \\u0110\\u1ed4I TH\\u1eba UY T\\u00cdN , \\u0111\\u1ed5i th\\u1ebb \\u1edf \\u0111\\u00e2u uy t\\u00edn nh\\u1ea5t , doithe1 gi\\u00e2y , Ki\\u1ec3m tra xem th\\u1ebb Garena \\u0111\\u00e3 n\\u1ea1p hay ch\\u01b0a ,trumnapthe , \\u0111\\u1ed5i card garena, Tr\\u00f9m N\\u1ea1p Th\\u1ebb ,thesieuviet, Trumtheviet.com , api \\u0111\\u1ed5i th\\u1ebb c\\u00e0o, tr\\u00f9m \\u0111\\u1ed5i th\\u1ebb, h\\u01b0\\u1edbng d\\u1eabn n\\u1ed1i api \\u0111\\u1ed5i th\\u1ebb cho shop ,Tr\\u00f9m Th\\u1ebb Vi\\u1ec7t , trumtheviet. com thesieuviet.com, thesieuviet.com.vn, th\\u00e9ieuviet.com th\\u00e9ieuviet,  doi the, trum the viet, \\u0111\\u1ed5i th\\u1ebb c\\u00e0o sang ti\\u1ec1n m\\u1eb7t, gachthenhanh, the sieu re, doi the nhanh, doi the cao sang tien mat, card24, \\u0111\\u1ed5i th\\u1ebb 1 gi\\u00e2y, tst, doithe1s, doithe nhanh nh\\u1ea5t , tsn, doicardnhanh, doi th\\u1ebb c\\u00e0o, trumthe vi\\u1ec7t, thecaoviet.com , site g\\u1ea1ch th\\u1ebb g\\u1ed1c ,trum the c\\u00e0o, \\u0111\\u1ed5i th\\u1ebb gi\\u00e1 r\\u1ebb, mua th\\u1ebb c\\u00e0o gi\\u00e1 r\\u1ebb, mua th\\u1ebb c\\u00e0o, card online,trumdoithe, \\u0111\\u1ed5i th\\u1ebb c\\u00e0o sang th\\u1ebb game, n\\u1ea1p ti\\u00ean momo b\\u1eb1ng th\\u1ebb c\\u00e0o, mua th\\u1ebb game b\\u1eb1ng th\\u1ebb \\u0111i\\u1ec7n tho\\u1ea1i, api th\\u1ebb c\\u00e0o, \\u0111\\u1ed5i th\\u1ebb uy t\\u00edn, \\u0111\\u1ed5i th\\u1ebb c\\u00e0o sang momo, trumthe com , trumdoithe.net, \\u0111\"}', 'Scoin', 2, 'assets/storage/userfiles/images/thecao/the-scoin.jpg', '10000,20000,50000,100000,200000,500000,1000000,2000000,5000000', NULL, NULL, 'VN', 'ON', 1, 1, '2023-03-14 05:30:11', '2023-03-14 05:30:11'),
(50, 'Thẻ Gosu', 'the-gosu', '{\"title\":\"VIPCARD1S.COM - \\u0110\\u1ed4I TH\\u1eba UY T\\u00cdN H\\u00c0NG \\u0110\\u1ea6U VI\\u1ec6T NAM, CHI\\u1ebeT KH\\u1ea4U T\\u1ed0T NH\\u1ea4T TH\\u1eca TR\\u01af\\u1edcNG VN\",\"description\":null,\"keyword\":\"sieudoithe, sieuthecao, doithe ck, doithecao online,DoiThe1SVN ,VIPCARD1S.COM , thecaore1s.vn ,th\\u1ebb c\\u00e0o r\\u1ebb 1s, thecaouytin,doithe1s.com ,web doi the chiet khau, C\\u00c1CH \\u0110\\u1ed4I TH\\u1eba UY T\\u00cdN , \\u0111\\u1ed5i th\\u1ebb \\u1edf \\u0111\\u00e2u uy t\\u00edn nh\\u1ea5t , doithe1 gi\\u00e2y , Ki\\u1ec3m tra xem th\\u1ebb Garena \\u0111\\u00e3 n\\u1ea1p hay ch\\u01b0a ,trumnapthe , \\u0111\\u1ed5i card garena, Tr\\u00f9m N\\u1ea1p Th\\u1ebb ,thesieuviet, Trumtheviet.com , api \\u0111\\u1ed5i th\\u1ebb c\\u00e0o, tr\\u00f9m \\u0111\\u1ed5i th\\u1ebb, h\\u01b0\\u1edbng d\\u1eabn n\\u1ed1i api \\u0111\\u1ed5i th\\u1ebb cho shop ,Tr\\u00f9m Th\\u1ebb Vi\\u1ec7t , trumtheviet. com thesieuviet.com, thesieuviet.com.vn, th\\u00e9ieuviet.com th\\u00e9ieuviet,  doi the, trum the viet, \\u0111\\u1ed5i th\\u1ebb c\\u00e0o sang ti\\u1ec1n m\\u1eb7t, gachthenhanh, the sieu re, doi the nhanh, doi the cao sang tien mat, card24, \\u0111\\u1ed5i th\\u1ebb 1 gi\\u00e2y, tst, doithe1s, doithe nhanh nh\\u1ea5t , tsn, doicardnhanh, doi th\\u1ebb c\\u00e0o, trumthe vi\\u1ec7t, thecaoviet.com , site g\\u1ea1ch th\\u1ebb g\\u1ed1c ,trum the c\\u00e0o, \\u0111\\u1ed5i th\\u1ebb gi\\u00e1 r\\u1ebb, mua th\\u1ebb c\\u00e0o gi\\u00e1 r\\u1ebb, mua th\\u1ebb c\\u00e0o, card online,trumdoithe, \\u0111\\u1ed5i th\\u1ebb c\\u00e0o sang th\\u1ebb game, n\\u1ea1p ti\\u00ean momo b\\u1eb1ng th\\u1ebb c\\u00e0o, mua th\\u1ebb game b\\u1eb1ng th\\u1ebb \\u0111i\\u1ec7n tho\\u1ea1i, api th\\u1ebb c\\u00e0o, \\u0111\\u1ed5i th\\u1ebb uy t\\u00edn, \\u0111\\u1ed5i th\\u1ebb c\\u00e0o sang momo, trumthe com , trumdoithe.net, \\u0111\"}', 'Gosu', 2, 'assets/storage/images/upload_1B9TNVEHOGA6.png', '10000,20000,50000,100000,200000,500000,1000000', NULL, NULL, 'VN', 'ON', 1, 1, '2023-03-14 05:36:55', '2023-03-14 05:36:55'),
(51, 'Thẻ Kul', 'the-kul', '{\"title\":\"VIPCARD1S.COM - \\u0110\\u1ed4I TH\\u1eba UY T\\u00cdN H\\u00c0NG \\u0110\\u1ea6U VI\\u1ec6T NAM, CHI\\u1ebeT KH\\u1ea4U T\\u1ed0T NH\\u1ea4T TH\\u1eca TR\\u01af\\u1edcNG VN\",\"description\":null,\"keyword\":\"H\\u1ec7 th\\u1ed1ng \\u0111\\u1ed5i th\\u1ebb c\\u00e0o sang ti\\u1ec1n m\\u1eb7t , momo ph\\u00ed t\\u1ed1t nh\\u1ea5t th\\u1ecb tr\\u01b0\\u1eddng - t\\u1ef1 \\u0111\\u1ed9ng x\\u1eed l\\u00fd th\\u1ebb c\\u1ef1c nhanh ch\\u00f3ng ! \\u0110\\u1ed5i th\\u1ebb c\\u00e0o th\\u00e0nh ti\\u1ec1n m\\u1eb7t, \\u0111\\u1ed5i th\\u1ebb c\\u00e0o sang ti\\u1ec1n m\\u1eb7t, \\u0111\\u1ed5i th\\u1ebb c\\u00e0o ra ti\\u1ec1n m\\u1eb7t, \\u0111\\u1ed5i th\\u1ebb c\\u00e0o sang th\\u1ebb garena, \\u0111\\u1ed5i th\\u1ebb gate sang ti\\u1ec1n m\\u1eb7t, \\u0111\\u1ed5i th\\u1ebb Viettel th\\u00e0nh ti\\u1ec1n m\\u1eb7t, c\\u00e1ch n\\u1ea1p th\\u1ebb c\\u00e0o v\\u00e0o momo , \\u0111\\u1ed5i th\\u1ebb r\\u00fat momo nhanh nh\\u1ea5t , \\u0111\\u1ed5i th\\u1ebb r\\u00fat atm nhanh nh\\u00e1t , \\u0111\\u1ed5i th\\u1ebb r\\u00fat momo uy t\\u00edn .\"}', 'Kul', 2, 'assets/storage/userfiles/images/thecao/Kul.jpeg', '10000,20000,50000,100000,200000,500000,1000000,2000000', NULL, NULL, 'VN', 'ON', 1, 1, '2023-03-14 05:38:37', '2023-03-14 05:38:37'),
(53, 'Thẻ Oncash', 'the-oncash', '{\"title\":\"VIPCARD1S.COM - \\u0110\\u1ed4I TH\\u1eba UY T\\u00cdN H\\u00c0NG \\u0110\\u1ea6U VI\\u1ec6T NAM, CHI\\u1ebeT KH\\u1ea4U T\\u1ed0T NH\\u1ea4T TH\\u1eca TR\\u01af\\u1edcNG VN\",\"description\":null,\"keyword\":\"H\\u1ec7 th\\u1ed1ng \\u0111\\u1ed5i th\\u1ebb c\\u00e0o sang ti\\u1ec1n m\\u1eb7t , momo ph\\u00ed t\\u1ed1t nh\\u1ea5t th\\u1ecb tr\\u01b0\\u1eddng - t\\u1ef1 \\u0111\\u1ed9ng x\\u1eed l\\u00fd th\\u1ebb c\\u1ef1c nhanh ch\\u00f3ng ! \\u0110\\u1ed5i th\\u1ebb c\\u00e0o th\\u00e0nh ti\\u1ec1n m\\u1eb7t, \\u0111\\u1ed5i th\\u1ebb c\\u00e0o sang ti\\u1ec1n m\\u1eb7t, \\u0111\\u1ed5i th\\u1ebb c\\u00e0o ra ti\\u1ec1n m\\u1eb7t, \\u0111\\u1ed5i th\\u1ebb c\\u00e0o sang th\\u1ebb garena, \\u0111\\u1ed5i th\\u1ebb gate sang ti\\u1ec1n m\\u1eb7t, \\u0111\\u1ed5i th\\u1ebb Viettel th\\u00e0nh ti\\u1ec1n m\\u1eb7t, c\\u00e1ch n\\u1ea1p th\\u1ebb c\\u00e0o v\\u00e0o momo , \\u0111\\u1ed5i th\\u1ebb r\\u00fat momo nhanh nh\\u1ea5t , \\u0111\\u1ed5i th\\u1ebb r\\u00fat atm nhanh nh\\u00e1t , \\u0111\\u1ed5i th\\u1ebb r\\u00fat momo uy t\\u00edn .\"}', 'Oncash', 2, '/assets/storage/userfiles/images/thecao/the-oncash.png', '20000,50000,100000,200000,500000', NULL, NULL, 'VN', 'ON', 1, 1, '2023-03-14 05:42:56', '2023-03-14 05:42:56'),
(54, 'Thẻ Sohacoin', 'the-sohacoin', '{\"title\":\"VIPCARD1S.COM - \\u0110\\u1ed4I TH\\u1eba UY T\\u00cdN H\\u00c0NG \\u0110\\u1ea6U VI\\u1ec6T NAM, CHI\\u1ebeT KH\\u1ea4U T\\u1ed0T NH\\u1ea4T TH\\u1eca TR\\u01af\\u1edcNG VN\",\"description\":null,\"keyword\":\"sieudoithe, sieuthecao, doithe ck, doithecao online,DoiThe1SVN ,VIPCARD1S.COM , thecaore1s.vn ,th\\u1ebb c\\u00e0o r\\u1ebb 1s, thecaouytin,doithe1s.com ,web doi the chiet khau, C\\u00c1CH \\u0110\\u1ed4I TH\\u1eba UY T\\u00cdN , \\u0111\\u1ed5i th\\u1ebb \\u1edf \\u0111\\u00e2u uy t\\u00edn nh\\u1ea5t , doithe1 gi\\u00e2y , Ki\\u1ec3m tra xem th\\u1ebb Garena \\u0111\\u00e3 n\\u1ea1p hay ch\\u01b0a ,trumnapthe , \\u0111\\u1ed5i card garena, Tr\\u00f9m N\\u1ea1p Th\\u1ebb ,thesieuviet, Trumtheviet.com , api \\u0111\\u1ed5i th\\u1ebb c\\u00e0o, tr\\u00f9m \\u0111\\u1ed5i th\\u1ebb, h\\u01b0\\u1edbng d\\u1eabn n\\u1ed1i api \\u0111\\u1ed5i th\\u1ebb cho shop ,Tr\\u00f9m Th\\u1ebb Vi\\u1ec7t , trumtheviet. com thesieuviet.com, thesieuviet.com.vn, th\\u00e9ieuviet.com th\\u00e9ieuviet,  doi the, trum the viet, \\u0111\\u1ed5i th\\u1ebb c\\u00e0o sang ti\\u1ec1n m\\u1eb7t, gachthenhanh, the sieu re, doi the nhanh, doi the cao sang tien mat, card24, \\u0111\\u1ed5i th\\u1ebb 1 gi\\u00e2y, tst, doithe1s, doithe nhanh nh\\u1ea5t , tsn, doicardnhanh, doi th\\u1ebb c\\u00e0o, trumthe vi\\u1ec7t, thecaoviet.com , site g\\u1ea1ch th\\u1ebb g\\u1ed1c ,trum the c\\u00e0o, \\u0111\\u1ed5i th\\u1ebb gi\\u00e1 r\\u1ebb, mua th\\u1ebb c\\u00e0o gi\\u00e1 r\\u1ebb, mua th\\u1ebb c\\u00e0o, card online,trumdoithe, \\u0111\\u1ed5i th\\u1ebb c\\u00e0o sang th\\u1ebb game, n\\u1ea1p ti\\u00ean momo b\\u1eb1ng th\\u1ebb c\\u00e0o, mua th\\u1ebb game b\\u1eb1ng th\\u1ebb \\u0111i\\u1ec7n tho\\u1ea1i, api th\\u1ebb c\\u00e0o, \\u0111\\u1ed5i th\\u1ebb uy t\\u00edn, \\u0111\\u1ed5i th\\u1ebb c\\u00e0o sang momo, trumthe com , trumdoithe.net, \\u0111\"}', 'Sohacoin', 2, '/assets/storage/userfiles/images/thecao/the-sohacoin.png', '10000,20000,30000,50000,100000,200000,300000,500000,1000000', NULL, NULL, 'VN', 'ON', 1, 1, '2023-03-14 05:44:38', '2023-03-14 05:51:57'),
(55, 'Thẻ Vega', 'the-vega', '{\"title\":\"VIPCARD1S.COM - \\u0110\\u1ed4I TH\\u1eba UY T\\u00cdN H\\u00c0NG \\u0110\\u1ea6U VI\\u1ec6T NAM, CHI\\u1ebeT KH\\u1ea4U T\\u1ed0T NH\\u1ea4T TH\\u1eca TR\\u01af\\u1edcNG VN\",\"description\":null,\"keyword\":\"sieudoithe, sieuthecao, doithe ck, doithecao online,DoiThe1SVN ,VIPCARD1S.COM , thecaore1s.vn ,th\\u1ebb c\\u00e0o r\\u1ebb 1s, thecaouytin,doithe1s.com ,web doi the chiet khau, C\\u00c1CH \\u0110\\u1ed4I TH\\u1eba UY T\\u00cdN , \\u0111\\u1ed5i th\\u1ebb \\u1edf \\u0111\\u00e2u uy t\\u00edn nh\\u1ea5t , doithe1 gi\\u00e2y , Ki\\u1ec3m tra xem th\\u1ebb Garena \\u0111\\u00e3 n\\u1ea1p hay ch\\u01b0a ,trumnapthe , \\u0111\\u1ed5i card garena, Tr\\u00f9m N\\u1ea1p Th\\u1ebb ,thesieuviet, Trumtheviet.com , api \\u0111\\u1ed5i th\\u1ebb c\\u00e0o, tr\\u00f9m \\u0111\\u1ed5i th\\u1ebb, h\\u01b0\\u1edbng d\\u1eabn n\\u1ed1i api \\u0111\\u1ed5i th\\u1ebb cho shop ,Tr\\u00f9m Th\\u1ebb Vi\\u1ec7t , trumtheviet. com thesieuviet.com, thesieuviet.com.vn, th\\u00e9ieuviet.com th\\u00e9ieuviet,  doi the, trum the viet, \\u0111\\u1ed5i th\\u1ebb c\\u00e0o sang ti\\u1ec1n m\\u1eb7t, gachthenhanh, the sieu re, doi the nhanh, doi the cao sang tien mat, card24, \\u0111\\u1ed5i th\\u1ebb 1 gi\\u00e2y, tst, doithe1s, doithe nhanh nh\\u1ea5t , tsn, doicardnhanh, doi th\\u1ebb c\\u00e0o, trumthe vi\\u1ec7t, thecaoviet.com , site g\\u1ea1ch th\\u1ebb g\\u1ed1c ,trum the c\\u00e0o, \\u0111\\u1ed5i th\\u1ebb gi\\u00e1 r\\u1ebb, mua th\\u1ebb c\\u00e0o gi\\u00e1 r\\u1ebb, mua th\\u1ebb c\\u00e0o, card online,trumdoithe, \\u0111\\u1ed5i th\\u1ebb c\\u00e0o sang th\\u1ebb game, n\\u1ea1p ti\\u00ean momo b\\u1eb1ng th\\u1ebb c\\u00e0o, mua th\\u1ebb game b\\u1eb1ng th\\u1ebb \\u0111i\\u1ec7n tho\\u1ea1i, api th\\u1ebb c\\u00e0o, \\u0111\\u1ed5i th\\u1ebb uy t\\u00edn, \\u0111\\u1ed5i th\\u1ebb c\\u00e0o sang momo, trumthe com , trumdoithe.net, \\u0111\"}', 'Vega', 2, '/assets/storage/userfiles/images/thecao/Vega.png', '10000,20000,50000,100000,200000,500000,1000000,2000000', NULL, NULL, 'VN', 'ON', 1, 1, '2023-03-14 05:46:41', '2023-03-14 05:46:41'),
(57, 'Thẻ Bit', 'the-bit', '{\"title\":null,\"description\":null,\"keyword\":null}', 'BITVN', 2, 'assets/storage/userfiles/images/thecao/Bitvn.jpg', '50000,100000,200000,500000,1000000,2000000,5000000', NULL, NULL, 'VN', 'ON', 1, 1, '2023-03-14 05:58:20', '2023-03-14 05:59:15');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `softcard_purchased`
--

CREATE TABLE `softcard_purchased` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `serial` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL COMMENT 'Dòng này phải mã hóa',
  `value` double DEFAULT NULL COMMENT 'Mệnh giá',
  `expire` varchar(255) DEFAULT NULL,
  `user_id` int(11) NOT NULL COMMENT 'Người tạo',
  `order_code` varchar(50) NOT NULL,
  `softcard_order_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `name` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `admin` int(11) DEFAULT 0,
  `ctv_acc` int(11) NOT NULL DEFAULT 0,
  `phone` varchar(15) NOT NULL,
  `number_wallets` varchar(15) NOT NULL COMMENT 'địa chỉ ví ',
  `money` int(11) NOT NULL DEFAULT 0,
  `total_money` int(11) NOT NULL DEFAULT 0,
  `ref_click` int(11) DEFAULT NULL,
  `ref_ck` float DEFAULT 0 COMMENT '% giơi thiệu ',
  `ref_id` varchar(15) DEFAULT NULL COMMENT 'địa chỉ ví NGƯỜI MỜI ',
  `gender` varchar(8) DEFAULT 'male',
  `avatar` varchar(255) DEFAULT NULL,
  `nhom_ck` varchar(255) DEFAULT 'nhom_ck_1',
  `password` varchar(255) NOT NULL,
  `api_token` varchar(255) NOT NULL COMMENT 'dùng để api rút tiền, mua thẻ ',
  `token` varchar(255) NOT NULL COMMENT 'lưu cookie login',
  `time_request` int(11) DEFAULT NULL,
  `time_session` int(11) DEFAULT NULL,
  `provider` varchar(100) DEFAULT NULL COMMENT 'Login bằng mạng xã hội',
  `provider_id` varchar(255) DEFAULT NULL COMMENT 'ID tại mạng xã hội',
  `mkc2` varchar(100) DEFAULT NULL,
  `status` tinyint(4) DEFAULT 0 COMMENT '1 là khóa ',
  `status_wallets` tinyint(4) DEFAULT 0 COMMENT '1 là bị khóa ví ',
  `parent_id` int(11) DEFAULT NULL,
  `currency_code` varchar(50) DEFAULT NULL,
  `appversion` float DEFAULT NULL,
  `language` varchar(100) DEFAULT NULL,
  `twofactor` varchar(100) DEFAULT NULL COMMENT '2FA, MKC2',
  `twofactor_secret` varchar(255) DEFAULT NULL COMMENT 'key 2fa ',
  `chat_id_telegram` varchar(255) DEFAULT NULL,
  `username_telegram` varchar(255) DEFAULT NULL,
  `ip` varchar(100) DEFAULT NULL,
  `device` text DEFAULT NULL,
  `otp_email` varchar(255) DEFAULT NULL,
  `last_login_ip` varchar(255) DEFAULT NULL,
  `last_session_id` varchar(255) DEFAULT NULL,
  `api_key` varchar(100) DEFAULT NULL,
  `failed` tinyint(4) DEFAULT 0 COMMENT 'Số lần đăng nhập sai',
  `failed_reason` varchar(255) DEFAULT NULL COMMENT 'lý do đăng nhập thất bại ',
  `verify_phone` tinyint(4) DEFAULT NULL,
  `verify_email` tinyint(4) DEFAULT NULL,
  `verify_fail_reason` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `wallet_history`
--

CREATE TABLE `wallet_history` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `user_id_nhan` int(11) DEFAULT NULL COMMENT 'người nhận tiền nếu là chuyển,',
  `order_code` varchar(255) DEFAULT NULL,
  `sotientruoc` int(11) DEFAULT NULL,
  `sotienthaydoi` int(11) DEFAULT NULL,
  `sotiensau` int(11) DEFAULT NULL,
  `fees` double DEFAULT NULL COMMENT 'phí gd',
  `created_at` datetime DEFAULT current_timestamp(),
  `message` text DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `id_nick` text DEFAULT NULL COMMENT 'Ghi Id Nick game',
  `type_money` varchar(11) NOT NULL,
  `ip` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_vietnamese_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `wallet_orders_naptien`
--

CREATE TABLE `wallet_orders_naptien` (
  `id` int(11) NOT NULL,
  `order_code` varchar(50) NOT NULL,
  `user_id` int(11) NOT NULL,
  `net_amount` double NOT NULL,
  `fees` double DEFAULT 0,
  `pay_amount` double NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `paygate` varchar(255) DEFAULT NULL,
  `paygate_code` varchar(255) DEFAULT NULL,
  `payment_trans_id` varchar(255) DEFAULT NULL,
  `payout_code` varchar(255) DEFAULT NULL,
  `client_note` varchar(255) DEFAULT NULL COMMENT 'ghi chú cho use',
  `admin_note` varchar(1000) DEFAULT NULL,
  `log` longtext DEFAULT NULL,
  `account_num` varchar(255) DEFAULT NULL,
  `account_name` varchar(255) DEFAULT NULL,
  `account_tag` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT 'xuly' COMMENT 'xuly, hoantat, huy, loi',
  `message` longtext DEFAULT NULL,
  `method` varchar(255) DEFAULT NULL,
  `vendor` varchar(50) DEFAULT NULL,
  `created_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `wallet_orders_ruttien`
--

CREATE TABLE `wallet_orders_ruttien` (
  `id` int(11) NOT NULL,
  `order_code` varchar(50) NOT NULL,
  `user_id` int(11) NOT NULL,
  `net_amount` double NOT NULL,
  `fees` double DEFAULT 0,
  `pay_amount` double NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `paygate` varchar(255) DEFAULT NULL,
  `paygate_code` varchar(255) DEFAULT NULL,
  `payment_trans_id` varchar(255) DEFAULT NULL,
  `payout_code` varchar(255) DEFAULT NULL,
  `client_note` varchar(255) DEFAULT NULL COMMENT 'ghi chú cho use',
  `log` longtext DEFAULT NULL,
  `account_num` varchar(255) DEFAULT NULL,
  `account_name` varchar(255) DEFAULT NULL,
  `account_tag` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT 'xuly' COMMENT 'xuly, hoantat, huy, loi',
  `message` longtext DEFAULT NULL,
  `method` varchar(255) DEFAULT NULL,
  `vendor` varchar(50) DEFAULT NULL,
  `failed_pay` int(11) DEFAULT NULL,
  `created_time` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `web_con`
--

CREATE TABLE `web_con` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `tenweb` varchar(255) DEFAULT NULL,
  `webme` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `whitelist`
--

CREATE TABLE `whitelist` (
  `id` int(11) NOT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `ip` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci COMMENT='Địa chỉ IP cho phép';

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `affiliates`
--
ALTER TABLE `affiliates`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `chargings`
--
ALTER TABLE `chargings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `code` (`code`),
  ADD KEY `serial` (`serial`),
  ADD KEY `request_id` (`request_id`),
  ADD KEY `partner_id` (`partner_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Chỉ mục cho bảng `chargings_log`
--
ALTER TABLE `chargings_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `charging_id` (`charging_id`);

--
-- Chỉ mục cho bảng `chiet_khau`
--
ALTER TABLE `chiet_khau`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `danhmuc`
--
ALTER TABLE `danhmuc`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `localbanks_user`
--
ALTER TABLE `localbanks_user`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `merchants`
--
ALTER TABLE `merchants`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `partner_id` (`partner_id`),
  ADD UNIQUE KEY `partner_key` (`partner_key`);

--
-- Chỉ mục cho bảng `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `nick_game`
--
ALTER TABLE `nick_game`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `options`
--
ALTER TABLE `options`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Chỉ mục cho bảng `paygates`
--
ALTER TABLE `paygates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`);

--
-- Chỉ mục cho bảng `paygates_logs`
--
ALTER TABLE `paygates_logs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `checksum` (`checksum`);

--
-- Chỉ mục cho bảng `paygates_payout`
--
ALTER TABLE `paygates_payout`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `paygate_vendors`
--
ALTER TABLE `paygate_vendors`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Chỉ mục cho bảng `rechargews_cat`
--
ALTER TABLE `rechargews_cat`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `rechargews_items`
--
ALTER TABLE `rechargews_items`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `rechargews_log`
--
ALTER TABLE `rechargews_log`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `rechargews_order`
--
ALTER TABLE `rechargews_order`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `sliders`
--
ALTER TABLE `sliders`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `softcards_orders`
--
ALTER TABLE `softcards_orders`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `softcard_items`
--
ALTER TABLE `softcard_items`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `softcard_products`
--
ALTER TABLE `softcard_products`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `softcard_purchased`
--
ALTER TABLE `softcard_purchased`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `wallet_history`
--
ALTER TABLE `wallet_history`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `wallet_orders_naptien`
--
ALTER TABLE `wallet_orders_naptien`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `wallet_orders_ruttien`
--
ALTER TABLE `wallet_orders_ruttien`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `web_con`
--
ALTER TABLE `web_con`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `whitelist`
--
ALTER TABLE `whitelist`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `affiliates`
--
ALTER TABLE `affiliates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `chargings`
--
ALTER TABLE `chargings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `chargings_log`
--
ALTER TABLE `chargings_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `danhmuc`
--
ALTER TABLE `danhmuc`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `localbanks_user`
--
ALTER TABLE `localbanks_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `logs`
--
ALTER TABLE `logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=325;

--
-- AUTO_INCREMENT cho bảng `menu`
--
ALTER TABLE `menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT cho bảng `merchants`
--
ALTER TABLE `merchants`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT cho bảng `news`
--
ALTER TABLE `news`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `nick_game`
--
ALTER TABLE `nick_game`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `options`
--
ALTER TABLE `options`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=507;

--
-- AUTO_INCREMENT cho bảng `paygates`
--
ALTER TABLE `paygates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=103;

--
-- AUTO_INCREMENT cho bảng `paygates_logs`
--
ALTER TABLE `paygates_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `paygates_payout`
--
ALTER TABLE `paygates_payout`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `paygate_vendors`
--
ALTER TABLE `paygate_vendors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT cho bảng `rechargews_cat`
--
ALTER TABLE `rechargews_cat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `rechargews_items`
--
ALTER TABLE `rechargews_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=320;

--
-- AUTO_INCREMENT cho bảng `rechargews_log`
--
ALTER TABLE `rechargews_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `rechargews_order`
--
ALTER TABLE `rechargews_order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `sliders`
--
ALTER TABLE `sliders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT cho bảng `softcards_orders`
--
ALTER TABLE `softcards_orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `softcard_items`
--
ALTER TABLE `softcard_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=320;

--
-- AUTO_INCREMENT cho bảng `softcard_products`
--
ALTER TABLE `softcard_products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT cho bảng `softcard_purchased`
--
ALTER TABLE `softcard_purchased`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `wallet_history`
--
ALTER TABLE `wallet_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `wallet_orders_naptien`
--
ALTER TABLE `wallet_orders_naptien`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `wallet_orders_ruttien`
--
ALTER TABLE `wallet_orders_ruttien`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `web_con`
--
ALTER TABLE `web_con`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `whitelist`
--
ALTER TABLE `whitelist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
