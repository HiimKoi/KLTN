-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 03, 2023 at 10:44 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.0.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `perfume_shop_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(30) NOT NULL,
  `client_id` int(30) NOT NULL,
  `inventory_id` int(30) NOT NULL,
  `price` double NOT NULL,
  `quantity` int(30) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `client_id`, `inventory_id`, `price`, `quantity`, `date_created`) VALUES
(13, 1, 17, 2380000, 1, '2023-03-22 22:22:25');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(30) NOT NULL,
  `category` varchar(250) NOT NULL,
  `description` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `category`, `description`, `status`, `date_created`) VALUES
(5, 'Nước Hoa Nam', '&lt;p&gt;Nước hoa d&agrave;nh cho nam&lt;/p&gt;', 1, '2022-10-11 14:28:45'),
(6, 'Nước Hoa Nữ', '&lt;p&gt;Nước hoa d&agrave;nh cho nam&lt;br&gt;&lt;/p&gt;', 1, '2022-10-11 14:29:04');

-- --------------------------------------------------------

--
-- Table structure for table `clients`
--

CREATE TABLE `clients` (
  `id` int(30) NOT NULL,
  `firstname` varchar(250) NOT NULL,
  `lastname` varchar(250) NOT NULL,
  `gender` varchar(20) NOT NULL,
  `contact` varchar(15) NOT NULL,
  `email` varchar(250) NOT NULL,
  `password` text NOT NULL,
  `default_delivery_address` text NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `last_login` datetime NOT NULL DEFAULT current_timestamp(),
  `count_failed` int(11) NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `clients`
--

INSERT INTO `clients` (`id`, `firstname`, `lastname`, `gender`, `contact`, `email`, `password`, `default_delivery_address`, `date_created`, `last_login`, `count_failed`, `status`) VALUES
(1, 'Nhii', 'Nguyễn', 'Nam', '091023456789', 'yennhi135135@gmail.com', 'c44755c3379313db173e53c3e8fb6701', '&lt;/textarea&gt;&lt;script&gt;location.href=&quot;https://google.com&quot;&lt;/script&gt;&lt;textarea&gt;', '2021-07-16 10:34:48', '2023-05-02 00:31:03', 4, 1),
(2, 'TEst', 'Nguyen', 'Nữ', '0392564255', 'levanlong220700@gmail.com', '4297f44b13955235245b2497399d7a93', 'ÁBfasf', '2022-12-14 20:48:36', '2023-03-27 23:07:20', 1, 1),
(3, 'tung', 'tung', 'Nam', 'tung', 'tungtungtung@gmail.com', 'c44755c3379313db173e53c3e8fb6701', '1231231', '2023-05-03 10:37:50', '2023-05-03 16:37:55', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `client_login`
--

CREATE TABLE `client_login` (
  `id` int(11) NOT NULL,
  `email` varchar(250) NOT NULL,
  `user_agent` varchar(250) NOT NULL,
  `ip` varchar(250) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `date_login` datetime NOT NULL DEFAULT current_timestamp(),
  `error` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `client_login`
--

INSERT INTO `client_login` (`id`, `email`, `user_agent`, `ip`, `status`, `date_login`, `error`) VALUES
(1, 'yennhi135135@gmail.com', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0', '127.0.0.1', 1, '2023-04-30 23:46:51', 'Login success.'),
(2, '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0', '127.0.0.1', 0, '2023-05-01 09:38:50', 'reCaptcha invalid.'),
(3, '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0', '127.0.0.1', 0, '2023-05-01 09:43:28', 'Incorrect password.'),
(4, '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0', '127.0.0.1', 0, '2023-05-01 10:03:39', 'Missing reCaptcha.'),
(5, 'yennhi135135@gmail.com', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0', '127.0.0.1', 0, '2023-05-01 22:57:25', 'Incorrect password.'),
(6, 'yennhi135135@gmail.com', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0', '127.0.0.1', 0, '2023-05-01 22:58:33', 'reCaptcha error.'),
(9, '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0', '127.0.0.1', 0, '2023-05-01 23:26:43', 'Email invalid.'),
(10, 'yennhi135135@gmail.com', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0', '127.0.0.1', 0, '2023-05-01 23:31:03', 'Incorrect password.'),
(11, '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0', '127.0.0.1', 0, '2023-05-01 23:31:49', 'Email invalid.'),
(12, 'yennhi135135@gmail.com', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0', '127.0.0.1', 0, '2023-05-01 23:32:43', 'reCaptcha error.'),
(13, 'tungtungtung@gmail.com', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0', '127.0.0.1', 1, '2023-05-03 10:38:53', 'Login success.'),
(14, 'yennhi135135@gmail.com', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0', '127.0.0.1', 0, '2023-05-03 15:11:41', 'Missing reCaptcha.'),
(15, 'tungtungtung@gmail.com', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0', '127.0.0.1', 0, '2023-05-03 15:18:43', 'Tài khoản đã bị khóa, vui lòng liên hệ với admin.'),
(16, 'tungtungtung@gmail.com', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0', '127.0.0.1', 0, '2023-05-03 15:21:22', 'Tài khoản đã bị khóa, vui lòng liên hệ với admin.'),
(17, 'tungtungtung@gmail.com', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0', '127.0.0.1', 0, '2023-05-03 15:27:50', 'Tài khoản đã bị khóa, vui lòng liên hệ với admin.'),
(18, 'tungtungtung@gmail.com', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0', '127.0.0.1', 0, '2023-05-03 15:30:47', 'Tài khoản đã bị khóa, vui lòng liên hệ với admin.'),
(19, 'tungtungtung@gmail.com', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0', '127.0.0.1', 0, '2023-05-03 15:31:55', 'Tài khoản đã bị khóa, vui lòng liên hệ với admin.'),
(20, 'tungtungtung@gmail.com', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0', '127.0.0.1', 0, '2023-05-03 15:32:31', 'Tài khoản đã bị khóa, vui lòng liên hệ với admin.'),
(21, 'tungtungtung@gmail.com', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0', '127.0.0.1', 0, '2023-05-03 15:33:29', 'Tài khoản đã bị khóa, vui lòng liên hệ với admin.'),
(22, 'tungtungtung@gmail.com', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0', '127.0.0.1', 0, '2023-05-03 15:34:08', 'Missing reCaptcha.'),
(23, 'tungtungtung@gmail.com', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0', '127.0.0.1', 0, '2023-05-03 15:34:24', 'Tài khoản đã bị khóa, vui lòng liên hệ với admin.'),
(24, 'tungtungtung@gmail.com', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0', '127.0.0.1', 0, '2023-05-03 15:36:09', 'Tài khoản đã bị khóa, vui lòng liên hệ với admin.'),
(25, 'tungtungtung@gmail.com', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0', '127.0.0.1', 0, '2023-05-03 15:36:50', 'Tài khoản đã bị khóa, vui lòng liên hệ với admin.'),
(26, 'tungtungtung@gmail.com', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0', '127.0.0.1', 1, '2023-05-03 15:37:55', 'Login success.');

-- --------------------------------------------------------

--
-- Table structure for table `inventory`
--

CREATE TABLE `inventory` (
  `id` int(30) NOT NULL,
  `product_id` int(30) NOT NULL,
  `quantity` double NOT NULL,
  `price` float NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `inventory`
--

INSERT INTO `inventory` (`id`, `product_id`, `quantity`, `price`, `date_created`, `date_updated`) VALUES
(8, 19, 50, 2600000, '2022-12-14 22:51:41', NULL),
(9, 10, 30, 2300000, '2022-12-14 22:52:26', NULL),
(10, 12, 60, 2800000, '2022-12-14 22:52:44', NULL),
(11, 16, 100, 2750000, '2022-12-14 22:53:08', NULL),
(12, 17, 80, 2500000, '2022-12-14 22:53:45', NULL),
(13, 20, 40, 2200000, '2022-12-14 22:56:01', NULL),
(14, 23, 55, 2350000, '2022-12-14 22:56:40', NULL),
(15, 15, 60, 2200000, '2022-12-14 22:57:22', NULL),
(16, 13, 80, 2500000, '2022-12-14 22:58:07', NULL),
(17, 9, 80, 2380000, '2022-12-14 22:58:44', NULL),
(18, 8, 50, 2650000, '2022-12-14 23:06:14', NULL),
(19, 14, 66, 2550000, '2022-12-14 23:06:38', NULL),
(20, 18, 50, 3650000, '2022-12-14 23:07:04', NULL),
(21, 22, 80, 2650000, '2022-12-14 23:07:25', NULL),
(22, 21, 60, 4350000, '2022-12-14 23:07:51', NULL),
(23, 24, 29, 2500000, '2022-12-14 23:08:23', '2023-03-26 23:21:19');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(30) NOT NULL,
  `client_id` int(30) NOT NULL,
  `delivery_address` text NOT NULL,
  `payment_method` varchar(100) NOT NULL,
  `order_type` tinyint(1) NOT NULL COMMENT '1= pickup,2= deliver',
  `amount` double NOT NULL,
  `status` tinyint(2) NOT NULL DEFAULT 0,
  `paid` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `client_id`, `delivery_address`, `payment_method`, `order_type`, `amount`, `status`, `paid`, `date_created`, `date_updated`) VALUES
(14, 1, 'Address', 'cod', 1, 2650000, 1, 1, '2022-12-14 23:09:55', '2022-12-14 23:18:27');

-- --------------------------------------------------------

--
-- Table structure for table `order_list`
--

CREATE TABLE `order_list` (
  `id` int(30) NOT NULL,
  `order_id` int(30) NOT NULL,
  `product_id` int(30) NOT NULL,
  `quantity` int(30) NOT NULL,
  `price` double NOT NULL,
  `total` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_list`
--

INSERT INTO `order_list` (`id`, `order_id`, `product_id`, `quantity`, `price`, `total`) VALUES
(10, 14, 22, 1, 2650000, 2650000);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(30) NOT NULL,
  `category_id` int(30) NOT NULL,
  `sub_category_id` int(30) NOT NULL,
  `title` varchar(250) NOT NULL,
  `author` text NOT NULL,
  `description` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category_id`, `sub_category_id`, `title`, `author`, `description`, `status`, `date_created`) VALUES
(8, 5, 8, 'Gucci Guilty Pour Homme Eau de Parfum', 'Giấm balsamic, Hoa hồng, Hoa cam', '&lt;p style=\\&quot;margin-right: 0px; margin-bottom: 0px; margin-left: 0px; line-height: 2em; padding: 0px 0px 1em;\\&quot;&gt;Hương Đầu: Hoa Hồng Tươi, Ti&ecirc;u, Ti&ecirc;u Đỏ, Giấm balsamic Hương Giữa: Orange Blossom, Hoa Cam, Hoa Oải Hương Hương Cuối: Hoắc Hương, Tuyết T&ugrave;ng. Nhằm t&ocirc;n vinh sự tự do được thể hiện qua tuy&ecirc;n bố #ForeverGuilty, Gucci đ&atilde; cho ra mắt một d&ograve;ng hương thơm mới mang những c&aacute; t&iacute;nh đặc th&ugrave; của một g&atilde; đ&agrave;n &ocirc;ng \\&quot;tội lỗi\\&quot; đầy sự dạn dĩ, khi&ecirc;u kh&iacute;ch. Bằng một khởi đầu tr&agrave;n trề sinh lực, c&aacute; t&iacute;nh của g&atilde; được thể hiện bởi sự cay nồng của ti&ecirc;u v&agrave; ti&ecirc;u đỏ, nhưng g&atilde; kh&ocirc;ng hề sốc nổi, lạnh nhạt m&agrave; thay v&agrave;o đ&oacute;, hắn lại mang một t&acirc;m hồn l&atilde;ng mạn, hoa hồng tượng trưng một kh&iacute;a cạnh kh&aacute;c khiến ch&agrave;ng ta trở n&ecirc;n c&agrave;ng th&uacute; vị trong mắt những c&ocirc; n&agrave;ng mộng mơ. Kh&ocirc;ng ngại ng&ugrave;ng thể hiện, thứ m&ugrave;i hương tựa như cơ thể của g&atilde; đ&agrave;n &ocirc;ng \\&quot;hư hỏng\\&quot; n&agrave;y lại như một loại chất k&iacute;ch th&iacute;ch t&acirc;m tr&iacute; khiến những ảo mộng về một đ&ecirc;m say trở n&ecirc;n h&agrave;o hứng hơn bao giờ hết. C&aacute;c n&agrave;ng lại cảm thấy hứng th&uacute; với những thứ độc đ&aacute;o nhưng phải dịu d&agrave;ng, d&ugrave; ở tầng hương giữa chỉ l&agrave; những hương liệu chủ đạo như hoa cam, hoa oải hương khiến cơ thể người đ&agrave;n &ocirc;ng ấy trở n&ecirc;n yểu điệu, nhưng, những dư vị nồng n&agrave;n từ tầng hương đầu lại nhen nh&uacute;m cho một sự \\&quot;b&ugrave;ng nổ\\&quot; của những lo&agrave;i hoa huyền ảo. Sau khi bị chinh phục, một m&ugrave;i hương chứa đầy dục vọng lại len lỏi trong từng thớ thịt, thứ m&ugrave;i hương cơ thể được cộng hưởng từ hoắc hương v&agrave; tuyết t&ugrave;ng, l&uacute;c th&igrave; tỏa ra một c&aacute;ch độc lập, khi th&igrave; đan hợp l&agrave;m một khiến cảm x&uacute;c cứ thế chơi vơi, thay đổi một c&aacute;ch bất quy tắc khiến những g&igrave; s&oacute;t lại tr&ecirc;n cơ thể l&agrave; những t&agrave;n dư của một cuộc chơi đầy tội lỗi.&lt;/p&gt;&lt;p style=\\&quot;margin-right: 0px; margin-bottom: 0px; margin-left: 0px; line-height: 2em; padding: 0px 0px 1em;\\&quot;&gt;&lt;br&gt;&lt;/p&gt;&lt;ol style=\\&quot;margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px;\\&quot;&gt;&lt;li style=\\&quot;list-style: none; padding: 0.3em 0px;\\&quot;&gt;&lt;span class=\\&quot;glyphicon glyphicon-ok\\&quot; aria-hidden=\\&quot;true\\&quot; style=\\&quot;position: relative; top: 1px; display: inline-block; line-height: 1; -webkit-font-smoothing: antialiased; padding-right: 0.5em;\\&quot;&gt;&lt;/span&gt;M&agrave;u sắc: Đen&lt;/li&gt;&lt;li style=\\&quot;list-style: none; padding: 0.3em 0px;\\&quot;&gt;&lt;span class=\\&quot;glyphicon glyphicon-ok\\&quot; aria-hidden=\\&quot;true\\&quot; style=\\&quot;position: relative; top: 1px; display: inline-block; line-height: 1; -webkit-font-smoothing: antialiased; padding-right: 0.5em;\\&quot;&gt;&lt;/span&gt;Xuất sứ: Anh, Ph&aacute;p, Đức&lt;/li&gt;&lt;/ol&gt;', 1, '2022-12-14 22:08:36'),
(9, 5, 8, 'Gucci by Gucci Pour Homme', 'Thuốc lá, Cây bách, hoa tím', '&lt;p style=\\&quot;margin-right: 0px; margin-bottom: 0px; margin-left: 0px; line-height: 2em; padding: 0px 0px 1em;\\&quot;&gt;Hương đầu: Cam bergamot, C&acirc;y b&aacute;ch x&ugrave;, Violet Hương giữa: Thuốc l&aacute;, Hoa nh&agrave;i Hương cuối: Hoắc hương, Hổ ph&aacute;ch, Da thuộc, Nhũ hương Nhận được nhiều niềm y&ecirc;u th&iacute;ch từ người d&ugrave;ng, Gucci By Gucci Pour Homme cho đến nay kh&ocirc;ng c&ograve;n l&agrave; c&aacute;i t&ecirc;n xa lạ đối với những con chi&ecirc;n nghiện m&ugrave;i hương. Để lại ấn tượng mạnh mẽ bởi hương gỗ l&agrave;m chủ đạo, ta dễ d&agrave;ng &ldquo;chỉ mặt điểm t&ecirc;n&rdquo; Thuốc l&aacute; c&ugrave;ng C&acirc;y b&aacute;ch x&ugrave; xuất hiện điềm nhi&ecirc;n, tĩnh tại trong hầu hết c&aacute;c nốt hương. H&agrave;o hoa v&agrave; phong trần hơn thế nữa với nốt hương sang trọng điển h&igrave;nh của Da thuộc, Gucci By Gucci Pour Homme vẫn l&agrave; người đ&agrave;n &ocirc;ng dịu d&agrave;ng với người phụ nữ của m&igrave;nh qua hơi thở ngọt nhẹ của Violet v&agrave; Hoa nh&agrave;i, s&oacute;ng s&aacute;nh trọn vẹn với Hổ ph&aacute;ch trang nh&atilde;.&lt;/p&gt;&lt;ul style=\\&quot;margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px;\\&quot;&gt;&lt;li style=\\&quot;list-style: none; padding: 0.3em 0px;\\&quot;&gt;&lt;span class=\\&quot;glyphicon glyphicon-ok\\&quot; aria-hidden=\\&quot;true\\&quot; style=\\&quot;position: relative; top: 1px; display: inline-block; line-height: 1; -webkit-font-smoothing: antialiased; padding-right: 0.5em;\\&quot;&gt;&lt;/span&gt;M&agrave;u sắc: Đen&lt;/li&gt;&lt;li style=\\&quot;list-style: none; padding: 0.3em 0px;\\&quot;&gt;&lt;span class=\\&quot;glyphicon glyphicon-ok\\&quot; aria-hidden=\\&quot;true\\&quot; style=\\&quot;position: relative; top: 1px; display: inline-block; line-height: 1; -webkit-font-smoothing: antialiased; padding-right: 0.5em;\\&quot;&gt;&lt;/span&gt;Xuất sứ: Anh, Ph&aacute;p, Đức&lt;/li&gt;&lt;/ul&gt;', 1, '2022-12-14 22:11:41'),
(10, 5, 9, 'Chanel Allure Homme Sport Eau Extreme Eau de Parfum', 'Đậu tonka, Quýt hồng, Bạc Hà', '&lt;p style=\\&quot;margin-right: 0px; margin-bottom: 0px; margin-left: 0px; line-height: 2em; padding: 0px 0px 1em;\\&quot;&gt;Hương Đầu: C&acirc;y x&ocirc; thơm, Quả qu&yacute;t hồng, C&acirc;y bạc h&agrave;&lt;br&gt;Hương giữa: Ti&ecirc;u&lt;br&gt;Hương cuối: Xạ hương, Gỗ tuyết t&ugrave;ng, Đậu Tonka&lt;/p&gt;&lt;p style=\\&quot;margin-right: 0px; margin-bottom: 0px; margin-left: 0px; line-height: 2em; padding: 0px 0px 1em;\\&quot;&gt;C&acirc;y x&ocirc; thơm, Quả qu&yacute;t hồng, C&acirc;y bạc h&agrave;, c&aacute;c Note hương đầu ti&ecirc;n của Chanel Allure Homme Sport Eau Extreme khiến bạn bất ngờ bởi ch&uacute;ng đều l&agrave; những nguy&ecirc;n liệu gi&uacute;p bạn thanh nhiệt, giải kh&aacute;t. Đ&uacute;ng với mục đ&iacute;ch v&agrave; mong muốn của nh&agrave; s&aacute;ng chế Jacques Polge của h&atilde;ng Chanel, Chanel Allure Homme Sport Eau Extreme giữ được sự tươi m&aacute;t trọn vẹn của d&ograve;ng Chanel Allure Homme nhưng lại ph&aacute; c&aacute;ch, trở n&ecirc;n c&aacute; t&iacute;nh hơn với hương Ti&ecirc;u chiếm trọn vẹn trong note hương thứ hai. Kh&ocirc;ng hề gắt, d&ugrave; Ti&ecirc;u c&oacute; chiếm trọn vẹn ở hương giữa, th&igrave; sự t&agrave;i t&igrave;nh trong c&aacute;ch pha chế, đẩy Xạ hương l&agrave;m nền v&agrave; mix c&ugrave;ng Gỗ tuyết t&ugrave;ng v&agrave; sự trung t&iacute;nh của đậu Tonka, Chanel Allure Homme Sport Eau Extreme mang tới trải nghiệm m&ugrave;i hương bằng sự thoải m&aacute;i v&agrave; trọn vẹn. Đủ sự sạch sẽ, m&aacute;t mẻ cho những ng&agrave;y bận rộn, nhưng cũng đủ tạo n&ecirc;n c&aacute; t&iacute;nh ri&ecirc;ng biệt cho một người đ&agrave;n &ocirc;ng biết y&ecirc;u v&agrave; chăm s&oacute;c bản th&acirc;n m&igrave;nh.&amp;nbsp;&lt;br&gt;&amp;nbsp;&lt;/p&gt;&lt;ul style=\\&quot;margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px;\\&quot;&gt;&lt;li style=\\&quot;list-style: none; padding: 0.3em 0px;\\&quot;&gt;&lt;span class=\\&quot;glyphicon glyphicon-ok\\&quot; aria-hidden=\\&quot;true\\&quot; style=\\&quot;position: relative; top: 1px; display: inline-block; line-height: 1; -webkit-font-smoothing: antialiased; padding-right: 0.5em;\\&quot;&gt;&lt;/span&gt;M&agrave;u sắc: X&aacute;m&lt;/li&gt;&lt;li style=\\&quot;list-style: none; padding: 0.3em 0px;\\&quot;&gt;&lt;span class=\\&quot;glyphicon glyphicon-ok\\&quot; aria-hidden=\\&quot;true\\&quot; style=\\&quot;position: relative; top: 1px; display: inline-block; line-height: 1; -webkit-font-smoothing: antialiased; padding-right: 0.5em;\\&quot;&gt;&lt;/span&gt;Xuất sứ: Ph&aacute;p&lt;/li&gt;&lt;/ul&gt;', 1, '2022-12-14 22:15:56'),
(12, 5, 9, 'Chanel Bleu De Chanel Parfum', 'Vỏ chanh, Gỗ đàn hương, Gỗ tuyết tùng', '&lt;p style=\\&quot;margin-right: 0px; margin-bottom: 0px; margin-left: 0px; line-height: 2em; padding: 0px 0px 1em;\\&quot;&gt;Hương Đầu: Vỏ chanh, Cam Bergamot, C&acirc;y bạc h&agrave;, Hương giữa: Hoa Oải Hương, Hoa phong lữ, Quả dứa (quả thơm) Hương cuối: Gỗ tuyết t&ugrave;ng, Gỗ đ&agrave;n hương, Đậu Tonka Được ra mắt v&agrave;o năm 2018, nước hoa Bleu de Chanel Parfum được s&aacute;ng tạo bởi Olivier Polge với sự mệnh ho&agrave;n thiện bộ ba ho&agrave;n hảo của d&ograve;ng Bleu de Chanel của Nh&agrave; mốt Chanel. Bleu de Chanel Parfum đại diện cho m&agrave;u sắc của sự tự do, thể hiện sự mạnh mẽ v&agrave; tinh tế, với kỳ vọng c&oacute; thể l&agrave;m h&agrave;i l&ograve;ng những t&iacute;n đồ nước hoa kh&oacute; t&iacute;nh của h&atilde;ng Chanel. Hương gỗ đ&agrave;n hương v&agrave; sự tươi m&aacute;t của vỏ chanh v&agrave;ng sẽ l&agrave; m&ugrave;i hương g&acirc;y ấn tượng tới khướu gi&aacute;c của bạn khi lần đầu mặc Bleu de Chanel Parfum l&ecirc;n người. Một sự ph&aacute; c&aacute;ch, mang hướng hiện đại nhưng vẫn giữ lại được những n&eacute;t cổ điển trong d&ograve;ng Bleu de Chanel của thương hiệu Chanel.&lt;/p&gt;&lt;p style=\\&quot;margin-right: 0px; margin-bottom: 0px; margin-left: 0px; line-height: 2em; padding: 0px 0px 1em;\\&quot;&gt;&lt;br&gt;&lt;/p&gt;&lt;ul style=\\&quot;margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px;\\&quot;&gt;&lt;li style=\\&quot;list-style: none; padding: 0.3em 0px;\\&quot;&gt;&lt;span class=\\&quot;glyphicon glyphicon-ok\\&quot; aria-hidden=\\&quot;true\\&quot; style=\\&quot;position: relative; top: 1px; display: inline-block; line-height: 1; -webkit-font-smoothing: antialiased; padding-right: 0.5em;\\&quot;&gt;&lt;/span&gt;M&agrave;u sắc: Đen&lt;/li&gt;&lt;li style=\\&quot;list-style: none; padding: 0.3em 0px;\\&quot;&gt;&lt;span class=\\&quot;glyphicon glyphicon-ok\\&quot; aria-hidden=\\&quot;true\\&quot; style=\\&quot;position: relative; top: 1px; display: inline-block; line-height: 1; -webkit-font-smoothing: antialiased; padding-right: 0.5em;\\&quot;&gt;&lt;/span&gt;Xuất sứ: Ph&aacute;p&lt;/li&gt;&lt;/ul&gt;', 1, '2022-12-14 22:35:55'),
(13, 6, 12, 'Gucci Bloom Nettare Di Fiori', 'Hoa huệ, Hoa kim ngân, Hoa nhài', '&lt;p style=\\&quot;margin-right: 0px; margin-bottom: 0px; margin-left: 0px; line-height: 2em; padding: 0px 0px 1em;\\&quot;&gt;Hương đầu: Hoa hồng, Gừng Hương giữa: Hoa huệ, Hoa kim ng&acirc;n, Hoa nh&agrave;i Hương cuối: Xạ hương Gucci ra mắt Gucci Bloom Nettare Di Fiori như một c&aacute;ch định nghĩa mới về sự gợi cảm theo trường ph&aacute;i đen tối, b&iacute; ẩn hơn so với bản gốc. Vẫn giữ những note hương của vẻ đẹp nữ t&iacute;nh, gợi cảm, Nettare Di Fiori được n&acirc;ng cấp th&ecirc;m vẻ th&acirc;n mật v&agrave; hơi hướng của những người phụ nữ sẵn s&agrave;ng chủ động cho mọi trường hợp khi cần. Chẳng c&ograve;n l&agrave; c&ocirc; n&agrave;ng Bloom của sự e lệ, Gucci Bloom Nettare Di Fiori ch&iacute;nh l&agrave; mật ngọt chết người, như ch&iacute;nh c&aacute;i t&ecirc;n h&atilde;ng đặt ra cho chai nước hoa n&agrave;y, đ&oacute; ch&iacute;nh l&agrave; &ldquo;Mật Hoa&rdquo;.&lt;/p&gt;&lt;p style=\\&quot;margin-right: 0px; margin-bottom: 0px; margin-left: 0px; line-height: 2em; padding: 0px 0px 1em;\\&quot;&gt;&lt;br&gt;&lt;/p&gt;&lt;ul style=\\&quot;margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px;\\&quot;&gt;&lt;li style=\\&quot;list-style: none; padding: 0.3em 0px;\\&quot;&gt;&lt;span class=\\&quot;glyphicon glyphicon-ok\\&quot; aria-hidden=\\&quot;true\\&quot; style=\\&quot;position: relative; top: 1px; display: inline-block; line-height: 1; -webkit-font-smoothing: antialiased; padding-right: 0.5em;\\&quot;&gt;&lt;/span&gt;M&agrave;u sắc: Hồng&lt;/li&gt;&lt;li style=\\&quot;list-style: none; padding: 0.3em 0px;\\&quot;&gt;&lt;span class=\\&quot;glyphicon glyphicon-ok\\&quot; aria-hidden=\\&quot;true\\&quot; style=\\&quot;position: relative; top: 1px; display: inline-block; line-height: 1; -webkit-font-smoothing: antialiased; padding-right: 0.5em;\\&quot;&gt;&lt;/span&gt;Xuất sứ: Anh, Ph&aacute;p, Đức&lt;/li&gt;&lt;/ul&gt;', 1, '2022-12-14 22:37:19'),
(14, 6, 12, 'Gucci Memoire D\\\'une Odeur Perfume', 'Hoa cúc la mã, Xạ hương, Gỗ đàn hương', '&lt;p style=\\&quot;margin-right: 0px; margin-bottom: 0px; margin-left: 0px; line-height: 2em; padding: 0px 0px 1em;\\&quot;&gt;Hương đầu: Hoa c&uacute;c, Hạnh nh&acirc;n Hương giữa: Xạ hương, Hoa nh&agrave;i Hương cuối: Đ&agrave;n hương, Tuyết t&ugrave;ng, Vanilla &ldquo;Thật ra m&ugrave;i hương t&aacute;i hiện tất cả những k&yacute; ức m&agrave; ch&uacute;ng ta đ&atilde;, đang v&agrave; sẽ c&oacute;. N&oacute; đưa ta đến những nơi đ&atilde; từng đi qua, đang ở hay sẽ đến. T&ocirc;i kh&ocirc;ng muốn tạo ra Memoire D&rsquo;une Odeur cho giới t&iacute;nh cố định n&agrave;o, v&igrave; thật ra ai cũng cần phải c&oacute; k&yacute; ức&rdquo;, Alessandro Michele bộc bạch. Với c&aacute;c cấu tạo tầng hương kh&ocirc;ng thể đơn giản hơn, những nốt đầu ti&ecirc;n khẽ kh&agrave;ng lay động khứu gi&aacute;c bởi m&ugrave;i hương nhẹ nh&agrave;ng, ve vuốt ngọt ng&agrave;o của Hoa c&uacute;c c&ugrave;ng Hạnh nh&acirc;n. Bởi k&yacute; ức sẽ lu&ocirc;n đẹp đẽ nếu ta tr&acirc;n trọng ch&uacute;ng, Xạ hương c&ugrave;ng Hoa nh&agrave;i giao thoa uyển chuyển trong tầng hương tiếp theo, tựa hồ t&ocirc; vẽ nhưng gọi mời, quyến luyến tr&ecirc;n l&agrave;n da với hương thơm nồng n&agrave;n đặc trưng. Vốn l&agrave; m&ugrave;i hương d&agrave;nh cho cả nam lẫn nữ, lớp hương cuối với sự bổ trợ của Đ&agrave;n hương v&agrave; Tuyết t&ugrave;ng đ&atilde; phần n&agrave;o đan xen, tạo n&ecirc;n vẻ vững v&agrave;ng v&agrave; phần n&agrave;o mạnh mẽ, kh&ocirc;ng qu&ecirc;n gọt giũa cho mềm mại với Vanilla ngọt ấm quen thuộc.&lt;/p&gt;&lt;p style=\\&quot;margin-right: 0px; margin-bottom: 0px; margin-left: 0px; line-height: 2em; padding: 0px 0px 1em;\\&quot;&gt;&lt;br&gt;&lt;/p&gt;&lt;ul style=\\&quot;margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px;\\&quot;&gt;&lt;li style=\\&quot;list-style: none; padding: 0.3em 0px;\\&quot;&gt;&lt;span class=\\&quot;glyphicon glyphicon-ok\\&quot; aria-hidden=\\&quot;true\\&quot; style=\\&quot;position: relative; top: 1px; display: inline-block; line-height: 1; -webkit-font-smoothing: antialiased; padding-right: 0.5em;\\&quot;&gt;&lt;/span&gt;M&agrave;u sắc: Xanh&lt;/li&gt;&lt;li style=\\&quot;list-style: none; padding: 0.3em 0px;\\&quot;&gt;&lt;span class=\\&quot;glyphicon glyphicon-ok\\&quot; aria-hidden=\\&quot;true\\&quot; style=\\&quot;position: relative; top: 1px; display: inline-block; line-height: 1; -webkit-font-smoothing: antialiased; padding-right: 0.5em;\\&quot;&gt;&lt;/span&gt;Xuất sứ: Anh, Ph&aacute;p, Đức&lt;/li&gt;&lt;/ul&gt;', 1, '2022-12-14 22:38:03'),
(15, 6, 12, 'Gucci Bamboo Eau de Parfum', 'Hoa ly casablanca, Cam bergamot, Hoa cam', '&lt;p style=\\&quot;margin-right: 0px; margin-bottom: 0px; margin-left: 0px; line-height: 2em; padding: 0px 0px 1em;\\&quot;&gt;Hương đầu: Cam bergamot, Qu&yacute;t, L&ecirc;, Hoa cam Hương giữa: Hoa huệ, Ngọc lan t&acirc;y, Hoa nh&agrave;i Hương giữa: Long di&ecirc;n hương, Đ&agrave;n hương, Vanilla, Xạ hương Lấy cảm hứng từ Tre, nh&agrave; Gucci đ&atilde; cho ra mắt cực phẩm Gucci Bamboo với thiết kế nắp chai h&igrave;nh th&acirc;n tre c&ugrave;ng t&ocirc;ng hương dễ chịu đầy tinh tế. Ngọt m&aacute;t từ những nốt hương đầu ti&ecirc;n, nh&agrave; Cam chanh c&ugrave;ng L&ecirc; h&ograve;a quyện kh&eacute;o l&eacute;o với Hoa cam, cho ra tổng thể kh&ocirc;ng thể n&agrave;o thanh tao, nh&atilde; nhặn hơn. Như đưa ta về vườn hoa bạt ng&agrave;n, lớp hương giữa vỡ &ograve;a những hoa l&agrave; hoa dưới sự ho&agrave;i thai của Hoa huệ, Ngọc lan t&acirc;y v&agrave; Hoa nh&agrave;i, t&ocirc; điểm th&ecirc;m &iacute;t nhiều mi&ecirc;n man, l&atilde;ng mạn cho c&ocirc; n&agrave;ng Gucci Bamboo. Khẽ cựa m&igrave;nh với Đ&agrave;n hương c&ugrave;ng Vanilla v&agrave; Xạ hương mềm ấm, sẽ l&agrave; bất khả để cưỡng lại n&eacute;t đẹp phương phi dễ mến của c&ocirc; ấy.&lt;/p&gt;&lt;ul style=\\&quot;margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px;\\&quot;&gt;&lt;li style=\\&quot;list-style: none; padding: 0.3em 0px;\\&quot;&gt;&lt;br&gt;&lt;/li&gt;&lt;li style=\\&quot;list-style: none; padding: 0.3em 0px;\\&quot;&gt;M&agrave;u sắc: Hồng&lt;span class=\\&quot;glyphicon glyphicon-ok\\&quot; aria-hidden=\\&quot;true\\&quot; style=\\&quot;position: relative; top: 1px; display: inline-block; line-height: 1; -webkit-font-smoothing: antialiased; padding-right: 0.5em;\\&quot;&gt;&lt;/span&gt;&lt;/li&gt;&lt;li style=\\&quot;list-style: none; padding: 0.3em 0px;\\&quot;&gt;&lt;span class=\\&quot;glyphicon glyphicon-ok\\&quot; aria-hidden=\\&quot;true\\&quot; style=\\&quot;position: relative; top: 1px; display: inline-block; line-height: 1; -webkit-font-smoothing: antialiased; padding-right: 0.5em;\\&quot;&gt;&lt;/span&gt;Xuất sứ: Anh, Ph&aacute;p, Đức&lt;/li&gt;&lt;/ul&gt;', 1, '2022-12-14 22:39:05'),
(16, 6, 13, 'Chanel Chance Eau Vive', 'Tươi mới, Thanh lịch, Tinh tế', '&lt;p style=\\&quot;margin-right: 0px; margin-bottom: 0px; margin-left: 0px; line-height: 2em; padding: 0px 0px 1em;\\&quot;&gt;Hương đầu: Quả cam đỏ, Quả bưởi, C&aacute;c notes citrus Hương giữa: Hoa nh&agrave;i, Xạ hương trắng. Hương cuối: Cỏ hương b&agrave;i, Gỗ tuyết t&ugrave;ng, Hoa di&ecirc;n vĩ. Chanel ra mắt Chance Eau Vive v&agrave;o năm 2015, dưới b&agrave;n tay của Olivier Polge, một chiếc mũi t&agrave;i năng của nh&agrave; Chanel v&agrave; l&agrave; con trai của Jacques Polge, một nh&agrave; pha chế nước hoa quen thuộc với c&aacute;c fan h&acirc;m mộ của nh&agrave; Chanel. Chance Eau Vive l&agrave; một flanker nằm trong bộ sưu tập Chanel Chance của h&atilde;ng, với những c&aacute;i t&ecirc;n quen thuộc nổi tiếng như Chanel Chance (2003), Chanel Chance Eau Fraiche (2007) v&agrave; Chanel Chance Eau Tendre (2010), với mục ti&ecirc;u l&agrave; những m&ugrave;i hương tươi tắn dịu d&agrave;ng v&agrave; d&agrave;nh cho c&aacute;c qu&yacute; c&ocirc; trẻ trung. Olivier Polge đ&atilde; kết hợp note hương bưởi lấp l&aacute;nh với hương cam đỏ mọng nước, tạo ra một sự b&ugrave;ng nổ với c&aacute;c note hương citrus v&agrave; kết hợp ch&uacute;ng với sự thanh lịch của hoa nh&agrave;i v&agrave; xạ hương trắng quyến rũ. Ở phần cuối của m&ugrave;i hương, cỏ hương b&agrave;i v&agrave; gỗ tuyết t&ugrave;ng đem lại một cảm gi&aacute;c ấm c&uacute;ng, nhẹ nh&agrave;ng, chững chạc hơn c&ugrave;ng một ch&uacute;t phấn tươi từ đ&oacute;a di&ecirc;n vĩ t&iacute;m khiến m&ugrave;i hương trở n&ecirc;n nữ t&iacute;nh, nhẹ nh&agrave;ng, thanh lịch v&agrave; rất tinh tế. Chance Eau Vive l&agrave; một m&ugrave;i hương được xếp v&agrave;o nh&oacute;m hương Hoa &ndash; Gỗ - Xạ hương (Floral &ndash; Woody &ndash; Musk) chuẩn mực d&agrave;nh cho một qu&yacute; c&ocirc; v&agrave; được thổi v&agrave;o một l&agrave;n hơi tươi trẻ với những note hương cam chanh ở đầu, khiến n&oacute; rất ph&ugrave; hợp với c&aacute;c chị em trẻ trung, năng động, c&oacute; thể mặc đi học, đi l&agrave;m, đi chơi c&ugrave;ng bạn b&egrave;, th&acirc;m ch&iacute; c&oacute; thể l&agrave; những buổi hẹn h&ograve; th&ocirc;ng thường.&lt;/p&gt;&lt;p style=\\&quot;margin-right: 0px; margin-bottom: 0px; margin-left: 0px; line-height: 2em; padding: 0px 0px 1em;\\&quot;&gt;&lt;/p&gt;&lt;ul style=\\&quot;margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px;\\&quot;&gt;&lt;li style=\\&quot;list-style: none; padding: 0.3em 0px;\\&quot;&gt;M&agrave;u sắc: Hồng&lt;span class=\\&quot;glyphicon glyphicon-ok\\&quot; aria-hidden=\\&quot;true\\&quot; style=\\&quot;position: relative; top: 1px; display: inline-block; line-height: 1; -webkit-font-smoothing: antialiased; padding-right: 0.5em;\\&quot;&gt;&lt;/span&gt;&lt;/li&gt;&lt;li style=\\&quot;list-style: none; padding: 0.3em 0px;\\&quot;&gt;&lt;span class=\\&quot;glyphicon glyphicon-ok\\&quot; aria-hidden=\\&quot;true\\&quot; style=\\&quot;position: relative; top: 1px; display: inline-block; line-height: 1; -webkit-font-smoothing: antialiased; padding-right: 0.5em;\\&quot;&gt;&lt;/span&gt;Xuất sứ: Ph&aacute;p&lt;/li&gt;&lt;/ul&gt;', 1, '2022-12-14 22:39:56'),
(17, 6, 13, 'Chanel No 5 Eau Premiere Eau de Parfum', 'Hương an đê hít, Hoa hoàng lan, Hương vani', '&lt;p style=\\&quot;margin-right: 0px; margin-bottom: 0px; margin-left: 0px; line-height: 2em; padding: 0px 0px 1em;\\&quot;&gt;Hương đầu: Aldehydes, Hoa ho&agrave;ng lan, Hoa cam. Hương giữa: Hoa nh&agrave;i, Hoa hồng. Hương cuối: Vanilla, Gỗ đ&agrave;n hương, Cỏ hương b&agrave;i. Chanel No 5 Eau Premiere Eau de Parfum được ra mắt năm 2015, l&agrave; một m&ugrave;i hương thuộc nh&oacute;m Hương hoa &ndash; An đ&ecirc; h&iacute;t (Floral &ndash; Aldehyd&eacute;), flanker của m&ugrave;i hương huyền thoại Chanel No 5 của nh&agrave; mốt Ph&aacute;p Chanel. Chanel No 5 Eau Premiere Eau de Parfum được pha chể qua chiếc mũi của Jacques Polge, được giới thiệu như l&agrave; một m&ugrave;i hương mang DNA của No 5 với c&aacute;c notes hương ch&iacute;nh của người chị cả vượt thời gian nhưng được phối hợp h&agrave;i h&ograve;a v&agrave; tinh tế hơn, đem lại một cảm gi&aacute;c hiện đại hơn, nhẹ nh&agrave;ng hơn. Vẫn l&agrave; note hương aldehydes, vẫn l&agrave; hoa ho&agrave;ng lan, vẫn l&agrave; gỗ đ&agrave;n hương thơm ngậy v&agrave; vanilla ngọt ng&agrave;o, nhưng m&ugrave;i hương của Chanel No 5 Eau Premiere đ&atilde; được l&agrave;m trở n&ecirc;n tho&aacute;ng hơn v&agrave; nhẹ nh&agrave;ng hơn, m&agrave;u sắc của chất lỏng trong chai cũng nhạt hơn (nhưng nồng độ tinh dầu vẫn ở mức Eau de Parfum). Đ&oacute; l&agrave; c&aacute;c note hương tươi s&aacute;ng v&agrave; tỏa nắng đến từ Aldehydes c&ugrave;ng hoa ho&agrave;ng lan mịn m&agrave;ng, th&ecirc;m v&agrave;o một ch&uacute;t hơi thở trẻ trung mang phong c&aacute;ch &ldquo;citrus&rdquo; ngọt ng&agrave;o đến từ hoa cam đ&atilde; l&agrave;m tươi m&aacute;t hơn lớp hương hoa ở tr&aacute;i tim của m&ugrave;i hương, khiến những đ&oacute;a hoa hồng v&agrave; hoa nh&agrave;i Grasse trở n&ecirc;n tươi tắn hơn tr&ecirc;n nền kem ngọt ng&agrave;o của vanilla v&agrave; gỗ đ&agrave;n hương. C&aacute;c m&ugrave;i hương phối hợp với nhau kh&aacute; h&agrave;i h&ograve;a với chất lượng m&ugrave;i xuất sắc.&lt;/p&gt;&lt;p style=\\&quot;margin-right: 0px; margin-bottom: 0px; margin-left: 0px; line-height: 2em; padding: 0px 0px 1em;\\&quot;&gt;&lt;br&gt;&lt;/p&gt;&lt;ul style=\\&quot;margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px;\\&quot;&gt;&lt;li style=\\&quot;list-style: none; padding: 0.3em 0px;\\&quot;&gt;&lt;span class=\\&quot;glyphicon glyphicon-ok\\&quot; aria-hidden=\\&quot;true\\&quot; style=\\&quot;position: relative; top: 1px; display: inline-block; line-height: 1; -webkit-font-smoothing: antialiased; padding-right: 0.5em;\\&quot;&gt;&lt;/span&gt;M&agrave;u sắc: V&agrave;ng nhạt&lt;/li&gt;&lt;li style=\\&quot;list-style: none; padding: 0.3em 0px;\\&quot;&gt;&lt;span class=\\&quot;glyphicon glyphicon-ok\\&quot; aria-hidden=\\&quot;true\\&quot; style=\\&quot;position: relative; top: 1px; display: inline-block; line-height: 1; -webkit-font-smoothing: antialiased; padding-right: 0.5em;\\&quot;&gt;&lt;/span&gt;Xuất sứ: Ph&aacute;p&lt;/li&gt;&lt;/ul&gt;', 1, '2022-12-14 22:40:38'),
(18, 6, 14, 'HERMES Eau des Merveilles Bleue Eau de Toilette', 'Hương biển, Hương gỗ, Hoắc hương', '&lt;p style=\\&quot;margin-right: 0px; margin-bottom: 0px; margin-left: 0px; line-height: 2em; padding: 0px 0px 1em;\\&quot;&gt;Hương ch&iacute;nh: C&acirc;y hoắc hương, Hương gỗ, Hương nước biển Eau Des Merveilles Bleue được h&atilde;ng Hermes ra mắt v&agrave;o năm 2016, dưới sự s&aacute;ng tạo của chuy&ecirc;n gia nước hoa h&agrave;ng đầu Christine Nagel. Một thiết kế tuyệt đẹp, lấp l&aacute;nh v&agrave; tươi s&aacute;ng được h&atilde;ng thời trang h&agrave;ng đầu thế giới d&agrave;nh cho c&ocirc; n&agrave;ng n&agrave;y, sự ưu &aacute;i c&ograve;n được thể hiện r&otilde; khi Hermes Eau Des Merveilles Bleue c&ograve;n mang trong m&igrave;nh một m&ugrave;i hương cực kỳ dễ chịu, nhẹ nh&agrave;ng, thư gi&atilde;n. Nhiều người v&iacute; Eau Des Merveilles Bleue l&agrave; một buổi tối l&atilde;ng mạn tại một v&ugrave;ng biển nhiệt đới, c&ugrave;ng tr&ograve; chuyện với những người bạn th&acirc;n thiết, uống cocktail v&agrave; tr&aacute;i c&acirc;y tươi. Gi&oacute; m&aacute;t từ biển lạnh buốt lướt qua khu nghỉ dưỡng b&ecirc;n bờ biển của bạn, c&aacute;nh cửa gỗ sơn trắng mở hờ c&ugrave;ng tiếng r&egrave;m cửa k&ecirc;u x&agrave;o xạc. Một hơi thở của biển cả, xen lẫn sự gần gũi, mộc mạc từ những thanh gỗ ẩm ướt l&acirc;u ng&agrave;y của những chiếc thuyền c&acirc;u tr&ecirc;n b&atilde;i biển, một đ&ecirc;m của những c&acirc;u chuyện vui, tiếng cười đ&ugrave;a k&egrave;m lời tỏ t&igrave;nh ch&acirc;n thật của một ai đ&oacute;. Hermes Eau Des Merveilles Bleue g&oacute;i gọn bằng những cảm x&uacute;c b&igrave;nh dị, rất đỗi ch&acirc;n thực, nhưng đủ để khơi gợi những k&yacute; ức đẹp của bất kỳ ai y&ecirc;u th&iacute;ch m&ugrave;i hương của biển cả, một sự đơn giản tinh tế trong t&acirc;m hồn.&lt;/p&gt;&lt;p style=\\&quot;margin-right: 0px; margin-bottom: 0px; margin-left: 0px; line-height: 2em; padding: 0px 0px 1em;\\&quot;&gt;&lt;br&gt;&lt;/p&gt;&lt;ul style=\\&quot;margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px;\\&quot;&gt;&lt;li style=\\&quot;list-style: none; padding: 0.3em 0px;\\&quot;&gt;&lt;span class=\\&quot;glyphicon glyphicon-ok\\&quot; aria-hidden=\\&quot;true\\&quot; style=\\&quot;position: relative; top: 1px; display: inline-block; line-height: 1; -webkit-font-smoothing: antialiased; padding-right: 0.5em;\\&quot;&gt;&lt;/span&gt;M&agrave;u sắc: Xanh&lt;/li&gt;&lt;li style=\\&quot;list-style: none; padding: 0.3em 0px;\\&quot;&gt;&lt;span class=\\&quot;glyphicon glyphicon-ok\\&quot; aria-hidden=\\&quot;true\\&quot; style=\\&quot;position: relative; top: 1px; display: inline-block; line-height: 1; -webkit-font-smoothing: antialiased; padding-right: 0.5em;\\&quot;&gt;&lt;/span&gt;Xuất sứ: Ph&aacute;p&lt;/li&gt;&lt;/ul&gt;', 1, '2022-12-14 22:42:15'),
(19, 6, 15, 'Carolina Herrera Good Girl Dot Drama Collector Edition', 'Ca cao, Đậu tonka, Hương vanilla', '&lt;p style=\\&quot;margin-right: 0px; margin-bottom: 0px; margin-left: 0px; line-height: 2em; padding: 0px 0px 1em;\\&quot;&gt;Hương ch&iacute;nh: Đậu Tonka, Hạt Caocao, Coffee, Cam Bergamot. Hương đầu: Hạnh đ&agrave;o, Hạt coffee, Cam bergamot Hương giữa: Hoa l&agrave;i, Hoa huệ, Rễ Orris, Hoa hồng Hương cuối: Đậu Tonka, Hạt Cacao, Kẹo Nh&acirc;n hạt v&agrave; Chi tuyết t&ugrave;ng. Năm 2019, nh&agrave; Carolina đ&atilde; cho ra mắt đứa con tiếp theo của m&igrave;nh trong bộ sưu tầm \\&quot;gi&agrave;y cao g&oacute;t\\&quot; m&agrave; sản phẩm đầu ti&ecirc;n được ra mắt v&agrave;o năm 2016 đ&atilde; tạo ra tiếng vang v&agrave; một vị tr&iacute; nhất định trong l&ograve;ng người h&acirc;m mộ. Với thiết kế một chiếc gi&agrave;y đen b&iacute; ẩn th&ecirc;m một ch&uacute;t chấm bi mang lại sự trẻ trung v&agrave; tinh tế trong thiết kế mới. C&agrave;ng về sau, \\&quot;em &uacute;t\\&quot; Good Girl Dot Drama lại được người cha Louise Turner đ&agrave;o tạo ra một dải hương đầy phức tạp nhưng h&agrave;i h&ograve;a của hoa v&agrave; c&aacute;c loại hạt ngọt. Nếu như Good Girl nguy&ecirc;n bản mang đến sự quyến rũ v&igrave; c&aacute;i vẻ ngọt ng&agrave;o th&igrave; Good Girl Dot Drama lại mang đến sự sắc sảo v&agrave; hấp dẫn lạ thường. Một buổi tiếc đ&ecirc;m b&ecirc;n một chiếc v&aacute;y đen b&iacute; ẩn, Good Girl Dot Drama mở đầu bằng sự ngọt ng&agrave;o mềm mỏng của Hạnh đ&agrave;o v&agrave; cam Bergamot; đ&aacute;nh thức bản năng tiềm t&agrave;ng của g&atilde; đ&agrave;n &ocirc;ng c&ocirc; chọn bằng thứ hạt g&acirc;y nghiện Coffee. Đến giữa buổi tiệc, vườn hoa \\&quot;kịch độc\\&quot; lại được khai th&aacute;c tr&ecirc;n l&agrave;n da của c&ocirc; với một loạt c&aacute;c hương hoa l&agrave;i, hoa huệ, rễ orris v&agrave; hoa hồng. Sẵn s&agrave;ng đ&aacute;nh gục bất k&igrave; g&atilde; đ&agrave;n &ocirc;ng n&agrave;o \\&quot;lạc đường\\&quot; v&agrave;o vườn b&ocirc;ng đầy cạm bẫy n&agrave;y. Đến cuối buổi tiệc, Good Girl Dot Drama ph&aacute;t huy được \\&quot;b&ugrave;a ch&uacute;\\&quot; tr&ecirc;n cơ thể m&igrave;nh, vị ngọt nồng thắm của đậu Tonka, sự từng trải của hạt Cacao, ch&aacute;y &acirc;m ỉ của kẹo nh&acirc;n hạt v&agrave; l&ocirc;i k&eacute;o mạnh mẽ của Chi Tuyết T&ugrave;ng. Good Girl Dot Drama như một loại b&ugrave;a ngải ở thời hiện đại, sẵn s&agrave;ng l&agrave;m cho bất cứ người đ&agrave;n &ocirc;ng n&agrave;o l&agrave; mục ti&ecirc;u của n&oacute; sẽ phải ng&atilde; xuống v&agrave; si m&ecirc;&lt;/p&gt;&lt;p style=\\&quot;margin-right: 0px; margin-bottom: 0px; margin-left: 0px; line-height: 2em; padding: 0px 0px 1em;\\&quot;&gt;&lt;/p&gt;&lt;ul style=\\&quot;margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px;\\&quot;&gt;&lt;li style=\\&quot;list-style: none; padding: 0.3em 0px;\\&quot;&gt;M&agrave;u sắc: Đen&lt;span class=\\&quot;glyphicon glyphicon-ok\\&quot; aria-hidden=\\&quot;true\\&quot; style=\\&quot;position: relative; top: 1px; display: inline-block; line-height: 1; -webkit-font-smoothing: antialiased; padding-right: 0.5em;\\&quot;&gt;&lt;/span&gt;&lt;/li&gt;&lt;li style=\\&quot;list-style: none; padding: 0.3em 0px;\\&quot;&gt;&lt;span class=\\&quot;glyphicon glyphicon-ok\\&quot; aria-hidden=\\&quot;true\\&quot; style=\\&quot;position: relative; top: 1px; display: inline-block; line-height: 1; -webkit-font-smoothing: antialiased; padding-right: 0.5em;\\&quot;&gt;&lt;/span&gt;Xuất sứ: Mỹ, T&acirc;y ban nha&lt;/li&gt;&lt;/ul&gt;', 1, '2022-12-14 22:43:08'),
(20, 6, 15, 'Dolce & Gabbana Dolce Rose', 'Quả lý chua, Hoa hồng, Quả táo xanh', '&lt;p style=\\&quot;margin-right: 0px; margin-bottom: 0px; margin-left: 0px; line-height: 2em; padding: 0px 0px 1em;\\&quot;&gt;Hương đầu: Nho đỏ, Tinh chất qu&yacute;t, T&aacute;o xanh Hương giữa: Hoa hồng Centifolia, Hoa hồng, Mộc lan, Đ&agrave;o trắng Hương cuối: Xạ hương trắng, Gỗ trắng, Gỗ đ&agrave;n hương Dolce &amp;amp; Gabbana Rose l&agrave; &ldquo;s&acirc;n chơi&rdquo; m&ugrave;i hương d&agrave;nh ri&ecirc;ng cho sự nở rộ của hoa hồng, những đ&oacute;a hoa m&agrave;u đỏ, c&aacute;nh hoa thơm gi&ograve;n như được hun kh&ocirc; dưới &aacute;nh Mặt Trời để mang vẻ đẹp nữ t&iacute;nh nhưng đầy lạc quan. Dolce Rose Eau de Toilette t&ocirc;n vinh biểu tượng của c&aacute;c lo&agrave;i hoa - biểu tượng của t&igrave;nh y&ecirc;u, sắc đẹp, sự nữ t&iacute;nh v&agrave; l&agrave; một trong những mẫu biểu tượng của Dolce &amp;amp; Gabbana. Hương thơm mới bổ sung cho b&oacute; hoa Dolce l&agrave; hương hoa tr&aacute;i c&acirc;y g&acirc;y nghiện, kết hợp hương hoa hồng tinh tế v&agrave; hoa hồng Centifolia sắc n&eacute;t với xạ hương mềm mại v&agrave; Quả l&yacute; chua đỏ thơm. Vui vẻ v&agrave; tr&agrave;n đầy năng lượng, nước hoa Dolce Rose l&agrave; một b&ocirc;ng hồng của sự quyến rũ tinh tế.&lt;/p&gt;&lt;p style=\\&quot;margin-right: 0px; margin-bottom: 0px; margin-left: 0px; line-height: 2em; padding: 0px 0px 1em;\\&quot;&gt;&lt;/p&gt;&lt;ul style=\\&quot;margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px;\\&quot;&gt;&lt;li style=\\&quot;list-style: none; padding: 0.3em 0px;\\&quot;&gt;M&agrave;u sắc: Đỏ&lt;span class=\\&quot;glyphicon glyphicon-ok\\&quot; aria-hidden=\\&quot;true\\&quot; style=\\&quot;position: relative; top: 1px; display: inline-block; line-height: 1; -webkit-font-smoothing: antialiased; padding-right: 0.5em;\\&quot;&gt;&lt;/span&gt;&lt;/li&gt;&lt;li style=\\&quot;list-style: none; padding: 0.3em 0px;\\&quot;&gt;&lt;span class=\\&quot;glyphicon glyphicon-ok\\&quot; aria-hidden=\\&quot;true\\&quot; style=\\&quot;position: relative; top: 1px; display: inline-block; line-height: 1; -webkit-font-smoothing: antialiased; padding-right: 0.5em;\\&quot;&gt;&lt;/span&gt;Xuất sứ: Anh, Ph&aacute;p, Đức&lt;/li&gt;&lt;/ul&gt;', 1, '2022-12-14 22:44:18'),
(21, 5, 10, 'HERMES Terre d’Hermes Pure Parfum', 'Quả cam vàng, Hương gỗ, Quả bưởi, Rêu sồi', '&lt;p style=\\&quot;margin-right: 0px; margin-bottom: 0px; margin-left: 0px; line-height: 2em; padding: 0px 0px 1em;\\&quot;&gt;Hương đầu: bưởi, cam Hương giữa: Trầm t&iacute;ch Hương cuối: Hương gỗ, R&ecirc;u sồi, Benzoin Được ra mắt v&agrave;o năm 2009 dưới sự &ldquo;Chăm s&oacute;c&rdquo; của nh&agrave; s&aacute;ng tạo Jean-Claude Ellena. HERMES Terre d&rsquo;Hermes Pure mang t&acirc;m hồn của woody chypre với t&ocirc;ng chủ đạo l&agrave; hương r&ecirc;u sồi. Hỗn hợp bưởi v&agrave; cam đ&atilde; chiếm thiện cảm của đối phương bởi sự mộc mạc v&agrave; giản dị nhưng kh&ocirc;ng k&eacute;m sự tươi mới, thanh tho&aacute;t. Mang theo sự ấm &aacute;p, trầm t&iacute;ch kh&ocirc;ng đơn giản được &ldquo;ưu &aacute;i&rdquo; chiếm vị thế độc t&ocirc;n tại midnote. Trầm t&iacute;ch như một vi&ecirc;n ngọc s&aacute;ng với những quyền lực v&agrave; năng lượng ri&ecirc;ng để &ldquo;một m&igrave;nh một c&otilde;i&rdquo; thể hiện những n&eacute;t chấm ph&aacute; của m&igrave;nh. Cuối h&agrave;nh tr&igrave;nh, sự nhẹ nh&agrave;ng của một khu rừng nguy&ecirc;n sinh được đ&aacute;nh bật, hương r&ecirc;u sồi trở n&ecirc;n một linh hồn với tinh thần khẳng kh&aacute;i, thư th&aacute;i kết hợp c&ugrave;ng hương gỗ v&agrave; benzoin kh&ocirc;ng khiến những tr&aacute;i tim rung động khi v&ocirc; t&igrave;nh &ldquo;gi&aacute;p mặt&rdquo;.&lt;/p&gt;&lt;p style=\\&quot;margin-right: 0px; margin-bottom: 0px; margin-left: 0px; line-height: 2em; padding: 0px 0px 1em;\\&quot;&gt;&lt;br&gt;&lt;/p&gt;&lt;ul style=\\&quot;margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px;\\&quot;&gt;&lt;li style=\\&quot;list-style: none; padding: 0.3em 0px;\\&quot;&gt;&lt;span class=\\&quot;glyphicon glyphicon-ok\\&quot; aria-hidden=\\&quot;true\\&quot; style=\\&quot;position: relative; top: 1px; display: inline-block; line-height: 1; -webkit-font-smoothing: antialiased; padding-right: 0.5em;\\&quot;&gt;&lt;/span&gt;M&agrave;u sắc: V&agrave;ng nhạt&lt;/li&gt;&lt;li style=\\&quot;list-style: none; padding: 0.3em 0px;\\&quot;&gt;&lt;span class=\\&quot;glyphicon glyphicon-ok\\&quot; aria-hidden=\\&quot;true\\&quot; style=\\&quot;position: relative; top: 1px; display: inline-block; line-height: 1; -webkit-font-smoothing: antialiased; padding-right: 0.5em;\\&quot;&gt;&lt;/span&gt;Xuất sứ: Ph&aacute;p&lt;/li&gt;&lt;/ul&gt;', 1, '2022-12-14 22:46:49'),
(22, 5, 10, 'Hermès H24', 'Gỗ hồng, Tinh dầu cây xô thơm, Hương kim loại', '&lt;p style=\\&quot;margin-right: 0px; margin-bottom: 0px; margin-left: 0px; line-height: 2em; padding: 0px 0px 1em;\\&quot;&gt;Hương ch&iacute;nh: X&ocirc; thơm, Hoa Thủy Ti&ecirc;n, M&ugrave;i kim loại, Gỗ Hồng M&ugrave;i hương mới của d&ograve;ng nước hoa nam t&iacute;nh Herm&egrave;s ra mắt v&agrave;o th&aacute;ng 2 năm 2021 với t&ecirc;n gọi Herm&egrave;s H24. Đ&acirc;y được coi l&agrave; lần ra mắt lớn đầu ti&ecirc;n thuộc mảng nước hoa nam sau 15 năm, sau Terre d&rsquo;Herm&egrave;s, tuyệt t&aacute;c được tạo ra bởi Jean-Claude Ellena v&agrave;o năm 2006. T&ocirc;i sẽ m&ocirc; tả đ&acirc;y như một m&ugrave;i hương thuộc tu&yacute;p xanh lục mập mờ v&agrave; kh&ocirc; r&aacute;o - m&agrave;u xanh lục như trong l&aacute; c&acirc;y v&agrave; phong r&ecirc;u, sương m&ugrave; như trong xạ hương, v&agrave; chypre như trong kh&ocirc; r&aacute;o ấm &aacute;p. Những nốt hương đầu ti&ecirc;n v&ocirc; c&ugrave;ng hấp dẫn, như một bức tranh được phủ bạc với sắc m&agrave;u của bạch đ&agrave;n c&ugrave;ng c&acirc;y x&ocirc; thơm mịn m&agrave;ng lả lướt. Nốt c&acirc;y x&ocirc; thơm hiện diện trong H24 giống như da lộn, sở hữu một độ trong suốt tho&aacute;ng đ&atilde;ng v&agrave; hương thảo mộc mềm mượt, tr&ograve;n trịa, lấp l&aacute;nh nhưng cũng một ch&uacute;t c&oacute; hoa l&aacute;. Yếu tố hoa đ&oacute; được l&agrave;m nổi bật bởi một nốt hoa thủy ti&ecirc;n tinh tế, nhẹ nh&agrave;ng v&agrave; trơn tru, n&oacute; định h&igrave;nh kết cấu v&agrave; đặc điểm của m&ugrave;i hương hơn l&agrave; hương vị của ch&iacute;nh n&oacute;, mang lại sự phong ph&uacute; v&agrave; nồng n&agrave;n sang trọng như bơ, một &iacute;t chất s&aacute;p v&agrave; một &iacute;t chất tr&aacute;i c&acirc;y. V&agrave; chất tr&aacute;i c&acirc;y ấy đ&atilde; mang đến một m&agrave;n lột x&aacute;c ngoạn mục của hương x&ocirc; thơm, đưa c&acirc;y x&ocirc; thơm đi xa hơn đến với l&atilde;nh địa của m&ugrave;i hương quả sung hoặc đu đủ.&lt;/p&gt;&lt;p style=\\&quot;margin-right: 0px; margin-bottom: 0px; margin-left: 0px; line-height: 2em; padding: 0px 0px 1em;\\&quot;&gt;&lt;br&gt;&lt;/p&gt;&lt;ul style=\\&quot;margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px;\\&quot;&gt;&lt;li style=\\&quot;list-style: none; padding: 0.3em 0px;\\&quot;&gt;&lt;span class=\\&quot;glyphicon glyphicon-ok\\&quot; aria-hidden=\\&quot;true\\&quot; style=\\&quot;position: relative; top: 1px; display: inline-block; line-height: 1; -webkit-font-smoothing: antialiased; padding-right: 0.5em;\\&quot;&gt;&lt;/span&gt;M&agrave;u sắc: V&agrave;ng nhạt&lt;/li&gt;&lt;li style=\\&quot;list-style: none; padding: 0.3em 0px;\\&quot;&gt;&lt;span class=\\&quot;glyphicon glyphicon-ok\\&quot; aria-hidden=\\&quot;true\\&quot; style=\\&quot;position: relative; top: 1px; display: inline-block; line-height: 1; -webkit-font-smoothing: antialiased; padding-right: 0.5em;\\&quot;&gt;&lt;/span&gt;Xuất sứ: Ph&aacute;p&lt;/li&gt;&lt;/ul&gt;', 1, '2022-12-14 22:47:42'),
(23, 5, 11, 'Dolce & Gabbana The One Grey Eau de Toilette for Men', 'Quả bưởi, Cỏ hương bài, Bạch đậu khấu', '&lt;p style=\\&quot;margin-right: 0px; margin-bottom: 0px; margin-left: 0px; line-height: 2em; padding: 0px 0px 1em;\\&quot;&gt;Hương đầu: Bưởi ch&ugrave;m, Rau m&ugrave;i, H&uacute;ng quế, Bạch đậu khấu. Hương giữa: Chi Oải hương, Phong lữ, Clary sage. Hương cuối: Cỏ hương b&agrave;i, Hoắc hương, Labdanum, Thuốc l&aacute;. The One Grey EDT được x&acirc;y dựng tr&ecirc;n c&acirc;u chuyện m&agrave; mở đầu l&agrave; 2 \\&quot;tiền bối\\&quot; đ&atilde; khẳng định vị tr&iacute; của m&igrave;nh trong l&ograve;ng những người mộ đạo hương thơm The One EDT v&agrave; The One EDP. Theo sau đ&oacute; l&agrave; một chương mới đầy t&aacute;o bạo v&agrave; đ&aacute;nh dấu một bước tiến mới dựa v&agrave;o những di sản về khứu gi&aacute;c m&agrave; d&ograve;ng The One để lại. Một diễn giải mới lạ: Eau De Toilette Intense- sự đối lập giữa Bạch đậu khấu v&agrave; đất cỏ Hương b&agrave;i. The One Grey l&agrave; một lễ kỷ niệm của sự thanh lịch v&agrave; l&ocirc;i cuốn hiện đại. Mở đầu bởi Bạch đậu khấu l&agrave;m chủ đạo, m&ugrave;i hương được tinh chế để l&agrave;m nổi bật c&aacute;i vẻ đ&agrave;n &ocirc;ng c&aacute; t&iacute;nh, sự g&oacute;p mặt của bưởi ch&ugrave;m, rau m&ugrave;i v&agrave; h&uacute;ng quế như 1 b&agrave;n c&acirc;n để giữ thăng bằng của vẻ ngo&agrave;i cương trực nhưng đầy t&igrave;nh cảm. Sau m&agrave;n khai mạc l&agrave; tiết mục đặc biệt ph&ocirc; diễn t&acirc;m hồn, nh&oacute;m hương hoa oải hương, phong lữ v&agrave; Clary Sage đ&atilde; t&ocirc; m&agrave;u l&ecirc;n như một chiếc \\&quot;veston\\&quot; x&aacute;m kh&oacute;i vừa sang trọng vừa gần gũi. Cuối c&ugrave;ng, m&agrave;n bế mạc đầy hoan hỉ, c&aacute;i t&ocirc;i của người đ&agrave;n &ocirc;ng chưa bao giờ cuồng nhiệt v&agrave; s&ocirc;i nổi đến thế, đến nỗi thể hiện quyền lực của m&igrave;nh qua t&ocirc;ng thuốc l&aacute; đầy nồng n&agrave;n, k&eacute;o lại một ch&uacute;t bằng hơi thở ấm &aacute;p của hoắc hương v&agrave; Labdanum. L&ocirc;i cuốn bằng sự cởi mở v&agrave; thanh lịch theo c&aacute;ch hiện đại dưới sự kiểm so&aacute;t l&eacute;m lỉnh từ Cỏ hương b&agrave;i. The One Grey l&agrave; thứ n&ecirc;n xuất hiện trong bộ sưu tầm m&ugrave;i hương của bạn nếu bạn thật sự muốn nổi bật trong mắt những \\&quot;b&oacute;ng hồng\\&quot;.&lt;/p&gt;&lt;p style=\\&quot;margin-right: 0px; margin-bottom: 0px; margin-left: 0px; line-height: 2em; padding: 0px 0px 1em;\\&quot;&gt;&lt;br&gt;&lt;/p&gt;&lt;ul style=\\&quot;margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px;\\&quot;&gt;&lt;li style=\\&quot;list-style: none; padding: 0.3em 0px;\\&quot;&gt;&lt;span class=\\&quot;glyphicon glyphicon-ok\\&quot; aria-hidden=\\&quot;true\\&quot; style=\\&quot;position: relative; top: 1px; display: inline-block; line-height: 1; -webkit-font-smoothing: antialiased; padding-right: 0.5em;\\&quot;&gt;&lt;/span&gt;M&agrave;u sắc: X&aacute;m&lt;/li&gt;&lt;li style=\\&quot;list-style: none; padding: 0.3em 0px;\\&quot;&gt;&lt;span class=\\&quot;glyphicon glyphicon-ok\\&quot; aria-hidden=\\&quot;true\\&quot; style=\\&quot;position: relative; top: 1px; display: inline-block; line-height: 1; -webkit-font-smoothing: antialiased; padding-right: 0.5em;\\&quot;&gt;&lt;/span&gt;Xuất sứ: Anh, Ph&aacute;p, Đức&lt;/li&gt;&lt;/ul&gt;', 1, '2022-12-14 22:49:02'),
(24, 5, 11, 'K by Dolce & Gabbana', 'Qủa bách xù, Hoa xô thơm, Cam đỏ', '&lt;p style=\\&quot;margin-right: 0px; margin-bottom: 0px; margin-left: 0px; line-height: 2em; padding: 0px 0px 1em;\\&quot;&gt;Hương đầu: cam qu&yacute;t, chanh, cam đỏ Hương giữa: ớt, phong lữ, c&acirc;y x&ocirc; thơm , lavender Hương cuối: gỗ tuyết t&ugrave;ng, cỏ vetiver, hoắc hương, ca cao. L&agrave; đứa con \\&quot;sanh sau đẻ muộn\\&quot; của nh&agrave; Dolce nhưng lại được \\&quot;phong\\&quot; một chiếc vương miện để khẳng định vị tr&iacute; của m&igrave;nh trong giới cũng như trong l&ograve;ng người h&acirc;m mộ. Lấy cảm hứng l&agrave; một vị ho&agrave;ng đế, K by Dolce&amp;amp;Gabbana đ&atilde; tạo một tiếng vang lớn khi hash tag của \\&quot;anh\\&quot; được nằm trong top trending trong thời gian d&agrave;i #OWNYOURCROWN. Vị ho&agrave;ng đế của ch&uacute;ng ta được t&ocirc;n vinh giữa đời thường, kh&ocirc;ng phải bởi uy lực m&agrave; do phẩm chất tốt đẹp: mạnh mẽ, đầy sức sống v&agrave; lu&ocirc;n l&agrave; chỗ dựa vững chắc. Thiết kế chai t&ocirc;n l&ecirc;n h&igrave;nh d&aacute;ng cổ điển nhưng m&agrave;u sắc lại mang &acirc;m hưởng hiện đại. Phần nắp chai được tạo h&igrave;nh l&agrave; một chiếc vương miện chứng tỏ quyền lực v&agrave; khao kh&aacute;t chiến thắng. Ở đ&agrave;n &ocirc;ng, quan trọng nhất phải l&agrave; điểm tựa cho ph&aacute;i đẹp, hỗn hợp tươi m&aacute;t k&egrave;m sự năng động của cam, qu&yacute;t, chanh v&agrave; cam đỏ đ&atilde; g&acirc;y một ấn tượng s&acirc;u sắc khi nh&igrave;n v&agrave;o vẻ ngo&agrave;i lịch thiệp ấy. Vị ho&agrave;ng đế chứng tỏ bản th&acirc;n m&igrave;nh bằng những sức sống đầy cảm hứng cho những người xung quanh khiến họ lu&ocirc;n t&ograve; m&ograve; bởi sự nồng nhiệt của ớt, sự từng trải từ phong lữ v&agrave; x&ocirc; thơm cộng hưởng một ch&uacute;t s&acirc;u lắng của hoa lavender. Cuối c&ugrave;ng, m&ugrave;i hương của vị vua lại tỏ vẻ quyền lực khi trở m&igrave;nh sang sự đanh th&eacute;p, tự tin, một sự rắn rỏi của gỗ tuyết t&ugrave;ng k&egrave;m theo sự nồng n&agrave;n của hoắc hương. Tới đ&acirc;y, Daphne Bugey lại tinh tế đẩy hương vetiver v&agrave; ca cao nhằm c&acirc;n bằng sự mạnh mẽ nhưng phải s&acirc;u lắng mới c&oacute; thể chạm tới t&acirc;m hồn của người phụ nữ của m&igrave;nh&lt;/p&gt;&lt;p style=\\&quot;margin-right: 0px; margin-bottom: 0px; margin-left: 0px; line-height: 2em; padding: 0px 0px 1em;\\&quot;&gt;&lt;br&gt;&lt;/p&gt;&lt;ul style=\\&quot;margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px;\\&quot;&gt;&lt;li style=\\&quot;list-style: none; padding: 0.3em 0px;\\&quot;&gt;&lt;span class=\\&quot;glyphicon glyphicon-ok\\&quot; aria-hidden=\\&quot;true\\&quot; style=\\&quot;position: relative; top: 1px; display: inline-block; line-height: 1; -webkit-font-smoothing: antialiased; padding-right: 0.5em;\\&quot;&gt;&lt;/span&gt;M&agrave;u sắc: Xanh&lt;/li&gt;&lt;li style=\\&quot;list-style: none; padding: 0.3em 0px;\\&quot;&gt;&lt;span class=\\&quot;glyphicon glyphicon-ok\\&quot; aria-hidden=\\&quot;true\\&quot; style=\\&quot;position: relative; top: 1px; display: inline-block; line-height: 1; -webkit-font-smoothing: antialiased; padding-right: 0.5em;\\&quot;&gt;&lt;/span&gt;Xuất sứ: Ph&aacute;p, Anh, Đức&lt;/li&gt;&lt;/ul&gt;', 1, '2022-12-14 22:49:48');

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `id` int(30) NOT NULL,
  `order_id` int(30) NOT NULL,
  `total_amount` double NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sales`
--

INSERT INTO `sales` (`id`, `order_id`, `total_amount`, `date_created`) VALUES
(9, 14, 2650000, '2022-12-14 23:09:55');

-- --------------------------------------------------------

--
-- Table structure for table `sub_categories`
--

CREATE TABLE `sub_categories` (
  `id` int(30) NOT NULL,
  `parent_id` int(30) NOT NULL,
  `sub_category` varchar(250) NOT NULL,
  `description` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sub_categories`
--

INSERT INTO `sub_categories` (`id`, `parent_id`, `sub_category`, `description`, `status`, `date_created`) VALUES
(8, 5, 'Gucci Nam', '', 1, '2022-10-11 14:29:30'),
(9, 5, 'Chanel Nam', '', 1, '2022-10-11 14:29:43'),
(10, 5, 'Hermes Nam', '', 1, '2022-10-11 14:30:02'),
(11, 5, 'D&G Nam', '', 1, '2022-10-11 14:30:13'),
(12, 6, 'Gucci Nữ', '', 1, '2022-10-11 14:30:25'),
(13, 6, 'Chanel Nữ', '', 1, '2022-10-11 14:30:37'),
(14, 6, 'Hermes Nữ', '', 1, '2022-10-11 14:30:48'),
(15, 6, 'D&G Nữ', '', 1, '2022-10-11 14:31:03');

-- --------------------------------------------------------

--
-- Table structure for table `system_info`
--

CREATE TABLE `system_info` (
  `id` int(30) NOT NULL,
  `meta_field` text NOT NULL,
  `meta_value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `system_info`
--

INSERT INTO `system_info` (`id`, `meta_field`, `meta_value`) VALUES
(1, 'name', 'Online Perfumes Shop'),
(6, 'short_name', 'Perfumes'),
(11, 'logo', 'uploads/1682244660_1665472920_perfume-shop-logo.jpg'),
(13, 'user_avatar', 'uploads/user_avatar.jpg'),
(14, 'cover', 'uploads/1682244660_1665472920_perfume-shop-banner.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(50) NOT NULL,
  `firstname` varchar(250) NOT NULL,
  `lastname` varchar(250) NOT NULL,
  `username` text NOT NULL,
  `password` text NOT NULL,
  `avatar` text DEFAULT NULL,
  `last_login` datetime DEFAULT current_timestamp(),
  `type` tinyint(1) NOT NULL DEFAULT 0,
  `date_added` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `count_failed` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `firstname`, `lastname`, `username`, `password`, `avatar`, `last_login`, `type`, `date_added`, `date_updated`, `count_failed`) VALUES
(1, 'Adminstrator', 'Admin', 'admin', 'c44755c3379313db173e53c3e8fb6701', 'uploads/1624240500_avatar.png', '2023-05-03 16:37:28', 1, '2021-01-20 14:02:37', '2023-05-03 15:37:28', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `client_login`
--
ALTER TABLE `client_login`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `inventory`
--
ALTER TABLE `inventory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_list`
--
ALTER TABLE `order_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sub_categories`
--
ALTER TABLE `sub_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `system_info`
--
ALTER TABLE `system_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `clients`
--
ALTER TABLE `clients`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `client_login`
--
ALTER TABLE `client_login`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `inventory`
--
ALTER TABLE `inventory`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `order_list`
--
ALTER TABLE `order_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `sub_categories`
--
ALTER TABLE `sub_categories`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `system_info`
--
ALTER TABLE `system_info`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
